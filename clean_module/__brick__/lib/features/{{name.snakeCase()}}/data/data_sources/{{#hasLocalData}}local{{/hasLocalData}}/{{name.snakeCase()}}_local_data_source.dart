import "dart:convert";
import "package:shared_preferences/shared_preferences.dart";

{{#addTemplateCode}}import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../models/dtos/{{name.snakeCase()}}_model.dart";{{/addTemplateCode}}

/// Local data source for the {{name.pascalCase()}} collection
abstract class {{name.pascalCase()}}LocalDataSource {

  {{#areCommentsOn}}/*
  A local data source is responsible for abstracting the database layer from the data layer. 
  The data source's main functions are:
    Data Retrieval: It fetches data from the specified source. This could involve making a network request to an API, querying a database, or reading a file.
    Data Storage: It saves data back to the source. This could involve making a POST request to an API, executing an INSERT query on a database, or writing to a file.
    Data Conversion: It often converts the data into a format that the rest of the application can use. This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}Future<{{name.pascalCase()}}Model> getLast{{name.pascalCase()}}();
  Future<void> cache{{name.pascalCase()}}({required {{name.pascalCase()}}Model? {{name.camelCase()}}ToCache});{{/addTemplateCode}}

}

{{#addTemplateCode}}const _cached{{name.pascalCase()}} = "CACHED_{{name.constantCase()}}";{{/addTemplateCode}}

/// Local data source for the {{name.pascalCase()}} collection
class {{name.pascalCase()}}LocalDataSourceImpl implements {{name.pascalCase()}}LocalDataSource {
  /// Local data source for the {{name.pascalCase()}} collection
  {{name.pascalCase()}}LocalDataSourceImpl({required this.localSource});

  /// Shared preferences instance
  final SharedPreferences localSource;

  {{#areCommentsOn}}/*
  The local data source implementation is responsible for making the actual database requests. 
  It is responsible for converting the data into a format that the rest of the application can use. This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}@override
  Future<{{name.pascalCase()}}Model> getLast{{name.pascalCase()}}() {
    final jsonString = localSource.getString(_cached{{name.pascalCase()}});

    if (jsonString != null) {
      return Future.value({{name.pascalCase()}}Model.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cache{{name.pascalCase()}}({required {{name.pascalCase()}}Model? {{name.camelCase()}}ToCache}) async {
    if ({{name.camelCase()}}ToCache != null) {
      localSource.setString(
        _cached{{name.pascalCase()}},
        json.encode(
          {{name.camelCase()}}ToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }{{/addTemplateCode}}

}
