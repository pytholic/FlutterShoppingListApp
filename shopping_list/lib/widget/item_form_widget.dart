import 'package:flutter/material.dart';

class ItemFormWidget extends StatelessWidget {
  final String name;
  final int amount;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedAmount;
  final VoidCallback onAddItem;

  const ItemFormWidget({
    Key? key,
    this.name = '',
    this.amount = 0,
    required this.onChangedName,
    required this.onChangedAmount,
    required this.onAddItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildName(),
              SizedBox(height: 10),
              buildAmount(),
              SizedBox(height: 10),
              buildButton(),
            ],
          ),
        ),
      );

  Widget buildName() => TextFormField(
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
          border: UnderlineInputBorder(),
          labelText: 'Name',
          //fillColor: Colors.black,
          //filled: true,
        ),
      );

  Widget buildAmount() => TextFormField(
        maxLines: 1,
        initialValue: amount.toString(),
        onChanged: onChangedAmount,
        decoration: InputDecoration(
            border: UnderlineInputBorder(), labelText: 'Amount'),
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
