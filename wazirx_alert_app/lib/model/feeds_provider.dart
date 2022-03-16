import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

import 'feeds.dart';

class FeedsProvider with ChangeNotifier {
  List<Feed> _items = [];
  List<Feed> get items {
    return _items.toList();
  }

  Future<void> fetchRSS() async {
    final url = Uri.parse('https://cointelegraph.com/rss');

    try {
      final response = await http.get(url);
      final _feed = RssFeed.parse(response.body);
      // print(_feed.title);
      List<Feed> loadedData = [];
      _feed.items.forEach((element) {
        // print(element.title);
        loadedData.add(Feed(
          title: element.title,
          description: element.enclosure.url,
          link: element.link,
          pubDate: element.pubDate.toString(),
        ));
      });

      _items = loadedData.cast<Feed>();

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
