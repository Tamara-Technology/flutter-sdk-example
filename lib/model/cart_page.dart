class CartPage {
  String? script;
  String? url;

  CartPage({this.script, this.url});

  CartPage.fromJson(Map<String, dynamic> json) {
    script = json['script'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['script'] = script;
    data['url'] = url;
    return data;
  }

  @override
  String toString() {
    return 'CartPage{script: $script, url: $url}';
  }
}
