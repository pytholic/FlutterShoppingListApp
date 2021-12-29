import 'package:flutter/material.dart';

Color color_label = Colors.teal;
Color color_underline = Colors.teal;

class ItemFormWidget extends StatelessWidget {
  final String name;
  final String amount;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedAmount;
  final VoidCallback onAddItem;

  const ItemFormWidget({
    Key? key,
    this.name = '',
    this.amount = '',
    required this.onChangedName,
    required this.onChangedAmount,
    required this.onAddItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildName(),
              SizedBox(height: 20),
              buildAmount(),
              SizedBox(height: 20),
              buildButton(),
            ],
          ),
        ),
      );

  Widget buildName() => TextFormField(
        style: TextStyle(color: Colors.white),
        maxLines: 1,
        initialValue: name,
        onChanged: onChangedName,
        validator: (name) {
          if (name!.isEmpty) {
            return 'The name cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_underline),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_underline),
          ),
          labelText: 'Name',
          labelStyle: TextStyle(
            fontSize: 18,
            color: color_label,
          ),
        ),
      );

  Widget buildAmount() => TextFormField(
        style: TextStyle(color: Colors.white),
        maxLines: 1,
        initialValue: amount,
        onChanged: onChangedAmount,
        validator: (amount) {
          if (amount!.isEmpty) {
            return 'The amount cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_underline),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_underline),
          ),
          labelText: 'Amount',
          labelStyle: TextStyle(
            fontSize: 18,
            color: color_label,
          ),
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: onAddItem,
          child: Text(
            'Add',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
}
