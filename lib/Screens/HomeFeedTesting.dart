import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csiddu/Models/EventModel.dart';
import 'package:csiddu/CrudServices.dart';

class HomeFeedTesting extends StatelessWidget {
  CrudMethodsEvents crudMethodsEvents = new CrudMethodsEvents();
  static Stream<QuerySnapshot> events;

  @override
  Widget build(BuildContext context) {
    print('build method was called');
    events = events == null ? crudMethodsEvents.fetchEvents() : events;
    return StreamBuilder<QuerySnapshot>(
      stream: events,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    snapshot.sort((a, b) => b.data["postedOn"].compareTo(a.data["postedOn"]));
    return ListView(
      padding: const EdgeInsets.only(top: 5.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final event = Event(data);
    print(event.toString());
    print(event.reference.documentID);
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 4),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 150,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                              ),
                            ))),
                    Center(child: CachedNetworkImage(imageUrl: event.imageUrl))
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.025),
                    ],
                  )),
            ),
          )),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 8, 0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${event.eventName} \n",
                          style: TextStyle(
                              fontSize: 25, fontFamily: "QuickSandRegular")),
                      TextSpan(
                          text: "${event.date} \n",
                          style: TextStyle(
                              fontSize: 12, fontFamily: "QuickSandLight")),
                    ], style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}