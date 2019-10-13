import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;

/// model with the match title, description and percentage from server
class MatchModel {
  String title;
  int matchPercent;
  String description;
  MatchModel({this.title, this.matchPercent, this.description});

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return new MatchModel(
        title: json['title'],
        matchPercent: json['matchPercent'],
        description: json['description']);
  }
}

/// getting the match title, text and percentage from server
Future<List<MatchModel>> fetchPost(String _idMale, String _idFemale) async {
  /// http URL for making get requests to the server
  String _httpGetMatchText =
      'https://my-json-server.typicode.com/mitrich248/match-app-json/matchData';
  //'https://signs/match?male=$_idMale&female=$_idFemale';
  final response = await http.get(_httpGetMatchText);
  List responseJson = json.decode(response.body);

  /// if ok then save data in the model fields
  if (response.statusCode == 200) {
    return responseJson.map((m) => MatchModel.fromJson(m)).toList();
  }

  /// if not ok then raise the error
  else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(_httpGetMatchText));
  }
}
