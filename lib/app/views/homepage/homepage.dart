import 'package:ad_exam/app/utilies/firestore_helper/firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/notemodel.dart';

class homepage extends StatelessWidget {
   homepage({super.key});

  @override
  TextEditingController notecontroller = TextEditingController();
  TextEditingController notetitlecontroller = TextEditingController();
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
                  controller: notetitlecontroller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Add  Title note here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12),),),
                  labelText: 'Title Note',
                ),
                  onChanged: (val){
                    notecontroller.text = val;
                  },
                ),
                const SizedBox(height: 25),
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
                    notetitlecontroller.text = val;
                  },
                ),
                ElevatedButton(onPressed: () {
                 NotesModel notes = NotesModel(
                     notes: notecontroller.text,
                     notetitle: notetitlecontroller.text,
                 );
                 FireStoreHelper.fireStoreHelper.addNotes(notes);
                 Get.back();
                }, child: const Text("ADD Notes"),),
              ],
            ),
          ),
        ),
        );
      },),
      body: StreamBuilder(
        stream: FireStoreHelper.fireStoreHelper.getnotes(),
        builder:
        (context, snapshot)  {
          QuerySnapshot? querySnapshot = snapshot.data as QuerySnapshot?;
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: querySnapshot!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListTile(
                    title: Text(querySnapshot!.docs[index]['notes']),

                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}