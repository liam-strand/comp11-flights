//
//  lib.swift
//  
//
//  Created by Liam Strand on 5/3/22.
//

import Foundation

struct Flight {
    let dep: Int
    let arr: Int
}

func read_a_flight(prompt: String) -> Flight {
    print(prompt, terminator: "")
    
    if let input_str = readLine(strippingNewline: true) {
        let seps = CharacterSet(charactersIn: " \n\r\t ")
        let times = input_str.components(separatedBy: seps)
        
        return Flight(dep: Int(times[0])! * 60 + Int(times[1])!,
                      arr: Int(times[2])! * 60 + Int(times[3])!)
    } else {
        exit(EXIT_FAILURE)
    }
}

func time_difference(t1: Int, t2: Int) -> Int {
    if t1 > t2 {
        return (60 * 24) + t2 - t1
    } else {
        return t2 - t1
    }
}

func print_time_difference(tag: String, time: Int) {
    let hrs = time / 60
    let min = time % 60
    
    print("\(tag): \(hrs) hr \(min) min")
}
