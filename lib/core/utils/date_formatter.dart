import 'package:intl/intl.dart';

class DateFormatter {
  const DateFormatter._();

  static final DateFormat _dayMonthYear = DateFormat('MMM d, yyyy');
  static final DateFormat _dayMonth = DateFormat('MMM d');
  static final DateFormat _monthYear = DateFormat('MMMM yyyy');
  static final DateFormat _time = DateFormat('h:mm a');

  static String date(DateTime dateTime) => _dayMonthYear.format(dateTime);

  static String dayMonth(DateTime dateTime) => _dayMonth.format(dateTime);

  static String monthYear(DateTime dateTime) => _monthYear.format(dateTime);

  static String time(DateTime dateTime) => _time.format(dateTime);

  static String dateTime(DateTime dateTime) => '${date(dateTime)} · ${time(dateTime)}';

  static String relativeDayLabel(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final diff = today.difference(target).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    if (diff > 1 && diff < 7) return DateFormat('EEEE').format(dateTime);
    return date(dateTime);
  }
}
