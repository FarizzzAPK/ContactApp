import 'package:flutter/material.dart';

import 'contactModel.dart';

class Contactcard extends StatelessWidget {
  Contactmodel contact;
  int index;
  Function callBackClick;
  Contactcard({
    super.key,
    required this.contact,
    required this.index,
    required this.callBackClick,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffFFF1D4),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.file(
                        contact.image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xffFFF1D4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          contact.username,
                          style: TextStyle(
                            color: Color(0xff29384D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Color(0xff29384D),
                        ),
                        SizedBox(width: 7),
                        Text(contact.email,style: TextStyle(fontSize: 11),),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color(0xff29384D),
                        ),
                        SizedBox(width: 7),
                        Text(contact.phone,style: TextStyle(fontSize: 14),),
                      ],
                    ),
                    SizedBox(height: 7),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xffF93E3E),
                        foregroundColor: Color(0xffffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        callBackClick(index);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Color(0xffffffff),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: Color(0xffFFF1D4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}