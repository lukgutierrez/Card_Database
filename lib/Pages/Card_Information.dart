import 'package:card_database_aplication/models/Cards.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CardInformation extends StatefulWidget {
  final String numbercard;
  final String peoplecard;
  final String cvccard;

  final String dnipeople;

  CardInformation(
      {required this.numbercard,
      required this.peoplecard,
      required this.cvccard,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () async {
                  Carta newCard = Carta(
                      numbercard: widget.numbercard,
                      peoplecard: widget.peoplecard,
                      cvccard: widget.cvccard,
                      dnipeople: widget.dnipeople,
                      datecard: widget.peoplecard);

                  carta.add(newCard);
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: ListTile(
          title: Text(widget.numbercard),
          subtitle: Text(widget.peoplecard),
        )

        // ValueListenableBuilder(
        //     valueListenable: carta.listenable(),
        //     builder: (context, box, wiget) {
        //       return ListView.builder(
        //         itemCount: box.length,
        //         itemBuilder: (context, index) {
        //           var currentBox = box;
        //           var tarjeta = currentBox.get(index);
        //           return ListTile(
        //             title: Text(tarjeta.numbercar),
        //           );
        //         },
        //       );
        //     }),
        );
  }
}
