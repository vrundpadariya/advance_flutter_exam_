import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepage extends StatelessWidget {
   homepage({super.key});

  @override
  TextEditingController notecontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.dialog(AlertDialog(
          title: Center(child: Text("Add note "),
          ),
          content: Container(
            width: 500,
            child: Column(
              children: [
                TextFormField(
                  controller: notecontroller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Add note here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12),),),
                  labelText: 'note',
                ),
                  onChanged: (val){
                    notecontroller.text = val;
                  },
                ),
              ],
            ),
          ),
        ),
        );
      },),
      body: Container(),
    );
  }
}
