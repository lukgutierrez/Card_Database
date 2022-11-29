import 'package:card_database_aplication/models/Cards.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CardInformation extends StatefulWidget {
  final String numbercard;
  final String peoplecard;
  final String cvccard;
  final String datecard;
  final String dnipeople;

  CardInformation(
      {required this.numbercard,
      required this.peoplecard,
      required this.cvccard,
      required this.datecard,
      required this.dnipeople});

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

  _delete(int index) {
    carta.deleteAt(index);
  }

  _addInfo(index) async {
    Carta newCarta = Carta(
        numbercard: widget.numbercard,
        datecard: widget.datecard,
        cvccard: widget.cvccard,
        peoplecard: widget.peoplecard,
        dnipeople: widget.dnipeople);

    carta.add(newCarta);
    print('Save Information!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () async {
                _addInfo(0);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: carta.listenable(),
          builder: (context, box, wiget) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var tarjeta = currentBox.get(index);
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    _delete(index);
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(tarjeta.numbercard),
                                Text(tarjeta.peoplecard),
                                Text(tarjeta.datecard),
                                Text(tarjeta.cvccard),
                                Text(tarjeta.dnipeople),
                                Divider(
                                  height: 30,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  _addInfo(index);
                                },
                                child: Text("Save"))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
