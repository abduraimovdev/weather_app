extension DateTimeConverter on int? {

  DateTime? get fromJson {
    return this != null
        ? DateTime.fromMillisecondsSinceEpoch(this! * 1000).toLocal()
        : null;
  }

  toJson(DateTime? data) {
    return (data?.toUtc().millisecondsSinceEpoch ?? 0) ~/ 1000;
  }
}
