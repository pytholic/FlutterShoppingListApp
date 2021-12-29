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
    return Container(
      width: double.infinity,
      height: 125,
      color: Colors.blueGrey[800],
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 10,
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
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //margin: EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () {}, //_incrementAmount,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      item.amount,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 5, right: 5),
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
