# Spaceduck
# based on: https://github.com/pineapplegiant/spaceduck

evaluate-commands %sh{
    red='rgb:e33400'
    orange='rgb:e39400'
    green='rgb:5ccc96'
    yellow='rgb:f2ce00'
    purple='rgb:b3a1e6'
    purple2='rgb:7a5ccc'
    purpledark='rgb:30365F'
    purple2dark='rgb:686f9a'
    cyan='rgb:00a3cc'
    magenta='rgb:ce6f8f'

	background='rgb:0f111b'
    foreground='rgb:ecf0c1'
    visual='rgb:1b1c36'
    cursor='rgb:16172d'

    echo "
        # code
        face global value              ${yellow}
        face global type               ${yellow}
        face global variable           ${cyan}
        face global module             ${red}
        face global function           ${green}
        face global string             ${cyan}
        face global keyword            ${green}
        face global operator           ${red}
        face global attribute          ${purple}
        face global comment            ${purpledark}
        face global meta               ${purple2}
        face global builtin            ${orange}+b

        # markup
        face global title              ${green}+b
        face global header             ${green}
        face global bold               ${foreground}+b
        face global italic             ${foreground}+i
        face global mono               ${foreground}
        face global block              ${magenta}
        face global link               ${cyan}
        face global bullet             ${yellow}
        face global list               ${orange}

        # builtin
        face global Default            ${foreground},default
        face global PrimarySelection   ${foreground},${purpledark}
        face global SecondarySelection ${foreground},${background}
        face global PrimaryCursor      ${background},${foreground}
        face global SecondaryCursor    ${background},${foreground}
        face global PrimaryCursorEol   ${background},${foreground}
        face global SecondaryCursorEol ${background},${foreground}
        face global LineNumbers        ${purpledark},default
        face global LineNumberCursor   ${purple},default
        face global LineNumbersWrapped ${purple2},${background}
        face global MenuForeground     ${foreground},${background}
        face global MenuBackground     ${purple},${background}
        face global MenuInfo           ${visual}
        face global Information        ${foreground},${visual}
        face global Error              ${red},default+b
        face global StatusLine         ${purple2},${background}+b
        face global StatusLineMode     ${background}
        face global StatusLineInfo     ${foreground}
        face global StatusLineValue    ${foreground}
        face global StatusCursor       ${foreground},${background}
        face global Prompt             ${foreground}+b
        face global MatchingChar       ${foreground},${background}+b
        face global BufferPadding      ${foreground},default
    "
}

