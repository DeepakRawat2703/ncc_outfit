import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncc_outfit/models/cart.dart';
import 'package:ncc_outfit/models/catalog.dart';
class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({ Key?  key, required this.item})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: GridTile(
        header:  Container(
          child: Text(item.name,style: TextStyle(color: Colors.white),),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.lightBlue
          ),
        ) ,
        child: Container(
            padding : EdgeInsets.all(40),
            child: Image.network(item.image) ),

        footer: Container(

            child: ButtonBar(

                alignment: MainAxisAlignment.spaceBetween,
                children: [
               Text("Rs " + item.price.toString(),style: TextStyle(color: Colors.black,
                  fontWeight:FontWeight.bold ),
              ),
                  AddToCart(item:item ),
                ]),


          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.lightBlue),) ,

      ),
    );
  }
}

class AddToCart extends StatefulWidget {
  final Item item;
  const AddToCart({Key? key, required this.item}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart= CartModel();
  @override
  Widget build(BuildContext context) {

    bool isInCart =false;
    if(_cart.items.contains(widget.item)) {
      isInCart=true;
    }
    else{
      isInCart=false;
    }
    return   ElevatedButton(onPressed: () {
      if (!isInCart) {
        if (isInCart == false) {
          isInCart = true;
        }
        else {
          isInCart = false;
        }
        final _catalog = CatalogModel();

        _cart.catalog = _catalog;
        _cart.add(widget.item);
      }
     setState(() {

     });
    },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isInCart? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),);
  }
}

