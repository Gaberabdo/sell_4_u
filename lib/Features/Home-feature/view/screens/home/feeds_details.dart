import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:sell_4_u/Features/Home-feature/Cubit/feeds_cubit/feeds_cubit.dart';
import 'package:sell_4_u/Features/Home-feature/Cubit/feeds_cubit/feeds_state.dart';
import 'package:sell_4_u/Features/Home-feature/models/product_model.dart';
import 'package:sell_4_u/core/constant.dart';

import '../../../../../generated/l10n.dart';

class HomeFeedsDetails extends StatelessWidget {
  const HomeFeedsDetails({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedsCubit(),
      child: BlocConsumer<FeedsCubit, FeedsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              centerTitle: true,
              automaticallyImplyLeading: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 16,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyLight.heart,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: model.images.asMap().entries.map(
                      (e) {
                        final index = e.key;
                        final imageUrl = e.value;
                        return Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Image(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: ColorStyle.gray,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.image),
                                    Text('${index + 1}/${model.images.length}')
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.visibility_outlined,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                model.view.toString(),
                                style: FontStyleThame.textStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Views',
                                style: FontStyleThame.textStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 22,
                                width: 1,
                                color: ColorStyle.gray,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.timelapse_outlined,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                transform(model.time!),
                                style: FontStyleThame.textStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 22,
                                width: 1,
                                color: ColorStyle.gray,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                model.cat,
                                style: FontStyleThame.textStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontColor: ColorStyle.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            model.reasonOfOffer,
                            style: FontStyleThame.textStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontColor: ColorStyle.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            model.price,
                            style: FontStyleThame.textStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontColor: ColorStyle.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                IconlyLight.location,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                model.location.toString(),
                                style: FontStyleThame.textStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).description,
                            style: FontStyleThame.textStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Text(
                              model.description,
                              overflow: TextOverflow.ellipsis,
                              style: FontStyleThame.textStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontColor: Colors.black38,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
