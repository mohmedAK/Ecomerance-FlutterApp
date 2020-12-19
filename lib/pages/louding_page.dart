import 'package:demo_maker/Notifier/brand_notifier.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/Notifier/perfume_notifier.dart';
import 'package:demo_maker/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    startTime();
  }

  startTime() async {
    await Provider.of<BrandNotifier>(context, listen: false).getBrand();
    await Provider.of<PerfumeNotifier>(context, listen: false).getSlide();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
//    Future.delayed(Duration(seconds: 5), () {
//      // 5s over, navigate to a new page
//
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF07031a),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/rosa.png',
                height: 150,
                width: 150,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                TXT25,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Montserrat-Bold',
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              )
            ],
          ),
          Center(
            child: Visibility(
              visible: true,
              child: Container(
                color: Color(0xFF07031a),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircularProgressIndicator(
                    //valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    backgroundColor: Color(0xFF07031a),
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
