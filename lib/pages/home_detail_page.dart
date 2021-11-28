

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncc_outfit/models/cart.dart';
import 'package:ncc_outfit/models/catalog.dart';
import 'package:ncc_outfit/widgets/item_widget.dart';

class HomeDetailPage extends StatefulWidget {
  final Item catalog;
  const HomeDetailPage({Key? key,  required this.catalog}) : assert(catalog != null),
        super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    Item item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
        backgroundColor: Colors.white,
      body: Column(

        children: [
          SizedBox(
            height: size.height * 0.7,
            width: size.width * 0.9,
            child: Center(child: Image.network(widget.catalog.image),),
          ),





        ],
      ),
    );


  }
}
