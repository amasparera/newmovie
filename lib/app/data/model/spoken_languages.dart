class SpokenLanggues {
  final String englishName;
  final String iso;
  final String name;

  SpokenLanggues(this.englishName, this.iso, this.name);

  factory SpokenLanggues.fromJson(Map<String, dynamic> map) {
    return SpokenLanggues(map["english_name"], map["iso_639_1"], map["name"]);
  }
}
