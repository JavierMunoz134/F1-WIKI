import 'package:app_f1/NoticiasScreen.dart';
import 'package:flutter/material.dart';
import 'pilotos_screen.dart';
import 'circuitos_screen.dart';
import 'escuderias_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo-f1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
              AnimatedPositioned(
  duration: Duration(milliseconds: 500), // Reduced from 1 second to 500 milliseconds
  left: _startAnimation ? MediaQuery.of(context).size.width / 2 - 75 : -150,
  child: Container(
    width: 150,
    height: 150,
    child: Image.asset('assets/f1.png'),
  ),
),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 170),
                    Text(
                        'F1 WIKI',
                        style: TextStyle(
                          fontSize: 50, // Increase font size
                          color: Colors.white,
                          shadows: [
                            Shadow( // Duplicate shadow for a more intense effect
                              blurRadius: 10.0,
                              color: Colors.red, // Change shadow color to red
                              offset: Offset(5.0, 5.0),
                            ),
                            Shadow( // Duplicate shadow for a more intense effect
                              blurRadius: 10.0,
                              color: Colors.red, // Change shadow color to red
                              offset: Offset(-5.0, 5.0),
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Russo One', // Use a bold, racing-style font
                        ),
                      ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Pilotos', style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Russo One')),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PilotosScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Circuitos', style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Russo One')),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CircuitosScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Container(
    width: double.infinity,
    child: ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Escuderías', style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Russo One')),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EscuderiasScreen()),
        );
      },
    ),
  ),
),
SizedBox(height: 20),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Container(
    width: double.infinity,
    child: ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Noticias', style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Russo One')),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoticiasScreen()), // Asegúrate de tener una pantalla NoticiasScreen
        );
      },
    ),
  ),
),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}