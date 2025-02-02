import 'package:contactf/contactCard.dart';
import 'package:contactf/contactModel.dart';
import 'package:contactf/noContacts.dart';
import 'package:contactf/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'enteringData.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void _showModalBottunSheet() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Color(0xff29384D),
      builder: (context) => Enteringdata(),
    );
    if (result == true) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29384D),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 24),
            child: Row(
              children: [
                RouteImage(117, 39),
              ],
            ),
          ),
          Expanded(
            child: Contactmodel.Contacts.isEmpty
                ? Nocontacts()
                : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: Contactmodel.Contacts.length,
                itemBuilder: (context, index) => Contactcard(
                  contact: Contactmodel.Contacts[index],
                  index: index,
                  callBackClick: (int index) {
                    Contactmodel.Contacts.removeAt(index);
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: Contactmodel.Contacts.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  Contactmodel.Contacts.removeAt(Contactmodel.Contacts.length - 1);
                });
              },
              child: Icon(Icons.delete, color: Color(0xffffffff)),
              backgroundColor: Color(0xffF93E3E),
            ),
          ),
          SizedBox(height: 8),
          Visibility(
            visible: Contactmodel.Contacts.length <= 5,
            child: FloatingActionButton(
              onPressed: _showModalBottunSheet,
              child: Icon(Icons.add, color: Color(0xff29384D)),
              backgroundColor: Color(0xffFFF1D4),
            ),
          ),
        ],
      ),
    );
  }
}