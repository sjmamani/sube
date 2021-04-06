import 'package:flutter/material.dart';
import 'package:sube/src/utils/constants.dart';
import 'package:sube/src/widgets/app_bar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[_ProfileImage(), _PersonalData()],
          ),
        ),
        SubeAppBar(
          height: 100,
          showImage: false,
          title: 'Perfil',
        ),
      ],
    );
  }
}

class _PersonalData extends StatelessWidget {
  const _PersonalData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tus Datos',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 15, spreadRadius: 2)
                ],
                color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tipo',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.5),
                  ),
                  _Dropdown(),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Documento',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.5),
                  ),
                  TextFormField(
                    onTap: () {},
                    initialValue: '39.987.622',
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.edit),
                      prefixIcon: Icon(
                        Icons.picture_in_picture,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Nombre y Apellido',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.5),
                  ),
                  TextFormField(
                    onTap: () {},
                    initialValue: 'Joaquin Mamani',
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.edit),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Contraseña',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.5),
                  ),
                  TextFormField(
                    initialValue: '123456',
                    onTap: () {},
                    onFieldSubmitted: (value) {},
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.edit),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Correo',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.5),
                  ),
                  TextFormField(
                    initialValue: 'santiagojmamani@gmail.com.ar',
                    onTap: () {},
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.edit),
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 130, right: 10, left: 10, bottom: 10),
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
              border: Border.all(color: kBackgroundColor, width: 4),
            ),
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 14,
            ),
          ),
        )
      ],
    );
  }
}

class _Dropdown extends StatelessWidget {
  const _Dropdown({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 38.0),
          margin: EdgeInsets.only(left: 16.0),
          child: DropdownButton(
            isExpanded: true,
            underline: Container(
              height: 2,
              color: Color(0xFFBDBDBD),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16),
            value: 'DNI',
            iconSize: 0,
            items: <String>['DNI', 'Pasaporte', 'CUIL']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 54,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.keyboard_arrow_down,
                size: 28.0,
                color: Colors.grey,
              ),
              Container(
                height: 2,
                color: Color(0xFFBDBDBD),
              ),
            ],
          ),
        )
      ],
    );
  }
}
