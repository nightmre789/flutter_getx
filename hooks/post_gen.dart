import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await cleanupFiles(context);
  await installDependencies(context);
  await moveFiles(context);
}

Future<void> cleanupFiles(HookContext context) async {
  final onFilesRemoved = context.logger.progress('removing .gitkeep files ...');

  await Directory('.')
      .list(recursive: true)
      .where((element) => element.toString().contains('.gitkeep'))
      .listen(
    (file) {
      file.delete();
    },
    onDone: () => onFilesRemoved.complete('.gitkeep files removed!'),
  );
}

Future<void> installDependencies(HookContext context) async {
  final onInstalledDependencies =
      context.logger.progress('installing dependencies ...');
  var result = await Process.run('flutter', ['pub', 'add', 'get'],
      workingDirectory: './{{name}}');
  if (result.exitCode == 0) {
    var pubspec = await File('./{{name}}/pubspec.yaml');
    var sink = pubspec.openWrite(mode: FileMode.append);
    sink.write('\tassets:\n\t\t- assets/icons/\n\t\t- assets/images/\n');
    sink.close();
    onInstalledDependencies.complete('dependencies installed!');
  } else
    context.logger.err(result.stderr);
}

Future<void> moveFiles(HookContext context) async {
  final onCopied =
      context.logger.progress('copying architecture into /lib/ ...');

  var mv1 = await Process.run('mv', [
    'components',
    'constants',
    'controllers',
    'data',
    'pages',
    'routes',
    'main.dart',
    './{{name}}/lib/',
  ]);
  if (mv1.exitCode == 0)
    onCopied.complete('successfully copied architecture into /lib/');
  else
    context.logger.err(
        "${mv1.stderr}\n Error: please ensure your shell supports mv command!");

  final onCopiedAssets =
      context.logger.progress('making assets folder in /{{name}}/ ...');

  var mv2 = await Process.run('mv', [
    'assets',
    './{{name}}/',
  ]);
  if (mv2.exitCode == 0)
    onCopiedAssets.complete('successfully made assets in /{{name}}/');
  else
    context.logger.err(mv1.stderr);
}
