import 'package:vietnamese_lunar_core/vietnamese_lunar_core.dart';
import 'holiday.dart';

class VnHolidayUtils {
  // Private static list of holidays
  static const List<Holiday> _holidays = [
    // Group 1: Major Public Holidays (Nghỉ lễ theo luật)
    // Solar
    Holiday(name: 'Tết Dương Lịch', day: 1, month: 1, isDayOff: true),
    Holiday(name: 'Giải phóng Miền Nam', day: 30, month: 4, isDayOff: true),
    Holiday(name: 'Quốc tế Lao động', day: 1, month: 5, isDayOff: true),
    Holiday(name: 'Quốc Khánh', day: 2, month: 9, isDayOff: true),
    // Lunar
    Holiday(
      name: 'Tết Nguyên Đán',
      day: 1,
      month: 1,
      isLunar: true,
      isDayOff: true,
    ),
    Holiday(
      name: 'Tết Nguyên Đán',
      day: 2,
      month: 1,
      isLunar: true,
      isDayOff: true,
    ),
    Holiday(
      name: 'Tết Nguyên Đán',
      day: 3,
      month: 1,
      isLunar: true,
      isDayOff: true,
    ),
    Holiday(
      name: 'Giỗ Tổ Hùng Vương',
      day: 10,
      month: 3,
      isLunar: true,
      isDayOff: true,
    ),

    // Group 2: Vietnamese Observances (Không nghỉ)
    // Solar
    Holiday(name: 'Thành lập Đảng CSVN', day: 3, month: 2),
    Holiday(name: 'Thầy thuốc Việt Nam', day: 27, month: 2),
    Holiday(name: 'Quốc tế Phụ nữ', day: 8, month: 3),
    Holiday(name: 'Thành lập Đoàn TNCS', day: 26, month: 3),
    Holiday(name: 'Ngày Sách Việt Nam', day: 21, month: 4),
    Holiday(name: 'Chiến thắng Điện Biên Phủ', day: 7, month: 5),
    Holiday(name: 'Sinh nhật Bác', day: 19, month: 5),
    Holiday(name: 'Quốc tế Thiếu nhi', day: 1, month: 6),
    Holiday(name: 'Báo chí Việt Nam', day: 21, month: 6),
    Holiday(name: 'Gia đình Việt Nam', day: 28, month: 6),
    Holiday(name: 'Thương binh Liệt sĩ', day: 27, month: 7),
    Holiday(name: 'Cách mạng Tháng 8', day: 19, month: 8),
    Holiday(name: 'Giải phóng Thủ đô', day: 10, month: 10),
    Holiday(name: 'Doanh nhân Việt Nam', day: 13, month: 10),
    Holiday(name: 'Phụ nữ Việt Nam', day: 20, month: 10),
    Holiday(name: 'Pháp luật Việt Nam', day: 9, month: 11),
    Holiday(name: 'Nhà giáo Việt Nam', day: 20, month: 11),
    Holiday(name: 'Quân đội Nhân dân', day: 22, month: 12),
    // Lunar
    Holiday(
      name: 'Tết Nguyên Tiêu (Rằm tháng Giêng)',
      day: 15,
      month: 1,
      isLunar: true,
    ),
    Holiday(
      name: 'Tết Hàn Thực (Bánh trôi bánh chay)',
      day: 3,
      month: 3,
      isLunar: true,
    ),
    Holiday(name: 'Lễ Phật Đản', day: 15, month: 4, isLunar: true),
    Holiday(name: 'Tết Đoan Ngọ', day: 5, month: 5, isLunar: true),
    Holiday(
      name: 'Lễ Thất Tịch (Ngưu Lang Chức Nữ)',
      day: 7,
      month: 7,
      isLunar: true,
    ),
    Holiday(name: 'Lễ Vu Lan', day: 15, month: 7, isLunar: true),
    Holiday(name: 'Tết Trung Thu', day: 15, month: 8, isLunar: true),
    Holiday(name: 'Ông Công Ông Táo', day: 23, month: 12, isLunar: true),

    // Group 3: Western/International Holidays (Hưởng ứng)
    // Solar
    Holiday(name: 'Lễ Tình Nhân (Valentine)', day: 14, month: 2),
    Holiday(name: 'Cá Tháng Tư (April Fool\'s)', day: 1, month: 4),
    Holiday(name: 'Halloween', day: 31, month: 10),
    Holiday(
      name: 'Quốc tế Đàn ông (International Men\'s Day)',
      day: 19,
      month: 11,
    ),
    Holiday(name: 'Lễ Giáng Sinh (Noel)', day: 25, month: 12),
  ];

  static List<Holiday> getHolidays(DateTime date) {
    final List<Holiday> results = [];

    // Step 1: Check Solar Holidays
    for (var holiday in _holidays) {
      if (!holiday.isLunar) {
        if (holiday.day == date.day && holiday.month == date.month) {
          results.add(holiday);
        }
      }
    }

    // Step 2: Convert date to LunarDate
    final lunarDate = const VnLunarCore().convertSolarToLunar(date);

    // Step 3: Check Lunar Holidays
    for (var holiday in _holidays) {
      if (holiday.isLunar) {
        if (holiday.day == lunarDate.day && holiday.month == lunarDate.month) {
          results.add(holiday);
        }
      }
    }

    return results;
  }
}
