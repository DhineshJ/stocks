import 'dart:convert';

import 'package:http/http.dart';
import 'package:stocks/mockedData.dart';

class MockDataSource {
  Future<Response> getResponse() async {
    return Response(json.encode(mockedResponse), 200);
  }

  Future<Response> getStockResponse() async {
    return Response(json.encode(mockedStockList), 200);
  }

  Future<Response> getSectorResponse() async {
    return Response(json.encode(sectorPerformance), 200);
  }

  Future<Response> getNewsData() async {
    return Response(json.encode(news), 200);
  }
}
