//
//  lib.swift
//
//
//  Created by Liam Strand on 5/3/22.
//

let flight_1 = read_a_flight(prompt: "Flight 1: ")
let flight_2 = read_a_flight(prompt: "Flight 2: ")

let layover = time_difference(t1: flight_1.arr, t2: flight_2.dep)
let total_time = layover + time_difference(t1: flight_1.dep, t2: flight_1.arr)
                         + time_difference(t1: flight_2.dep, t2: flight_2.arr)

print_time_difference(tag: "Layover", time: layover)
print_time_difference(tag: "Total", time: total_time)
