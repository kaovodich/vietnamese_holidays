import 'package:flutter_test/flutter_test.dart';
import 'package:vietnamese_holidays/vietnamese_holidays.dart';

void main() {
  group('Strict Holiday Tests', () {
    test('Test Case 1: Fixed Solar Holidays (Simple)', () {
      // 19/11/2024 -> Expect: "Quốc tế Đàn ông"
      final date1 = DateTime(2024, 11, 19);
      final holidays1 = date1.vietnameseHolidays;
      expect(
        holidays1.any((h) => h.name.contains('Quốc tế Đàn ông')),
        isTrue,
        reason: 'Should contain International Men\'s Day',
      );

      // 20/11/2024 -> Expect: "Nhà giáo Việt Nam"
      final date2 = DateTime(2024, 11, 20);
      final holidays2 = date2.vietnameseHolidays;
      expect(
        holidays2.any((h) => h.name.contains('Nhà giáo Việt Nam')),
        isTrue,
        reason: 'Should contain Vietnamese Teacher\'s Day',
      );
    });

    test('Test Case 2: Lunar Holidays in Specific Years (Complex)', () {
      // Tet 2025: Input Solar 2025-01-29 (Mùng 1 Tết)
      final tet2025 = DateTime(2025, 1, 29);
      final holidaysTet = tet2025.vietnameseHolidays;
      expect(
        holidaysTet.any((h) => h.name == 'Tết Nguyên Đán'),
        isTrue,
        reason: '2025-01-29 should be Tet Nguyen Dan',
      );

      // Hung Kings 2025: Input Solar 2025-04-07 (10/3 Âm)
      final hungKings2025 = DateTime(2025, 4, 7);
      final holidaysHungKings = hungKings2025.vietnameseHolidays;
      expect(
        holidaysHungKings.any((h) => h.name == 'Giỗ Tổ Hùng Vương'),
        isTrue,
        reason: '2025-04-07 should be Hung Kings Commemoration',
      );

      // Mid-Autumn 2024: Input Solar 2024-09-17 (15/8 Âm)
      final midAutumn2024 = DateTime(2024, 9, 17);
      final holidaysMidAutumn = midAutumn2024.vietnameseHolidays;
      expect(
        holidaysMidAutumn.any((h) => h.name == 'Tết Trung Thu'),
        isTrue,
        reason: '2024-09-17 should be Mid-Autumn Festival',
      );
    });

    test('Test Case 3: Edge Cases', () {
      // Check the range of Tet (Mùng 1, 2, 3). Input Solar 2025-01-31 (Mùng 3)
      final tetMung3 = DateTime(2025, 1, 31);
      final holidaysTetMung3 = tetMung3.vietnameseHolidays;
      expect(
        holidaysTetMung3.any((h) => h.name == 'Tết Nguyên Đán'),
        isTrue,
        reason: '2025-01-31 should be Tet Nguyen Dan (Mung 3)',
      );

      // Check a random normal day -> Expect Empty List
      final randomDay = DateTime(2024, 6, 15); // Random day with no holidays
      final holidaysRandom = randomDay.vietnameseHolidays;
      expect(
        holidaysRandom,
        isEmpty,
        reason: 'Random day should have no holidays',
      );
    });
  });
}
