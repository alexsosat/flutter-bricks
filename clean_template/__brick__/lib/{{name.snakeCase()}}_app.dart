import "package:flutter/material.dart";
import "package:flutter_flavor/flutter_flavor.dart";

import "core/constants/theme/material_theme.dart";
import "core/constants/theme/util.dart";
import "core/routes/{{name.snakeCase()}}_router.dart";

final _appRouter = AppRouter();   

/// [{{name.pascalCase()}}App] is the entry point of the application.
class {{name.pascalCase()}}App extends StatelessWidget {
  /// [{{name.pascalCase()}}App] is the entry point of the application.
  const {{name.pascalCase()}}App({super.key});

  @override
  Widget build(BuildContext context) =>
     FlavorBanner(
      child: MaterialApp.router(
        title: "{{name.pascalCase()}}",
        debugShowCheckedModeBanner: false,

        //Theming  
        themeMode: ThemeMode.system,
            theme: MaterialTheme(createTextTheme(context, "Poppins", "Poppins"),)
                .light(),
            darkTheme:
                MaterialTheme(createTextTheme(context, "Poppins", "Poppins"),)
                    .dark(),


        routerConfig: _appRouter.config(),
      ),
    );
}
