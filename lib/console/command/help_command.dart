part of commands;

class HelpCommand extends Command {
  HelpCommand(super.created);

  factory HelpCommand.create() {
    return HelpCommand(DateTime.now());
  }

  @override
  String get command => "help";

  @override
  Future<Map<String, String>> run() async {
    String value = "";
    for (int x = 0; x < allCommands.keys.length; x++) {
      String key = allCommands.keys.toList()[x];
      value += "\n$key";
      final command = allCommands[key];
      if (command != null) {
        command.runnableSubCommands.forEach(
          (element) {
            value += "\n  -- $element";
          },
        );
      }
    }
    return {
      "list": "Please choose one of the following commands:\n$value",
    };
  }
}
