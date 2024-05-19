class CartModel {
  int? id;
  String notetitle;
  String notes;


  CartModel({required this.notes,required this.notetitle, this.id});

  factory CartModel.fromDB({required Map<String, dynamic> data}) {
    return CartModel(
      id: data['id'],
      notetitle: data['notetitle'],
      notes: data['notes'],
    );
  }
}