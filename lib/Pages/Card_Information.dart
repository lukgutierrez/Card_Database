import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

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
        body: ValueListenableBuilder(
            valueListenable: carta.listenable(),
            builder: (context, box, wiget) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var currentBox = box;
                  var tarjeta = currentBox.get(index);
                  return ListTile(
                    title: Text(tarjeta.numbercard),
                  );
                },
              );
            }));
  }
}
