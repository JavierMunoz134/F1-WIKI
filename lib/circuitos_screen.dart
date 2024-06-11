import 'package:app_f1/NoticiasScreen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'home_page.dart';
import 'pilotos_screen.dart';
import 'escuderias_screen.dart';

class CircuitosScreen extends StatefulWidget {
  @override
  _CircuitosScreenState createState() => _CircuitosScreenState();
}

class _CircuitosScreenState extends State<CircuitosScreen> {
  List circuitos = [];

  @override
  void initState() {
    super.initState();
    loadCircuitos();
  }

  Future<void> loadCircuitos() async {
    String jsonString = await rootBundle.loadString('assets/circuitos.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      circuitos = jsonResponse['circuitos'];
    });
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
      body: ListView.builder(
        itemCount: circuitos.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[200],
            shadowColor: Colors.grey,
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              circuitos[index]['nombre'],
                              style: TextStyle(
                                fontSize: 20,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.red[700]!,
                                fontFamily: 'Russo One',
                              ),
                            ),
                            // Solid text as fill.
                            Text(
                              circuitos[index]['nombre'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Russo One',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(circuitos[index]['bandera'], width: 30, height: 20),
                    ],
                  ),
                ),
                Image.network(circuitos[index]['foto']),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Localización: ' + circuitos[index]['localizacion'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Russo One')),
                      Text('Año de construcción: ' + circuitos[index]['ano_construccion'].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Russo One')),
                      Text('Número de curvas: ' + circuitos[index]['num_curvas'].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Russo One')),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}