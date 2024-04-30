import 'package:budget_tracker_app/utils/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController textEditingController =TextEditingController();
  GlobalKey<FormState> key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Add Category"),),
      body: Center(child: Form(
        key: key,
        child: Column(mainAxisSize: MainAxisSize.min,
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
                DBHelper.dbHelper.insertCategory();
              }
          }, child: Text("Create"))
        ],),
      ),),
    ));
  }
}
