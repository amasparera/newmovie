class ProductionCompanies {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompanies(this.id, this.logoPath, this.name, this.originCountry);

  factory ProductionCompanies.fromJson(Map<String, dynamic> map) {
    return ProductionCompanies(
        map["id"], map["logo_path"], map["name"], map["origin_country"]);
  }
}
