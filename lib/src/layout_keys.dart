part of in_app_keyboard;

abstract class KeyboardLayoutKeys {
  int activeIndex = 0;
  KeyboardLayoutType layoutType = KeyboardLayoutType.Alphabetic;

  List<List> get defaultEnglishLayout => _defaultEnglishLayout;
  List<List> get defaultArabicLayout => _defaultArabicLayout;
  List<List> get defaultNumericLayout => _defaultNumericLayout;
  List<List> get defaultSpecialLayout => _defaultSpecialLayout;
  List<List> get defaultNumberLayout => _defaultNumberLayout;

  List<List> get activeLayout => getLayout(layoutType, activeIndex);
  int getLanguagesCount();
  List<List> getLanguage(int index);
  List<List> getLayout(KeyboardLayoutType layout, int index);

  void switchNumeric() {
    layoutType = KeyboardLayoutType.Numeric;
  }

  void switchSpecial() {
    layoutType = KeyboardLayoutType.Special;
  }

  void switchNumber() {
    layoutType = KeyboardLayoutType.Number;
  }

  void switchAlphabetic() {
    layoutType = KeyboardLayoutType.Alphabetic;
  }

  void switchLanguage() {
    if ((activeIndex + 1) == getLanguagesCount()) {
      activeIndex = 0;
    } else {
      activeIndex++;
    }
  }
}

class KeyboardDefaultLayoutKeys extends KeyboardLayoutKeys {
  List<KeyboardDefaultLayouts> defaultLayouts;
  KeyboardDefaultLayoutKeys(this.defaultLayouts);

  @override
  int getLanguagesCount() => defaultLayouts.length;

  @override
  List<List> getLayout(KeyboardLayoutType layout, int index) {
    switch (layout) {
      case KeyboardLayoutType.Numeric:
        return defaultNumericLayout;
      case KeyboardLayoutType.Special:
        return defaultSpecialLayout;
      case KeyboardLayoutType.Number:
        return _defaultNumberLayout;
      default:
        return getLanguage(index);
    }
  }

  @override
  List<List> getLanguage(int index) {
    switch (defaultLayouts[index]) {
      case KeyboardDefaultLayouts.English:
        return _defaultEnglishLayout;
      case KeyboardDefaultLayouts.Arabic:
        return _defaultArabicLayout;
      default:
    }
    return _defaultEnglishLayout;
  }
}

const List<List> _defaultEnglishLayout = [
  // Row 1
  // const [
  //   '1',
  //   '2',
  //   '3',
  //   '4',
  //   '5',
  //   '6',
  //   '7',
  //   '8',
  //   '9',
  //   '0',
  // ],
  // Row 2
  const [
    'q',
    'w',
    'e',
    'r',
    't',
    'y',
    'u',
    'i',
    'o',
    'p',
  ],
  // Row 3
  const [
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    // ';',
    // '\'',
  ],
  // Row 4
  const [
    KeyAction.Shift,
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm',
    KeyAction.Backspace
    // ',',
    // '.',
    // '/',
  ],
  // Row 5
  const [
    KeyAction.SwitchNumeric,
    '/',
    KeyAction.SwitchLanguage,
    KeyAction.Space,
    // '&',
    // '_',
    // '-',
    '.',
    KeyAction.Confirm,
  ]
];

const List<List> _defaultArabicLayout = [
  // Row 1
  // const [
  //   '1',
  //   '2',
  //   '3',
  //   '4',
  //   '5',
  //   '6',
  //   '7',
  //   '8',
  //   '9',
  //   '0',
  // ],
  // Row 2
  const [
    'ض',
    'ص',
    'ث',
    'ق',
    'ف',
    'غ',
    'ع',
    'ه',
    'خ',
    'ح',
    'ج',
    // 'د',
    // KeyAction.Backspace
  ],
  // Row 3
  const [
    'ش',
    'س',
    'ي',
    'ب',
    'ل',
    'ا',
    'ت',
    'ن',
    'م',
    'ك',
    'ط',
  ],
  // Row 4
  const ['ذ', 'ء', 'ؤ', 'ر', 'ى', 'ة', 'و', 'ز', 'ظ', 'د', KeyAction.Backspace],
  // Row 5
  const [
    KeyAction.SwitchNumeric,
    '،',
    KeyAction.SwitchLanguage,
    KeyAction.Space,
    '.',
    KeyAction.Confirm,
  ]
];

const List<List> _defaultNumericLayout = [
  // Row 1
  const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ],

  // Row 2
  const [
    '@',
    '#',
    '\$',
    '_',
    '&',
    '-',
    '+',
    '(',
    ')',
    '/',
  ],

  // Row 3
  const [
    KeyAction.SwitchSpecial,
    '*',
    '"',
    '\'',
    ':',
    ';',
    '!',
    '?',
    KeyAction.Backspace,
  ],

  // Row 4
  const [
    KeyAction.SwitchAlphabetic,
    ',',
    KeyAction.SwitchNumber,
    KeyAction.Space,
    '.',
    KeyAction.Confirm,
  ]
];

const List<List> _defaultSpecialLayout = [
  // Row 1
  [
    '~',
    '\`',
    '|',
    '•',
    '√',
    'π',
    '÷',
    '×',
    '§',
    '∆',
  ],

  // Row 2
  [
    '£',
    '¢',
    '€',
    '¥',
    '^',
    '°',
    '=',
    '{',
    '}',
    '\\',
  ],

  // Row 3
  [
    KeyAction.SwitchNumeric,
    '%',
    '©',
    '®',
    '™',
    '✓',
    '[',
    ']',
    KeyAction.Backspace,
  ],

  // Row 4
  [
    KeyAction.SwitchAlphabetic,
    '<',
    KeyAction.SwitchNumber,
    KeyAction.Space,
    '>',
    KeyAction.Confirm,
  ]
];

const List<List> _defaultNumberLayout = [
  // Row 1
  [
    '+',
    '1',
    '2',
    '3',
    '%',
  ],

  // Row 2
  [
    '-',
    '4',
    '5',
    '6',
    KeyAction.Space,
  ],

  // Row 3
  [
    '/',
    '7',
    '8',
    '9',
    KeyAction.Backspace,
  ],

  // Row 4
  [
    KeyAction.SwitchAlphabetic,
    KeyAction.SwitchNumeric,
    '0',
    '=',
    KeyAction.Confirm,
  ]
];
