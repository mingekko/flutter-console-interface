part of contact_commands;

class ContactInfoCommand extends Command {
  ContactInfoCommand(super.created);

  factory ContactInfoCommand.create() {
    return ContactInfoCommand(DateTime.now());
  }

  @override
  String get command => "info";

  @override
  Future<Map<String, String>> run() async {
    return {
      "name": "Takács Bálint",
      "title" : "Flutter Developer",
      "bio" : r'"Code is like humor. When you have to explain it, it’s bad." - Cory House',
    };
  }
   
}
