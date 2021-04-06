import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sube/src/utils/constants.dart';
import 'package:sube/src/widgets/app_bar.dart';
import 'package:sube/src/widgets/filtros.dart';

class TarjetasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SubeAppBar(
          height: 100,
          showImage: false,
          title: 'Tarjetas',
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                _SaldoActual(),
                _Tarjetas(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Cantidad de Viajes',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FiltroFechas(),
                      SizedBox(
                        height: 20,
                      ),
                      _Grafica()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Grafica extends StatelessWidget {
  const _Grafica({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)
          ]),
          child: LineChart(LineChartData(
            gridData: FlGridData(show: false),
            backgroundColor: Colors.white,
            titlesData: FlTitlesData(
              show: true,
              leftTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                textStyle: const TextStyle(
                    color: Color(0xff68737d),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return 'Abr';
                    case 2:
                      return 'May';
                    case 3:
                      return 'Jun';
                    case 4:
                      return 'Jul';
                    case 5:
                      return 'Ago';
                  }
                  return '';
                },
                margin: 8,
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 26 / 2),
                  FlSpot(1, 18 / 2),
                  FlSpot(2, 22 / 2),
                  FlSpot(3, 34 / 2),
                  FlSpot(4, 30 / 2),
                  FlSpot(5, 27 / 2),
                  FlSpot(6, 40 / 2),
                ],
                isCurved: true,
                colors: [Color(0xffA998F8)],
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  colors: [Color(0x99A998F8)],
                ),
              ),
            ],
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 26,
            borderData: FlBorderData(show: false),
          )),
        ),
      ),
    );
  }
}

class _Tarjetas extends StatelessWidget {
  const _Tarjetas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _TarjetaSube(),
          _TarjetaSube(),
          _TarjetaSube(),
        ],
      ),
    );
  }
}

class _TarjetaSube extends StatelessWidget {
  const _TarjetaSube({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: 280,
      decoration: BoxDecoration(
          color: kSecundaryColor, borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/logo-sube-alt.png'),
            height: 40,
            width: 80,
          ),
          Text(
            '6061 2681 8500 7231',
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}

class _SaldoActual extends StatelessWidget {
  const _SaldoActual({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Saldo Actual',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          '\$356',
          style: TextStyle(fontSize: 28),
        ),
      ],
    );
  }
}
