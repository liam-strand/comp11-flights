use std::io::{self, Write};
use text_io::scan;

fn main() {
    let flight1 = Flight::from_stdin("Flight 1");
    let flight2 = Flight::from_stdin("Flight 2");

    print_duration("Layover", &Flight::layover(&flight1, &flight2));
    print_duration("Total", &(Flight::duration(&flight1) + Flight::duration(&flight2) + Flight::layover(&flight1, &flight2)));
}

struct Flight { dep: u32, arr: u32 }

impl Flight {
    fn from_stdin(tag: &str) -> Flight {
        print!("{}: ", tag);
        io::stdout().flush().unwrap();
        let (dep_h, dep_m, arr_h, arr_m): (u32, u32, u32, u32);
        scan!("{} {} {} {}", dep_h, dep_m, arr_h, arr_m);
        
        return Flight { dep: 60 * dep_h + dep_m, arr: 60 * arr_h + arr_m };
    }

    fn layover(flight1: &Flight, flight2: &Flight) -> u32 { duration(flight1.arr, flight2.dep) }

    fn duration(flight: &Flight) -> u32 { duration(flight.dep, flight.arr) }
}

fn print_duration(tag: &str, dur: &u32) -> () {
    println!("{}: {} hr {} min", tag, dur / 60, dur % 60);
}

fn duration(t1: u32, mut t2: u32) -> u32 {
    if t1 > t2 { t2 += 60 * 24; }
    return t2 - t1;
}
