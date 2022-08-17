import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await cleanupFiles(context);

  await installDependencies(context);
  await updatePubspec(context);

  context.logger.success('Successfully created {{name}}!');
  context.logger.info('Run the following commands to get started: ');
  context.logger.info('  cd {{name}}');
  context.logger.info('  flutter run');
}

Future<void> cleanupFiles(HookContext context) async {
  final progress = context.logger.progress('Cleaning up directory ...');
  await Directory('./{{name}}/')
      .list(recursive: true)
      .where((element) => element.toString().contains('.gitkeep'))
      .listen((file) {
    file.delete();
  });
  progress.complete('Removed .gitkeep files');
}

installDependencies(HookContext context) async {
  final progress = context.logger.progress('Installing dependencies ...');
  await Process.run(
    'flutter',
    ['pub', 'add', 'get'],
    workingDirectory: './{{name}}',
    runInShell: true,
  );
  progress.complete('Installed dependencies');
}

updatePubspec(HookContext context) async {
  final progress = context.logger.progress('Updating pubspec ...');
  var pubspec = await File('./{{name}}/pubspec.yaml');
  var sink = pubspec.openWrite(mode: FileMode.append);
  sink.write('  assets:\n    - assets/icons/\n    - assets/images/\n');
  await sink.close();
  progress.complete('Updated pubspec');
}
