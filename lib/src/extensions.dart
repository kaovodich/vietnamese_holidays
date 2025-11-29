import 'holiday.dart';
import 'vn_holiday_utils.dart';

extension HolidayExt on DateTime {
  List<Holiday> get vietnameseHolidays => VnHolidayUtils.getHolidays(this);

  bool get isVietnameseDayOff {
    final holidays = vietnameseHolidays;
    return holidays.any((holiday) => holiday.isDayOff);
  }
}
