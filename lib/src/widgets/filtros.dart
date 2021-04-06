import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sube/src/models/app_state.dart';
import 'package:sube/src/utils/constants.dart';

class FiltroFechas extends StatelessWidget {
  const FiltroFechas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> tiempos = ['Día', 'Mes', 'Año'];
    final tiempo = Provider.of<AppState>(context).tiempo;
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            3,
            (index) => Expanded(
              child: GestureDetector(
                onTap: () {
                  Provider.of<AppState>(context, listen: false).tiempo =
                      tiempos[index];
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                        tiempo == tiempos[index] ? kPrimaryColor : Colors.white,
                    borderRadius: tiempo == tiempos[index]
                        ? BorderRadius.circular(13)
                        : null,
                  ),
                  child: Center(
                      child: Text(
                    tiempos[index],
                    style: TextStyle(
                        color: tiempo == tiempos[index]
                            ? Colors.white
                            : Colors.black),
                  )),
                ),
              ),
            ),
          )),
    );
  }
}
