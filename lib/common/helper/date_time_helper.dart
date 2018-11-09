class DateTimeHelper {
  static const List<int> _splitPoints = const [86400, 3600, 60, 1];

  static String getTimeStringFromSeconds(int seconds) {

    var dur = Duration(seconds: seconds);

    return dur.toString().split(".")[0];
  }
}