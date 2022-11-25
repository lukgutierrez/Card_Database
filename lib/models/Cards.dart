import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';

part 'Cards.g.dart';

@HiveType(typeId: 1)
class Card {
  @HiveField(0)
  final Int numbercard;
  @HiveField(1)
  final Int datecard;
  @HiveField(2)
  final Int cvccard;
  @HiveField(3)
  final String peoplecard;
  @HiveField(4)
  final Int dnipeople;

  Card({
    required this.numbercard,
    required this.datecard,
    required this.cvccard,
    required this.peoplecard,
    required this.dnipeople,
  });
}
