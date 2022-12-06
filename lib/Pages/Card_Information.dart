import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CardInformation extends StatefulWidget {
  late final String numbercard;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () async {}, icon: Icon(Icons.save)),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: carta.listenable(),
          builder: (context, box, widget) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                late var currentBox = box;
                late var tarjeta = currentBox.get(index);
               return 
               ListTile(
                title: Text(tarjeta?.numbercard??""),
               )
               ;
                // return Dismissible(
                //   key: UniqueKey(),
                //   onDismissed: (direction) {
                //     _delete(index);
                //   },
                //   child: Container(
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             Column(
                //               children: [
                //                 // Text(widget.datecard),
                //                 // Text(widget.peoplecard),
                //                 // Text(widget.numbercard),
                //                 // Text(widget.cvccard),
                //                 // Text(widget.dnipeople),
                //                 Text(tarjeta?.numbercard ?? "uh"),
                //                 Text(tarjeta?.datecard ?? "oho"),
                //                 // Text(tarjeta.cvccard),
                //                 // Text(tarjeta.peoplecard),
                //                 // Text(tarjeta.dnipeople),
                //                 Divider(
                //                   height: 30,
                //                   color: Colors.yellow,
                //                 ),
                //               ],
                //             ),
                //             ElevatedButton(
                //                 onPressed: () {}, child: Text("hello"))
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // );
              },
            );
          }),
    );
  }
}

// List(data) {
//   return Dismissible(
//     key: UniqueKey(),
//     onDismissed: (direction) {},
//     child: Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 children: [
//                   Text(data),
//                   Text(data),
//                   Text(data),
//                   Text(data),
//                   Text(data),
//                   Divider(
//                     height: 30,
//                     color: Colors.yellow,
//                   ),
//                 ],
//               ),
//               ElevatedButton(onPressed: () {}, child: Text("Save"))
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
