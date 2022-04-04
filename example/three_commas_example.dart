import 'package:three_commas/three_commas.dart';

void main() async {
  final api = ThreeCommasApi(key: '', secret: '');

  /// Get last 20 active deals
  final activeDeals = await api.getDeals({'limit': 20, 'scope': 'active'});
  print(activeDeals);
}
