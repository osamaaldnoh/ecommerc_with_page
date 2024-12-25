import 'package:ecommerc_with_page/model/product.dart';
import 'package:ecommerc_with_page/screen/db_screen.dart';
import 'package:ecommerc_with_page/screen/product_screen.dart';
import 'package:ecommerc_with_page/widget_screen/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Movies(),
      child: MaterialApp(
          theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          ),
        routes: {
          '/': (_) => MyMoviesScreen(),
          ProductWidget().routeName: (_) => ProductWidget(),
          DBScreen().routeName: (_) => DBScreen(),
        },
      ),
    );
  }
}
