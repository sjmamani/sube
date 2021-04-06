import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sube/src/models/app_state.dart';
import 'package:sube/src/utils/constants.dart';
import 'package:sube/src/utils/transportes.dart';

class ScrollableMainInfo extends StatefulWidget {
  const ScrollableMainInfo({
    Key key,
  }) : super(key: key);

  @override
  _ScrollableMainInfoState createState() => _ScrollableMainInfoState();
}

class _ScrollableMainInfoState extends State<ScrollableMainInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 330),
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              _FormatoUso(),
              _HistorialViajes(),
            ],
          )),
    );
  }
}

class _FormatoUso extends StatelessWidget {
  const _FormatoUso({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Formato de Uso',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              for (var transporte in transportes)
                _TransportePilar(transporte: transporte)
            ],
          )
        ],
      ),
    );
  }
}

class _TransportePilar extends StatelessWidget {
  final Transporte transporte;
  const _TransportePilar({
    Key key,
    this.transporte,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final selectedId = Provider.of<AppState>(context).selectedId;
    final activo = selectedId == transporte.id ? true : false;

    return GestureDetector(
      onTap: () {
        Provider.of<AppState>(context, listen: false).selectedId =
            transporte.id;
        Provider.of<AppState>(context, listen: false).transporte =
            transporte.nombre;
      },
      child: Container(
        width: 65,
        height: 150,
        decoration: BoxDecoration(
            color: activo ? kPrimaryColor : Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Image(
                  image: AssetImage('assets/icons/${transporte.imagen}'),
                  width: 45,
                  height: 45,
                )),
            SizedBox(
              height: 35,
            ),
            Text(
              transporte.nombre,
              style: TextStyle(
                  color: activo ? Colors.white : kPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistorialViajes extends StatelessWidget {
  const _HistorialViajes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedId = Provider.of<AppState>(context).selectedId;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Historial de Viajes',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(children: [
              // TODO Improve this or find another way
              if (selectedId == 0) ...viajesColectivo,
              if (selectedId == 1) ...viajesSubte,
              if (selectedId == 2) ...viajesTrenes,
            ]),
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5, color: Colors.black12, spreadRadius: 5)
                ]),
          ),
        ],
      ),
    );
  }
}

class _Viaje extends StatelessWidget {
  final Color color;
  final String linea;
  final String fecha;
  final String precio;
  const _Viaje({
    Key key,
    this.color,
    this.linea,
    this.fecha,
    this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transporte = Provider.of<AppState>(context).transporte;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                transporte == 'Tren' ? linea.substring(0, 1) : linea,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$transporte Línea $linea',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  fecha,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          Text(
            '\$$precio',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}

final List<_Viaje> viajesColectivo = [
  _Viaje(
    color: Colors.purpleAccent,
    linea: '64',
    fecha: '18 de Septiembre, 2:45 PM',
    precio: '22,00',
  ),
  _Viaje(
    color: Colors.green,
    linea: '59',
    fecha: '17 de Septiembre, 4:55 PM',
    precio: '21,00',
  ),
  _Viaje(
    color: Colors.blueAccent,
    linea: '9',
    fecha: '17 de Septiembre, 10:30 AM',
    precio: '22,00',
  ),
  _Viaje(
    color: Colors.orangeAccent,
    linea: '91',
    fecha: '16 de Septiembre, 10:30 AM',
    precio: '20,00',
  ),
];

final List<_Viaje> viajesSubte = [
  _Viaje(
    color: Colors.blue,
    linea: 'A',
    fecha: '18 de Septiembre, 2:45 PM',
    precio: '19,00',
  ),
  _Viaje(
    color: Colors.red,
    linea: 'B',
    fecha: '17 de Septiembre, 4:55 PM',
    precio: '19,00',
  ),
  _Viaje(
    color: Colors.blue[800],
    linea: 'C',
    fecha: '17 de Septiembre, 10:30 AM',
    precio: '19,00',
  ),
  _Viaje(
    color: Colors.green,
    linea: 'D',
    fecha: '16 de Septiembre, 10:30 AM',
    precio: '19,00',
  ),
];

final List<_Viaje> viajesTrenes = [
  _Viaje(
    color: Colors.blue,
    linea: 'Sarmiento',
    fecha: '18 de Septiembre, 5:45 PM',
    precio: '7,75',
  ),
  _Viaje(
    color: Colors.blue,
    linea: 'Roca',
    fecha: '17 de Septiembre, 9:55 PM',
    precio: '12,25',
  ),
  _Viaje(
    color: Colors.blue,
    linea: 'Roca',
    fecha: '17 de Septiembre, 10:30 AM',
    precio: '12,25',
  )
];
