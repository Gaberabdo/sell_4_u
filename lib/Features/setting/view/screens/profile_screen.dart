import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_4_u/Features/Auth-feature/presentation/pages/login/login_screen.dart';
import 'package:sell_4_u/Features/setting/model/user_model.dart';
import 'package:sell_4_u/Features/setting/model/user_provider.dart';
import 'package:sell_4_u/Features/setting/view/screens/edit_profile.dart';
import 'package:sell_4_u/Features/setting/view/screens/notifications.dart';
import 'package:sell_4_u/Features/setting/view/screens/recently_viewed.dart';
import 'package:sell_4_u/Features/setting/view/screens/saved_searched.dart';
import 'package:sell_4_u/core/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<UserProvider>(
      create: (context) => UserProvider()..getDetails(),
      builder: (context, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        child: Text(
                          ' ',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Provider.of<UserProvider>(context).userModel != null
                                ? Provider.of<UserProvider>(context)
                                    .userModel!
                                    .name!
                                : "User name",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text('login to buy and sell anything'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'My Account',
                    style: FontStyleThame.textStyle(
                        fontColor: ColorStyle.primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const EditProfile()));
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.edit,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Edit Profile',
                              style: FontStyleThame.textStyle(),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RecentlyViewed()));
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.library_books_sharp,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              'My Listings',
                              style: FontStyleThame.textStyle(),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RecentlyViewed()));
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 22,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'My Favorites',
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SavedSearched()));
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.save_rounded,
                              size: 22,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Saved Searches',
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Settings',
                    style: FontStyleThame.textStyle(
                      fontColor: ColorStyle.primaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RecentlyViewed()));
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.language,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Language ',
                              style: FontStyleThame.textStyle(),
                            ),
                            const Spacer(),
                            const Text(
                              'العربيه',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.logout,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Logout ',
                              style: FontStyleThame.textStyle(),
                            ),
                            const Spacer(),

                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
