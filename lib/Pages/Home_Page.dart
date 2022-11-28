import 'package:card_database_aplication/Pages/Card_Information.dart';
import 'package:card_database_aplication/models/Cards.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numbercard = TextEditingController();
  TextEditingController datecard = TextEditingController();
  TextEditingController cvccard = TextEditingController();
  TextEditingController peoplecard = TextEditingController();
  TextEditingController dnipeople = TextEditingController();

  late final Box box;
  @override
  void initState() {
    super.initState();
    box = Hive.box('cards');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          TextField(
            controller: numbercard,
          ),
          TextField(
            controller: peoplecard,
          ),
          TextField(
            controller: datecard,
          ),
          TextField(
            controller: cvccard,
          ),
          TextField(
            controller: dnipeople,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Save INFOMATION")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CardInformation(
                    numbercard: numbercard.text,
                    peoplecard: peoplecard.text,
                    cvccard: cvccard.text,
                    dnipeople: dnipeople.text,
                  ),
                ));
              },
              child: Text("NEXT TO"))
        ],
      ),
    );
  }
}
//https://blog.logrocket.com/handling-local-data-persistence-flutter-hive/
//https://github.com/sbis04/hive_demo/blob/main/lib/utils/add_person_form.dart