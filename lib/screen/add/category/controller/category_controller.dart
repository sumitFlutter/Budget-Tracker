import 'package:budget_tracker_app/utils/helpers/db_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/category_model.dart';

class CategoryController extends GetxController{
  RxList<CategoryModel> categoryModelList=<CategoryModel>[].obs;
  void getData()
  async {
    List<CategoryModel> c1=await DBHelper.dbHelper.readCategory();
    categoryModelList.value=c1;
  }
}