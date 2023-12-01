class Temp {
 final num? day;
 final num? night;

  const Temp({
    required this.day,
    required this.night,
  });

 Map<String, dynamic> toJson() {
    return {
      'day': day,
      'night': night,
    };
  }

  factory Temp.fromJson(Map<String, Object?> json) {
    return Temp(
      day: json['day'] as num,
      night: json['night'] as num,
    );
  }
}
