import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../add/transaction/controller/transaction_controller.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  TransactionController tController = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => ListView.builder(
        itemCount: tController.income.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("${tController.l2[index].id!}"),
            title: Text(tController.l2[index].title!),
            subtitle: Text("INCOME"),
            trailing: Text("${tController.l2[index].amount}"),
          );
        },
      ),
    );
  }
}