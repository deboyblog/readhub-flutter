import 'package:flutter/material.dart';
import 'package:readhub/redux/states/main.dart';
import 'package:readhub/redux/view_models/main.dart';
import 'package:readhub/views/wrapper.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<ReduxState> store = StoreContainer.global;
  runApp(new Readhub(
    store: store,
  ));
}

class Readhub extends StatelessWidget {
  final Store<ReduxState> store;

  Readhub({Key key, this.store}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Readhub',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blueGrey,
          ),
          home: Wrapper(),
        ));
  }
}
