import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/pages/account_page.dart';
import 'package:demo_maker/pages/cart_page.dart';
import 'package:demo_maker/pages/home_page.dart';
import 'package:demo_maker/pages/info.dart';
import 'package:demo_maker/pages/searchePage.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String id;
  Footer({@required this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      color: Colors.black,
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Info()));
                },
                icon: Icon(
                  Icons.info,
                  color: Info.id == id ? footerButtonColor : Colors.grey,
                  size: 35,
                )),
          ),
//          Expanded(
//            child: IconButton(
//                onPressed: () {
//                  // print(id);
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => AccountPage()));
//                },
//                icon: Icon(
//                  Icons.account_circle,
//                  color: AccountPage.id == id ? Colors.pink : Colors.grey,
//                  size: 35,
//                )),
//          ),
          Expanded(
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                icon: Icon(
                  Icons.home,
                  color: Home.id == id ? footerButtonColor : Colors.grey,
                  size: 35,
                )),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                  size: 35,
                )),
          ),
//          Expanded(
//            child: IconButton(
//                onPressed: () {
//                  Navigator.pushReplacement(context,
//                      MaterialPageRoute(builder: (context) => SearchePage()));
//                },
//                icon: Icon(
//                  Icons.search,
//                  color: SearchePage.id == id ? footerButtonColor : Colors.grey,
//                  size: 35,
//                )),
//          )
        ],
      ),
    );
  }
}
