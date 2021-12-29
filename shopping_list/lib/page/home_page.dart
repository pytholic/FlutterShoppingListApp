import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/main.dart';
import 'package:shopping_list/widget/add_item_widget.dart';
import 'package:shopping_list/widget/item_list_widget.dart';
import 'package:shopping_list/api/firebase_api.dart';
import 'package:shopping_list/model/item.dart';
import 'package:shopping_list/provider/items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void _incrementAmount(String amount) {
  //   //var tmp = 0;
  //   int tmp = int.parse(amount);

  //   setState(() {
  //     tmp++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      body: StreamBuilder<List<Item>>(
        stream: FirebaseApi.readItems(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ));
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final items = snapshot.data!;

                final provider = Provider.of<ItemsProvider>(context);
                provider.setItems(items);

                return ItemListWidget();
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.teal, // "+" button background color
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddItemDialogWidget(),
          barrierDismissible: true,
        ),
        child: Icon(Icons.add),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
