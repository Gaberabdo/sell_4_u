// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import '../../../core/helper/dio-helper.dart';
// import 'home-state.dart';
//
// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitialState());
//
//   static HomeCubit get(context) => BlocProvider.of(context);
//
//
//
// Future<void> createPoduct(
//   {
//     required String productName,
//
//
//     required double salary,
// }
//     )async{
//   emit(LoadingProductState());
//   final response=await DioHelper.postData(url: Constant.CreateProduct, data: {
//     "name":productName,
//     "categoryName":"coffee",
//     "salary":salary
//
//
//   },
//   token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWU5YTEwYmQwYzdkMjYxMWE1NzE4ZmUiLCJuYW1lIjoi2KfYr9mF2YYiLCJlbWFpbCI6ImFkbWluMTJAZ21haWwuY29tIiwiaWF0IjoxNzA5ODEwNTgwfQ.15etdlpuy5Sph9Q_tiDA9Fxpsuy0G9dE1MkkluoNZs8');
//
//   if(response.statusCode==200){
//
//     emit(SuccessProductState());
//   }else if (response.statusCode == 401) {
//     // Handle unauthorized access (invalid credentials)
//     emit(ErrorProducrState());
//   } else {
//     // Handle other status codes
//     emit(ErrorProducrState());
//   }
// }
//   ///product?=coffee
// ProductModel ?model;
//   Future<void> GetProduct() async {
//     emit(LoadinggetProducrState());
//
//     try {
//       final response = await DioHelper.getData(
//         url: 'https://sales-project-main.onrender.com/product?=coffee',
//         data: {},
//       );
//
//       if (response.statusCode == 200) {
//         model = ProductModel.fromJson(response.data as Map<String, dynamic>);
//         emit(SuccessgetProducrState());
//       } else {
//         emit(ErrorgetProducrState());
//       }
//     } catch (error) {
//       print(error.toString());
//       emit(ErrorgetProducrState());
//     }
//   }
//
//
//
// }