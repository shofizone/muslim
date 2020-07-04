import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  String get formatTime1 {
    if (this == null) return null;
    return DateFormat("hh:mm a").format(this);
  }
  String get formatTime2 {
    if (this == null) return null;
    return DateFormat("hh:mm:ss a").format(this);
  }

  String get formatTime11 {
    if (this == null) return null;
    return DateFormat("hh:mm").format(this);
  }
  String get getAmpm {
    if (this == null) return null;
    return DateFormat("a").format(this);
  }
  String get formatDate1 {
    if (this == null) return null;
    return DateFormat('EEEE, MMM d, ''yyyy').format(this);
  }

}

extension DurationEx on Duration {
  String formatDuration1() {
    if (this == null) return null;

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(this.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(this.inSeconds.remainder(60));
    return "${twoDigits(this.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
