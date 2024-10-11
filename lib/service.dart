import 'package:dio/dio.dart';
import 'package:flutter_booking_app/session.dart';

final dio = Dio();

Future<Response> request(String url) async {
  Response response;
  response = await dio.get(url);
  return response;
}

Future<List<Session>> getSessionData(url) async {
    try {
        Response response = await request(url);
        if(response.statusCode == 200){
          List<dynamic> jsonData = response.data['data'];
          List<Session> sessionData = jsonData.map((json) => Session.fromJson(json)).toList();
          return sessionData;
        } else{
          throw Exception('Failed to load session data');
        }
    } catch (e) {
      print(e);
      return [];
    }
}
