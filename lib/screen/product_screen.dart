import 'package:ecommerc_with_page/connection/postlink.dart';
import 'package:ecommerc_with_page/controller/db_controller.dart';
import 'package:ecommerc_with_page/model/product.dart';
import 'package:ecommerc_with_page/screen/db_screen.dart';
import 'package:ecommerc_with_page/widget_screen/product_widget.dart';
import 'package:flutter/material.dart';


class MyMoviesScreen extends StatefulWidget {
  const MyMoviesScreen({Key? key}) : super(key: key);

  @override
  State<MyMoviesScreen> createState() => _MyMoviesScreenState();
}

class _MyMoviesScreenState extends State<MyMoviesScreen> {
  Postlink postlink = Postlink();
  Db_Controller db_controller = Db_Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products',),
        backgroundColor: Colors.deepOrange,
        actions: [
          ElevatedButton.icon(onPressed: (){
            Navigator.pushNamed(context, DBScreen().routeName);
          }, icon: Icon(Icons.next_plan_outlined), label: Text('welcom'))
        ],
      ),
      body: FutureBuilder<List<Movie>>(
          future: postlink.getdata(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (ctx, index) {
                    db_controller.addDB(
                        snap.data![index].title,
                        snap.data![index].description,
                        snap.data![index].price.toString(),
                        );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductWidget().routeName,
                              arguments: {
                                'id': snap.data![index].id,
                                'title': snap.data![index].title,
                                'images': snap.data![index].images,
                              });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.network(
                                        snap.data![index].thumbnail),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    right: 0,
                                    child: Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        snap.data![index].title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.add_shopping_cart,
                                      color: Colors.deepOrange,
                                    ),
                                    Text('\$' +
                                        snap.data![index].price.toString()),
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.deepOrange,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
