import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/model/item.dart';
import 'package:shopping_list/utils.dart';

var db = "shopping_list_haseeb";

class FirebaseApi {
  static Future<String> createItem(Item item) async {
    final docItem = FirebaseFirestore.instance.collection(db).doc();

    item.id = docItem.id;
    await docItem.set(item.toJson());

    return docItem.id;
  }

  static Stream<List<Item>> readItems() => FirebaseFirestore.instance
      .collection(db)
      .orderBy(ItemField.createdTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Item.fromJson));

// update will be just amount field
  static Future updateItem(Item item) async {
    final docItem = FirebaseFirestore.instance.collection(db).doc(item.id);

    await docItem.update(item.toJson());
  }

  static Future deleteItem(Item item) async {
    final docItem = FirebaseFirestore.instance.collection(db).doc(item.id);

    await docItem.delete();
  }
}
