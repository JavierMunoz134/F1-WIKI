import 'package:app_f1/NoticiasScreen.dart';
import 'package:app_f1/circuitos_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'home_page.dart';
import 'escuderias_screen.dart';

class PilotosScreen extends StatefulWidget {
  @override
  _PilotosScreenState createState() => _PilotosScreenState();
}

class _PilotosScreenState extends State<PilotosScreen> {
  List pilotos = [];

  @override
  void initState() {
    super.initState();
    loadPilotos();
  }

  Future<void> loadPilotos() async {
    String jsonString = await rootBundle.loadString('assets/pilotos.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      pilotos = jsonResponse['pilotos'];
    });
  }

  Color getTeamColor(String team) {
    switch (team) {
      case 'Mercedes':
        return Color(0xFF27F4D2);
      case 'Aston Martin':
        return Color(0xFF229971);
      case 'Red Bull Racing':
        return Color(0xFF3671C6);
      case 'Williams':
        return Color(0xFF64C4FF);
      case 'Alpine':
        return Color(0xFFFF87BC);
      case 'Kick Sauber':
        return Color(0xFF52E252);
      case 'Ferrari':
        return Color(0xFFDC0000);
      case 'Williams':
        return Color(0xFF64C4FF);
      case 'Haas':
        return Color(0xFF787878);
      case 'McLaren': 
        return Color(0xFFFF8700);
      case 'AlphaTauri': 
        return Color(0xFF2B4562);
      default:
        return Colors.white;
      
    }
  }

  void showPilotDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: getTeamColor(pilotos[index]['escuderia']),
              width: 2.0,
            ),
          ),
          child: Card(
            color: getTeamColor(pilotos[index]['escuderia']),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.network(pilotos[index]['foto'], fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(pilotos[index]['nombre'] + ' ' + pilotos[index]['apellidos'], style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Russo One')),
                      SizedBox(height: 10),
                      Text(pilotos[index]['escuderia'], style: TextStyle(color: Colors.white, fontFamily: 'Russo One')),
                      SizedBox(height: 5),
                      Text(pilotos[index]['nacionalidad'], style: TextStyle(color: Colors.white, fontFamily: 'Russo One')),
                      SizedBox(height: 5),
                      Text('Edad: ' + pilotos[index]['edad'].toString(), style: TextStyle(color: Colors.white, fontFamily: 'Russo One')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Image.asset('assets/f1.png'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Pilotos', style: TextStyle(color: Colors.red, fontFamily: 'Russo One')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PilotosScreen()),
              );
            },
          ),
          TextButton(
            child: Text('Circuitos', style: TextStyle(color: Colors.red, fontFamily: 'Russo One')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CircuitosScreen()),
              );
            },
          ),
          TextButton(
            child: Text('Escuderías', style: TextStyle(color: Colors.red, fontFamily: 'Russo One')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EscuderiasScreen()),
              );
            },
          ),
          TextButton(
            child: Text('Noticias', style: TextStyle(color: Colors.red, fontFamily: 'Russo One')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticiasScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
  crossAxisCount: 2,
  childAspectRatio: 0.6,
  children: List.generate(pilotos.length, (index) {
    return GestureDetector(
  onTap: () => showPilotDialog(context, index),
  child: Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Add this
    ),
    color: getTeamColor(pilotos[index]['escuderia']),
    child: Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)), // And this
            child: Image.network(pilotos[index]['foto'], fit: BoxFit.cover),
          ),
        ),
       Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(pilotos[index]['nombre'] + ' ' + pilotos[index]['apellidos'], style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Russo One')),
      SizedBox(height: 10),
      Text(pilotos[index]['escuderia'], style: TextStyle(color: Colors.white, fontFamily: 'Russo One')),
      SizedBox(height: 5),
      Text(pilotos[index]['nacionalidad'], style: TextStyle(color: Colors.white, fontFamily: 'Russo One')),
      SizedBox(height: 5),
      Text('Edad: ' + pilotos[index]['edad'].toString(), style: TextStyle(color: Colors.white, fontFamily: 'Russo One')),
    ],
  ),
),
      ],
    ),
  ),
);
  }),
),
    );
  }
}