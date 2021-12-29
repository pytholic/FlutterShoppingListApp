import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Color color_label = Colors.teal;
Color color_underline = Colors.teal;

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
        style: TextStyle(color: Colors.white, fontSize: 18),
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
          floatingLabelBehavior:
              FloatingLabelBehavior.never, // To disable zoom out animation
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_underline),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_underline),
          ),
          hintText: 'Name',
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );

  Widget buildAmount() => TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(color: Colors.white, fontSize: 18),
        maxLines: 1,
        initialValue: '',
        onChanged: onChangedAmount,
        validator: (amount) {
          if (amount!.isEmpty) {
            return 'The amount cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_underline),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_underline),
          ),
          hintText: 'Amount',
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
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
