# {{feature_name.titleCase()}} Analytics

This folder contains analytics tracking for the {{feature_name.titleCase()}} feature.

## Files

- `{{feature_name.snakeCase()}}_analytics_bloc.dart` - Main analytics BLoC
- `{{feature_name.snakeCase()}}_analytics_event.dart` - Analytics events
- `{{feature_name.snakeCase()}}_analytics_state.dart` - Analytics state
- `{{feature_name.snakeCase()}}_analytics_events.dart` - Feature-specific predefined events

## Usage

### 1. Register the BLoC

Add the analytics BLoC to your feature's BLoC providers:

```dart
MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => {{feature_name.pascalCase()}}AnalyticsBloc(),
    ),
    // ... other BLoCs
  ],
  child: {{feature_name.pascalCase()}}Page(),
)
```

### 2. Track Screen Views

Track when a screen is viewed:

```dart
class {{feature_name.pascalCase()}}Page extends StatefulWidget {
  @override
  void initState() {
    super.initState();

    // Track screen view
    context.read<{{feature_name.pascalCase()}}AnalyticsBloc>().add(
      {{feature_name.pascalCase()}}AnalyticsEvent.logScreenView(
        screenName: '{{feature_name.pascalCase()}}',
        parameters: {
          'source': 'navigation',
        },
      ),
    );
  }
}
```

### 3. Track Custom Events

Use predefined events from `{{feature_name.snakeCase()}}_analytics_events.dart`:

```dart
// Feature viewed
context.read<{{feature_name.pascalCase()}}AnalyticsBloc>().add(
  {{feature_name.pascalCase()}}AnalyticsEvent.logEvent(
    event: {{feature_name.pascalCase()}}ViewedEvent(),
  ),
);

// Feature action
context.read<{{feature_name.pascalCase()}}AnalyticsBloc>().add(
  {{feature_name.pascalCase()}}AnalyticsEvent.logEvent(
    event: {{feature_name.pascalCase()}}ActionEvent(
      actionType: 'submit',
      additionalParams: {'item_count': 5},
    ),
  ),
);

// Feature completed
context.read<{{feature_name.pascalCase()}}AnalyticsBloc>().add(
  {{feature_name.pascalCase()}}AnalyticsEvent.logEvent(
    event: {{feature_name.pascalCase()}}CompletedEvent(
      duration: Duration(seconds: 30),
    ),
  ),
);
```

### 4. Record Errors

Track errors that occur in the feature:

```dart
try {
  // risky operation
  await someOperation();
} catch (e, stackTrace) {
  // Record to crashlytics
  context.read<{{feature_name.pascalCase()}}AnalyticsBloc>().add(
    {{feature_name.pascalCase()}}AnalyticsEvent.recordError(
      exception: e,
      stackTrace: stackTrace,
      reason: 'Failed to perform operation',
      fatal: false,
    ),
  );

  // Also track as analytics event
  context.read<{{feature_name.pascalCase()}}AnalyticsBloc>().add(
    {{feature_name.pascalCase()}}AnalyticsEvent.logEvent(
      event: {{feature_name.pascalCase()}}ErrorEvent(
        errorType: 'operation_failed',
        errorMessage: e.toString(),
      ),
    ),
  );
}
```

### 5. Set User Context

Add feature-specific context to crash reports:

```dart
context.read<{{feature_name.pascalCase()}}AnalyticsBloc>().add(
  {{feature_name.pascalCase()}}AnalyticsEvent.setUserContext(
    context: {
      'current_screen': '{{feature_name.snakeCase()}}_details',
      'feature_state': 'active',
      // Add any relevant feature-specific context
    },
  ),
);
```

### 6. Integration with Feature BLoC

Track analytics in your main feature BLoC:

```dart
class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  final {{feature_name.pascalCase()}}AnalyticsBloc _analyticsBloc;

  {{feature_name.pascalCase()}}Bloc(this._analyticsBloc) : super({{feature_name.pascalCase()}}Initial()) {
    on<LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) async {
    final stopwatch = Stopwatch()..start();

    try {
      // Load data...
      final data = await repository.loadData();

      stopwatch.stop();

      // Track successful load
      _analyticsBloc.add(
        {{feature_name.pascalCase()}}AnalyticsEvent.logEvent(
          event: AnalyticsEvent(
            name: '{{feature_name.snakeCase()}}_data_loaded',
            parameters: {
              'duration_ms': stopwatch.elapsedMilliseconds,
              'item_count': data.length,
            },
          ),
        ),
      );

      emit({{feature_name.pascalCase()}}Loaded(data));
    } catch (e, stack) {
      stopwatch.stop();

      // Record error
      _analyticsBloc.add(
        {{feature_name.pascalCase()}}AnalyticsEvent.recordError(
          exception: e,
          stackTrace: stack,
          reason: 'Failed to load {{feature_name.snakeCase()}} data',
        ),
      );

      emit({{feature_name.pascalCase()}}Error(e.toString()));
    }
  }
}
```

## Adding New Events

To add new feature-specific events, edit `{{feature_name.snakeCase()}}_analytics_events.dart`:

```dart
class MyCustomEvent extends AnalyticsEvent {
  MyCustomEvent({
    required String customParam,
    Map<String, dynamic>? additionalParams,
  }) : super(
        name: '{{feature_name.snakeCase()}}_my_custom_event',
        parameters: {
          'custom_param': customParam,
          ...?additionalParams,
        },
      );
}
```

## Best Practices

1. **Be Specific**: Use descriptive event names that clearly indicate what happened
2. **Include Context**: Add relevant parameters to help analyze the data
3. **Don't Track PII**: Never include personal information in analytics
4. **Track Errors**: Always record errors with context for debugging
5. **Set Context Early**: Set user context as soon as relevant data is available
6. **Measure Performance**: Track duration for important operations

## Testing

Mock the analytics BLoC in tests:

```dart
class MockAnalyticsBloc extends MockBloc<{{feature_name.pascalCase()}}AnalyticsEvent, {{feature_name.pascalCase()}}AnalyticsState>
    implements {{feature_name.pascalCase()}}AnalyticsBloc {}

void main() {
  late MockAnalyticsBloc mockAnalyticsBloc;

  setUp(() {
    mockAnalyticsBloc = MockAnalyticsBloc();
  });

  test('tracks analytics event', () {
    // Your test...

    verify(() => mockAnalyticsBloc.add(any())).called(1);
  });
}
```
