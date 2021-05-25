import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wazirx_alert_app/model/feeds.dart';

import '../constants.dart';

class FeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _launchInBrowser(String url) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: true,
          forceWebView: true,
        );
      } else {
        throw 'Could not launch $url';
      }
    }

    final data = Provider.of<Feed>(context);
    return InkWell(
      onTap: () => _launchInBrowser(data.link),
      child: Container(
        margin: EdgeInsets.all(
          defaultPadding / 2,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                data.description,
                fit: BoxFit.cover,
                cacheHeight: 300,
                cacheWidth: 500,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black87,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Text(
                data.title.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
