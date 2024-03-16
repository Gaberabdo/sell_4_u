import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:sell_4_u/Features/Home-feature/Cubit/Layout_cubit/home-cubit.dart';
import 'package:sell_4_u/Features/Home-feature/Cubit/Layout_cubit/home-state.dart';
import 'package:sell_4_u/Features/Home-feature/view/screens/home/create_post.dart';
import 'package:sell_4_u/core/helper/component/component.dart';

import '../../../generated/l10n.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: Colors.white,
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: cubit.selectedIndex == 4
                  ? null
                  : TextFormWidget(
                      emailController: TextEditingController(),
                      prefixIcon: const Icon(
                        IconlyLight.search,
                        size: 15,
                      ),
                      hintText: S.of(context).search,
                      validator: '',
                      obscureText: false,
                      icon: false,
                      enabled: false,
                    ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.selectedIndex,
              onTap: (value) {
                cubit.onItemTapped(value);
                if (cubit.selectedIndex == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CreatePost();
                      },
                    ),
                  );
                  cubit.onItemTapped(0);
                }
              },
              items: cubit.item,
            ),
            body: cubit.screens[cubit.selectedIndex],
          );
        },
      ),
    );
  }
}
