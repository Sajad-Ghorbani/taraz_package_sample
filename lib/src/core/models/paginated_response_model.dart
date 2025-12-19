class PaginatedResponse<T> {
  final int totalItemsCount;
  final int pageSize;
  final int totalPagesCount;
  final int pageIndex;
  final bool next;
  final bool previous;
  final List<T> items;

  const PaginatedResponse({
    required this.totalItemsCount,
    required this.pageSize,
    required this.totalPagesCount,
    required this.pageIndex,
    required this.next,
    required this.previous,
    required this.items,
  });

  factory PaginatedResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic> json) fromJsonT) {
    return PaginatedResponse<T>(
      totalItemsCount: json['totalItemsCount'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalPagesCount: json['totalPagesCount'] ?? 0,
      pageIndex: json['pageIndex'] ?? 0,
      next: json['next'] ?? false,
      previous: json['previous'] ?? false,
      items: (json['items'] as List<dynamic>? ?? []).map((e) => fromJsonT(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T item) toJsonT) {
    return {
      'totalItemsCount': totalItemsCount,
      'pageSize': pageSize,
      'totalPagesCount': totalPagesCount,
      'pageIndex': pageIndex,
      'next': next,
      'previous': previous,
      'items': items.map(toJsonT).toList(),
    };
  }

  PaginatedResponse<T> copyWith({int? totalItemsCount, int? pageSize, int? totalPagesCount, int? pageIndex, bool? next, bool? previous, List<T>? items}) {
    return PaginatedResponse<T>(
      totalItemsCount: totalItemsCount ?? this.totalItemsCount,
      pageSize: pageSize ?? this.pageSize,
      totalPagesCount: totalPagesCount ?? this.totalPagesCount,
      pageIndex: pageIndex ?? this.pageIndex,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      items: items ?? this.items,
    );
  }
}
