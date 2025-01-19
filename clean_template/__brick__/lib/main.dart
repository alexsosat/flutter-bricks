import "package:flutter/material.dart";

import "core/config/dependency_injection.dart";
import "core/config/environment_config.dart";
import "{{name.snakeCase()}}_app.dart";

void main() async {
  EnvironmentConfig.init(
    flavor: Flavor.production,
  );

  await DependencyInjection.init();

  runApp(const {{name.pascalCase()}}App());
}
