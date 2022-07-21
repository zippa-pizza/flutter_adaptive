/// A series of widgets and utilities that adapt to the current platform.
library flutter_adaptive;

import 'package:flutter/widgets.dart';
import 'src/widgets/_.dart';

export 'src/utilities/show_action_sheet.dart';
export 'src/utilities/show_date_picker.dart';
export 'src/utilities/show_dialog.dart';
export 'src/widgets/_.dart';
export 'src/widgets/bottom_navigation_bar.dart';
export 'src/widgets/button.dart';
export 'src/widgets/dropdown_button.dart';
export 'src/widgets/dropdown_menu_item.dart';
export 'src/widgets/expansion_tile.dart';
export 'src/widgets/icon_button.dart';
export 'src/widgets/icons.dart';
export 'src/widgets/list_tile.dart';
export 'src/widgets/menu_button.dart';
export 'src/widgets/route.dart';
export 'src/widgets/search_text_field.dart';
export 'src/widgets/spinner.dart';
export 'src/widgets/switch_list_tile.dart';
export 'src/widgets/tap_area.dart';
export 'src/widgets/text_field.dart';
export 'src/widgets/toggle_buttons.dart';

final ScrollPhysics scrollPhysics =
    isIOS ? const BouncingScrollPhysics() : const ClampingScrollPhysics();
