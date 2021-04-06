import 'package:flutter/material.dart';
import 'package:sube/src/utils/constants.dart';

class SubeAppBar extends StatelessWidget {
  final double height;
  final bool showImage;
  final String title;
  const SubeAppBar({
    Key key,
    @required this.height,
    @required this.showImage,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.0))),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image(
              height: 30,
              width: 30,
              image: AssetImage('assets/icons/menu.png'),
              color: Colors.white,
              fit: BoxFit.cover,
            ),
            showImage
                ? _ProfileImage()
                : Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
            Image(
              height: 30,
              width: 30,
              image: AssetImage('assets/icons/notification.png'),
              color: Colors.white,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            print("Click!");
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.white,
              height: 75,
              width: 75,
              child: Image(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Joaquin Mamani',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
