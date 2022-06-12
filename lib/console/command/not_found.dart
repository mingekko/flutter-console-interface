part of commands;

class NotFoundCommand extends Command {
  NotFoundCommand(super.created);

  factory NotFoundCommand.create(){
    return NotFoundCommand(DateTime.now());
  }

  @override
  String get command => "not_found";

  @override
  Future<Map<String, String>> run() async {
    return {
      "error": 'Command not found. Run "help" for available commands and options.',
    };
  } 
}
