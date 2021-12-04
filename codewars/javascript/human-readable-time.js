// https://www.codewars.com/kata/52685f7382004e774f0001f7

const seconds_in_minute = 60;
const seconds_in_hour = 60 * seconds_in_minute;

function humanReadable (seconds) {
    const timeSpan = [];
    const timeUnitsInSeconds = [seconds_in_hour, seconds_in_minute, 1];

    let remainingSeconds = seconds;
    for (const timeUnit of timeUnitsInSeconds) {
        const timeSlice = Math.trunc(remainingSeconds / timeUnit)
        remainingSeconds -= (timeSlice * timeUnit);
        timeSpan.push(timeSlice.toString().padStart(2, '0'));
    }

    return timeSpan.join(':');
}