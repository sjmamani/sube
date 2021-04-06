import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sube/src/models/app_state.dart';

import 'package:sube/src/pages/home/home_page.dart';
import 'package:sube/src/pages/mapa_page.dart';
import 'package:sube/src/pages/profile_page.dart';
import 'package:sube/src/pages/tarjetas_page.dart';

import 'package:sube/src/utils/constants.dart';
import 'package:sube/src/widgets/custom_bottom_bar.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var navIndex = 0;

  final pages = List<Widget>.unmodifiable(
      [HomePage(), TarjetasPage(), ProfilePage(), MapaPage()]);

  final iconList = List<IconData>.unmodifiable([
    Icons.home,
    Icons.account_balance_wallet,
    Icons.person,
    Icons.location_on
  ]);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new AppState(),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: pages[navIndex],
        bottomNavigationBar: CustomBottomBar(
          icons: iconList,
          activeIndex: navIndex,
          onPressed: (i) => setState(() => navIndex = i),
        ),
      ),
    );
  }
}
