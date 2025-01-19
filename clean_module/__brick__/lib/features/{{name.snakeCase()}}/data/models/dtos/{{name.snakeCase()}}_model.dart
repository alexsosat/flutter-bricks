import "dart:convert";

import "../../../business/entities/{{name.snakeCase()}}_entity.dart";

/// Model that transforms the {{name.pascalCase()}} data from the API to the
/// application entity
class {{name.pascalCase()}}Model extends {{name.pascalCase()}}Entity {
  /// Model that transforms the {{name.pascalCase()}} data from the API to the
  /// application entity
  const {{name.pascalCase()}}Model();

  {{#areCommentsOn}}/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  /// Factory method to create a Home model instance from a JSON
  factory {{name.pascalCase()}}Model.fromJson({required String json}) => {{name.pascalCase()}}Model.fromMap(map: jsonDecode(json));

  /// Factory method to create a {{name.pascalCase()}} model instance from a map
  factory {{name.pascalCase()}}Model.fromMap({required Map<String, dynamic> map}) =>
     const {{name.pascalCase()}}Model();

  /// Factory method to create a {{name.pascalCase()}} model instance from an 
  /// entity
  factory {{name.pascalCase()}}Model.fromEntity({required {{name.pascalCase()}}Entity entity}) => {{name.pascalCase()}}Model();

  /// Converts the {{name.pascalCase()}} model instance to a map
  Map<String, dynamic> toMap() => {};

  /// Converts the Home model instance to a JSON
  String toJson() => jsonEncode(toMap());
  
  /// Converts the {{name.pascalCase()}} model instance to an entity
  {{name.pascalCase()}}Entity toEntity() => {{name.pascalCase()}}Entity();
}
