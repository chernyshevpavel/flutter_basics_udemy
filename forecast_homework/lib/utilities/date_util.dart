import 'package:intl/intl.dart';

abstract class DateUtil {
  static String formattedDate(DateTime dateTime) =>
      DateFormat('EEE, MMM d, y').format(dateTime).toString();
}
