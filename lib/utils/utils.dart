import 'package:intl/intl.dart';

class Utils {
  String dateFormatter(String date) {
    final dateTime = DateFormat('dd-MMM-yyyy').format(DateTime.parse(date));
    return dateTime;
  }
}