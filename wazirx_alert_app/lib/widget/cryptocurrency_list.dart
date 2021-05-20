import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './cryptocurrency_list_item.dart';
import '../model/cryptocurrency.dart';

class CryptocurrencyList extends StatelessWidget {
  final quoteUnit;
  CryptocurrencyList(this.quoteUnit);

  @override
  Widget build(BuildContext context) {
    final cryptoData =
        Provider.of<Cryptocurrency>(context).findByQuoteUnit(quoteUnit);
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: ListView.builder(
        itemCount: cryptoData.length,
        itemBuilder: (_, i) => ChangeNotifierProvider.value(
          value: cryptoData[i],
          child: CryptocurrencyListItem(),
        ),
      ),
    );
  }
}
