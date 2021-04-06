import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final Function(int) onPressed;
  final int activeIndex;
  final List<IconData> icons;

  const CustomBottomBar(
      {@required this.onPressed,
      @required this.activeIndex,
      @required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        // width: 300.0,
        height: 70.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var i = 0; i < icons.length; i++)
              IconButton(
                icon: Icon(
                  icons[i],
                  size: 35,
                ),
                color: activeIndex == i
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
                onPressed: () => onPressed(i),
              )
          ],
        ),
      ),
    );
  }
}
