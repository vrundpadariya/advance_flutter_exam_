import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/notemodel.dart';
import '../../utilies/firestore_helper/firestore_helper.dart';

class homepage extends StatelessWidget {
  homepage({super.key});

  TextEditingController notecontroller = TextEditingController();
  TextEditingController notetitlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: const Center(
                child: Text("Add note "),
              ),
              content: SizedBox(
                width: 500,
                height: 250,
                child: Column(
                  children: [
                    TextFormField(
                      controller: notetitlecontroller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Add  Title note here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        labelText: 'Title Note',
                      ),
                      onChanged: (val) {
                        notetitlecontroller.text = val;
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: notecontroller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Add note here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        labelText: 'note',
                      ),
                      onChanged: (val) {
                        notecontroller.text = val;
                      },
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        NotesModel notes = NotesModel(
                          notes: notecontroller.text,
                          notetitle: notetitlecontroller.text,
                        );
                        FireStoreHelper.fireStoreHelper.addNotes(notes);
                        Get.back();
                      },
                      child: const Text("ADD Notes"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      body: StreamBuilder(
          stream: FireStoreHelper.fireStoreHelper.getnotes(),
          builder: (context, snapshot) {
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
                    child: Card(
                      child: ListTile(
                        title: Text(querySnapshot.docs[index]['titleNotes']),
                        trailing: IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Get.dialog(
                              AlertDialog(
                                content: Container(
                                  height: 100,
                                  width: 500,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.update),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                          onPressed: () {
                                            NotesModel notes = NotesModel(
                                              notes: querySnapshot.docs[index]
                                                  ['notes'],
                                              notetitle: querySnapshot
                                                  .docs[index]['notes'],
                                            );
                                            FireStoreHelper.fireStoreHelper
                                                .deleteNotes(notes);
                                            Get.back();
                                          },
                                          icon: Icon(Icons.delete),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                          onPressed: () {
                                            DBHelper.dbHelper.Addnote(
                                                note: querySnapshot.docs[index]
                                                    ['notes'],
                                                notetitle: querySnapshot
                                                    .docs[index]['notes']);
                                            Get.toNamed("/likeNotes");
                                          },
                                          icon: Icon(Icons.favorite_border),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
