import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/notemodel.dart';

class FireStoreHelper {
  FireStoreHelper._();
  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  addNotes(NotesModel NotesModel) {
    firestore.collection('notes').doc(NotesModel.notes).set({
      'titleNotes': NotesModel.notetitle,
      'notes': NotesModel.notes,
    });
  }

  getnotes() {
    return firestore.collection('notes').snapshots();
  }

  updateNotes(NotesModel NotesModel) {
    firestore.collection('notes').doc(NotesModel.notes).update({
      'notes': NotesModel.notes,
    });
  }

  deleteNotes(NotesModel NotesModel) {
    firestore.collection('notes').doc(NotesModel.notes).delete();
  }
}