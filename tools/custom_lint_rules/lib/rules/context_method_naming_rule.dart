import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// A lint rule that enforces naming conventions for methods that use
/// context.select() or context.read().
///
/// Methods using context.select() should be prefixed with 'select'
/// Methods using context.read() should be prefixed with 'read'
class ContextMethodNamingRule extends DartLintRule {
  const ContextMethodNamingRule() : super(code: _code);

  static const _code = LintCode(
    name: 'context_method_naming',
    problemMessage:
        'Method {0} uses context.{1}() but name should start with "{1}"',
    correctionMessage:
        'Rename the method to start with "{1}", e.g., {1}{2}',
    errorSeverity: DiagnosticSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addMethodDeclaration((node) {
      // Only check methods with BuildContext parameter
      if (!_hasContextParameter(node)) return;

      final methodName = node.name.lexeme;

      // Skip common patterns that shouldn't be renamed:
      // - Private methods (start with _)
      // - Event handlers (start with on)
      // - build methods (required by Flutter)
      if (methodName.startsWith('_') ||
          methodName.startsWith('on') ||
          methodName == 'build') {
        return;
      }

      final usage = _findContextCalls(node);

      // Check for context.select() return
      if (usage.returnsSelect &&
          !methodName.startsWith('select') &&
          !methodName.startsWith('get')) {
        final suggestedName = _capitalizeName(methodName);
        reporter.atToken(
          node.name,
          _code,
          arguments: [methodName, 'select', suggestedName],
        );
      }

      // Check for context.read() return
      if (usage.returnsRead &&
          !methodName.startsWith('read') &&
          !methodName.startsWith('get')) {
        final suggestedName = _capitalizeName(methodName);
        reporter.atToken(
          node.name,
          _code,
          arguments: [methodName, 'read', suggestedName],
        );
      }
    });

    // Also check top-level functions
    context.registry.addFunctionDeclaration((node) {
      // Only check functions with BuildContext parameter
      if (!_hasContextParameterInFunction(node)) return;

      final functionName = node.name.lexeme;

      // Skip common patterns (private functions, event handlers)
      if (functionName.startsWith('_') || functionName.startsWith('on')) {
        return;
      }

      final usage = _findContextCallsInFunction(node);

      // Check for context.select() return
      if (usage.returnsSelect &&
          !functionName.startsWith('select') &&
          !functionName.startsWith('get')) {
        final suggestedName = _capitalizeName(functionName);
        reporter.atToken(
          node.name,
          _code,
          arguments: [functionName, 'select', suggestedName],
        );
      }

      // Check for context.read() return
      if (usage.returnsRead &&
          !functionName.startsWith('read') &&
          !functionName.startsWith('get')) {
        final suggestedName = _capitalizeName(functionName);
        reporter.atToken(
          node.name,
          _code,
          arguments: [functionName, 'read', suggestedName],
        );
      }
    });
  }

  bool _hasContextParameter(MethodDeclaration node) {
    final params = node.parameters?.parameters;
    if (params == null) return false;

    return params.any((param) {
      if (param is SimpleFormalParameter) {
        final type = param.type;
        if (type is NamedType) {
          return type.name.lexeme == 'BuildContext';
        }
      }
      return false;
    });
  }

  bool _hasContextParameterInFunction(FunctionDeclaration node) {
    final params = node.functionExpression.parameters?.parameters;
    if (params == null) return false;

    return params.any((param) {
      if (param is SimpleFormalParameter) {
        final type = param.type;
        if (type is NamedType) {
          return type.name.lexeme == 'BuildContext';
        }
      }
      return false;
    });
  }

  _ContextUsage _findContextCalls(MethodDeclaration node) {
    final visitor = _ContextCallVisitor();
    visitor.analyzeMethod(node);
    return visitor.usage;
  }

  _ContextUsage _findContextCallsInFunction(FunctionDeclaration node) {
    final visitor = _ContextCallVisitor();
    visitor.analyzeFunction(node);
    return visitor.usage;
  }

  String _capitalizeName(String name) {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1);
  }
}

class _ContextUsage {
  bool returnsSelect = false;
  bool returnsRead = false;
}

class _ContextCallVisitor extends RecursiveAstVisitor<void> {
  final usage = _ContextUsage();
  bool _inReturnStatement = false;
  bool _isExpressionBody = false;

  void analyzeMethod(MethodDeclaration node) {
    // Check if this is an expression body method (=>)
    final body = node.body;
    if (body is ExpressionFunctionBody) {
      _isExpressionBody = true;
      body.expression.accept(this);
    } else if (body is BlockFunctionBody) {
      body.block.accept(this);
    }
  }

  void analyzeFunction(FunctionDeclaration node) {
    // Check if this is an expression body function (=>)
    final body = node.functionExpression.body;
    if (body is ExpressionFunctionBody) {
      _isExpressionBody = true;
      body.expression.accept(this);
    } else if (body is BlockFunctionBody) {
      body.block.accept(this);
    }
  }

  @override
  void visitReturnStatement(ReturnStatement node) {
    _inReturnStatement = true;
    super.visitReturnStatement(node);
    _inReturnStatement = false;
  }

  @override
  void visitMethodInvocation(MethodInvocation node) {
    // Only flag if this context call is in a return statement or expression body
    if (_inReturnStatement || _isExpressionBody) {
      final target = node.target;
      if (target is SimpleIdentifier && target.name == 'context') {
        final methodName = node.methodName.name;
        if (methodName == 'select') {
          usage.returnsSelect = true;
        } else if (methodName == 'read') {
          usage.returnsRead = true;
        }
      }
    }
    super.visitMethodInvocation(node);
  }
}
