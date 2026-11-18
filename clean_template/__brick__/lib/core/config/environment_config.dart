import "package:flutter_common_classes/flutter_common_classes.dart";

/// A class that provides the environment configuration for the application.
///
/// This class is used to set the environment variables for the application.
class {{name.pascalCase()}}Environment {
  static const valueKey = "valueKey";

  static const Map<String, dynamic> variables = {valueKey: "value"};
}

/// Example of an app-specific flavor enum implementing [AppFlavor].
/// Each consuming app defines its own set of values like this one.
enum {{name.pascalCase()}}Flavor implements AppFlavor {
  production(variables: {{name.pascalCase()}}Environment.variables),
  

  const {{name.pascalCase()}}Flavor({required this.variables});
}
