def main():
    (f1_dep, f1_arr) = extract_times(input("Flight 1: "))
    (f2_dep, f2_arr) = extract_times(input("Flight 2: "))
    
    print_duration("Layover", duration(f1_arr, f2_dep))
    print_duration("Total", duration(f1_dep, f1_arr) + duration(f1_arr, f2_dep) + duration(f2_dep, f2_arr))

def extract_times(flight_str: str) -> tuple:
    time_list = flight_str.split()

    return (int(time_list[0]) * 60 + int(time_list[1]), int(time_list[2]) * 60 + int(time_list[3]))

def duration(t1: int, t2: int) -> int:
    if t1 > t2:
        return (60 * 24) + t2 - t1;
    else:
        return t2 - t1

def print_duration(tag: str, dur: int) -> None:
    print(f"{tag}: {dur // 60} hr {dur % 60} min")

if __name__ == "__main__":
    main()
