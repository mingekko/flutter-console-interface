part of stack_commands;

class StackCommand extends Command {
  StackCommand(
    super.created, {
    super.runnableSubCommands,
  });

  factory StackCommand.create() {
    return StackCommand(
      DateTime.now(),
    );
  }

  @override
  String get command => "stacks";

  @override
  Future<Map<String, String>> run() async {
    return {
      "flutter": "■■■■■■■■■■ 100%",
      "dart": "■■■■■■■■■■ 100%",
      "nodejs": "■■■■■■□□□□ 60%",
      "nestjs": "■■■■■■□□□□ 60%",
      "nextjs": "■■■■■■□□□□ 60%",
      "c#": "■■■■■■□□□□ 60%",
      "java": "■■■■■■□□□□ 60%",
    };
  }
}
