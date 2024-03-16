import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_4_u/Features/Home-feature/Cubit/feeds_cubit/feeds_cubit.dart';
import 'package:sell_4_u/Features/Home-feature/Cubit/feeds_cubit/feeds_state.dart';

class BannerCat extends StatelessWidget {
  const BannerCat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedsCubit()..getCategory(),
      child: BlocConsumer<FeedsCubit, FeedsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = FeedsCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          cubit.getCategoryDetails(cubit.catModelIdes[index]);
                        },
                        child: Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.black38),
                        ),
                      );
                    },
                    itemCount: cubit.catModel.length,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
