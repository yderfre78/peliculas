import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pelicuals en cine'),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            CardSwiper(),
          ],
        ));
  }
}
