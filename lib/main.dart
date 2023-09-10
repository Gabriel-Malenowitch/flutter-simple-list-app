import 'package:flutter/material.dart';

// Deixando aqui só pra ficar mais fácil de ler, mas essa constante deveria estar em outro lugar.
final globalWords = [
  'Bananaquedabra',
  'Almofarizinhos',
  'Pamonhazinha',
  'Cocoricólogos',
  'Xaropambulante',
  'Fofocandopatia',
  'Cachorroquente',
  'Tchutchucar',
  'Breguicinha',
  'Mingauzada',
  'Palhaçadastrófico',
  'Chocalhotas',
  'Babadoconfusão',
  'Trapalhiquices',
  'Boboquicestral',
  'Malabarinhas',
  'Gravatacolorida',
  'Cacarejante',
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme:
            ThemeData(appBarTheme: const AppBarTheme(color: Colors.deepPurple)),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('My first app!!'),
            centerTitle: true,
            // backgroundColor: Colors.deepPurple,
          ),
          body: BodyWidgetWithState(),
        ));
  }
}

class BodyWidgetWithState extends StatefulWidget {
  final List<String> words = globalWords;
  final List<String> savedWords = [];

  BodyWidgetWithState({super.key});

  @override
  Body createState() => Body();
}

class Body extends State<BodyWidgetWithState> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: widget.words.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          final word = widget.words[index];
          final isAlreadySaved = widget.savedWords.contains(word);

          return ListTile(
              trailing: Icon(
                  isAlreadySaved ? Icons.favorite : Icons.favorite_border,
                  color: isAlreadySaved ? Colors.deepPurple : null),
              title: Text(widget.words[index]),
              onTap: () {
                setState(() {
                  if (isAlreadySaved) {
                    widget.savedWords.remove(word);
                  } else {
                    widget.savedWords.add(word);
                  }
                });
              });
        });
  }
}
