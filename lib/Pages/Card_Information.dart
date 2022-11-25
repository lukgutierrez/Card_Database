import 'package:flutter/material.dart';

class CardInformation extends StatefulWidget {
  CardInformation({Key? key}) : super(key: key);

  @override
  State<CardInformation> createState() => _CardInformationState();
}

class _CardInformationState extends State<CardInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(),
    );
  }
}
