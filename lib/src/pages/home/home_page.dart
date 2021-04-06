import 'package:flutter/material.dart';

import 'package:sube/src/widgets/app_bar.dart';

import 'components/resumen.dart';
import 'components/scrollable_main_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SubeAppBar(
          height: 250,
          showImage: true,
        ),
        ScrollableMainInfo(),
        Resumen()
      ],
    );
  }
}
