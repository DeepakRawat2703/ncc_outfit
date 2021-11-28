import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncc_outfit/pages/login_page.dart';
import 'package:ncc_outfit/utils/routes.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Container(
        color: Colors.black54,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child:
                UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName:
                Text("Contact Deatails : "),
                  accountEmail:
              Text("ncc@gmail.com"),

                 decoration :BoxDecoration(
                   color: Colors.brown[500]
                 ),
                )
            ) ,
            ListTile(
              leading: Icon(CupertinoIcons.home,
              color: Colors.white,),
              onTap:  () =>
                  Navigator.pushNamed(context, MyRoutes.homeRoute) ,
              title: Text("Home",textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                  ),
              ),
            ) ,
                ListTile(
                  leading: Icon(Icons.logout,
                  color: Colors.white,),
                  // onTap: () async {
                  //   await FirebaseAuth.instance.signOut();
                  //   Navigator.pushAndRemoveUntil(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => LoginPage()),
                  //           (route) => false);
                  // },
                  onTap:  () =>
                      Navigator.pushNamed(context, MyRoutes.loginRoute),
                  title: Text("Sign Out",textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                      ),
                  ),
                ) ,
          ListTile(
            leading: Icon(CupertinoIcons.cart,
            color: Colors.white,),
            onTap:  () =>
          Navigator.pushNamed(context, MyRoutes.cartRoute) ,
            title: Text("Cart",textScaleFactor: 1.2
              ,style: TextStyle(
                color: Colors.white,
                ),
            ),
          ) ,

          ],
        ),
      ),
    );
  }
}
