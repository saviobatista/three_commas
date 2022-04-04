/// Support for doing something awesome.
///
/// More dartdocs go here.
library three_commas;

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class ThreeCommasException implements Exception {
  final String message;
  ThreeCommasException(this.message);
}

class ThreeCommasApi {
  final String key;
  final String secret;
  final String base = 'https://api.3commas.io';

  ThreeCommasApi({required this.key, required this.secret})
      : assert(key != ''),
        assert(secret != '');

  /// Generate signature for request
  /// used for authenticated requests as defined at
  /// https://github.com/3commas-io/3commas-official-api-docs#signed--endpoint-security
  String generateSignature(String requestUri, String requestData) {
    final key = utf8.encode(secret);
    final bytes = utf8.encode(requestUri + requestData);

    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  Future<dynamic> makeRequest(
      String method, String path, Map<String, dynamic>? params) async {
    /// Parameters as query string as described on API docs
    final querystring = Uri(
        queryParameters: params?.map(
      (key, value) => MapEntry(key, value?.toString()),
    )).query;

    /// Generate signature for request
    final sig = generateSignature(path, querystring);
    try {
      final uri = Uri.parse('$base$path$querystring');
      final headers = {'APIKEY': key, 'Signature': sig, 'Forced-Mode': 'real'};
      http.Response response;
      switch (method) {
        case 'GET':
          response = await http.get(uri, headers: headers);
          break;
        case 'POST':
          response = await http.post(uri, headers: headers);
          break;
        case 'PATCH':
          response = await http.patch(uri, headers: headers);
          break;
        default:
          throw ThreeCommasException('Invalid method');
      }
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        final data = json.decode(response.body);
        throw ThreeCommasException('Error type: ${data.error}\n'
            'Error message: ${data.error_description}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> ping() async {
    return await makeRequest('GET', '/public/api/ver1/ping', null);
  }

  Future<dynamic> getDeals(
    Map<String, dynamic>? params,
  ) async =>
      await makeRequest(
        'GET',
        '/public/api/ver1/deals?',
        params,
      );

  Future<dynamic> dealUpdateMaxSafetyOrders(
    int dealId,
    int maxSafetyOrders,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/deals/$dealId/max_safety_orders?',
        {'deal_id': dealId, 'max_safety_orders': maxSafetyOrders},
      );
  Future<dynamic> dealPanicSell(
    int dealId,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/deals/$dealId/panic_sell?',
        {'deal_id': dealId},
      );

  Future<dynamic> dealCancel(
    int dealId,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/deals/$dealId/cancel?',
        {'deal_id': dealId},
      );

  Future<dynamic> dealUpdateTp(
    int dealId,
    double tp,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/deals/$dealId/update_tp?',
        {'deal_id': dealId, 'new_take_profit_percentage': tp},
      );
  Future<dynamic> getDeal(
    int dealId,
  ) async =>
      await makeRequest(
        'GET',
        '/public/api/ver1/deals/$dealId/show?',
        {'deal_id': dealId},
      );
  Future<dynamic> dealAddFunds(
    Map<String, dynamic>? params,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/deals/${params?['deal_id']}/add_funds?',
        params,
      );

  /// BOTS METHODS

  Future<dynamic> getBotsBlackList() async => await makeRequest(
        'GET',
        '/public/api/ver1/bots/pairs_black_list?',
        null,
      );
  Future<dynamic> botsUpdateBlackList(
    Map<String, dynamic>? params,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/bots/update_pairs_black_list?',
        params,
      );
  Future<dynamic> botCreate(
    Map<String, dynamic>? params,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/bots/create_bot?',
        params,
      );
  Future<dynamic> getBots(
    Map<String, dynamic>? params,
  ) async =>
      await makeRequest(
        'GET',
        '/public/api/ver1/bots?',
        params,
      );
  Future<dynamic> getBotsStats(
    Map<String, dynamic>? params,
  ) async =>
      await makeRequest(
        'GET',
        '/public/api/ver1/bots/stats?',
        params,
      );
  Future<dynamic> botUpdate(
    Map<String, dynamic>? params,
  ) async =>
      await makeRequest('PATCH',
          '/public/api/ver1/bots/${params?['bot_id']}/update?', params);
  Future<dynamic> botDisable(
    int botId,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/bots/$botId/disable?',
        {'bot_id': botId},
      );
  Future<dynamic> botEnable(
    int botId,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/bots/$botId/enable?',
        {'bot_id': botId},
      );
  Future<dynamic> botStartNewDeal(
    Map<String, dynamic>? params,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/bots/${params?['bot_id']}/start_new_deal?',
        params,
      );
  Future<dynamic> botDelete(
    int botId,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/bots/$botId/delete?',
        {'bot_id': botId},
      );
  Future<dynamic> botPanicSellAllDeals(
    int botId,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/bots/$botId/panic_sell_all_deals?',
        {'bot_id': botId},
      );
  Future<dynamic> botCancelAllDeals(
    int botId,
  ) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/bots/$botId/cancel_all_deals?',
        {'bot_id': botId},
      );
  Future<dynamic> botShow(
    int botId,
  ) async =>
      await makeRequest(
        'GET',
        '/public/api/ver1/bots/$botId/show?',
        {'bot_id': botId},
      );

  ///
  /// SMART TRADES METHODS
  ///

  Future<dynamic> smartTradesCreateSimpleSell(
          Map<String, dynamic>? params) async =>
      await makeRequest(
        'POST',
        '/public/api/ver1/smart_trades/create_simple_sell?',
        params,
      );
  Future<dynamic> smartTradesCreateSimpleBuy(
          Map<String, dynamic>? params) async =>
      await makeRequest(
          'POST', '/public/api/ver1/smart_trades/create_simple_buy?', params);
  Future<dynamic> smartTradesCreateSmartSell(
          Map<String, dynamic>? params) async =>
      await makeRequest(
          'POST', '/public/api/ver1/smart_trades/create_smart_sell?', params);
  Future<dynamic> smartTradesCreateSmartCover(
          Map<String, dynamic>? params) async =>
      await makeRequest(
          'POST', '/public/api/ver1/smart_trades/create_smart_cover?', params);
  Future<dynamic> smartTradesCreateSmartTrade(
          Map<String, dynamic>? params) async =>
      await makeRequest(
          'POST', '/public/api/ver1/smart_trades/create_smart_trade?', params);
  Future<dynamic> smartTrades(Map<String, dynamic>? params) async =>
      await makeRequest('GET', '/public/api/ver1/smart_trades?', params);
  Future<dynamic> smartTradesV2(Map<String, dynamic>? params) async =>
      await makeRequest('GET', '/public/api/v2/smart_trades?', params);
  Future<dynamic> smartTradesStepPanicSell(
          Map<String, dynamic>? params) async =>
      await makeRequest(
          'POST',
          '/public/api/ver1/smart_trades/${params?['smart_trade_id']}/step_panic_sell?',
          params);
  Future<dynamic> smartTradesUpdate(Map<String, dynamic>? params) async =>
      await makeRequest(
          'PATCH',
          '/public/api/ver1/smart_trades/${params?['smart_trade_id']}/update?',
          params);
  Future<dynamic> smartTradesCancel(int smartTradeId) async =>
      await makeRequest(
          'POST',
          '/public/api/ver1/smart_trades/$smartTradeId/cancel?',
          {'smart_trade_id': smartTradeId});
  Future<dynamic> smartTradesPanicSell(int smartTradeId) async =>
      await makeRequest(
          'POST',
          '/public/api/ver1/smart_trades/$smartTradeId/panic_sell?',
          {'smart_trade_id': smartTradeId});
  Future<dynamic> smartTradesForceProcess(int smartTradeId) async =>
      await makeRequest(
          'POST',
          '/public/api/ver1/smart_trades/$smartTradeId/force_process?',
          {'smart_trade_id': smartTradeId});

  ///
  /// ACCOUNTS METHODS
  ///

  Future<dynamic> accountsNew(Map<String, dynamic>? params) async =>
      await makeRequest('POST', '/public/api/ver1/accounts/new?', params);
  Future<dynamic> accounts() async =>
      await makeRequest('GET', '/public/api/ver1/accounts?', null);

  Future<dynamic> accountsMarketList() async =>
      await makeRequest('GET', '/public/api/ver1/accounts/market_list?', null);
  Future<dynamic> accountsCurrencyRates() async => await makeRequest(
      'GET', '/public/api/ver1/accounts/currency_rates?', null);
  Future<dynamic> accountsSellAllToUsd(int accountId) async =>
      await makeRequest(
          'POST',
          '/public/api/ver1/accounts/$accountId/sell_all_to_usd?',
          {'account_id': accountId});
  Future<dynamic> accountsSellAllToBtc(int accountId) async =>
      await makeRequest(
          'POST',
          '/public/api/ver1/accounts/$accountId/sell_all_to_btc?',
          {'account_id': accountId});
  Future<dynamic> accountLoadBalances(int accountId) async => await makeRequest(
      'GET',
      '/public/api/ver1/accounts/$accountId/load_balances?',
      {'account_id': accountId});
  Future<dynamic> accountRename(Map<String, dynamic>? params) async =>
      await makeRequest('POST',
          '/public/api/ver1/accounts/${params?['account_id']}/rename?', params);
  Future<dynamic> accountPieChartData(int accountId) async => await makeRequest(
      'POST',
      '/public/api/ver1/accounts/$accountId/pie_chart_data?',
      {'account_id': accountId});
  Future<dynamic> accountTableData(int accountId) async => await makeRequest(
      'POST',
      '/public/api/ver1/accounts/$accountId/table_data?',
      {'account_id': accountId});
  Future<dynamic> accountRemove(int accountId) async => await makeRequest(
      'POST',
      '/public/api/ver1/accounts/$accountId/remove?',
      {'account_id': accountId});
}
