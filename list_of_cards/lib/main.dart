import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardList(cards: List<String>.generate(100, (index) => "Element $index")),
    );
  }
}

class CardList extends StatelessWidget {
  final List<String> cards;

  const CardList({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card List'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 100,
              child: InkWell(
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      cards[index],
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Card"),
                          content: Text(cards[index]),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context) {
                                    return DetailScreen(card: cards[index]);
                                  })
                                );
                              },
                              child: const Text("See details"),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("close"),
                            ),
                          ],
                        );
                      }
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String card;
  const DetailScreen({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card),
      ),
      body: Center(
        child: Text(card),
      ),
    );
  }
}
