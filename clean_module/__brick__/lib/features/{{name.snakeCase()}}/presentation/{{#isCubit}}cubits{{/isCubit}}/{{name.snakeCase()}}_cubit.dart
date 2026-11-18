import "package:flutter_common_classes/flutter_common_classes.dart";
import "package:get_it/get_it.dart";

import "../../business/entities/{{name.snakeCase()}}_entity.dart";

{{#addTemplateCode}}
import "../../business/repositories/{{name.snakeCase()}}_repository.dart";
import "../../business/use_cases/get_{{name.snakeCase()}}.dart";
import "../../data/models/params/{{name.snakeCase()}}_params.dart";
{{/addTemplateCode}}

/// Cubit to retrieve the archived accounts.
class {{name.pascalCase()}}Cubit extends AutoLoaderCubit<{{name.pascalCase()}}Entity> {
  /// Constructor.
  {{name.pascalCase()}}Cubit();

  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> callUseCase() 
  {{^addTemplateCode}}
  {
    // TODO: Implementar lógica
    throw UnimplementedError();
  }
  {{/addTemplateCode}}
  {{#addTemplateCode}}=> Get{{name.pascalCase()}}(
        {{name.camelCase()}}Repository: GetIt.I.get<{{name.pascalCase()}}Repository>(),
      ).call(
        params: const Get{{name.pascalCase()}}Params(),
      );{{/addTemplateCode}}
}
