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
        face global attribute          ${purple}
        face global builtin            ${orange}+b
        face global comment            ${purple2dark}
        face global delimiter          ${purple}
        face global function           ${green}
        face global identifier         ${orange}
        face global keyword            ${green}
        face global meta               ${purple2}
        face global module             ${red}
        face global operator           ${red}
        face global string             ${cyan}
        face global type               ${yellow}
        face global value              ${yellow}
        face global variable           ${cyan}

        # markup
        face global block              ${magenta}
        face global bold               ${foreground}+b
        face global bullet             ${yellow}
        face global header             ${green}
        face global italic             ${foreground}+i
        face global link               ${cyan}
        face global list               ${orange}
        face global mono               ${foreground}
        face global title              ${green}+b

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
        face global MatchingChar       ${purple},default+b
        face global BufferPadding      ${foreground},default
        face global Whitespace         ${orange},default
    "
}

