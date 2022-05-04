#!/usr/bin/env escript
-export([main/1]).

main(_) -> 
    {Flight_1_Dep, Flight_1_Arr} = read_flights("Flight 1: "),
    {Flight_2_Dep, Flight_2_Arr} = read_flights("Flight 2: "),

    print_duration("Layover:", duration(Flight_1_Arr, Flight_2_Dep)),
    print_duration("Layover:", duration(Flight_1_Dep, Flight_1_Arr)
                             + duration(Flight_1_Arr, Flight_2_Dep)
                             + duration(Flight_2_Dep, Flight_2_Arr)).
    
read_flights(Prompt) ->
    {ok, [Dep_Hr, Dep_Min, Arr_Hr, Arr_Min]} = io:fread(Prompt, "~d~d~d~d"),
    {(Dep_Hr * 60 + Dep_Min), (Arr_Hr * 60 + Arr_Min)}.

duration(Time_1, Time_2) when Time_1 =< Time_2 ->
    Time_2 - Time_1;

duration(Time_1, Time_2) ->
    (Time_2 + (60 * 24)) - Time_1.

print_duration(Tag, Time) ->
    io:format("~s ~w hr ~w min~n", [Tag, Time div 60, Time rem 60]).
