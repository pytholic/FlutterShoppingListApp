import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/model/item.dart';
import 'package:shopping_list/provider/items.dart';
import 'package:shopping_list/utils.dart';
import 'package:shopping_list/page/home_page.dart';
import 'dart:ui' as ui;

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(item.id),
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteItem(context, item),
              icon: Icons.delete,
            )
          ],
          child: buildItem(context),
        ),
      );

  Widget buildItem(BuildContext context) {
    // Create a main widget container which will contain all other items
    return Container(
      width: double.infinity,
      height: 125,
      color: Colors.blueGrey[800],
      padding: EdgeInsets.all(10),

      // Create stack to place and position widgets
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 10,

            // A container for "Name" text label
            child: Container(
              //margin: EdgeInsets.only(top: 4),
              child: Text(
                item.name,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Create a positioned Row() to place buttons and amount next to each other
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //margin: EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        decrementAmount(context, item);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      item.amount.toString(),
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 5, right: 5),
                    child: ElevatedButton(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        incrementAmount(context, item);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void deleteItem(BuildContext context, Item item) {
    final provider = Provider.of<ItemsProvider>(context, listen: false);
    provider.removeItem(item);
    Utils.showSnackBar(context, 'Deleted the item');
  }
}

void incrementAmount(BuildContext context, Item item) {
  final provider = Provider.of<ItemsProvider>(context, listen: false);
  item.amount++;
  provider.updateItem(item, item.name, item.amount);
}

void decrementAmount(BuildContext context, Item item) {
  final provider = Provider.of<ItemsProvider>(context, listen: false);
  // Add if-else block to avoid negative values
  if (item.amount > 0) {
    item.amount--;
    provider.updateItem(item, item.name, item.amount);
  } else {
    return null;
  }
}
