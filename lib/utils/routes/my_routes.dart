import 'package:budget_tracker_app/screen/add/category/view/add_category_screen.dart';
import 'package:budget_tracker_app/screen/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';

Map <String,WidgetBuilder> appRoutes={
  "/":(context) => const HomeScreen(),
  "addCategory":(context) => const AddCategoryScreen()
};