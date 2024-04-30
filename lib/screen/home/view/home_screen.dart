import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title:const  Text("Budget Tracker App"),
      actions: [
        PopupMenuButton(itemBuilder: (context) {
          return [PopupMenuItem(child: Text("Select Category:"),onTap: (){
            Get.toNamed("addCategory");
          },)];
        },)
      ],),
    ));
  }
}
