import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:seventh_word/domain/services/remote_service.dart';

class Cards extends StatefulWidget {
  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  var result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = RemoteService().fetchBooks("Fitness");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
    future: result,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data[index]['volumeInfo']['title']),
                    leading: Text(snapshot.data[index]['volumeInfo']['averageRating'].toString()+" ★"),
                    
                  
                    )
                ],
              ),
            );
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  ),
    );
  }
}
