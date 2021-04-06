import 'package:flutter/material.dart';
import 'package:sube/src/pages/root_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool teclado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Stack(
      children: <Widget>[
        _formulario(),
        Background(),
        if (!teclado) _Encabezado(),
      ],
    ));
  }

  SingleChildScrollView _formulario() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          margin: EdgeInsets.only(top: 400),
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
                initialValue: '39.987.622',
                onTap: () {
                  setState(() {
                    teclado = true;
                  });
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    teclado = false;
                  });
                },
                decoration: InputDecoration(
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
                initialValue: '12345678',
                onTap: () {
                  setState(() {
                    teclado = true;
                  });
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    teclado = false;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 28,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => RootPage()));
                },
                child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text(
                      'Ingresar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ))),
              ),
            ],
          ),
        ),
      ),
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

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 50,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Hola,',
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w100,
                letterSpacing: 2),
          ),
          Text(
            'Santiago',
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w200,
                letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: CustomPaint(painter: _BackgroundPainter()),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    lapiz.color = Color(0xFF0878B8);
    lapiz.style = PaintingStyle.fill;

    final path = new Path();
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.9,
        size.width * 0.5, size.height * 0.9);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.88, size.width, size.height);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);

    final path2 = new Path();
    lapiz.color = Color(0xFF0868B8);
    path2.moveTo(size.width, 0);
    path2.lineTo(size.width * 0.55, 0);
    path2.quadraticBezierTo(
        size.width * 0.65, size.height * 0.3, size.width, size.height * 0.5);
    // path2.lineTo(size.width, size.height * 0.5);
    canvas.drawPath(path2, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
