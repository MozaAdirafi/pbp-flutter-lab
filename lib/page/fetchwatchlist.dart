import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:http/http.dart' as http;

List<MyWatchListModel> listMyWatchListTotal = [];

Future<List<MyWatchListModel>> fetchMyWatchList() async {
  var url =
      Uri.parse('https://weeklyassignment02.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
  );
  
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<MyWatchListModel> listMyWatchList = [];
  for (var d in data) {
    if (d != null) {
      listMyWatchList.add(MyWatchListModel.fromJson(d));
      listMyWatchListTotal.add(MyWatchListModel.fromJson(d));
    }
  }
  return listMyWatchList;
}