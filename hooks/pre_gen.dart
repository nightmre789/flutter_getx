import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('generating base flutter app');
  try {
    await _generateApp(context);
    progress.complete('successfully generated base flutter app');
  } catch (e) {
    context.logger
        .err('generation failed! please ensure flutter cli is working');
  }
}

Future<ProcessResult> _generateApp(HookContext context) async {
  var app_description = context.vars['description'];
  var name_org = context.vars['org'];
  return Process.run('flutter', [
    'create',
    '{{name}}',
    '--description',
    '$app_description',
    '--org',
    '$name_org'
  ]);
}
