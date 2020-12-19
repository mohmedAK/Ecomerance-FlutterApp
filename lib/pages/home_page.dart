import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/brand_slide/brand_slide.dart';
import 'package:demo_maker/image_Slider_Home/image_slider.dart';
import 'package:demo_maker/pages/all_perfume_for_women_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'all_makeup_page.dart';
import 'all_perfume_for_men_Page.dart';
import 'app_bar.dart';
import 'display_makeup_by_type_page.dart';
import 'footer.dart';

class Home extends StatelessWidget {
  static String id = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(context, Home.id),
      body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(gradient: linearGradient),
              //color: Color(0xFF07031a),
              child: Column(
                children: <Widget>[
                  CompilcatedImageDemo(),
                  //========================Start Brand of Perfums for Woman Slide ===============================
                  titleContainer(TXT1),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllPerfumeForWomenPage()));
                    },
                    child: imageContainer(context, 'images/women_perfume3.jpg'),
                  ),
                  //========================End Brand of Perfums for Woman Slide ===============================

                  //========================Start Brand of Perfums for Men Slide ===============================
                  titleContainer(TXT2),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllPerfumeForMenPage()));
                    },
                    child: imageContainer(context, 'images/men_perfume.jpg'),
                  ),
                  //========================End Brand of Perfums for Men Slide ===============================

                  //========================Start Brand of Mackup ===============================
                  titleContainer(TXT3),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllMakeupPage()));
                    },
                    child: imageContainer(context, 'images/makeup.jpg'),
                  ),

                  //========================End Brand of Mackup ===============================

                  //========================Start Only For Man image ===============================
                  titleContainer(TXT4),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MakeupByTypePage(
                                    gender: GENDER_MEN,
                                    brandName: GENDER_ALL,
                                    type: TYPE_FORMEN,
                                  )));
                    },
                    child: imageContainer(context, 'images/excmen.png'),
                  ),
                  //========================End Only For Man image ===============================

                  //========================Start Eyes image ===============================
                  titleContainer(TXT5),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MakeupByTypePage(
                                    gender: GENDER_WOMEN,
                                    brandName: GENDER_ALL,
                                    type: TYPE_EYES,
                                  )));
                    },
                    child: imageContainer(context, 'images/eyes.jpg'),
                  ),
                  //========================End Eyes image ===============================

                  //========================Start Face image ===============================
                  titleContainer(TXT6),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MakeupByTypePage(
                                    gender: GENDER_WOMEN,
                                    brandName: GENDER_ALL,
                                    type: TYPE_FACE,
                                  )));
                    },
                    child: imageContainer(context, 'images/face.jpg'),
                  ),
                  //========================End Face image ===============================

                  //========================Start skin image ===============================
                  titleContainer(TXT7),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MakeupByTypePage(
                                    gender: GENDER_WOMEN,
                                    brandName: GENDER_ALL,
                                    type: TYPE_SKIN,
                                  )));
                    },
                    child: imageContainer(context, 'images/lips.jpg'),
                  ),
                  //========================End lips image ===============================

                  //========================Start skins image ===============================
                  titleContainer(TXT8),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MakeupByTypePage(
                                    gender: GENDER_WOMEN,
                                    brandName: GENDER_ALL,
                                    type: TYPE_SKIN,
                                  )));
                    },
                    child: imageContainer(context, 'images/skins.jpg'),
                  ),
                  //========================End skins image ===============================

                  //========================Start Hair image ===============================
                  titleContainer(TXT9),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MakeupByTypePage(
                                    gender: GENDER_WOMEN,
                                    brandName: GENDER_ALL,
                                    type: TYPE_HAIR,
                                  )));
                    },
                    child: imageContainer(context, 'images/hair2.jpg'),
                  ),
                  //========================End Hair image ===============================

                  //========================Start Hair image ===============================
                  titleContainer(TXT10),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MakeupByTypePage(
                                    gender: GENDER_WOMEN,
                                    brandName: GENDER_ALL,
                                    type: TYPE_CARE,
                                  )));
                    },
                    child: imageContainer(context, 'images/care.jpg'),
                  ),
                  //========================End Hair image ===============================
                ],
              ))),
      bottomNavigationBar: Footer(
        id: id,
      ),
    );
  }

  Container imageContainer(BuildContext context, String imgUrl) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(2, 80, 197, 1.0),
                Color.fromRGBO(142, 34, 90, 1.0)
              ]),
          borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(45.0),
            topRight: Radius.circular(45.0),
            bottomLeft: Radius.circular(45.0),
            // bottomRight: Radius.circular(45.0),
          ),
          image: DecorationImage(
              image: AssetImage(
                imgUrl,
              ),
              fit: BoxFit.fill),
//                        borderRadius: BorderRadius.only(
//                          topLeft: Radius.circular(20.0),
//                          topRight: Radius.circular(20.0),
//                          bottomLeft: Radius.circular(20.0),
//                          bottomRight: Radius.circular(20.0),
//                        ),
          color: Colors.white),
      height: 160.0,
      width: MediaQuery.of(context).size.width,
    );
  }

  Container titleContainer(String text) {
    return Container(
      child: Center(
        child: Container(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Segoe-UI',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
