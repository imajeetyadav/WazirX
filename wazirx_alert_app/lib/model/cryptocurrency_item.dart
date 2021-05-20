import 'package:flutter/foundation.dart';

class CryptocurrencyItem with ChangeNotifier {
  String id;
  String baseUnit;
  String quoteUnit;
  String low;
  String high;
  String last;
  String type;
  double open;
  String volume;
  String sell;
  String buy;
  int at;
  String name;
  bool isSelected;

  CryptocurrencyItem({
    this.id,
    this.baseUnit,
    this.quoteUnit,
    this.low,
    this.high,
    this.last,
    this.type,
    this.open,
    this.volume,
    this.sell,
    this.buy,
    this.at,
    this.name,
    this.isSelected = false,
  });

  void toggleFavoriteStatus() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
