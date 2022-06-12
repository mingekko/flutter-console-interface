part of console_ui;

class ConsolePrefix extends StatelessWidget {
  final DateTime? dateTime;
  final String? commandName;
  const ConsolePrefix({
    Key? key,
    this.dateTime,
    this.commandName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateParse = dateTime == null ? r"" : " ${dateTime!.format()} ";
    return RichText(
      text: TextSpan(
        text: dateParse,
        style: TextStyle(
          fontFamily: GoogleFonts.ptMono().fontFamily,
          color: backgroundColor,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.white70,
        ),
        children: [
          const TextSpan(
            text: r' $',
            style: TextStyle(
                color: cursorColor, backgroundColor: Colors.transparent),
          ),
          TextSpan(
            text: commandName ?? ' takacs.balint > ',
            style: TextStyle(
              color: commandName == null ? Colors.white : cursorColor,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

extension FormateDate on DateTime {
  String format() {
    return "${hour.format()}:${minute.format()}:${second.format()}";
  }
}

extension FormatInt on int {
  String format() {
    return toString().padLeft(2, "0");
  }
}
