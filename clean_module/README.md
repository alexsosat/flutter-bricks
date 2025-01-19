# Clean Module

This mason brick generates a feature structure following the principles of Clean Architecture. It helps in organizing your codebase into distinct layers, promoting separation of concerns and maintainability.

> [!IMPORTANT] 
>  This brick makes use of the [clean_template][1] feature for most of its functionality, it is recommended to execute this brick before using this one

## Generates
```
__brick__/
└── lib/
    └── features/
        └── {{name.snakeCase()}}/
            ├── business/
            │   ├── entities/
            │   │   └── {{name.snakeCase()}}_entity.dart
            │   ├── repositories/
            │   |   └── {{name.snakeCase()}}_repository.dart
            |   └── use_cases/
            |       └── get_{{name.snakeCase()}}.dart     
            ├── data/
            │   ├── datasources/
            |   |   ├── {{#hasLocalData}}local{{/hasLocalData}}/
            │   │   |    └── {{name.snakeCase()}}_local_data_source.dart
            |   |   └── {{#hasRemoteData}}remote{{/hasRemoteData}}/
            |   |        └── {{name.snakeCase()}}_remote_data_source.dart
            │   ├── models/
            │   │   ├── dtos/
            |   |   |   └── {{name.snakeCase()}}_model.dart
            |   |   └── params/
            |   |       └── {{name.snakeCase()}}_params.dart
            │   └── repositories/
            │       └── {{name.snakeCase()}}_repository_impl.dart
            └── presentation/
                ├── pages/
                │   └── {{name.snakeCase()}}_page.dart
                ├── {{#isRiverpod}}providers{{/isRiverpod}}/
                |   ├── {{name.snakeCase()}}_provider.dart    
                │   └── provider.dart
                ├── {{#isBloc}}blocs{{/isBloc}}/
                |   ├── {{name.snakeCase()}}_event.dart
                |   ├── {{name.snakeCase()}}_state.dart
                |   ├── {{name.snakeCase()}}_bloc.dart
                |   └── bloc.dart
                ├── {{#isCubit}}cubits{{/isCubit}}/
                |   └── {{name.snakeCase()}}_cubit.dart
                ├── {{#isGetX}}getX{{/isGetX}}/
                |   ├── {{name.snakeCase()}}_binding.dart
                |   └── {{name.snakeCase()}}_controller.dart
                └── {{#isProvider}}providers{{/isProvider}}/
                    └── {{name.snakeCase()}}_provider.dart   
```

## Usage

To generate a new feature using this brick, run the following command:

```sh
mason make clean_module --name <feature_name> --hasLocalData true --hasRemoteData true --state_management cubit --areCommentsOn true --addTemplateCode true
```

Replace `<feature_name>` with the desired name of your feature. 

Use the `--hasLocalData` and `--hasRemoteData` flags to include local and remote data sources, respectively.

Use the `--state_management` flag to choose the state manager of your choice:
Options:
1) cubit (default)
2) provider
3) bloc
4) riverpod
5) getx

Use the `--areCommentsOn` flag to include descriptive use comments in each class

Use the `--addTemplateCode` flag to include example code functions in each class

## TODOS
- [ ] Add feature page to router
- [ ] Adds template codes to state managements
  - [X] Cubit
  - [ ] Bloc
  - [ ] Riverpod
  - [ ] GetX
  - [ ] Provider

[1]: https://brickhub.dev/bricks/clean_template