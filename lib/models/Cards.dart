import 'package:hive_flutter/hive_flutter.dart';

part 'Cards.g.dart';

@HiveType(typeId: 1)
class Carta {
  @HiveField(0)
  final String numbercard;
  @HiveField(1)
  final String datecard;
  @HiveField(2)
  final String cvccard;
  @HiveField(3)
  final String peoplecard;
  @HiveField(4)
  final String dnipeople;

  const Carta({
    required this.numbercard,
    required this.datecard,
    required this.cvccard,
    required this.peoplecard,
    required this.dnipeople,
  });
}
