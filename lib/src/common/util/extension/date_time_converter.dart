extension DateTimeConverter on int? {

  @override
  DateTime? get fromJson {
    return this != null
        ? DateTime.fromMillisecondsSinceEpoch(this! * 1000).toLocal()
        : null;
  }

  @override
  toJson(DateTime? data) {
    return (data?.toUtc().millisecondsSinceEpoch ?? 0) ~/ 1000;
  }
}
