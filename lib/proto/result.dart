class Result {
  String? func;
  dynamic context;

  Result({this.func, this.context});

  Result.fromJson(Map<String, dynamic> json) {
    func = json['func'];
    context = json['context'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['func'] = func;
    if (context != null) {
      data['context'] = context!.toJson();
    }
    return data;
  }
}
