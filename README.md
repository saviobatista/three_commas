Dart wrapper for [Official 3commas API](https://github.com/3commas-io/3commas-official-api-docs/)

[3commas.io](https://3commas.io/?c=saviobatista) is collection of smart tools for cryptocurrency traders and investors to minimize risks, limit losses, grow profits, and manage their trades and portfolios across multiple exchanges.


Buy me a beer 🍺
```
BTC: 1JtJMVQLeaLn3wQwQL8VjqSijJ1i4ugjoo
ETH: 0xa83141ee143be0b814f7a92c865a4e79de9ea781
```

## Features

Current methods

### for deals

```dart
 getDeals (params)
 dealUpdateMaxSafetyOrders (deal_id, max_safety_orders)
 dealPanicSell (deal_id)
 dealCancel (deal_id)
 dealUpdateTp (deal_id, new_take_profit_percentage)
 getDeal (deal_id)
 getDealSafetyOrders (deal_id)
```

### for bots

```
  getBotsBlackList ()
  botsUpdateBlackList (params)
  botCreate (params)
  getBots (params)
  getBotsStats (params)
  botUpdate (params)
  botDisable (bot_id)
  botEnable (bot_id)
  botStartNewDeal (params)
  botDelete (bot_id)
  botPaniceSellAllDeals (bot_id)
  botCancelAllDeals (bot_id)
  botShow (bot_id)
```

### for smart trades

```
  smartTradesCreateSimpleSell (params)
  smartTradesCreateSimpleBuy (params)
  smartTradesCreateSmartSell (params)
  smartTradesCreateSmartCover (params)
  smartTradesCreateSmartTrade (params)
  smartTrades ()
  smartTradesStepPanicSell (params)
  smartTradesUpdate (params)
  smartTradesCancel (smart_trade_id)
  smartTradesPanicSell (smart_trade_id)
  smartTradesForceProcess (smart_trade_id)
```

### for accounts

```
  accountsNew (params)
  accounts ()
  accountsMarketList ()
  accountsCurrencyRates ()
  accountSellAllToUsd (account_id)
  accountSellAllToBtc (account_id)
  accountLoadBalances (account_id)
  accountRename (params)
  accountPieChartData (account_id)
  accountTableData (account_id)
  accountRemove (account_id)
```

---

## Getting started

Before you use, is needed to create a API secret and key as described at [3commas documentation](https://help.3commas.io/en/articles/5599671-3commas-api-creating-an-api-key-for-development)

## Usage

### Example

The code bellow shows how to list last 20 active deals

```dart
import 'package:three_commas/three_commas.dart';
void main() async {
  final api = ThreeCommasApi(key: '', secret: '');

  final activeDeals = await api.getDeals({'limit': 20, 'scope': 'active'});

  print(activeDeals);
}

```


## Credits

This package was based on NodeJS module from [rentorm](https://github.com/rentorm/3commas-api-node)