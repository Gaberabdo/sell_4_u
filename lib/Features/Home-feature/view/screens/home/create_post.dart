import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:sell_4_u/Features/Home-feature/Cubit/feeds_cubit/feeds_cubit.dart';
import 'package:sell_4_u/Features/Home-feature/Cubit/feeds_cubit/feeds_state.dart';
import 'package:sell_4_u/core/constant.dart';
import 'package:sell_4_u/core/helper/component/component.dart';

import '../../../../../generated/l10n.dart';
import '../../../models/category_model.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

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
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 16,
                ),
              ),
              title: Text(
                S.of(context).postAd,
                style: FontStyleThame.textStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if (cubit.imageList.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(242, 242, 242, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              cubit.pickImages();
                            },
                            child: Container(
                              height: 200,
                              color: ColorStyle.gray,
                              child: const Center(
                                child: Image(
                                  image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/sales-b43bd.appspot.com/o/image-removebg-preview%20(2).png?alt=media&token=240ba74f-db07-4bdc-a340-f8b10686ae1f',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (cubit.imageList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselSlider(
                        items: cubit.imageList.asMap().entries.map(
                          (e) {
                            final index = e.key;
                            final imageUrl = e.value;
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(242, 242, 242, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Stack(
                                      children: [
                                        Image(
                                          height: 170,
                                          image: FileImage(imageUrl),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                        PopupMenuButton<int>(
                                          onCanceled: () {
                                            Navigator.of(context);
                                          },
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide.none),
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: 1,
                                              onTap: () {
                                                cubit.pickImages();
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Add image',
                                                    style:
                                                        FontStyleThame.textStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  const Icon(Icons.plus_one)
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 2,
                                              child: InkWell(
                                                onTap: () {
                                                  cubit.deleteImage(
                                                      value: imageUrl);
                                                },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "remove",
                                                      style: FontStyleThame
                                                          .textStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    const Icon(IconlyLight.delete)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                          icon: const CircleAvatar(
                                            child: Icon(
                                              Icons.more_horiz,
                                            ),
                                          ),
                                          offset: const Offset(0, 20),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: ColorStyle.gray,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.image),
                                              Text(
                                                  '${index + 1}/${cubit.imageList.length}')
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildDropDownSpecies(cubit.catModel, cubit),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 111,
                      child: TextFormWidget(
                        maxLines: 2,
                        emailController: TextEditingController(),
                        prefixIcon: const Icon(
                          Icons.details,
                          size: 15,
                        ),
                        hintText: S.of(context).details,
                        validator: '',
                        obscureText: false,
                        icon: false,
                        enabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 111,
                      child: TextFormWidget(
                        maxLines: 2,
                        emailController: TextEditingController(),
                        prefixIcon: const Icon(
                          Icons.description,
                          size: 15,
                        ),
                        hintText: S.of(context).descriptionAdd,
                        validator: '',
                        obscureText: false,
                        icon: false,
                        enabled: true,
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

  Widget buildDropDownSpecies(
    List<CategoryModel> model,
    FeedsCubit cubit,
  ) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorStyle.gray,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<CategoryModel>(

          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(8),
          dropdownColor: Colors.white,
          iconSize: 18,
          iconEnabledColor: Colors.black,
          hint: Text(cubit.catValueString),
          onChanged: (newValue) {
            if (newValue != null) {
              // Find the index of newValue in the model list
              int index = model.indexOf(newValue);
              // Pass the index along with the value
              cubit.catValueStringCreate(
                value: newValue.categoryName!,
                index: index,
              );
            }
          },
          items: model.map((CategoryModel value) {
            return DropdownMenuItem<CategoryModel>(
              value: value,
              child: Text(
                value.categoryName!,
                style: FontStyleThame.textStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
