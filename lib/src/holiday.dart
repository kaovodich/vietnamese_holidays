class Holiday {
  final String name;
  final int day;
  final int month;
  final bool isLunar; // true = Lunar Calendar based, false = Solar
  final bool isDayOff; // true = Public Holiday (Red day in VN law)

  const Holiday({
    required this.name,
    required this.day,
    required this.month,
    this.isLunar = false,
    this.isDayOff = false,
  });

  @override
  String toString() {
    return 'Holiday(name: $name, day: $day, month: $month, isLunar: $isLunar, isDayOff: $isDayOff)';
  }
}
