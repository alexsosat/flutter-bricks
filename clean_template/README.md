# Clean Template

The clean_template mason brick provides the core structure for creating a new app based on the principles of Clean Architecture. 

This template helps in organizing your codebase into distinct layers, promoting separation of concerns and maintainability. It includes core configurations and essential libraries to get you started quickly with a clean and scalable architecture.

Key features:

- Pre-configured project structure following Clean Architecture principles.
- Core libraries and configurations included.
Sample feature to demonstrate best practices.
- Supports for different environments
- Supports multiple state management solutions.

Ideal for developers looking to start a new project with a robust and maintainable architecture.

For creating the features for the application following this pipeline use the [clean_module][1] brick

## Generates
```
__brick__/
├── lib/
|   ├── core/
|   |   ├── adapters/
|   |   |   └── dio_adapter.dart
|   |   ├── config/
|   |   |   ├── dependenct_injection.dart
|   |   |   └── environment_config.dart  
|   |   ├── constants/
|   |   |   ├── classes/
|   |   |   |   ├── params.dart
|   |   |   |   └── use_case.dart
|   |   |   └── theme/
|   |   |       ├── matherial_theme.dart
|   |   |       └── util.dart
|   |   ├── cubit_states/
|   |   |   └── state_mixin.dart
|   |   ├── errors/
|   |   |   ├── connection/
|   |   |   |   ├── client_error_exception.dart
|   |   |   |   ├── connection_error_exception.dart
|   |   |   |   ├── http_call_exception.dart
|   |   |   |   └── server_error_exception.dart
|   |   |   ├── app_exception.dart
|   |   |   ├── error_handler.dart
|   |   |   └── failure.dart
|   |   ├── extensions/
|   |   |   ├── color_extension.dart
|   |   |   ├── num_extension.dart
|   |   |   └── theme_extension.dart
|   |   ├── routes/
|   |   |   ├── app_router.dart
|   |   |   └── names.dart
|   |   ├── services/
|   |   |   └── connection/
|   |   |       └── network_info.dart
|   |   └── widgets
|   |       └── cubit_state_mixin_builder.dart
|   ├── {{name.snakeCase()}}_app.dart
|   └── main.dart
├── test/
|   └── widget_test.dart
├── analysis_options.yaml
└── pubspec.yaml
```

## Usage

To generate the template of the app using this brick execute the following command:

```sh
mason make clean_template --name <app-name>
```

Replace <app-name> with the name of your app

## Packages

This brick installs the following packages from pub.dev

Dependencies
- [auto_route][2]: ^9.2.0
- [dio][3]: ^5.5.0+1
- [equatable][4]: ^2.0.5
- [flutter_bloc][5]: ^8.1.6
- [flutter_flavor][6]: ^3.1.3
- [flutter_pretty_dio_logger][7]: ^3.0.0
- [fpdart][8]: ^1.1.0
- [google_fonts][9]: ^6.2.1
- [internet_connection_checker_plus][10]: ^2.5.1
- [shared_preferences][11]: ^2.3.1

Dev Dependencies
- [build_runner][12]: ^2.4.11
- [auto_route_generator][13]: ^9.0.0
- [flutter_lints][14]: ^4.0.0
  
## TODOS
- [ ] Add state managers helpers
    - [X] Cubit/Bloc
    - [ ]  Provider
    - [ ]  Riverpod
    - [ ]  GetX
- [ ] Add Spacers constant class
- [ ] Run build runner on post hook 

[1]: https://brickhub.dev/bricks/clean_module
[2]: https://pub.dev/packages/auto_route
[3]: https://pub.dev/packages/dio
[4]: https://pub.dev/packages/equatable
[5]: https://pub.dev/packages/flutter_bloc
[6]: https://pub.dev/packages/flutter_flavor
[7]: https://pub.dev/packages/flutter_pretty_dio_logger
[8]: https://pub.dev/packages/fpdart
[9]: https://pub.dev/packages/google_fonts
[10]: https://pub.dev/packages/internet_connection_checker_plus
[11]: https://pub.dev/packages/shared_preferences
[12]: https://pub.dev/packages/build_runner
[13]: https://pub.dev/packages/auto_route_generator
[14]: https://pub.dev/packages/flutter_lints
