import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ncc_outfit/pages/home_detail_page.dart';
import 'package:ncc_outfit/utils/routes.dart';
import 'dart:convert';
import 'package:ncc_outfit/widgets/drawer.dart';
import 'package:ncc_outfit/models/catalog.dart';
import 'package:ncc_outfit/widgets/item_widget.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState(){
    super.initState();
    loadData();
  }
 loadData() async{
    await Future.delayed(Duration(seconds: 2));
final catalogJson = await rootBundle.loadString("files/catalog.json");
final  decodedData=jsonDecode(catalogJson);
var productsData=decodedData["products"];
CatalogModel.items =List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
 setState(() {

 });
  }
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () =>
        Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: Colors.lightBlue,
      child: Icon(CupertinoIcons.cart),)  ,
      appBar: AppBar(backgroundColor: Colors.lightBlue,
        title: Text('NCC OUTFIT',style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold
        ),
        ),

      ),
      backgroundColor: Colors.white,
      body: Padding(

        padding: const EdgeInsets.all(12.0),
        child:(CatalogModel.items != null && CatalogModel.items.isNotEmpty) ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16
              ),
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index)  {
          final item = CatalogModel.items[index];
          final catalog = CatalogModel.items[index];
          return InkWell( onTap:()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog :catalog),  ),) ,
              child: ItemWidget(item: item));}
          ) : Center(child: CircularProgressIndicator(),),

      ),
      drawer: MyDrawer(),
    ));
  }
}
