import 'package:flutter/material.dart';

import '../mobile/home_page_mobile.dart';
import '../mobile/home_page_tablet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          /*if (constraints.maxWidth > 970) {
            return const HomePageDesktop();
          }*/
          if (constraints.maxWidth >= 645 && constraints.maxWidth <= 970) {
            return const HomePageTablet();
          }
          return const HomePageMobile();
        },
      ),
    );
  }
}
