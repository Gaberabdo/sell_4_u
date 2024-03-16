import 'package:flutter/material.dart.';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  // List? followers;
  // List? following;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.image,
    // this.followers,
    // this.following
  });
  factory UserModel.fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return UserModel(
        email : snapshot['email'],
      name : snapshot['name'],
      phone : snapshot['phone'],
      uId : snapshot['uId'],
      image : snapshot['image'],
    );
  }
Map<String, dynamic> toJson()=> {
    'name': name,
    'email': email,
    'phone': phone,
    'image': image,
    'uId':uId
  };
}

//   name = json['name']?? '';
//   phone = json['phone']?? '';
//   uId = json['uId']?? '';
//   image = json['image']?? '';
  // UserModel.fromJson(Map<String, dynamic>? json) {
  //   email = json!['email'] ?? '';
  //   name = json['name']?? '';
  //   phone = json['phone']?? '';
  //   uId = json['uId']?? '';
  //   image = json['image']?? '';
  //
  // }
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'image': image,
  //     'uId':uId
  //   };
  // }
