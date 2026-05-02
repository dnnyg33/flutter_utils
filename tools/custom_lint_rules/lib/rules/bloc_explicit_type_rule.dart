import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// A lint rule that ensures BlocProvider, BlocListener, BlocBuilder, and
/// BlocConsumer have explicit type parameters.
///
/// Without explicit types, these widgets won't register blocs properly
/// in the widget tree, causing ProviderNotFoundError at runtime.
class BlocExplicitTypeRule extends DartLintRule {
  const BlocExplicitTypeRule() : super(code: _code);

  static const _code = LintCode(
    name: 'bloc_explicit_type',
    problemMessage:
        '{0} must have an explicit type parameter. Without it, the bloc will not be registered properly and will cause a ProviderNotFoundError at runtime.',
    correctionMessage:
        'Add an explicit type parameter, e.g., {0}<MyBloc> or {0}<MyBloc, MyState>',
    errorSeverity: DiagnosticSeverity.ERROR,
  );

  static const _blocWidgetNames = {
    'BlocProvider',
    'BlocListener',
    'BlocBuilder',
    'BlocConsumer',
    'RepositoryProvider',
  };

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      final type = node.staticType;
      if (type == null) return;

      final className = type.element?.name;
      if (className == null || !_blocWidgetNames.contains(className)) return;

      // Check if type arguments are present
      final typeArguments = node.constructorName.type.typeArguments;
      if (typeArguments == null || typeArguments.arguments.isEmpty) {
        reporter.atNode(node.constructorName, _code, arguments: [className]);
      }
    });

    // Also check method return types that return BlocProvider
    context.registry.addMethodDeclaration((node) {
      final returnType = node.returnType;
      if (returnType is! NamedType) return;

      final typeName = returnType.name.lexeme;
      if (!_blocWidgetNames.contains(typeName)) return;

      // Check if return type has type arguments
      final typeArguments = returnType.typeArguments;
      if (typeArguments == null || typeArguments.arguments.isEmpty) {
        reporter.atNode(returnType, _code, arguments: [typeName]);
      }
    });

    // Check function return types
    context.registry.addFunctionDeclaration((node) {
      final returnType = node.returnType;
      if (returnType is! NamedType) return;

      final typeName = returnType.name.lexeme;
      if (!_blocWidgetNames.contains(typeName)) return;

      final typeArguments = returnType.typeArguments;
      if (typeArguments == null || typeArguments.arguments.isEmpty) {
        reporter.atNode(returnType, _code, arguments: [typeName]);
      }
    });
  }
}
