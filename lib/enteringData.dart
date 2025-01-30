import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'CustomInputField.dart';
import 'contactModel.dart';

class Enteringdata extends StatefulWidget {
  Enteringdata({super.key});

  @override
  State<Enteringdata> createState() => _EnteringdataState();

  void newcontact() {}
}

class _EnteringdataState extends State<Enteringdata> {
  // Controllers
  late TextEditingController UserNameController;
  late TextEditingController EmailController;
  late TextEditingController PhoneNumberController;

  String userName1 = 'User Name';
  String Email1 = 'example@email.com';
  String PhoneNumber1 = '+200000000000';

  final formKey = GlobalKey<FormState>();

  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    UserNameController = TextEditingController();
    EmailController = TextEditingController();
    PhoneNumberController = TextEditingController();
  }

  Future<void> _pickImageFromGallery() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  MediaQuery.of(context).viewInsets,      child: Material(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff29384D),

          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        if (_pickedImage != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(
                              _pickedImage!,
                              height: 146,
                              width: 146,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (_pickedImage == null)
                          Container(
                            height: 146,
                            width: 146,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: Color(0xffFFF1D4),
                                width: 2,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: _pickImageFromGallery,
                              child: Lottie.asset(
                                'assets/Lottie/image_picker.json',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            height: 146,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: UserNameController,
                                  builder: (context, value, child) {
                                    return Text(
                                      value.text.isEmpty
                                          ? "User Name"
                                          : value.text,
                                      style: TextStyle(
                                        color: Color(0xFFFDF6E3),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 32,
                                  child: Center(
                                    child: Container(
                                      height: 1,
                                      color: Color(0xffFFF1D4),
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: EmailController,
                                  builder: (context, value, child) {
                                    return Text(
                                      value.text.isEmpty
                                          ? "Email"
                                          : value.text,
                                      style: TextStyle(
                                        color: Color(0xFFFDF6E3),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 32,
                                  child: Center(
                                    child: Container(
                                      height: 1,
                                      color: Color(0xffFFF1D4),
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: PhoneNumberController,
                                  builder: (context, value, child) {
                                    return Text(
                                      value.text.isEmpty
                                          ? "+200000000000"
                                          : value.text,
                                      style: TextStyle(
                                        color: Color(0xFFFDF6E3),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    CustomInputField(
                      textInputType: TextInputType.name,
                      controller: UserNameController,
                      hintText: "Enter User Name",
                      validator: (value) =>
                      value.isEmpty ? "Enter Your name" : null,
                    ),
                    SizedBox(height: 8),
                    CustomInputField(
                      textInputType: TextInputType.emailAddress,
                      controller: EmailController,
                      hintText: "Enter User Email",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter User Email";
                        } else if (!RegExp(
                            r'^[a-zA-Z0-9._%±]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return "Enter valid email";
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    CustomInputField(
                      textInputType: TextInputType.phone,
                      controller: PhoneNumberController,
                      hintText: "Enter User Phone",
                      validator: (value) =>
                      value.isEmpty ? "Enter User Phone" : null,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xffFFF1D4),
                        ),
                      ),
                      onPressed: () {
                        newcontact();
                        print(Contactmodel.Contacts);

                      },
                      child: Text(
                        "Enter user",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Color(0xff29384D),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void newcontact() {
    if (formKey.currentState!.validate()) {
      if (_pickedImage == null) {
        // Show an error if no image is selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please select an image"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Add the new contact
      Contactmodel.Contacts.add(
        Contactmodel(
          username: UserNameController.text,
          email: EmailController.text,
          phone: PhoneNumberController.text,
          image: _pickedImage,
        ),
      );

      // Notify the Homescreen to update the UI
      Navigator.pop(context, true); // Pass `true` to indicate a new contact was added
    }
  }
}
