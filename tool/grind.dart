import 'dart:io';

import 'package:cli_pkg/cli_pkg.dart' as pkg;
import 'package:grinder/grinder.dart';

const _packageName = 'dart_github_workflow';
const owner = 'andikadeveloper';
const repo = 'dart-github-workflow';

void main(List<String> args) {
  pkg.name.value = _packageName;
  pkg.humanName.value = _packageName;
  pkg.githubUser.value = owner;
  pkg.githubRepo.value = '$owner/$repo';
  pkg.githubBearerToken.value = Platform.environment['GITHUB_TOKEN'];
  pkg.githubReleaseNotes.fn = () => File('CHANGELOG.md').readAsStringSync();

  pkg.addGithubTasks();

  grind(args);
}

@Task('Compile')
void compile() {
  run(
    'dart',
    arguments: ['compile', 'exe', 'bin/$_packageName.dart', '-o', _packageName],
  );
}
