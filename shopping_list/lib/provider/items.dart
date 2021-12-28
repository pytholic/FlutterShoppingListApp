import 'package:flutter/cupertino.dart';
import 'package:shopping_list/api/firebase_api.dart';
import 'package:shopping_list/model/item.dart';
import 'package:shopping_list/utils.dart';

class ItemsProvider extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items.toList();

  void setItems(List<Item> items) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _items = items;
        notifyListeners();
      });

  void addTodo(Item item) => FirebaseApi.createItem(item);

  void removeItem(Item item) {
    FirebaseApi.deleteItem(item);
    //Utils.showSnackBar(context, 'Deleted the task');
  }

  void updateItem(Item item, String name, int amount) {
    item.name = name;
    item.amount = amount;

    FirebaseApi.updateItem(item);
  }
}
