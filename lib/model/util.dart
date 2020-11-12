import 'dart:convert';
import 'dart:developer' as developer;

T validate<T>(T obj, String name, String scope) {
  if (obj == null) {
    final message = '## Parse error: Missing $name';
    developer.log(message, name: scope, error: jsonEncode(obj));
    throw Exception('$message in $scope');
  } else
    return obj;
}
