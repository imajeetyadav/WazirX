import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wazirx_alert_app/model/feeds.dart';
import 'package:wazirx_alert_app/model/feeds_provider.dart';
import 'package:wazirx_alert_app/widget/feed_item.dart';
import '../widget/header.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _refreshFeed() async {
      Provider.of<FeedsProvider>(context, listen: false).fetchRSS();
    }

    List<Feed> _feed = Provider.of<FeedsProvider>(context).items;
    return Container(
      child: Column(
        children: [
          Expanded(
            child: const Header(
              headerText: 'Feeds',
            ),
          ),
          Expanded(
            flex: 12,
            child: RefreshIndicator(
              onRefresh: _refreshFeed,
              child: ListView.builder(
                itemCount: _feed.length,
                itemBuilder: (_, i) => ChangeNotifierProvider.value(
                  value: _feed[i],
                  child: FeedItem(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
