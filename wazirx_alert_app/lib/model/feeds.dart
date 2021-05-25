import 'package:flutter/foundation.dart';

class Feed with ChangeNotifier {
  String title;
  String pubDate;
  String description;
  String link;
  // String media;

  Feed({
    @required this.title,
    @required this.pubDate,
    @required this.description,
    @required this.link,
  });
}
