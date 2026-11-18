{{#addTemplateCode}}import "package:fpdart/fpdart.dart";

import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../data/models/params/{{name.snakeCase()}}_params.dart";
import "../entities/{{name.snakeCase()}}_entity.dart";{{/addTemplateCode}}

/// Data operations for the {{name.pascalCase()}} collection
abstract class {{name.pascalCase()}}Repository {

  {{#areCommentsOn}}/*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */{{/areCommentsOn}}

  {{#addTemplateCode}}Future<Either<Failure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}({
    required {{name.pascalCase()}}Params {{name.camelCase()}}Params,
  });{{/addTemplateCode}}
}
