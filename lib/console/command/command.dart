part of commands;

@immutable
abstract class Command {
  const Command(
    this.created, {
    this.runnableSubCommands = const [],
  });

  String get command;

  /// When invoked.
  final DateTime created;

  Command? findSubCommand(String command) => null;

  /// Runnable sub commands.
  final List<String> runnableSubCommands;

  /// Run method.
  Future<Map<String, String>> run();

  //Run sub commands.
  Future<Map<String, String>> runSubCommands() async {
    Map<String, String> value = {};

    for (int x = 0; x < runnableSubCommands.length; x++) {
      final subCommand = findSubCommand(runnableSubCommands[x]);
      if (subCommand != null) {
        final data = await subCommand.run();
        value.addAll(data);
      }
    }
    return value;
  }
}
