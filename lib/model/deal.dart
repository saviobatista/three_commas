class Deal {
  Deal(
    this.id,
    this.type,
    this.botId,
    this.maxSafetyOrders,
    this.dealHasError,
    this.fromCurrencyId,
    this.toCurrencyId,
    this.accountId,
    this.activeSafetyOrdersCount,
    this.createdAt,
    this.updatedAt,
    this.finished,
    this.currentActiveSafetyOrdersCount,
    this.currentActiveSafetyOrders,
    this.completedSafetyOrdersCount,
    this.completedManualSafetyOrdersCount,
    this.cancellable,
    this.panicSellable,
    this.trailingEnabled,
    this.tslEnabled,
    this.stopLossTimeoutEnabled,
    this.stopLossTimeoutInSeconds,
    this.activeManualSafetyOrders,
    this.pair,
    this.status,
    this.localizedStatus,
    this.takeProfit,
    this.baseOrderVolume,
    this.safetyOrderVolume,
    this.safetyOrderStepPercentage,
    this.leverageType,
    this.boughtAmount,
    this.boughtVolume,
    this.boughtAveragePrice,
    this.baseOrderAveragePrice,
    this.soldAmount,
    this.soldVolume,
    this.soldAveragePrice,
    this.takeProfitType,
    this.finalProfit,
    this.martingaleCoefficient,
    this.martingaleVolumeCoefficient,
    this.martingaleStepCoefficient,
    this.stopLossPercentage,
    this.safetyOrderVolumeType,
    this.fromCurrency,
    this.toCurrency,
    this.currentPrice,
    this.takeProfitPrice,
    this.finalProfitPercentage,
    this.actualProfitPercentage,
    this.botName,
    this.accountName,
    this.usdFinalProfit,
    this.actualProfit,
    this.actualUsdProfit,
    this.reservedBaseCoin,
    this.reservedSecondCoin,
    this.trailingDeviation,
    this.strategy,
    this.reservedQuoteFunds,
    this.reservedBaseFunds,
    this.baseOrderVolumeType,
    this.profitCurrency,
    this.stopLossType,
  );
  int? id;
  String? type;
  int? botId;
  int? maxSafetyOrders;
  bool? dealHasError;
  int? fromCurrencyId;
  int? toCurrencyId;
  int? accountId;
  int? activeSafetyOrdersCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? finished;
  int? currentActiveSafetyOrdersCount;
  int? currentActiveSafetyOrders;
  int? completedSafetyOrdersCount;
  int? completedManualSafetyOrdersCount;
  bool? cancellable;
  bool? panicSellable;
  bool? trailingEnabled;
  bool? tslEnabled;
  bool? stopLossTimeoutEnabled;
  int? stopLossTimeoutInSeconds;
  int? activeManualSafetyOrders;
  String? pair;
  String? status;
  String? localizedStatus;
  double? takeProfit;
  double? baseOrderVolume;
  double? safetyOrderVolume;
  double? safetyOrderStepPercentage;
  String? leverageType;
  double? boughtAmount;
  double? boughtVolume;
  double? boughtAveragePrice;
  double? baseOrderAveragePrice;
  double? soldAmount;
  double? soldVolume;
  double? soldAveragePrice;
  String? takeProfitType;
  double? finalProfit;
  double? martingaleCoefficient;
  double? martingaleVolumeCoefficient;
  double? martingaleStepCoefficient;
  double? stopLossPercentage;
  String? profitCurrency;
  String? stopLossType;
  String? safetyOrderVolumeType;
  String? baseOrderVolumeType;
  String? fromCurrency;
  String? toCurrency;
  double? currentPrice;
  double? takeProfitPrice;
  double? finalProfitPercentage;
  double? actualProfitPercentage;
  String? botName;
  String? accountName;
  double? usdFinalProfit;
  double? actualProfit;
  double? actualUsdProfit;
  double? reservedBaseCoin;
  double? reservedSecondCoin;
  double? trailingDeviation;
  String? strategy;
  double? reservedQuoteFunds;
  double? reservedBaseFunds;

  Deal.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        botId = json['bot_id'],
        maxSafetyOrders = json['max_safety_orders'],
        dealHasError = json['deal_has_error'],
        fromCurrencyId = json['from_currency_id'],
        toCurrencyId = json['to_currency_id'],
        accountId = json['account_id'],
        activeSafetyOrdersCount = json['active_safety_orders_count'],
        createdAt = json['created_at'] ?? DateTime.parse(json['created_at']),
        updatedAt = json['updated_at'] ?? DateTime.parse(json['updated_at']),
        finished = json['finished'],
        currentActiveSafetyOrdersCount =
            json['current_active_safety_orders_count'],
        currentActiveSafetyOrders = json['current_active_safety_orders'],
        completedSafetyOrdersCount = json['completed_safety_orders_count'],
        completedManualSafetyOrdersCount =
            json['completed_manual_safety_orders_count'],
        cancellable = json['cancellable'],
        panicSellable = json['panic_sellable'],
        trailingEnabled = json['trailing_enabled'],
        tslEnabled = json['tsl_enabled'],
        stopLossTimeoutEnabled = json['stop_loss_timeout_enabled'],
        stopLossTimeoutInSeconds = json['stop_loss_timeout_in_seconds'],
        activeManualSafetyOrders = json['active_manual_safety_orders'],
        pair = json['pair'],
        status = json['status'],
        localizedStatus = json['localized_status'],
        takeProfit = json['take_profit'],
        baseOrderVolume = json['base_order_volume'],
        safetyOrderVolume = json['safety_order_volume'],
        safetyOrderStepPercentage = json['safety_order_step_percentage'],
        leverageType = json['leverage_type'],
        boughtAmount = json['bought_amount'],
        boughtVolume = json['bought_volume'],
        boughtAveragePrice = json['bought_average_price'],
        baseOrderAveragePrice = json['base_order_average_price'],
        soldAmount = json['sold_amount'],
        soldVolume = json['sold_volume'],
        soldAveragePrice = json['sold_average_price'],
        takeProfitType = json['take_profit_type'],
        finalProfit = json['final_profit'],
        martingaleCoefficient = json['martingale_coefficient'],
        martingaleVolumeCoefficient = json['martingale_volume_coefficient'],
        martingaleStepCoefficient = json['martingale_step_coefficient'],
        stopLossPercentage = json['stop_loss_percentage'],
        profitCurrency = json['profit_currency'],
        stopLossType = json['stop_loss_type'],
        safetyOrderVolumeType = json['safety_order_volume_type'],
        baseOrderVolumeType = json['base_order_volume_type'],
        fromCurrency = json['from_currency'],
        toCurrency = json['to_currency'],
        currentPrice = json['current_price'],
        takeProfitPrice = json['take_profit_price'],
        finalProfitPercentage = json['final_profit_percentage'],
        actualProfitPercentage = json['actual_profit_percentage'],
        botName = json['bot_name'],
        accountName = json['account_name'],
        usdFinalProfit = json['usd_final_profit'],
        actualProfit = json['actual_profit'],
        actualUsdProfit = json['actual_usd_profit'],
        reservedBaseCoin = json['reserved_base_coin'],
        reservedSecondCoin = json['reserved_second_coin'],
        trailingDeviation = json['trailing_deviation'],
        strategy = json['strategy'],
        reservedQuoteFunds = json['reserved_quote_funds'],
        reservedBaseFunds = json['reserved_base_funds'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'bot_id': botId,
        'max_safety_orders': maxSafetyOrders,
        'deal_has_error': dealHasError,
        'from_currency_id': fromCurrencyId,
        'to_currency_id': toCurrencyId,
        'account_id': accountId,
        'active_safety_orders_count': activeSafetyOrdersCount,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'finished': finished,
        'current_active_safety_orders_count': currentActiveSafetyOrdersCount,
        'current_active_safety_orders': currentActiveSafetyOrders,
        'completed_safety_orders_count': completedSafetyOrdersCount,
        'completed_manual_safety_orders_count':
            completedManualSafetyOrdersCount,
        'cancellable': cancellable,
        'panic_sellable': panicSellable,
        'trailing_enabled': trailingEnabled,
        'tsl_enabled': tslEnabled,
        'stop_loss_timeout_enabled': stopLossTimeoutEnabled,
        'stop_loss_timeout_in_seconds': stopLossTimeoutInSeconds,
        'active_manual_safety_orders': activeManualSafetyOrders,
        'pair': pair,
        'status': status,
        'localized_status': localizedStatus,
        'take_profit': takeProfit,
        'base_order_volume': baseOrderVolume,
        'safety_order_volume': safetyOrderVolume,
        'safety_order_step_percentage': safetyOrderStepPercentage,
        'leverage_type': leverageType,
        'bought_amount': boughtAmount,
        'bought_volume': boughtVolume,
        'bought_average_price': boughtAveragePrice,
        'base_order_average_price': baseOrderAveragePrice,
        'sold_amount': soldAmount,
        'sold_volume': soldVolume,
        'sold_average_price': soldAveragePrice,
        'take_profit_type': takeProfitType,
        'final_profit': finalProfit,
        'martingale_coefficient': martingaleCoefficient,
        'martingale_volume_coefficient': martingaleVolumeCoefficient,
        'martingale_step_coefficient': martingaleStepCoefficient,
        'stop_loss_percentage': stopLossPercentage,
        'profit_currency': profitCurrency,
        'stop_loss_type': stopLossType,
        'safety_order_volume_type': safetyOrderVolumeType,
        'base_order_volume_type': baseOrderVolumeType,
        'from_currency': fromCurrency,
        'to_currency': toCurrency,
        'current_price': currentPrice,
        'take_profit_price': takeProfitPrice,
        'final_profit_percentage': finalProfitPercentage,
        'actual_profit_percentage': actualProfitPercentage,
        'bot_name': botName,
        'account_name': accountName,
        'usd_final_profit': usdFinalProfit,
        'actual_profit': actualProfit,
        'actual_usd_profit': actualUsdProfit,
        'reserved_base_coin': reservedBaseCoin,
        'reserved_second_coin': reservedSecondCoin,
        'trailing_deviation': trailingDeviation,
        'strategy': strategy,
        'reserved_quote_funds': reservedQuoteFunds,
        'reserved_base_funds': reservedBaseFunds,
      };
}
