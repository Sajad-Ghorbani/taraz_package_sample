enum LeadStatus {
  /// value is 0
  inProgress(0),

  /// value is 1
  success(1),

  /// value is 2
  fail(2);

  final int value;

  const LeadStatus(this.value);

  static LeadStatus fromJson(int value) => LeadStatus.values.firstWhere((element) => element.value == value);

  int toJson() => value;
}
