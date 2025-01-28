import 'dart:io';

class Contactmodel {
  File? image;
  String username;
  String email;
  String phone;
  Contactmodel({
      this.image,
      required this.username,
      required this.email,
      required this.phone}
);
  static List<Contactmodel> Contacts =[];
}
