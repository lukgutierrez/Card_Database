import 'package:card_database_aplication/models/Cards.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  const HiveData();
  Future<int> saveDataMoney(Carta carta) async {
    final Box<Carta> box = await Hive.openBox<Carta>('carta');
    return box.add(carta);
  }

  Future<int> deleteDataMoney(Carta carta) async {
    final Box<Carta> box = await Hive.openBox<Carta>('carta');
    return box.clear();
  }

  Future<void> deleteDataMoneyIndex(int index) async {
    final Box<Carta> box = await Hive.openBox<Carta>('carta');
    return box.deleteAt(index);
  }

  Future<List<Carta>> get contact async {
    final Box<Carta> box = await Hive.openBox<Carta>('carta');
    return box.values.toList();
  }
}
