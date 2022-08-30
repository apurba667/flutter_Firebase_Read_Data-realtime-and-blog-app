import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection("blog").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print("The programe has problem ");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(children: [
                      Container(
                        height: 400,
                        child: Card(
                          elevation: 20,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        child: Text(data['title'][0]),
                                      ),
                                    ),
                                    Text(data["title"]),
                                    Icon(Icons.more_horiz)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Image.network(data["image"]),
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    data["des"],
                                    maxLines: 5,
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  );
                }).toList(),
              );
            }));
  }
}
