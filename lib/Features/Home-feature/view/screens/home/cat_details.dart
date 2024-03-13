import 'package:flutter/material.dart';
import 'package:sell_4_u/Features/Home-feature/models/category_model.dart';

class CatDetails extends StatelessWidget {
  const CatDetails({
    super.key,
    required this.categoryModel,
    required this.catModelIds,
  });

  final CategoryModel categoryModel;
  final String catModelIds;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
