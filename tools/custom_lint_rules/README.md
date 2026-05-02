# Custom Lint Rules

This package contains custom lint rules for the Fishbowl Flutter application.

## Rules

### `bloc_explicit_type`

**Severity:** ERROR (fails the build)

Ensures that all BLoC-related widgets have explicit type parameters:
- `BlocProvider`
- `BlocListener`
- `BlocBuilder`
- `BlocConsumer`
- `RepositoryProvider`

**Note:** `MultiBlocProvider` is **not** checked because it doesn't take type parameters. The types are specified on the individual `BlocProvider` instances in its `providers` list.

**Why this matters:**

Without explicit type parameters, the bloc/cubit won't be registered properly in the widget tree context. This causes `ProviderNotFoundError` at runtime, which is hard to debug and only appears during execution.

**Examples:**

```dart
// ❌ BAD - Will cause ProviderNotFoundError at runtime
BlocProvider(
  create: (context) => MyBloc(),
  child: MyWidget(),
)

// ✅ GOOD - Properly typed and will work correctly
BlocProvider<MyBloc>(
  create: (context) => MyBloc(),
  child: MyWidget(),
)

// ❌ BAD - Return type not explicit
BlocProvider getMyBlocProvider() {
  return BlocProvider(
    create: (context) => MyBloc(),
  );
}

// ✅ GOOD - Return type is explicit
BlocProvider<MyBloc> getMyBlocProvider() {
  return BlocProvider<MyBloc>(
    create: (context) => MyBloc(),
  );
}
```

## Setup

The custom lint rules are automatically activated via:
1. `analysis_options.yaml` - includes `custom_lint` plugin
2. `pubspec.yaml` - includes `custom_lint_rules` as a path dependency

## Running the Linter

**Important:** `flutter analyze` and `custom_lint` are **separate tools** that run independently. See [BLOC_TYPE_ENFORCEMENT.md](../../BLOC_TYPE_ENFORCEMENT.md) for more details on this distinction.

**Recommended:** Use the monorepo helper to run both analyzers together:
```bash
# Run both standard analyzer AND custom lint (recommended)
melos analyze:all

# Run strict mode analyzer AND custom lint
melos lint:all
```

**To run individually:**
```bash
# Run ONLY standard Flutter analyzer (does NOT run custom_lint)
fvm flutter analyze

# Run ONLY custom lint rules
fvm dart run custom_lint
```

## Development

To add new custom lint rules:
1. Create a new rule class in `lib/rules/`
2. Extend `DartLintRule`
3. Register it in `lib/custom_lint_rules.dart`
4. Run `fvm flutter pub get` in the root project
