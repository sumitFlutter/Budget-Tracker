
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../add/transaction/controller/transaction_controller.dart';
import '../../sub_screen/view/expense_screen.dart';
import '../../sub_screen/view/income_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtName = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TransactionController tController = Get.put(TransactionController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tController.getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Budget tracker"),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      onTap: () {
                        Get.toNamed('addCategory');
                      },
                      child: Text("ADD CATEGORY")),
                ];
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Income",
              ),
              Tab(
                text: "Ex",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [IncomeScreen(), ExpenseScreen()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('transaction');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

