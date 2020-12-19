import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/details_page/makeup_detail_page.dart';
import 'package:demo_maker/details_page/prefum_detail_page.dart';
import 'package:demo_maker/pages/all_makeup_page.dart';
import 'package:demo_maker/pages/all_perfume_for_men_Page.dart';
import 'package:demo_maker/pages/searchePage.dart';
import 'package:flutter/material.dart';

import 'all_perfume_for_women_page.dart';
import 'cart_page.dart';
import 'display_makeup_by_type_page.dart';
import 'home_page.dart';

AppBar appBarMethod(BuildContext context, String id) {
  if (id == CartPage.id) {
    return AppBar(
      centerTitle: true,
      title: InkWell(
        child: Text(
          TXT24,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      ),
      elevation: 0.0,
      backgroundColor: Color(0xFF050505),
    );
  } else if (id == AllPerfumeForWomenPage.id) {
    return AppBar(
      centerTitle: true,
      title: Text(
        TXT23,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      backgroundColor: Color(0xFF050505),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchePage(
                          gender: GENDER_WOMEN,
                          collactionName: COLLACTION_PERFUME,
                        )));
          },
        ),
      ],
    );
  } else if (id == AllPerfumeForMenPage.id) {
    return AppBar(
      centerTitle: true,
      title: Text(
        TXT22,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      backgroundColor: Color(0xFF050505),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchePage(
                          gender: GENDER_MEN,
                          collactionName: COLLACTION_PERFUME,
                        )));
          },
        ),
      ],
    );
  } else if (id == AllMakeupPage.id) {
    return AppBar(
      centerTitle: true,
      title: Text(
        TXT19,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      backgroundColor: Color(0xFF050505),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchePage(
                          collactionName: COLLACTION_MAKEUP,
                          gender: GENDER_WOMEN,
                        )));
          },
        ),
      ],
    );
  } else if (id == MakeupProductDetail.id) {
    return AppBar(
      centerTitle: true,
      title: Text(
        TXT21,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      backgroundColor: Color(0xFF050505),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchePage(
                          collactionName: COLLACTION_MAKEUP,
                          gender: GENDER_WOMEN,
                        )));
          },
        ),
      ],
    );
  } else if (id == PerfumeProductDetail.id) {
    return AppBar(
      centerTitle: true,
      title: Text(
        TXT20,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      backgroundColor: Color(0xFF050505),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchePage(
                          gender: GENDER_ALL,
                          collactionName: COLLACTION_PERFUME,
                        )));
          },
        ),
      ],
    );
  } else if (id == MakeupByTypePage.id) {
    return AppBar(
      centerTitle: true,
      title: Text(
        TXT19,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      backgroundColor: Color(0xFF050505),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchePage(
                          collactionName: COLLACTION_MAKEUP,
                          gender: GENDER_WOMEN,
                        )));
          },
        ),
      ],
    );
  } else {
    return AppBar(
      centerTitle: true,
      title: Text(
        TXT25,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      elevation: 0.0,
      backgroundColor: Color(0xFF050505),
    );
  }
}
