import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ncc_outfit/models/cart.dart';
class CartPage  extends StatelessWidget {
  const CartPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart",style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),

      body: Container(

        child: Column(
          children: [
            _CartList(),
             Divider(),
            _CartTotal(),

          ],
        ),
      ),

    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart =CartModel();
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Padding(padding: EdgeInsets.all(12),
          child: Text("Rs " + "${_cart.totalPrice}",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),)),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(12),
            child: ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Buying not supported yet")));

            },

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                child: Text("Buy")),
          )
        ],
      ) ,
    );
  }
}
class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart =CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty?Center(child: Text("Nothing to show "))
        : Expanded(
      child: ListView.builder(
       itemCount: _cart.items.length,
       itemBuilder: (context,index)=>ListTile(
         leading: Icon(Icons.done),
         trailing: IconButton(
           icon: Icon(Icons.remove_circle_outline),
           onPressed: (){
             _cart.remove(_cart.items[index]);
             setState(() {

             });
           },

         ),
         title:Text(_cart.items[index].name),
       ),
      ),
    );
  }
}
