import "package:auto_route/auto_route.dart";

/// App router.
@AutoRouterConfig(replaceInRouteName: "Page,Route")
class {{name.pascalCase()}}Router extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
      ];
}
