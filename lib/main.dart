import 'package:flutter/material.dart';
import 'package:flutter_hospital_dasboard/account.card.dart';
import 'package:flutter_hospital_dasboard/appointment.card.dart';
import 'package:flutter_hospital_dasboard/chart-painter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations(
//      [
//        DeviceOrientation.portraitUp,
//        DeviceOrientation.portraitDown,
//      ],
//    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HospitalDashBoardHome(),
    );
  }
}

Color primaryColor = Color(0xff0074ff);

class HospitalDashBoardHome extends StatelessWidget {
  const HospitalDashBoardHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Dash Board"),
      backgroundColor: primaryColor,
      elevation: 0,
      actions: <Widget>[
        // Icon(Icons.notifications),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            print("presionado");
          },
        ),
        Container(
          width: 50.0,
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00ff1d),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.label_outline,
              size: 35.0,
              color: primaryColor,
            ),
            Icon(
              Icons.ac_unit,
              color: Colors.grey,
              size: 30.0,
            ),
            Icon(
              Icons.tune,
              size: 30.0,
              color: Colors.grey,
            ),
            Icon(
              Icons.perm_identity,
              color: Colors.grey,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                        color: Color(0xff4d9eff),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Monthly",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: CustomPaint(
                      foregroundPainter:
                          ChartPainter(), /**Con ChartPainter dibujamos las lineas */
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: _buildChartLegend(
                          context), /**Con _buildChartLegend(context) colocamos los meses */
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Appointments",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildCard(
                    context,
                    child:
                        AppointmentCard(), /**Con AppointmentCard() creamos el card de Today y canceled */
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Today (28 January)",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Luisa Patel',
                      id: 'ID: AA741',
                      hour: '10:00 pm',
                      active: true,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Sara Fuller',
                      id: 'ID: BA953',
                      hour: '11:00 pm',
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Javier Fuller',
                      id: 'ID: DD5666',
                      hour: '01:00 pm',
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(context, {Widget child}) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

  List<Widget> _buildChartLegend(BuildContext context) {
    List<Widget> legend = [];
    int monthIndex = 0;
    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        legend.add(
          Positioned(
            left: (i * 23) - 10,
            top: 10,
            child: Container(
              height: 30,
              child: Text(
                getMonth(monthIndex++),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }
    }
    return legend.toList();
  }

  String getMonth(int index) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep'
    ];
    return months[index];
  }
}
