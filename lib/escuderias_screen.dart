import 'package:app_f1/NoticiasScreen.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'home_page.dart';
import 'pilotos_screen.dart';
import 'circuitos_screen.dart';

class EscuderiasScreen extends StatefulWidget {
  @override
  _EscuderiasScreenState createState() => _EscuderiasScreenState();
}

class _EscuderiasScreenState extends State<EscuderiasScreen> {
  List escuderias = [];

  @override
  void initState() {
    super.initState();
    loadEscuderias();
  }

  Future<void> loadEscuderias() async {
    String jsonString = await rootBundle.loadString('assets/escuderias.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      escuderias = jsonResponse['escuderias'];
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
  itemCount: escuderias.length,
  itemBuilder: (context, index) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(int.parse('FF' + escuderias[index]['color'].substring(1), radix: 16)),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        color: Colors.grey[850],
        shadowColor: Color(int.parse('FF' + escuderias[index]['color'].substring(1), radix: 16)),
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
                          escuderias[index]['nombre'],
                          style: TextStyle(
                            fontSize: 20,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Color(int.parse('FF' + escuderias[index]['color'].substring(1), radix: 16)),
                            fontFamily: 'Russo One',
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          escuderias[index]['nombre'],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Russo One',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.network(escuderias[index]['bandera'], width: 30, height: 20),
                ],
              ),
            ),
            Image.network(escuderias[index]['foto']),
          ],
        ),
      ),
      back: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(int.parse('FF' + escuderias[index]['color'].substring(1), radix: 16)),
            width: 3,
          ),
        ),
        color: Color(int.parse('FF' + escuderias[index]['color'].substring(1), radix: 16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              for (var field in ['base', 'jefe', 'motor', 'campeonatos']) ...[
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      '${field[0].toUpperCase()}${field.substring(1)}: ' +
                          (field == 'campeonatos'
                              ? escuderias[index][field].toString()
                              : escuderias[index][field]),
                      style: TextStyle(
                        fontSize: 24,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color(int.parse('FF' + escuderias[index]['color'].substring(1), radix: 16)),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Russo One',
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      '${field[0].toUpperCase()}${field.substring(1)}: ' +
                          (field == 'campeonatos'
                              ? escuderias[index][field].toString()
                              : escuderias[index][field]),
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Russo One',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  },
),
    );
  }
}