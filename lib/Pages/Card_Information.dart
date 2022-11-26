import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class CardInformation extends StatefulWidget {
  CardInformation({Key? key}) : super(key: key);

  @override
  State<CardInformation> createState() => _CardInformationState();
}

class _CardInformationState extends State<CardInformation> {
  late final Box carta;
  @override
  void initState() {
    carta = Hive.box('cards');
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(itemBuilder: ),
    );
  }
}
