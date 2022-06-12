part of console_ui;

class ConsolePage extends StatefulWidget {
  const ConsolePage({super.key});

  @override
  State<ConsolePage> createState() => _ConsolePageState();
}

class _ConsolePageState extends State<ConsolePage> {
  late final ConsoleManager consoleManager;
  final controller = TextEditingController();
  final _consoleFocus = FocusNode();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    consoleManager = ConsoleManager.instance;
  }

  void _scrollToBottom([int delayInSeconds = 1]) async {
    await Future.delayed(Duration(seconds: delayInSeconds));

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Widget _renderConsole() {
    return Row(
      children: [
        const ConsolePrefix(),
        Expanded(
          child: TextField(
            focusNode: _consoleFocus,
            autofocus: true,
            controller: controller,
            onSubmitted: (data) async {
              controller.clear();
              consoleManager.runCommand(data);
              FocusScope.of(context).requestFocus(_consoleFocus);
              _scrollToBottom();
            },
            showCursor: true,
            cursorWidth: 10,
          ),
        )
      ],
    );
  }

  Widget _renderCommandHistory() {
    return StreamBuilder(
      stream: consoleManager.commands,
      builder: (context, AsyncSnapshot<List<Command>> data) {
        if (!data.hasData) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.data!.map((e) => CommandsTile(command: e)).toList(),
        );
      },
    );
  }

  Widget _renderBody() {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.all(
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _renderCommandHistory(),
          _renderConsole(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _renderBody(),
      backgroundColor: backgroundColor,
    );
  }
}
