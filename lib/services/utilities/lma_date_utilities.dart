class BakerDateUtil {
  static bool isSameYear({
    required DateTime firstDate,
    required DateTime secondDate,
  }) {
    return firstDate.year == secondDate.year;
  }

  static bool isSameMonth({
    required DateTime firstDate,
    required DateTime secondDate,
  }) {
    final _isSameYear = isSameYear(
      firstDate: firstDate,
      secondDate: secondDate,
    );
    final isSameMonth = firstDate.month == secondDate.month;

    return isSameMonth && _isSameYear;
  }

  static bool isSameDay({
    required DateTime firstDate,
    required DateTime secondDate,
  }) {
    final isSameDay = firstDate.day == secondDate.day;
    final _isSameMonth = isSameMonth(
      firstDate: firstDate,
      secondDate: secondDate,
    );
    final _isSameYear = isSameYear(
      firstDate: firstDate,
      secondDate: secondDate,
    );

    return isSameDay && _isSameMonth && _isSameYear;
  }
}
