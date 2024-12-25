import 'package:ecommerc_with_page/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final routeName = 'ProductWidget';
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<dynamic> img = arg['images'];


    return Scaffold(
      appBar: AppBar(
        title: Text('Products Info'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
          itemCount: img.length,
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
                          child: Image.network(img[index]),
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
                              '${arg['title']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
