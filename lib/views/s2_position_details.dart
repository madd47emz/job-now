import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/OpenPosition.dart';

class PositionDetails extends StatelessWidget {
  final OpenPosition position;

  const PositionDetails({required this.position});

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = position.technologies.map((technology) => Chip(label: Text(technology),backgroundColor: Colors.deepPurpleAccent.shade100,)).toList();
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.share), onPressed: () {}),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(position.imageUrl,
                    fit: BoxFit.cover, width: double.infinity),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(position.positionName,
                          style: Theme.of(context).textTheme.headline4),
                      Text(position.salaryRange,
                          style: Theme.of(context).textTheme.subtitle1),
                      SizedBox(height: 16.0),
                      Text('Technologies:',
                          style: Theme.of(context).textTheme.subtitle1),
                      Wrap(
                        spacing: 10,
                        children: chips
                      ),
                      SizedBox(height: 16.0),
                      Text('Description:',
                          style: Theme.of(context).textTheme.subtitle1),
                      Text(position.description,
                          style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(height: 16.0),
                      Text('Company:',
                          style: Theme.of(context).textTheme.subtitle1),
                      Text(position.companyDescription,
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
