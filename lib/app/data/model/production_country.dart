class ProductionCountry {
  final String iso;
  final String name;

  ProductionCountry(this.iso, this.name);

  factory ProductionCountry.fromJson(Map<String, dynamic> map) {
    return ProductionCountry(map["iso_3166_1"], map["name"]);
  }
}
