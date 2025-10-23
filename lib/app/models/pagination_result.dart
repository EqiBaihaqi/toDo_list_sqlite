class PaginationResult<T> {
  final List<T> data;
  final PaginationInfo pagination;

  PaginationResult({
    required this.data,
    required this.pagination,
  });
}

class PaginationInfo {
  PaginationInfo({
    this.page,
    this.limit,
    this.offset,
    this.totalRows,
    this.currentRowsCount,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });

  PaginationInfo.fromJson(dynamic json) {
    page = json['page'];
    limit = json['limit'];
    offset = json['offset'];
    totalRows = json['totalRows'];
    currentRowsCount = json['currentRowsCount'];
    totalPages = json['totalPages'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
  }

  num? page;
  num? limit;
  num? offset;
  num? totalRows;
  num? currentRowsCount;
  num? totalPages;
  dynamic nextPage;
  dynamic prevPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['limit'] = limit;
    map['offset'] = offset;
    map['totalRows'] = totalRows;
    map['currentRowsCount'] = currentRowsCount;
    map['totalPages'] = totalPages;
    map['nextPage'] = nextPage;
    map['prevPage'] = prevPage;
    return map;
  }
}
