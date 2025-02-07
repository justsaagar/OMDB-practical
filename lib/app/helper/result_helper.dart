class ResultHelper {
  static T? firstListItem<T>(dynamic result) {
    if (result['Value'] is List<dynamic>) {
      return result['Value'].first;
    }
    return null;
  }

  static List<T> listItem<T>(dynamic result) {
    if (result is List<dynamic>) {
      return List<T>.from(result.map((item) => item as T));
    } else if (result['Value'] is List<dynamic>) {
      return result['Value'];
    }
    return [];
  }

  static T? resultVal<T>(dynamic result) {
    return result['Value'];
  }

  static List<T> mapList<T>(dynamic result, T Function(Map<String, dynamic>) mapper) {
    return result["Value"].map<T>((e) => mapper(e as Map<String, dynamic>)).toList();
  }

  static T? resultErrorVal<T>(dynamic result) {
    return result['Errors'];
  }

}
