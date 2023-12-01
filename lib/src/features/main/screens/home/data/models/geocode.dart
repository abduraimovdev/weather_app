class GeoCode {
  final String? name;
  final double? lat;
  final double? lon;
  final String? country;
  final String? state;

  const GeoCode({
    this.name,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
      'state': state,
    };
  }

  factory GeoCode.fromJson(Map<String, Object?> json) {
    return GeoCode(
      name: json['name'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      country: json['country'] as String,
      state: json['state'] == null ? "" : json['state'] as String,
    );
  }
}
