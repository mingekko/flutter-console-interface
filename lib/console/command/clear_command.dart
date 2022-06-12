part of commands;

class ClearCommand extends Command {
  ClearCommand(super.created);

  factory ClearCommand.create() {
    return ClearCommand(DateTime.now());
  }

  @override
  String get command => "clear";

  @override
  Future<Map<String, String>> run([List<String>? runnableSubCommands]) async {
    ConsoleManager.instance.clear();
    return {"": ""};
  }
}
