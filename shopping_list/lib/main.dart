import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/page/home_page.dart';
import 'package:shopping_list/provider/items.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = "Pytholic's Shopping List";

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ItemsProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            //primarySwatch: Colors.pink, // Todo "title text" color
            //primarySwatch: Colors.indigo.shade200,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal,
            ),
          ),
          home: HomePage(),
        ),
      );
}
