import 'package:demo_maker/pages/footer.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  static String id = 'info';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: Footer(
        id: id,
      ),
    );
  }
}
