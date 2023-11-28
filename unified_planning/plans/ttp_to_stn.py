from typing import List, Dict
import networkx as nx
import re
import copy
import unified_planning as up
from unified_planning.plans.time_triggered_plan import _absolute_time
from unified_planning.plans.time_triggered_plan import *
from unified_planning.plans.plan import ActionInstance
from unified_planning.model.mixins.timed_conds_effs import *
from unified_planning.plans.sequential_plan import SequentialPlan
from unified_planning.plans.partial_order_plan import PartialOrderPlan
from unified_planning.plot.plan_plot import plot_partial_order_plan


def is_time_in_interv(
    start: Fraction,
    duration: Fraction,
    timing: "up.model.timing.Timing",
    interval: "up.model.timing.TimeInterval",
) -> bool:
    time_pt = _absolute_time(timing, start=start, duration=duration)
    upper_time = _absolute_time(interval._upper, start=start, duration=duration)
    lower_time = _absolute_time(interval._lower, start=start, duration=duration)
    if (time_pt > lower_time if interval._is_left_open else time_pt >= lower_time) and (
        time_pt < upper_time if interval._is_right_open else time_pt <= upper_time
    ):
        return True
    return False


class TTP_to_STN:

    """Create a STN from a TimeTriggeredPlan"""

    def __init__(
        self, plan: TimeTriggeredPlan, problem: "up.model.mixins.ObjectsSetMixin"
    ):
        self.ttp = plan
        self.problem = problem
        self.table: Dict[
            Tuple[Fraction, ActionInstance, Optional[Fraction]],
            Dict[
                "up.model.timing.Timing",
                Tuple[List["up.model.fnode.FNode"], List["up.model.effect.Effect"]],
            ],
        ] = {}
        self.events: List[Tuple[Fraction, InstantaneousAction]] = []
        self.events_sorted: List[Tuple[Fraction, InstantaneousAction]] = []
        self.seq_plan: SequentialPlan
        self.partial_order_plan: PartialOrderPlan
        self.stn: nx.DiGraph

    def sort_condition(
        self,
        start: Fraction,
        duration: Fraction,
        conditions: Dict["up.model.timing.TimeInterval", List["up.model.fnode.FNode"]],
        effect: Tuple["up.model.timing.Timing", List["up.model.effect.Effect"]],
    ) -> Tuple["up.model.timing.Timing", List["up.model.fnode.FNode"]]:
        """
        From the dict of condition get all conditions for the specific timepoint from the couple timepoint effect.
        Return the coresponding timepoint conditions couple.
        """
        time_point = effect[0]
        cond_result = []
        for time_interval, condition in conditions.items():
            if is_time_in_interv(
                start, duration, time_point, time_interval
            ):  # Time point in interval
                cond_result += condition
        result = (time_point, cond_result)
        return result

    def get_table_event(
        self,
    ) -> Dict[
        Tuple[Fraction, ActionInstance, Optional[Fraction]],
        Dict[
            "up.model.timing.Timing",
            Tuple[List["up.model.fnode.FNode"], List["up.model.effect.Effect"]],
        ],
    ]:
        """
        Return table : For each action (the tuple) and each timepoint of this action the couple conditions effects"""
        for start, ai, duration in self.ttp.timed_actions:
            action = ai.action
            action_cpl = (start, ai, duration)
            self.table[action_cpl] = {}
            assert isinstance(action, DurativeAction)
            if duration is None:
                assert isinstance(
                    ai.action, InstantaneousAction
                ), "Error, None duration specified for non InstantaneousAction"
                continue
            for effect_time, effects in action.effects.items():
                pconditions = self.sort_condition(
                    start, duration, action.conditions, (effect_time, effects)
                )
                self.table[action_cpl].update({effect_time: (pconditions[1], effects)})
        return self.table

    def table_to_events(self) -> List[Tuple[Fraction, InstantaneousAction]]:
        """
        Return a list where each time is paired with an Instantaneous Action.
        Each Instantaneous Action is created from preconditions and effects from get_table_event()
        """
        self.get_table_event()
        for action_cpl, c_e_dict in self.table.items():
            start = action_cpl[0]
            duration = action_cpl[2]
            action = action_cpl[1]
            if duration is None:
                assert isinstance(
                    action.action, InstantaneousAction
                ), "Error, None duration specified for non InstantaneousAction"
                continue
            for time_pt, cond_eff_couple in c_e_dict.items():

                time = _absolute_time(time_pt, start, duration)
                inst_action = InstantaneousAction(str(action) + str(time_pt))

                # set condition and effect to each instant action
                if len(cond_eff_couple[0]) > 0:
                    for cond in cond_eff_couple[0]:
                        inst_action.add_precondition(cond)

                if len(cond_eff_couple[1]) > 0:
                    for effect in cond_eff_couple[1]:
                        inst_action.effects.append(effect)

                self.events += [(time, inst_action)]
        return self.events

    def sort_events(self) -> List[Tuple[Fraction, InstantaneousAction]]:
        self.table_to_events()

        self.events_sorted = sorted(self.events, key=lambda acts: acts[0])

        print("\r\nAFTER SORT")
        for tim, act in self.events_sorted:
            print("%s: %s" % (float(tim), act._name))
        return self.events_sorted

    def events_to_partial_order_plan(self):
        self.sort_events()
        list_act = [ActionInstance(i[1]) for i in self.events_sorted]
        seqplan = SequentialPlan(list_act)
        partial_order_plan = seqplan._to_partial_order_plan(self.problem)
        self.partial_order_plan = partial_order_plan
        print("\r\npartial order plan ", partial_order_plan)
        return partial_order_plan

    def partial_order_plan_to_stn(self) -> nx.DiGraph:
        graph = self.partial_order_plan._graph

        for ai_current, l_next_ai in self.partial_order_plan.get_adjacency_list.items():
            ai_current_time = [
                item[0] for item in self.events_sorted if item[1] == ai_current.action
            ][0]
            for ai_next in l_next_ai:
                ai_next_time = [
                    item[0] for item in self.events_sorted if item[1] == ai_next.action
                ][0]
                time_edge = ai_next_time - ai_current_time
                graph[ai_current][ai_next]["interval"] = [
                    time_edge,
                    time_edge,
                ]  # TODO get time with interval correctly


        # Add start and end nodes
        
        start = ActionInstance(InstantaneousAction("START"))
        end = ActionInstance(InstantaneousAction("END"))
        graph.add_node(start)
        graph.add_node(end)
        graph.add_edge(start, list(self.partial_order_plan.get_adjacency_list.keys())[0], interval= [0.0,0.0])
        graph.add_edge([item for item in list(self.partial_order_plan.get_adjacency_list.keys())[::-1] if item.action._name != "START" and item.action._name != "END"][0], end, interval= [0.0,0.0])

        self.stn = graph
        return graph

    def stn_clean(self, graph: nx.DiGraph):
        nodes_list = list(graph.nodes(data=True))

        to_jump = []
        for node, data in nodes_list:
            if node in to_jump:
                continue
            neighbors_node = copy.copy(graph.neighbors(node))
            for next_node in neighbors_node:
                if bool(re.match("(.*)(end|start) \+ [0-9]+$", next_node.action._name)):
                    neighbors_next_node = copy.copy(graph.neighbors(next_node))
                    for next_next_node in neighbors_next_node:
                        if next_next_node == node:
                            continue
                        graph.add_edge(node, next_next_node)
                        a = graph[node][next_node]["interval"]
                        b = graph[next_node][next_next_node]["interval"]
                        graph[node][next_next_node]["interval"] = [
                            a[0] + b[0],
                            a[1] + b[1],
                        ]
                        graph.remove_edge(
                            next_node, next_next_node
                        )  # is it usefull ? because delete node at the end

                    graph.remove_edge(
                        node, next_node
                    )  # is it usefull ? because delete node at the end
                    graph.remove_node(next_node)
                    to_jump += [item[0] for item in nodes_list if item[0] == next_node]
        


    def run(self):
        # partial order plan to STN
        self.events_to_partial_order_plan()
        graph = self.partial_order_plan_to_stn()
        self.stn_clean(graph)
        return graph
