enum MaterialColumns {
  none(value: 0),
  c1(value: 1),
  c2(value: 2),
  c3(value: 3),
  c4(value: 4),
  c5(value: 5),
  c6(value: 6),
  c7(value: 7),
  c8(value: 8),
  c9(value: 9),
  c10(value: 10),
  c11(value: 11),
  c12(value: 12);

  final int value;

  const MaterialColumns({required this.value});

  factory MaterialColumns.init({required int value}) => MaterialColumns.values
      .firstWhere((e) => e.value == value, orElse: () => MaterialColumns.c1);
}
