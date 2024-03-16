import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_4_u/Features/Auth-feature/manger/model/user_model.dart';
import 'package:sell_4_u/Features/Home-feature/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sell_4_u/Features/Home-feature/models/product_model.dart';
import 'package:sell_4_u/Features/Home-feature/view/screens/home/feeds_screen.dart';
import 'package:sell_4_u/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'feeds_state.dart';
import 'package:intl/intl.dart';

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

  List<File> imageList = [];
  List<String> postListOfImage = [];

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    if (pickedImages.isNotEmpty) {
      imageList = pickedImages.map((image) => File(image.path)).toList();
      emit(ImageUploadSuccess());
    } else {
      emit(ImageUploadFailed());
    }
  }

  Future<void> pickImagesAdd() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImages != null) {
      imageList.add(File(pickedImages.path));
      emit(ImageUploadSuccess());
    } else {
      emit(ImageUploadFailed());
    }
  }

  Future<void> uploadImages() async {
    final storage = FirebaseStorage.instance;

    emit(ImageUploadToFireLoading());
    for (var image in imageList) {
      final ref = storage
          .ref()
          .child('users/${Uri.file(image.path).pathSegments.last}');
      await ref.putFile(image).then((p0) {
        p0.ref.getDownloadURL().then((value) {
          postListOfImage.add(value);
          emit(ImageUploadToFireSuccess());
        });
      });
      imageList.remove(image);
    }
    if (imageList.isEmpty) {
      emit(ImageUploadSuccess());
    }
  }

  Future<void> requestPostToFire({
    required String cat,
    required String description,
    required String details,
    required String reasonOfOffer,
    required String uId,
    required String location,
    required String categoriesId,
    required double lan,
    required double price,
    required double numberOfDay,
    required double lat,
  }) async {
    String formattedDate =
        DateFormat('E MMM d y HH:mm:ss \'GMT\'Z (z)').format(DateTime.now());
    ProductModel model = ProductModel(
      cat: cat,
      images: postListOfImage,
      description: description,
      details: details,
      lan: lan,
      lat: lat,
      location: location,
      price: price,
      reasonOfOffer: reasonOfOffer,
      time: formattedDate,
      uId: uId,
      numberOfDay: numberOfDay,
    );
    emit(RequestPostToFireLoading());
    fireStore.collection('products').add(model.toMap()).then((value) {
      fireStore
          .collection('users')
          .doc(uId)
          .collection('products')
          .add(model.toMap())
          .then((value) {
        fireStore
            .collection('categories')
            .doc(categoriesId)
            .collection('products')
            .add(model.toMap())
            .then((value) {
          emit(RequestPostToFireSuccess());
        }).catchError((onError) {
          print('product to cat');
          emit(RequestPostToFireError());
        });
      }).then((value) {
        print('product to user');
        emit(RequestPostToFireError());
      });
    }).catchError((onError) {
      print('product to product');
      emit(RequestPostToFireError());
    });
  }

  void deleteImage({
    required File value,
  }) {
    imageList.remove(value);
    emit(ImageUploadFailed());
  }

  String catValueString = 'Select category';
  String catIdString = '';

  void catValueStringCreate({
    required String value,
    required int index,
  }) {
    catValueString = value;
    catIdString = catModelIdes[index];
    print(catIdString);
    print(catValueString);
    emit(ImageUploadFailed());
  }

  TextEditingController controller = TextEditingController();
}
