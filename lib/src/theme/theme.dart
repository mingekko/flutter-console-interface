part of theme;

const backgroundColor = Color(0xFF1a1a1a);
const cursorColor = Color(0xff00f572);

final themeData = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: GoogleFonts.ptMono().fontFamily,
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    errorBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(color: Color(0xFFcfcfcf), fontSize: 14,),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: cursorColor,
  ),
);
