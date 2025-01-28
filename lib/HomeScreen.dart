import 'package:contactf/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'enteringData.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff29384D),
      body: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            height: 39,
            width: 117,
            child: RouteImage(117, 39),
          ),

          Center(
            child: Lottie.asset(
              'assets/Lottie/empty_list.json',
              width: 368,
              height: 368,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: MediaQuery.of(context).size.height * 0.3,
            child: const Text(
              "There is No Contacts Added Here",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffFFF1D4),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(
          context: context,
          builder: (context) {

            return Enteringdata();
          },
        );
      },child: Icon(Icons.add,color: Color(0xff29384D),),backgroundColor: Color(0xffFFF1D4),),
    );
  }
}
