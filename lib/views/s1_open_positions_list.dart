import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/OpenPosition.dart';
import '../repositories/open_positions_repository.dart';
import '../view_models/positions_view_model.dart';
import 'util/open_position_item.dart';

class OpenPositionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = OpenPositionsViewModel(OpenPositionsRepository(Dio()));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Open positions...',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: StreamBuilder<List<OpenPosition>>(
          stream: viewModel.openPositionsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Handle errors appropriately
            }
      
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator()); // Show loading indicator
            }
      
            final positions = snapshot.data!;
            if(!positions.isEmpty){
              return ListView.separated(
                itemCount: positions.length,
                separatorBuilder: (context, index) => const Divider(), // Adjust separator as needed
                itemBuilder: (context, index) {
                  final position = positions[index];
                  return OpenPositionListItem(position: position);
                },
              );

            }else return Center(child: Text("No available positions",style: TextStyle(decoration: TextDecoration.none,fontSize: 20),));
          },
        ),
      ),
    );
  }
}
