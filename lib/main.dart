import 'package:flutter/material.dart';
import 'package:flutter_fest_northrift/cat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder<List>(
        future: Cat().meow(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: GridTile(
                    child: Image.network(
                      snapshot.data![index]['image']['url'],
                      fit: BoxFit.fill,
                    ),
                    header: Text(snapshot.data![index]['name']),
                    footer: Container(
                        color: Colors.white70,
                        child: Text(snapshot.data![index]['description'])),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container();
        },
      )),
    );
  }
}
