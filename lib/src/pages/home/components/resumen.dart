import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sube/src/models/app_state.dart';
import 'package:sube/src/widgets/filtros.dart';

class Resumen extends StatelessWidget {
  const Resumen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tiempo = Provider.of<AppState>(context).tiempo;
    List<int> valores;
    numeros.forEach((key, value) {
      if (key == tiempo) {
        valores = value;
        return;
      }
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 170),
        height: 160,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black12, spreadRadius: 5)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _items(valores[0].toString(), 'Viajes'), // variar 2 de provider
                _items('\$${valores[1].toString()}',
                    'Gastos'), // variar 44 de prov
                _items(valores[2].toString(), 'Cargas'), // variar 0 de prov
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: FiltroFechas(),
            )
          ],
        ),
      ),
    );
  }

  Column _items(String numero, String texto) {
    return Column(
      children: <Widget>[
        Text(
          numero,
          style: TextStyle(fontSize: 28),
        ),
        Text(
          texto,
          style: TextStyle(color: Colors.green),
        )
      ],
    );
  }
}

final numeros = {
  'Día': [2, 44, 0],
  'Mes': [27, 592, 3],
  'Año': [99, 1045, 17]
};
