# vietnamese_holidays

[![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**The ultimate Vietnamese Holiday database & calculator for Dart/Flutter.**

`vietnamese_holidays` is a powerful, lightweight library designed to handle the complexities of the Vietnamese calendar. It automatically converts Solar dates to Lunar dates to accurately detect traditional holidays (like Tet Nguyen Dan, Hung Kings Commemoration) alongside fixed Solar holidays and international observances.

## Key Features

*   **Smart Lunar Conversion**: Automatically handles Solar-to-Lunar conversion to pinpoint dynamic traditional holidays.
*   **Comprehensive Database**: Includes:
    *   **Public Holidays** (Red days - Legal days off).
    *   **Vietnamese Observances** (Cultural events like Teachers' Day, Women's Day).
    *   **International Holidays** (Western festivals like Halloween, Valentine, Men's Day).
*   **Simple API**: Clean `DateTime` extensions for intuitive usage.

## Installation

Add the package to your `pubspec.yaml`. Since this package is currently hosted via Git, use the following configuration:

```yaml
dependencies:
  vietnamese_holidays:
    git:
      url: https://github.com/YOUR_USERNAME/vietnamese_holidays.git
      ref: main
```

*Note: This package internally manages the dependency on `vietnamese_lunar_core` for accurate lunar calculations.*

## Usage Examples

### Scenario A: Check if today is a Public Holiday (Red Day)

Easily check if a specific date is a legal day off in Vietnam.

```dart
import 'package:vietnamese_holidays/vietnamese_holidays.dart';

void main() {
  DateTime today = DateTime.now();
  
  if (today.isVietnameseDayOff) {
    print("Hooray! No work today! 🎉");
  } else {
    print("Back to work! 💼");
  }
}
```

### Scenario B: Get events for a specific date

Retrieve all holidays falling on a given date, including both Solar and Lunar events.

```dart
import 'package:vietnamese_holidays/vietnamese_holidays.dart';

void main() {
  // Check International Men's Day
  DateTime mensDay = DateTime(2024, 11, 19);
  List<Holiday> events = mensDay.vietnameseHolidays;
  
  print(events); 
  // Output: [Holiday(name: "Quốc tế Đàn ông (International Men's Day)", ...)]

  // Check Tet Holiday (Lunar New Year)
  DateTime tet = DateTime(2025, 1, 29); // Mùng 1 Tết 2025
  print(tet.vietnameseHolidays);
  // Output: [Holiday(name: "Tết Nguyên Đán", isDayOff: true, isLunar: true, ...)]
}
```

## Features & Supported Holidays

We support a wide range of holidays categorized for your convenience:

*   **Official Public Holidays (Nghỉ lễ theo luật)**
    *   Tết Dương Lịch (New Year's Day)
    *   Tết Nguyên Đán (Lunar New Year)
    *   Giỗ Tổ Hùng Vương (Hung Kings Commemoration)
    *   Giải phóng Miền Nam (Reunification Day)
    *   Quốc tế Lao động (Labor Day)
    *   Quốc Khánh (National Day)

*   **Vietnamese Observances (Kỷ niệm & Văn hóa)**
    *   Thành lập Đảng CSVN
    *   Thầy thuốc Việt Nam (Physicians' Day)
    *   Quốc tế Phụ nữ (International Women's Day)
    *   Chiến thắng Điện Biên Phủ
    *   Sinh nhật Bác (Ho Chi Minh's Birthday)
    *   Thương binh Liệt sĩ (Remembrance Day)
    *   Phụ nữ Việt Nam (Vietnamese Women's Day)
    *   Nhà giáo Việt Nam (Teachers' Day)
    *   Quân đội Nhân dân (People's Army Day)
    *   *Lunar:* Tết Nguyên Tiêu, Lễ Phật Đản, Tết Trung Thu (Mid-Autumn Festival), Ông Công Ông Táo...

*   **International & Fun (Hưởng ứng)**
    *   Lễ Tình Nhân (Valentine's Day)
    *   Cá Tháng Tư (April Fool's)
    *   Halloween
    *   Quốc tế Đàn ông (International Men's Day - 19/11)
    *   Lễ Giáng Sinh (Christmas)

## API Reference

### `Holiday` Class

The core data structure representing a holiday event.

| Property | Type | Description |
| :--- | :--- | :--- |
| `name` | `String` | The name of the holiday (e.g., "Tết Nguyên Đán"). |
| `day` | `int` | The day of the month (Solar or Lunar). |
| `month` | `int` | The month of the year (Solar or Lunar). |
| `isLunar` | `bool` | `true` if the holiday is calculated based on the Lunar calendar. |
| `isDayOff` | `bool` | `true` if it is a legal public holiday in Vietnam (Red day). |

---

Built with ❤️ for the Vietnamese Flutter Community.
