part of commands_ui;

class CommandsTile extends StatelessWidget {
  final Command command;
  const CommandsTile({
    Key? key,
    required this.command,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FutureBuilder(
        future: command.run(),
        builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          if (command is WelcomeCommand) {
            return Text(
              snapshot.data!.values.first,
              style: const TextStyle(
                color: Colors.white,
              ),
            );
          }

          return Column(
            children: snapshot.data!.keys.map(
              (key) {
                final data = snapshot.data![key];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConsolePrefix(
                      dateTime: command.created,
                      commandName: " ${command.command}->$key ",
                    ),
                    InkWell(
                      onTap: !data!.isUrl()
                          ? null
                          : () async {
                              if (await canLaunchUrlString(data)) {
                                launchUrlString(data);
                              }
                            },
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            data,
                            textStyle: TextStyle(
                              color: Colors.white,
                              decoration: data.isUrl()
                                  ? TextDecoration.underline
                                  : null,
                            ),
                            cursor: "*",
                            speed: const Duration(milliseconds: 10),
                          ),
                        ],
                        totalRepeatCount: 1,
                        repeatForever: false,
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}

extension UrlChecker on String {
  /// Raw url check.
  bool isUrl() {
    return contains("https");
  }
}
