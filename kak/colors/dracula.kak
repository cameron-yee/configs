 evaluate-commands %sh{
    black="rgb:282a36"
    gray="rgb:44475a"
    white="rgb:f8f8f2"

    pink="rgb:ff79c6"
    purple="rgb:bd93f9"
    blue="rgb:6272a4"
    cyan="rgb:8be9fd"
    green="rgb:50fa7b"
    yellow="rgb:f1fa8c"
    orange="rgb:ffb86c"
    red="rgb:ff5555"

    echo "
         face global value $green
         face global type $purple
         face global variable $red
         face global function $red
         face global module $green
         face global string $yellow
         face global error $red
         face global keyword $purple
         face global operator $orange
         face global attribute $pink+b
         face global comment $blue+i
         face global meta $red
         face global builtin $green+b

         face global title $red
         face global header $orange
         face global bold $pink
         face global italic $purple
         face global mono $green
         face global block $cyan
         face global link $green
         face global bullet $green
         face global list $white

         face global Default default,default

         face global PrimarySelection $black,$pink
         face global PrimaryCursor $black,$cyan
         face global PrimaryCursorEol $black,$cyan

         face global SecondarySelection $black,$purple
         face global SecondaryCursor $black,$orange
         face global SecondaryCursorEol $black,$orange

         face global MatchingChar $black,$blue
         face global Search $blue,$green
         face global CurrentWord $white,$blue

         face global Whitespace default+f
         face global BufferPadding $gray,default
         face global WrapMarker Whitespace

         face global LineNumbers $yellow,default
         face global LineNumberCursor $white,$gray+b
         face global LineNumbersWrapped $gray,$black+i

         face global MenuForeground $blue,$white+b
         face global MenuBackground $white,$blue
         face global MenuInfo $cyan,$blue
         face global Information $yellow,$gray
         face global Error $black,$red

         face global StatusLine $white,default
         face global StatusLineMode $black,default
         face global StatusLineInfo $purple,default
         face global StatusLineValue $orange,default
         face global StatusCursor $white,$blue
         face global Prompt $black,$green
    "
}
