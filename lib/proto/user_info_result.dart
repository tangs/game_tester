class UserInfoResult {
  int? accountId;
  String? nickname;
  int? avatarId;
  String? email;
  String? phone;
  int? channelId;
  double? totalRecharge;
  double? totalRefund;
  double? money;
  double? moneySafe;
  double? moneyGift;
  double? moneyGiftSafe;
  double? amountOfWashCode;
  int? vipLevel;
  int? moneyExchangeCoin;
  int? unreadMail;

  UserInfoResult(
      {this.accountId,
      this.nickname,
      this.avatarId,
      this.email,
      this.phone,
      this.channelId,
      this.totalRecharge,
      this.totalRefund,
      this.money,
      this.moneySafe,
      this.moneyGift,
      this.moneyGiftSafe,
      this.amountOfWashCode,
      this.vipLevel,
      this.moneyExchangeCoin,
      this.unreadMail});

  UserInfoResult.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    nickname = json['nickname'];
    avatarId = json['avatar_id'];
    email = json['email'];
    phone = json['phone'];
    channelId = json['channel_id'];
    totalRecharge = json['total_recharge'];
    totalRefund = json['total_refund'];
    money = json['money'];
    moneySafe = json['money_safe'];
    moneyGift = json['money_gift'];
    moneyGiftSafe = json['money_gift_safe'];
    amountOfWashCode = json['amount_of_wash_code'];
    vipLevel = json['vip_level'];
    moneyExchangeCoin = json['money_exchange_coin'];
    unreadMail = json['unread_mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['nickname'] = nickname;
    data['avatar_id'] = avatarId;
    data['email'] = email;
    data['phone'] = phone;
    data['channel_id'] = channelId;
    data['total_recharge'] = totalRecharge;
    data['total_refund'] = totalRefund;
    data['money'] = money;
    data['money_safe'] = moneySafe;
    data['money_gift'] = moneyGift;
    data['money_gift_safe'] = moneyGiftSafe;
    data['amount_of_wash_code'] = amountOfWashCode;
    data['vip_level'] = vipLevel;
    data['money_exchange_coin'] = moneyExchangeCoin;
    data['unread_mail'] = unreadMail;
    return data;
  }
}
