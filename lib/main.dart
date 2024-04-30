import 'package:budget_tracker_app/utils/routes/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    ),
  );
}