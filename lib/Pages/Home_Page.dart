import 'package:card_database_aplication/models/Cards.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _numbercard = TextEditingController();
  TextEditingController _datecard = TextEditingController();
  TextEditingController _cvccard = TextEditingController();
  TextEditingController _peoplecard = TextEditingController();
  TextEditingController _dnipeople = TextEditingController();

  late final Box box;
  @override
  void initState() {
    super.initState();
    box = Hive.box('cards');
  }

  _addInfo() async {
    
    Carta newCard =  Carta(
      numbercard: _numbercard.text, 
      datecard: _datecard.text,
      cvccard: _cvccard.text, 
      peoplecard: _peoplecard.text, 
      dnipeople: _dnipeople.text
      );
    print("SALVADO");

    box.add(newCard);
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
            controller: _numbercard,
          ),
          TextField(
            controller: _peoplecard,
          ),
          TextField(
            controller: _datecard,
          ),
          TextField(
            controller: _cvccard,
          ),
          TextField(
            controller: _dnipeople,
          ),
          ElevatedButton(
              onPressed: () {
                _addInfo();
              },
              child: Text("NEXT TO"))
        ],
      ),
    );
  }
}
//https://blog.logrocket.com/handling-local-data-persistence-flutter-hive/
//https://github.com/sbis04/hive_demo/blob/main/lib/utils/add_person_form.dart