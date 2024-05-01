import 'package:budget_tracker_app/screen/add/category/controller/category_controller.dart';
import 'package:budget_tracker_app/utils/helpers/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController textEditingController =TextEditingController();
  TextEditingController update=TextEditingController();
  GlobalKey<FormState> key=GlobalKey<FormState>();
  CategoryController categoryController=Get.put(CategoryController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.getData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Add Category"),),
      body: Form(
        key: key,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(controller: textEditingController,
            decoration: InputDecoration(hintText: "Enter Category Type: "),
            validator: (value) {
              if(value!.isEmpty)
                {
                  return "Category Type is required";
                }
              return null;
            },),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              if(key.currentState!.validate())
                {
                  DBHelper.dbHelper.insertCategory(textEditingController.text);
                  textEditingController.clear();
                  categoryController.getData();
                }
            }, child: Text("Create")),
            SizedBox(height: 15,),
            Obx(
              () => Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return ListTile(title: Text(categoryController.categoryModelList[index].title!),
                  subtitle: Text(categoryController.categoryModelList[index].id!.toString()),
                  trailing: Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      update.text=categoryController.categoryModelList[index].title!;
                      Get.defaultDialog(
                        title: "update dialog",
                        content: TextField(controller: update,),
                        actions: [TextButton(onPressed: () {
                          Get.back();
                        }, child: Text("Cancel")),TextButton(onPressed: () {
                          DBHelper.dbHelper.updateCategory(title: update.text, id: categoryController.categoryModelList[index].id!);
                          update.clear();
                          categoryController.getData();
                          Get.back();
                        }, child: Text("Update"))]
                      );
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {
                      Get.defaultDialog( title: "Are You Sure?",
                          actions: [TextButton(onPressed: () {
                            Get.back();
                          }, child: Text("Cancel")),TextButton(onPressed: () {
                            DBHelper.dbHelper.deleteCategory(id: categoryController!.categoryModelList[index].id!);
                            categoryController.getData();
                            Get.back();
                          }, child: Text("Remove"))]
                      );
                    }, icon: Icon(Icons.remove))
                  ],),);
                },itemCount: categoryController.categoryModelList.length,),
              ),
            )
          ],),
        ),
      ),
    ));
  }
}
