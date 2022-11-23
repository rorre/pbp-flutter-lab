import 'package:counter_7/model/watchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<WatchList>> fetchWatchList() async {
  var url = Uri.parse('https://pbp22t2.herokuapp.com/mywatchlist/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<WatchList> watchLists = [];
  for (var d in data) {
    if (d != null) {
      watchLists.add(WatchList.fromJson(d));
    }
  }

  return watchLists;
}
