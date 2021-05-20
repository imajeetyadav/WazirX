import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../model/cryptocurrency.dart';
import '../widget/crypto_tabbar.dart';
import '../widget/header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Cryptocurrency>(context).fetchTicker().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            // Default flex is  1
            // and it takes 1/6 part of screen
            child: Row(
              children: [
                const Header(
                  headerText: 'WazirX Alert',
                ),
                Spacer(),
                Text(
                  Provider.of<Cryptocurrency>(context).lastUpdate.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.refresh_sharp),
                  onPressed: () {
                    Provider.of<Cryptocurrency>(context, listen: false)
                        .fetchTicker();
                  },
                )
              ],
            ),
          ),
          Expanded(
            flex: 12, // It takes 5/9 part of  Screen
            child: CryptoTabbar(),
          ),
        ],
      ),
    );
  }
}
