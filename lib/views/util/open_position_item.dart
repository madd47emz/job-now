import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_now/views/s2_position_details.dart';

import '../../Models/OpenPosition.dart';

class OpenPositionListItem extends StatelessWidget {
  final OpenPosition position;

  const OpenPositionListItem({required this.position});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.deepPurpleAccent.shade100,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(position.imageUrl, fit: BoxFit.cover, width: 50.0, height: 50.0),
      ),
      title: Text(position.positionName),
      subtitle: Text(position.salaryRange),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PositionDetails(position: position))),
    );
  }
}
