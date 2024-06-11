import 'dart:convert';
import 'package:app_f1/circuitos_screen.dart';
import 'package:app_f1/escuderias_screen.dart';
import 'package:app_f1/home_page.dart';
import 'package:app_f1/pilotos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flip_card/flip_card.dart';

class Noticia {
  final String titulo;
  final String descripcion;
  final String imagen;
  final String noticia;

  Noticia({required this.titulo, required this.descripcion, required this.imagen, required this.noticia});

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
      noticia: json['noticia'],
    );
  }
}

class NoticiasScreen extends StatelessWidget {
  Future<List<Noticia>> _loadNoticias() async {
    String jsonString = await rootBundle.loadString('assets/noticias.json');
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((e) => Noticia.fromJson(e)).toList();
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
      body: FutureBuilder<List<Noticia>>(
        future: _loadNoticias(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                child: Image.network(snapshot.data![index].imagen),
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.6),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data![index].titulo,
                                  style: TextStyle(color: Colors.red, fontFamily: 'Russo One', fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.data![index].descripcion,
                              style: TextStyle(color: Colors.black, fontFamily: 'Russo One', fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    back: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data![index].noticia,
                          style: TextStyle(color: Colors.black, fontFamily: 'Russo One', fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}