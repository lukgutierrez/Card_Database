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
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: cartadata.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(cartadata[index].peoplecard),
                  Text(cartadata[index].numbercard),
                  Text(cartadata[index].dnipeople),
                  Text(cartadata[index].datecard),
                  Text(cartadata[index].cvccard)
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                children: [
                  TextField(
                    controller: numbercard,
                  ),
                  TextField(
                    controller: namepeople,
                  ),
                  TextField(
                    controller: datacard,
                  ),
                  TextField(
                    controller: cvccard,
                  ),
                  TextField(
                    controller: dnipeople,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print("SAVE INFORMATIONDATE");
                        await hiveData.saveDataMoney(Carta(
                            numbercard: numbercard.text,
                            datecard: datacard.text,
                            cvccard: cvccard.text,
                            peoplecard: namepeople.text,
                            dnipeople: dnipeople.text));
                        await getData();
                      },
                      child: Container(
                        child: Text("INFORMATION"),
                      ))
                ],
              );
            },
          );
        }));
  }
}
