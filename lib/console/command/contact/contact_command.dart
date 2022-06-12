part of contact_commands;

class ContactCommand extends Command {
  ContactCommand(
    super.created, {
    super.runnableSubCommands,
  });

  factory ContactCommand.create(List<String>? subCommands) {
    return ContactCommand(
      DateTime.now(),
      runnableSubCommands: subCommands ?? [],
    );
  }

  static List<String> allCommands = [
    "info",
    "social",
  ];
  @override
  String get command => "contact";

  @override
  Future<Map<String, String>> run() async {
    Map<String, String> data = {};
    bool hasSubCommands = runnableSubCommands.isNotEmpty;

    /// You can separate and add custom function to commands.
    if (hasSubCommands) {
      data.addAll(await runSubCommands());
    } else {
      for (int x = 0; x < allCommands.length; x++) {
        data.addAll(await findSubCommand(allCommands[x])!.run());
      }
    }

    return data;
  }

  @override
  Command? findSubCommand(String command) {
    switch (command) {
      case "info":
        return ContactInfoCommand.create();
      case "social":
        return ContactSocialCommand.create();
    }

    return null;
  }
}
