import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import './cryptocurrency_item.dart';

class Cryptocurrency with ChangeNotifier {
  List<CryptocurrencyItem> _items = [];
  String _lastUpdate = 'Last Update';

  List<CryptocurrencyItem> get items {
    return _items.toList();
  }

  List<CryptocurrencyItem> findByQuoteUnit(String quoteUnit) {
    return _items.where((element) => element.quoteUnit == quoteUnit).toList();
  }

  get lastUpdate {
    print(_lastUpdate);
    return _lastUpdate;
  }

  Future<void> fetchTicker() async {
    final url = Uri.parse('https://api.wazirx.com/api/v2/tickers/');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<CryptocurrencyItem> loadedData = [];
      extractedData.forEach(
        (cryptoId, cryptoData) {
          loadedData.add(
            CryptocurrencyItem(
              id: cryptoId,
              baseUnit: cryptoData['base_unit'],
              quoteUnit: cryptoData['quote_unit'],
              low: cryptoData['low'],
              high: cryptoData['high'],
              last: cryptoData['last'],
              type: cryptoData['type'],
              open: double.parse(cryptoData['open'].toString()),
              volume: cryptoData['volume'],
              sell: cryptoData['sell'],
              buy: cryptoData['buy'],
              at: int.parse(cryptoData['at'].toString()),
              name: cryptoData['name'],
            ),
          );
        },
      );
      _items = loadedData.cast<CryptocurrencyItem>();
      _lastUpdate = DateFormat('HH:mm:ss').format(DateTime.now()).toString();
      notifyListeners();
    } catch (error) {
      throw (error);
    } finally {
      Future.delayed(Duration(seconds: 10), () {
        fetchTicker();
      });
    }
  }
}
