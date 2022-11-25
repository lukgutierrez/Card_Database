import 'package:card_database_aplication/Pages/Card_Information.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController numbercard = TextEditingController();
    TextEditingController datecard = TextEditingController();
    TextEditingController cvccard = TextEditingController();
    TextEditingController peoplecard = TextEditingController();
    TextEditingController dnipeople = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
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
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardInformation()));
              },
              child: Text("NEXT TO"))
        ],
      ),
    );
  }
}
