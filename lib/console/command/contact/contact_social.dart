part of contact_commands;

class ContactSocialCommand extends Command {
  ContactSocialCommand(super.created);

  factory ContactSocialCommand.create() {
    return ContactSocialCommand(DateTime.now());
  }

  @override
  String get command => "social";

  @override
  Future<Map<String, String>> run() async {
    return {
      "linkedin": "https://www.linkedin.com/in/t-balint",
      "github": "https://github.com/mingekko",
    };
  }
}
