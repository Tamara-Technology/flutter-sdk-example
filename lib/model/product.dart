class Product {
  String? script;
  String? url;

  Product({this.script, this.url});

  Product.fromJson(Map<String, dynamic> json) {
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
    return 'Product{script: $script, url: $url}';
  }
}
