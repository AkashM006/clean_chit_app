import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat("dd/MM/yyyy");

List<DateTime> getScheduledDates(
  DateTime startDate,
  FrequencyType frequencyType,
  int frequency,
  int count,
) {
  if (frequencyType == FrequencyType.monthly) {
    return _getScheduledMonths(startDate, frequency, count);
  }

  return _getScheduledWeeks(startDate, frequency, count);
}

List<DateTime> _getScheduledMonths(
  DateTime startDate,
  int frequency,
  int count,
) {
  List<DateTime> result = [];

  for (int i = 0; i < count; i++) {
    result.add(_limitToTheLastDayOfTheMonth(startDate, (i + 1) * frequency));
  }

  return result;
}

List<DateTime> _getScheduledWeeks(
  DateTime startDate,
  int frequency,
  int count,
) {
  List<DateTime> result = [];

  for (int i = 0; i < count; i++) {
    result.add(DateTime(
      startDate.year,
      startDate.month,
      result.isEmpty ? startDate.day + 7 : result.last.day + 7,
    ));
  }

  return result;
}

DateTime _limitToTheLastDayOfTheMonth(DateTime startDate, int offset) {
  final addedValue = startDate.month + offset;
  final finalMonth = addedValue > 12 ? addedValue % 12 : addedValue;

  DateTime result =
      DateTime(startDate.year, startDate.month + offset, startDate.day);

  if (result.month == finalMonth) return result;

  return _getLastDateOfMonth(result, finalMonth);
}

DateTime _getLastDateOfMonth(DateTime date, int month) {
  DateTime nextMonthStartDate = DateTime(date.year, month + 1, 1);

  return nextMonthStartDate.subtract(const Duration(days: 1));
}

String getWeekDay(DateTime date) {
  switch (date.weekday) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return 'Invalid day of the week';
  }
}
