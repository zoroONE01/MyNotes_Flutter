import 'package:intl/intl.dart';

class DatetimeUtil {
  static String getCurrentDate() {
    return DateFormat.yMMMMd('en_US').format(DateTime.now());
  }
}
