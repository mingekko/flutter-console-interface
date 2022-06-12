part of commands;

class WelcomeCommand extends Command {
  WelcomeCommand(super.created);

  factory WelcomeCommand.create() {
    return WelcomeCommand(DateTime.now());
  }

  @override
  String get command => "welcome";

  @override
  Future<Map<String, String>> run() async {
    String data = await rootBundle.loadString("assets/welcome.txt");
    return {
      "": data,
    };
  }
 
}
 