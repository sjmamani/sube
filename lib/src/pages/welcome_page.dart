import 'package:flutter/material.dart';
import 'package:sube/src/pages/login_page.dart';
import 'package:sube/src/utils/constants.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF225499),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/logo-sube-alt.png'),
                    width: 150,
                  ),
                  Text(
                    'Hola!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()));
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                        child: Center(
                            child: Text(
                          'Ingresar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        'Crear Cuenta',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ))),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Olvidaste tu contraseña?',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
