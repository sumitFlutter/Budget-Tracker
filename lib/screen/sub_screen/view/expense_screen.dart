import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../add/transaction/controller/transaction_controller.dart';


class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  TransactionController tController = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => ListView.builder(
        itemCount: tController.e.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("${tController.l2[index].id!}"),
            title: Text(tController.l2[index].title!),
            subtitle: Text("Expense"),
            trailing: Text("${tController.l2[index].amount}"),
          );
        },
      ),
    );
  }
}