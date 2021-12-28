import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/provider/items.dart';
import 'package:shopping_list/widget/item_widget.dart';

import 'item_widget.dart';

class ItemListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemsProvider>(context);
    final items = provider.items;

    return items.isEmpty
        ? Center(
            child: Text(
              'No items.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) =>
                Container(height: 8), // line spacing between the items
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return ItemWidget(item: item);
            },
          );
  }
}
