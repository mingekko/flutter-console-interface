library commands;

import 'package:console_interface/console/command/export.dart';
import 'package:console_interface/console/command/stack/export.dart';
import 'package:console_interface/console/export.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart';

export 'contact/export.dart';

part 'not_found.dart';
part 'command.dart';
part 'help_command.dart';
part 'clear_command.dart';
part 'welcome_command.dart';

Map<String, Command> allCommands = {
  "welcome": WelcomeCommand.create(),
  "contact": ContactCommand.create(
    ContactCommand.allCommands,
  ),
  "stacks" : StackCommand.create(),
  "help": HelpCommand.create(),
  "clear": ClearCommand.create(),
};
