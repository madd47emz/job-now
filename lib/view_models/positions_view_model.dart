import 'package:flutter/cupertino.dart';

import '../Models/OpenPosition.dart';
import '../repositories/open_positions_repository.dart';

class OpenPositionsViewModel extends ChangeNotifier {
  final OpenPositionsRepository repository;

  Stream<List<OpenPosition>>? _openPositionsStream;

  OpenPositionsViewModel(this.repository) {
    _fetchOpenPositions();
  }

  Stream<List<OpenPosition>> get openPositionsStream => _openPositionsStream!;

  void _fetchOpenPositions() async {
    _openPositionsStream = repository.getOpenPositions();
    notifyListeners();
  }
}
