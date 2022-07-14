import 'package:intl/intl.dart';

class datimeutil {
  static String GetCurrentDate() {
    return DateFormat.yMMMMd('en_US').format(DateTime.now());
  }
}
