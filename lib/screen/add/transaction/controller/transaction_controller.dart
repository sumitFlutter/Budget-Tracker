
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/db_helper.dart';
import '../model/transaction_model.dart';

class TransactionController extends GetxController {
  Rx<TimeOfDay> time = TimeOfDay.now().obs;
  Rx<DateTime> date = DateTime.now().obs;
  Rxn<String> selectedValue = Rxn<String>();
  RxList<TransactionModel> l2 = <TransactionModel>[].obs;
  RxList<TransactionModel> income = <TransactionModel>[].obs;
  RxList<TransactionModel> e = <TransactionModel>[].obs;

  Future<void> getTransaction() async {
    List<TransactionModel> l1 = await DBHelper.dbHelper.readTrans();
    l2.value = l1;
  }

  void divide() {
    for(int i=0;i<l2.length;i++)
      {
        l2[i].status==0?e.add(l2[i]):income.add(l2[i]);
      }
  }
}