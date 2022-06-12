part of console;

class ConsoleManager {
  ///Instance.
  static final ConsoleManager instance = ConsoleManager._internal();
  factory ConsoleManager() => instance;

  ConsoleManager._internal() {
    runCommand("welcome");
    runCommand("help");
  }

  /// Commands controller. Receive the commands from input.
  final _commandsController = StreamController<List<Command>>();

  /// Transform input raw text to command.
  Stream<List<Command>> get commands => _commandsController.stream;

  /// Command history.
  final List<Command> commandHistory = [];

  /// Invoke command if passed.
  void runCommand(String rawCommand) {
    ///Split sub commands.
    List<String> splittedCommands = rawCommand.split('--');

    /// Get base command.
    var baseCommand = splittedCommands.first;

    /// Remove base command.
    splittedCommands.removeAt(0);

    /// Validate command.
    final command = validateCommand(
      baseCommand.replaceAll(" ", ""),
      subCommands: splittedCommands,
    );

    _addCommand(command);
  }

  /// Add command to stream.
  void _addCommand(Command command) {
    commandHistory.add(command);
    _commandsController.add(commandHistory);
  }

  void clear() {
    commandHistory.clear();
    _commandsController.add(commandHistory);
    _addCommand(WelcomeCommand(DateTime.now()));
  }

  /// Validate command by input text.
  Command validateCommand(String command, {List<String>? subCommands}) {
    switch (command) {
      case "welcome":
        return WelcomeCommand.create();
      case "contact":
        return ContactCommand.create(
          subCommands,
        );
      case "help":
        return HelpCommand.create();
      case "clear":
        return ClearCommand.create();
      case "stacks":
        return StackCommand.create();

      default:
        return NotFoundCommand.create();
    }
  }
}
