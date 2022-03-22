# Simple State Management

A state management solution that is light weight, easy to use, and performant. Uses Flutter's [InheritedNotifier](https://api.flutter.dev/flutter/widgets/InheritedNotifier-class.html).

## Features

- Ridiculously easy to use.
- Light weight & performant.
- Lazily load data.

## Usage

Store state in a class that extends [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html), then create with `Provider`.

```dart
Provider(
    create: () => AppState(),
    child: ...
);
```

Data is lazily-loaded by default. To disable and load immediately when `Provider` is built, set `lazy` to `false`.

```dart
Provider(
    create: () => AppState(),
    lazy: false,
    child: ...
);
```

Access state via `BuildContext` wherever needed.

```dart
// DO rebuild widget when state changes.
context.watch<AppState>();

// DO NOT rebuild widget when state changes.
context.read<AppState>();
```
