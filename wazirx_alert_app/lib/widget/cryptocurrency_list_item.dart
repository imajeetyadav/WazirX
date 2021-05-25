import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../model/cryptocurrency_item.dart';

class CryptocurrencyListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CryptocurrencyItem>(context);
    bool _isHigh = data.open < double.parse(data.buy);
    var inr = data.quoteUnit == 'inr' ? "₹" : "";

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: defaultPadding / 4,
        horizontal: defaultPadding / 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Row(
        children: [
          Text(
            data.baseUnit.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            '/${data.quoteUnit.toUpperCase()}',
            style: TextStyle(fontSize: 13, color: Colors.white54),
          ),
          Spacer(),
          Text(
            '${inr + data.buy}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _isHigh ? Colors.green : Colors.red,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: _isHigh ? Colors.green : Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: _isHigh
                ? Icon(Icons.arrow_upward_sharp)
                : Icon(Icons.arrow_downward_sharp),
          )
        ],
      ),
    );
  }
}
