import 'package:flutter/material.dart.';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerified;
  String? image;


  UserModel({this.name, this.email, this.phone, this.uId, this.isEmailVerified,
    this.image, });

  UserModel.fromJson(Map<String, dynamic>? json) {
    email = json!['email'] ?? '';
    name = json!['name']?? '';
    phone = json!['phone']?? '';
    uId = json!['uId']?? '';
    isEmailVerified = json!['isEmailVerified']?? '';
    image = json!['image']?? '';

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'isEmailVerified': isEmailVerified,
      'image': image,

     'uId':uId
    };
  }
}
