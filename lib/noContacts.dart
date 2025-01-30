import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Nocontacts extends StatelessWidget {
  const Nocontacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
            Lottie.asset(
              'assets/Lottie/empty_list.json',
              width: 368,
              height: 368,
              fit: BoxFit.cover,
            ),const Text(
              "There is No Contacts Added Here",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffFFF1D4),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),

        ],
      ),
    );
  }
}
