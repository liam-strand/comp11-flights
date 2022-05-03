/*
 * flights.cpp
 *
 * Purpose: Determine the layover between two flights and compute the total
 *         travel time. Using Functions!!
 * Modified by: Liam Strand on 3/1/21
 */

#include <iostream>

using namespace std;

int getTime();
int convertToMinutes(int hours, int minutes);
int determineDuration(int time1, int time2);
void printDuration(string label, int duration);

int main() {

    // Get data for first flight from user and save to variables
    cout << "Flight 1: ";
    int hours = getTime();
    int minutes = getTime();
    int dptTime1 = convertToMinutes(hours, minutes);

    hours = getTime();
    minutes = getTime();
    int arrTime1 = convertToMinutes(hours, minutes);

    // Get data for second flight from user and save to variables
    cout << "Flight 2: ";
    hours = getTime();
    minutes = getTime();
    int dptTime2 = convertToMinutes(hours, minutes);

    hours = getTime();
    minutes = getTime();
    int arrTime2 = convertToMinutes(hours, minutes);

    // Print out the result of the calculations for layover and total time
    printDuration("Layover", determineDuration(arrTime1, dptTime2));
    printDuration("Total", determineDuration(dptTime1, arrTime1) +
        determineDuration(arrTime1, dptTime2) +
        determineDuration(dptTime2, arrTime2));

    return 0;
}

/* getTime
 * Parameters: None.
 * Purpose: Gets a number from the user.
 * Returns: An integer that the user provided.
 */
int getTime() {
    int output;
    cin >> output;
    return output;
}

/* convertToMinutes
 * Parameters: The hours and minutes of a given time.
 * Purpose: Converts time from hr/min to min.
 * Returns: The time in minutes.
 */
int convertToMinutes(int hours, int minutes) {
    return (60 * hours) + minutes;
}

/* determineDuration
 * Parameters: Two times in minutes
 * Purpose: Calculates the difference in time between the two times.
 * Returns: The difference between the two times in minutes.
 */
int determineDuration(int time1, int time2) {
    // If time2 is less than time1, we add 1 day's worth of minutes, so that
    // the subtraction operation returns a positive number.
    if (time2 < time1) {
        time2 += 1440;
    }

    return time2 - time1;
}

/* printDuration
 * Parameters: The label of the duration and the duration in minutes.
 * Purpose: Converts a time from minutes to hr/min and prints a formatted
            version with a label.
 * Returns: None.
 */
void printDuration(string label, int duration) {
    int minutes, hours;

    hours = duration / 60;
    minutes = duration - (hours * 60);

    cout << label << ": " << hours << " hr " << minutes << " min" << endl;
}
