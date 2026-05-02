import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'rules/bloc_explicit_type_rule.dart';
import 'rules/context_method_naming_rule.dart';

PluginBase createPlugin() => _CustomLintRules();

class _CustomLintRules extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        BlocExplicitTypeRule(),
        ContextMethodNamingRule(),
      ];
}
