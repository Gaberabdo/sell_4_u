import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_4_u/Features/Auth-feature/manger/model/user_model.dart';
import 'package:sell_4_u/Features/Home-feature/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sell_4_u/Features/Home-feature/models/product_model.dart';
import 'package:sell_4_u/Features/Home-feature/view/screens/home/feeds_screen.dart';
import 'package:sell_4_u/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import 'feeds_state.dart';

class FeedsCubit extends Cubit<FeedsState> {
  FeedsCubit() : super(FeedsInitial());

  static FeedsCubit get(context) => BlocProvider.of(context);

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<CategoryModel> catModel = [];
  List<String> catModelIdes = [];

  Future<void> getCategory() async {
    emit(GetCategoryLoading());
    fireStore.collection("categories").snapshots().listen((event) {
      catModel.clear();
      catModelIdes.clear();
      for (var element in event.docs) {
        catModel.add(CategoryModel.fromJson(element.data()));
        catModelIdes.add(element.id);
      }
      emit(GetCategorySuccess());
    }).onError((handleError) {
      emit(GetCategoryError());
    });
  }

  List<ProductModel> mostPopularModel = [];
  List<String> mostPopularIdes = [];

  Future<void> mostPopular() async {
    emit(GetMostPopularLoading());
    fireStore.collection("products").snapshots().listen((event) {
      mostPopularModel.clear();
      mostPopularIdes.clear();
      for (var element in event.docs) {
        mostPopularModel.add(ProductModel.fromJson(element.data()));
        mostPopularIdes.add(element.id);
      }
      emit(GetMostPopularSuccess());
    }).onError((handleError) {
      emit(GetMostPopularError());
    });
  }

  UserModel? userModel;

  Future<void> getUserData({required String id}) async {
    emit(GetMostPopularLoading());
    fireStore.collection("users").doc(id).snapshots().listen((event) {
      userModel = UserModel.fromJson(event.data());

      emit(GetUserSuccess());
    }).onError((handleError) {
      emit(GetUserError());
    });
  }

  void makePhoneCall({required String phone}) async {
    final url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openWhatsApp({required String phone}) async {
    final url = 'https://wa.me/+2$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
