import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_4_u/Features/Home-feature/view/screens/home/feeds_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sell_4_u/core/constant.dart';
import 'package:iconly/iconly.dart';

import 'home-state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const FeedsScreen(),
    const Column(),
    const Column(),
    const Column(),
    const Column(),
  ];
  int selectedIndex = 0;
  List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(
      icon: const Icon(IconlyLight.home),
      label: isArabic() ? 'الرئيسية' : 'Home',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.sell_outlined),
      label: isArabic() ? 'تجاري' : 'Commercials',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.add_to_photos_outlined),
      label: isArabic() ? 'أضف إعلانات' : 'Post an Ad',
    ),
    BottomNavigationBarItem(
      icon: const Icon(IconlyLight.search),
      label: isArabic() ? 'البحث' : 'Search',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.account_circle_outlined),
      label: isArabic() ? 'حسابي' : 'Account',
    ),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    emit(ChangeItemIndex());
  }
}
