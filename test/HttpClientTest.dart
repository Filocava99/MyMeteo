import 'dart:collection';

import 'file:///C:/Users/filip/Desktop/Workspaces/AndroidStudio/my_meteo/lib/http/HttpClient.dart';
import 'package:test/test.dart';

void main(){
  test('GET test. Http response should be 200', () async{
    HttpClient client = HttpClient();
    var response = await client.get("https://google.it");
    expect(response.statusCode, 200);
  });

  test('POST test. Http response should be 200', () async{
    HttpClient client = HttpClient();
    var response = await client.post("https://reqbin.com/echo/post/json");
    expect(response.statusCode, 200);
  });

  test('Client GET test. Http response should be 200', () async{
    HttpClient client = HttpClient();
    client.open();
    var response = await client.get("https://google.it");
    client.close();
    expect(response.statusCode, 200);
  });

  test('Client POST test. Http response should be 200', () async{
    HttpClient client = HttpClient();
    client.open();
    var response = await client.post("https://reqbin.com/echo/post/json");
    client.close();
    expect(response.statusCode, 200);
  });
}