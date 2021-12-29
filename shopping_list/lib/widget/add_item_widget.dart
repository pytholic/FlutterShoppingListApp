import 'package:flutter/material.dart';
import 'package:shopping_list/widget/item_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/provider/items.dart';
import 'package:shopping_list/model/item.dart';
import 'package:shopping_list/widget/item_widget.dart';
import 'package:shopping_list/utils.dart';

class AddItemDialogWidget extends StatefulWidget {
  @override
  _AddItemDialogWidgetState createState() => _AddItemDialogWidgetState();
}

class _AddItemDialogWidgetState extends State<AddItemDialogWidget> {
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String amount = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: Colors.blueGrey[800],
        content: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Item',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              ItemFormWidget(
                onChangedName: (name) => setState(() => this.name = name),
                onChangedAmount: (amount) =>
                    setState(() => this.amount = amount),
                onAddItem: addItem,
              ),
            ],
          ),
        ),
      );

  void addItem() {
    final isValid = _formkey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final item = Item(
        id: DateTime.now().toString(),
        name: name,
        amount: amount,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<ItemsProvider>(context, listen: false);
      provider.addTodo(item);

      Navigator.of(context).pop();
      Utils.showSnackBar(context, 'Added the item');
    }
  }
}
