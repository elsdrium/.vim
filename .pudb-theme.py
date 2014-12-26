# Supported 16 color values:
#   'h0' (color number 0) through 'h15' (color number 15)
#    or
#   'default' (use the terminal's default foreground),
#   'black', 'dark red', 'dark green', 'brown', 'dark blue',
#   'dark magenta', 'dark cyan', 'light gray', 'dark gray',
#   'light red', 'light green', 'yellow', 'light blue',
#   'light magenta', 'light cyan', 'white'
#
# Supported 256 color values:
#   'h0' (color number 0) through 'h255' (color number 255)
#
# 256 color chart: http://en.wikipedia.org/wiki/File:Xterm_color_chart.png
#
# "setting_name": (foreground_color, background_color),


FG_COLOR = "h188"
BG_COLOR = "default"
HIGHLIGHT_COLOR = "h244"
FOCUS_COLOR = "h240"
HEADER_COLOR = "h243"
LABEL_COLOR = "h187"
BOLD_LABEL_COLOR = add_setting(LABEL_COLOR, "bold")


palette.update({
    "variables": ("white", "default"),

    "var label": ("light blue", "default"),
    "var value": ("white", "default"),

    "stack": ("white", "default"),

    "frame name": ("white", "default"),
    "frame class": ("dark blue", "default"),
    "frame location": ("light cyan", "default"),

    "current frame name": (add_setting("white", "bold"), "default"),
    "current frame class": ("dark blue", "default"),
    "current frame location": ("light cyan", "default"),

    "focused frame name": ("black", "white"),
    "focused frame class": (add_setting("white", "bold"), "light gray"),
    "focused frame location": ("dark blue", "white"),

    "focused current frame name": ("black", "white"),
    "focused current frame class": (add_setting("white", "bold"), "light gray"),
    "focused current frame location": ("dark blue", "white"),

    "breakpoint": ("default", "default"),

    "search box": ("default", "default"),

    # highlighting
    "source": (FG_COLOR, BG_COLOR),
    "focused source": (FG_COLOR, FOCUS_COLOR),
    "highlighted source": ("white", HIGHLIGHT_COLOR),
    "current source": ("white", HIGHLIGHT_COLOR),
    "current focused source": ("white", HIGHLIGHT_COLOR),
    "current highlighted source": ("white", HIGHLIGHT_COLOR),

    "line number": ("light gray", "default"),
    "keyword": ("dark magenta", "default"),
    "name": ("white", "default"),
    "literal": ("light cyan", "default"),
    "string": ("dark red", "default"),
    "doublestring": ("dark red", "default"),
    "singlestring": ("light blue", "default"),
    "docstring": ("light red", "default"),
    "backtick": ("light gray", "default"),
    "punctuation": ("white", "default"),
    "comment": ("dark cyan", "default"),
    "classname": ("light cyan", "default"),
    "funcname": ("white", "default"),

    "breakpoint marker": ("dark red", "default"),

    # {{{ shell

    "command line edit": ("white", "default"),
    "command line prompt": (add_setting("white", "bold"), "default"),

    "command line output": (add_setting("white", "bold"), "default"),
    "command line input": (add_setting("white", "bold"), "default"),
    "command line error": (add_setting("light red", "bold"), "default"),

    "focused command line output": ("black", "white"),
    "focused command line input": (add_setting("black", "bold"), "white"),
    "focused command line error": ("black", "white"),

    "command line clear button": (add_setting("white", "bold"), "default"),
    "command line focused button": ("black", "light gray"), # White
    # doesn't work in curses mode

    # }}}

})
