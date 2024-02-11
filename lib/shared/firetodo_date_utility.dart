import 'package:collection/collection.dart';

class FireTodoDateUtility {
  static int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(
      firstDayThisMonth.year,
      firstDayThisMonth.month + 1,
      firstDayThisMonth.day,
    );

    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  static List<DateTime> getDatesInMonth(DateTime date) {
    final totalDays = daysInMonth(date);
    final listOfDates = List.generate(totalDays, (i) {
      return DateTime(date.year, date.month, i + 1);
    });

    return listOfDates;
  }

  static List<List<DateTime>> getDatesInMonthWeekly(DateTime date) {
    final listOfDates = getDatesInMonth(date);
    return listOfDates.slice(10, 24).slices(7).toList();
  }
}
