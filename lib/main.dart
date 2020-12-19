import 'package:demo_maker/Notifier/makeup_notifier.dart';

import 'package:demo_maker/pages/louding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Notifier/brand_notifier.dart';
import 'Notifier/cart_notifier.dart';
import 'Notifier/perfume_notifier.dart';

void main() {
  runApp(MultiProvider(providers: [
    // ChangeNotifierProvider.value(value: BrandController()),
    ChangeNotifierProvider(create: (_) => BrandNotifier()),
    ChangeNotifierProvider(create: (_) => PerfumeNotifier()),
    ChangeNotifierProvider(create: (_) => CartNotifier()),
    ChangeNotifierProvider(create: (_) => MakeupNotifier()),
  ], child: MaterialApp(darkTheme: ThemeData.dark(), home: LoadingScreen())));
}
