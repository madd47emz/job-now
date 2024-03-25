import 'package:dio/dio.dart';

import '../Models/OpenPosition.dart';

class OpenPositionsRepository {
  final Dio dio;

  OpenPositionsRepository(this.dio);

  Stream<List<OpenPosition>> getOpenPositions() async* {
    try {
      final response = await dio.get('https://f8fe223d246a426aa34795ffaedafffd.api.mockbin.io/');
      if (response.statusCode == 200) {
        final positionsData = response.data as List<dynamic>;
        yield positionsData.map((position) => OpenPosition.fromJson(position)).toList();
      } else {
        yield [];
      }
    } on DioException catch (e) {
      print(e);
      yield [];
    } catch (e) {
      yield [];
    }
  }}
