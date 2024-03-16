 import 'package:flutter/material.dart';
import 'package:sell_4_u/Features/setting/firebase.dart';
import 'package:sell_4_u/Features/setting/model/user_model.dart';

class UserProvider with ChangeNotifier{
UserModel? userModel;
bool isLoad=true;


getDetails()async{
  userModel=await EditMethod().getUserDetails();
  isLoad=false;
  notifyListeners();
}
}