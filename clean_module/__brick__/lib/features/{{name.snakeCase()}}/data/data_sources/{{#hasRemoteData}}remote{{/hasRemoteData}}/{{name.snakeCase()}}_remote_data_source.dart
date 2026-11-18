import "package:dio/dio.dart";
{{#addTemplateCode}}import "../../models/params/{{name.snakeCase()}}_params.dart";
import "../../models/dtos/{{name.snakeCase()}}_model.dart";{{/addTemplateCode}}

/// Remote data source for the {{name.pascalCase()}} collection
abstract class {{name.pascalCase()}}RemoteDataSource {

  {{#areCommentsOn}}/*
  A remote data source is responsible for abstracting the API layer from the data layer. 
  The data source's main functions are:
    Data Retrieval: It fetches data from the specified source. This could involve making a network request to an API, querying a database, or reading a file.
    Data Storage: It saves data back to the source. This could involve making a POST request to an API, executing an INSERT query on a database, or writing to a file.
    Data Conversion: It often converts the data into a format that the rest of the application can use. This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}({
    required {{name.pascalCase()}}Params {{name.camelCase()}}Params,
  });{{/addTemplateCode}}
  
}

/// Remote data source for the {{name.pascalCase()}} collection
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  /// Remote data source for the {{name.pascalCase()}} collection
 {{name.pascalCase()}}RemoteDataSourceImpl({required this.dio});

  /// Dio adapter instance
  final Dio dio;

  {{#areCommentsOn}}/*
  The remote data source implementation is responsible for making the actual API requests. 
  It is responsible for converting the data into a format that the rest of the application can use. This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}@override
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}({
    required {{name.pascalCase()}}Params {{name.camelCase()}}Params,
  }) async {
    final response = await dio.get(
      "YOUR_API_URL_HERE",
      queryParameters: {
        "api_key": "if needed",
      },
    );

   return {{name.pascalCase()}}Model.fromJson(json: response.data);
   
  }{{/addTemplateCode}}
 
}
