import 'package:card_database_aplication/models/Cards.dart';
import 'package:card_database_aplication/models/hive_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numbercard = TextEditingController(text: "");
  TextEditingController datacard = TextEditingController(text: "");
  TextEditingController cvccard = TextEditingController(text: "");
  TextEditingController namepeople = TextEditingController(text: "");
  TextEditingController dnipeople = TextEditingController(text: "");
  final HiveData hiveData = const HiveData();
  List<Carta> cartadata = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    cartadata = await hiveData.contact;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Hello LukGtz ;)",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        ),
        body: ListView.builder(
          itemCount: cartadata.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartadata[index].numbercard),
                      Text(cartadata[index].peoplecard),
                      Text(cartadata[index].datecard),
                      Text(cartadata[index].cvccard),
                      Text(cartadata[index].dnipeople)
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await hiveData.deleteDataMoneyIndex(index);
                        await getData();
                      },
                      child: Icon(Icons.delete))
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TeXfiel(numbercard, "NumberCard:", TextInputType.number),
                    TeXfiel(namepeople, "NamePeople:", TextInputType.text),
                    TeXfiel(datacard, "DateCard:", TextInputType.number),
                    TeXfiel(cvccard, "CVCCard:", TextInputType.number),
                    TeXfiel(dnipeople, "Subscription:", TextInputType.text),
                    ElevatedButton(
                        onPressed: () async {
                          await hiveData.saveDataMoney(Carta(
                              numbercard: numbercard.text,
                              datecard: datacard.text,
                              cvccard: cvccard.text,
                              peoplecard: namepeople.text,
                              dnipeople: dnipeople.text));
                          await getData();
                        },
                        child: Container(
                          child: Text("SAVE INFORMATION"),
                        ))
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add_card),
        ));
  }
}

TeXfiel(controller, name, date) {
  return TextField(
    keyboardType: date,
    textCapitalization: TextCapitalization.characters,
    controller: controller,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: name,
        hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
  );
}
