import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/model/item.dart';
import 'package:shopping_list/provider/items.dart';
import 'package:shopping_list/utils.dart';
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
              color: Colors.red.withOpacity(0.8),
              caption: 'Delete',
              onTap: () => deleteItem(context, item),
              icon: Icons.delete,
            )
          ],
          child: buildItem(context),
        ),
      );

  Widget buildItem(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.grey[800],
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        item.amount.toString(),
                        style: TextStyle(
                            fontSize: 20, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Container(
            //margin: EdgeInsets.only(top: 4),
            child: ElevatedButton(
              child: Text(
                '+',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 90,
          child: Container(
            //margin: EdgeInsets.only(top: 4),
            child: ElevatedButton(
              child: Text(
                '-',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void deleteItem(BuildContext context, Item item) {
    final provider = Provider.of<ItemsProvider>(context, listen: false);
    provider.removeItem(item);
    Utils.showSnackBar(context, 'Deleted the task');
  }
}
