import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Dash Board"),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: <Widget>[
          // Icon(Icons.notifications),
          // IconButton(
          Icon(Icons.notifications),
          //   onPressed: () {
          //     print("presionado");
          //   },
          // ),
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
      ),
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
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
    return months[index];
  }
}
