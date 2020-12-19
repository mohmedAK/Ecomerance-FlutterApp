import 'package:demo_maker/Notifier/cart_notifier.dart';
import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/details_page/prefum_detail_page.dart';
import 'package:demo_maker/pages/account_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';

class CartPage extends StatelessWidget {
  static String id = "cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF07031a),
        appBar: appBarMethod(context, CartPage.id),
        body: CartProduacts(),
        bottomNavigationBar: Container(
          color: Colors.grey[500],
          child: Directionality(
            textDirection: rtl,
            child: Row(
              children: <Widget>[
                //Total Cost
                Expanded(
                  child: ListTile(
                    title: Text(
                      TXT27,
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Segoe-UI-Bold',
                          fontSize: 25),
                    ),
                    subtitle: Consumer<CartNotifier>(
                      builder: (context, data, wid) {
                        return Text(
                          '\$${data.totalAmount}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        );
                      },
                    ),
                  ),
                ),
                //Check out button
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountPage()));
                    },
                    child: Text(
                      TXT28,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Segoe-UI-Bold',
                          fontSize: 20),
                    ),
                    color: Colors.purple,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CartProduacts extends StatefulWidget {
//  final productsInCart = [
//    {
//      "name": "Blazer",
//      "picture": "images/products/blazer1.jpeg",
//      "price": 85,
//      "size": "M",
//      "color": "Red",
//      "quantity": 1
//    },
//    {
//      "name": "Shoes",
//      "picture": "images/products/hills1.jpeg",
//      "price": 50,
//      "size": "7",
//      "color": "Red",
//      "quantity": 1
//    },
//    {
//      "name": "Blazer",
//      "picture": "images/products/blazer1.jpeg",
//      "price": 85,
//      "size": "M",
//      "color": "Red",
//      "quantity": 1
//    }
//  ];
  @override
  _CartProduactsState createState() => _CartProduactsState();
}

class _CartProduactsState extends State<CartProduacts> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartNotifier>(context);
    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, int i) {
          print('cart' + cart.itemCount.toString());
          return CartPdt(
            post: Provider.of<CartNotifier>(context, listen: false)
                .items
                .values
                .toList()[i],
            id: cart.items.values.toList()[i].id,
            cartProductId: Provider.of<CartNotifier>(context, listen: false)
                .items
                .keys
                .toList()[i],
//            cartProductPrice: cart.items.values.toList()[i].price,
//            cartProductQty: cart.items.values.toList()[i].quantity,
//            cartProductName: cart.items.values.toList()[i].name,
//            size: cart.items.values.toList()[i].sizeOrColor,
          );
        });
  }
}

class CartPdt extends StatelessWidget {
  final post;
  final String id;
  final String cartProductId;
//  final double cartProductPrice;
//  final int cartProductQty;
//  final cartProductName;
//  final size;

  CartPdt({
    this.post,
    this.id,
    this.cartProductId,
//      this.cartProductPrice,
//      this.cartProductQty,
//      this.cartProductName,
//      this.size,
  });

  @override
  Widget build(BuildContext context) {
    print(post.brand);
    print(post.category);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.deepOrange,
      ),
      onDismissed: (direction) {
        Provider.of<CartNotifier>(context, listen: false)
            .removeItem(cartProductId);
      },
      child: Card(
        child: Directionality(
          textDirection: rtl,
          child: Container(
            decoration: BoxDecoration(gradient: linearGradient),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PerfumeProductDetail(
                        //post: post,
                        ),
                  ),
                );
              },
              isThreeLine: true,
              // contentPadding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.pink,
                child: FittedBox(
                    child: Text(
                  '\$${post.price}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              title: Text(
                '${post.name}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '$TXT26 ${post.quantity}',
                            textDirection: rtl,
                            style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: post.category == CATEGORY_PERFUME
                          ? Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    ' $TXT29${post.sizeOrColor} ml',
                                    textDirection: rtl,
                                    style: TextStyle(
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    TXT30,
                                    style: TextStyle(
                                        color: Colors.white,
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color:
                                          Color(int.parse(post.getSizeOrColor)),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      )),
                                  width: 20,
                                  height: 20,
                                )
                              ],
                            )),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '$TXT31${post.brand}',
                      style: TextStyle(
                          color: Colors.white,
                          //  fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '$TXT32 \$${post.price * post.quantity}',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
//        trailing: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Expanded(
//              flex: 3,
//              child: IconButton(
//                onPressed: () {
//                  setState(() {
//                    widget.cartProductQty++;
//                  });
//                },
//                icon: Icon(Icons.arrow_drop_up),
//              ),
//            ),
//            Expanded(
//                flex: 1,
//                child: Text(
//                  '${widget.cartProductQty}',
//                  style: TextStyle(fontSize: 12),
//                )),
//            Expanded(
//              flex: 2,
//              child: IconButton(
//                onPressed: () {
//                  setState(() {
//                    widget.cartProductQty--;
//                  });
//                },
//                icon: Icon(Icons.arrow_drop_down),
//              ),
//            ),
//          ],
//        ),
            ),
          ),
        ),
      ),
    );
  }
}
