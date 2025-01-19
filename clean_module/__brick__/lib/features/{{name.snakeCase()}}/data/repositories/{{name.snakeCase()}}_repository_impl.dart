{{#addTemplateCode}}import "package:fpdart/fpdart.dart";{{/addTemplateCode}}

{{#hasRemoteData}}{{#hasLocalData}}import "../../../../core/services/connection/network_info.dart";{{/hasLocalData}}{{/hasRemoteData}}
{{#addTemplateCode}}import "../../../../core/errors/error_handler.dart";
import "../../../../core/errors/failure.dart";{{/addTemplateCode}}


import "../../business/repositories/{{name.snakeCase()}}_repository.dart";
{{#hasLocalData}}import "../data_sources/local/{{name.snakeCase()}}_local_data_source.dart";{{/hasLocalData}}
{{#hasRemoteData}}import "../data_sources/remote/{{name.snakeCase()}}_remote_data_source.dart";{{/hasRemoteData}}
{{#addTemplateCode}}import "../models/dtos/{{name.snakeCase()}}_model.dart";
import "../models/params/{{name.snakeCase()}}_params.dart";{{/addTemplateCode}}

/// Data operations for the {{name.pascalCase()}} collection
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  /// Data operations for the {{name.pascalCase()}} collection
  {{name.pascalCase()}}RepositoryImpl({
    {{#hasRemoteData}}required this.remoteDataSource,{{/hasRemoteData}}
    {{#hasLocalData}}required this.localDataSource,{{/hasLocalData}}
    {{#hasRemoteData}}{{#hasLocalData}}required this.networkInfo,{{/hasLocalData}}{{/hasRemoteData}}
  });
  
{{#hasRemoteData}}final {{name.pascalCase()}}RemoteDataSource remoteDataSource;{{/hasRemoteData}}
{{#hasLocalData}}final {{name.pascalCase()}}LocalDataSource localDataSource;{{/hasLocalData}}
{{#hasRemoteData}}{{#hasLocalData}}final NetworkInfo networkInfo;{{/hasLocalData}}{{/hasRemoteData}}

  {{#areCommentsOn}}/*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}@override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}(
      {required {{name.pascalCase()}}Params {{name.camelCase()}}Params}) async {

    {{#hasRemoteData}}if (await networkInfo.isConnected) {
      return ErrorHandler.handleApiCall<{{name.pascalCase()}}Entity>(
        () {
          return remoteDataSource.get{{name.pascalCase()}}({{name.camelCase()}}Params: {{name.camelCase()}}Params);
        },
      );
    } else {
      {{#hasLocalData}}return ErrorHandler.handleCacheCall<{{name.pascalCase()}}Model>(
        () {
          return localDataSource.getLast{{name.pascalCase()}}();
        },
      );{{/hasLocalData}}
    }{{/hasRemoteData}}{{^hasRemoteData}}
    {{#hasLocalData}}return ErrorHandler.handleCacheCall<{{name.pascalCase()}}Model>(
        () {
          return localDataSource.getLast{{name.pascalCase()}}();
        },
      );{{/hasLocalData}}{{/hasRemoteData}}
  }{{/addTemplateCode}}
}
