import 'package:ecommerc_with_page/model/db_model.dart';

import 'package:flutter/material.dart';


import '../controller/db_controller.dart';

class DBScreen extends StatelessWidget {
  final routeName = 'DBScreen';
  Db_Controller db_controller = Db_Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.deepOrange,
      ),
      body: FutureBuilder<List<DbModel>>(
          future: db_controller.showTasks(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                  child: Text('data'),
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
