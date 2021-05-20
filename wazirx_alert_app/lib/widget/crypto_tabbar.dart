import 'package:flutter/material.dart';

import '../constants.dart';
import './cryptocurrency_list.dart';

class CryptoTabbar extends StatelessWidget {
  const CryptoTabbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: TabBar(
              enableFeedback: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), // Creates border
                  color: primaryColor),
              tabs: [
                Tab(
                  text: 'INR',
                ),
                Tab(
                  text: 'USDT',
                ),
                Tab(
                  text: 'BTC',
                ),
                Tab(
                  text: 'WRX',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 18,
            child: TabBarView(
              children: [
                CryptocurrencyList('inr'),
                CryptocurrencyList('usdt'),
                CryptocurrencyList('btc'),
                CryptocurrencyList('wrx'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
