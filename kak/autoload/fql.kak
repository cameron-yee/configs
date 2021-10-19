##
# CUSTOM: copied and hacked from sql.kak. Not sure if it's 100% accurate.
##

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*/?(?i)fql %{
    set-option buffer filetype fql
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=fql %{
    require-module fql
    set-option window static_words %opt{fql_static_words}
}

hook -group fql-highlight global WinSetOption filetype=fql %{
    add-highlighter window/fql ref fql
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/fql }
}


provide-module fql %{

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/fql regions
add-highlighter shared/fql/code default-region group
add-highlighter shared/fql/double_string region '"' (?<!\\)(\\\\)*" fill string
add-highlighter shared/fql/single_string region "'" (?<!\\)(\\\\)*' fill string
add-highlighter shared/fql/comment1 region '--' '$' fill comment
add-highlighter shared/fql/comment2 region '#' '$' fill comment
add-highlighter shared/fql/comment3 region '/\*' '\*/' fill comment

evaluate-commands %sh{
    # # Keywords
    keywords=""
    # keywords="ALTER|AS|ASC|AUTO_INCREMENT|CHECK|CONSTRAINT|CREATE|DATABASE|DEFAULT|DELETE|DESC|DISTINCT|DROP"
    # keywords="${keywords}|EXISTS|FOREIGN KEY|FROM|FULL JOIN|FULL OUTER JOIN|GROUP BY|HAVING|INDEX|INNER JOIN"
    # keywords="${keywords}|INSERT INTO|INTO|JOIN|LEFT JOIN|LEFT OUTER JOIN|LIMIT|MODIFY|NOT NULL|ON|ORDER BY|PRIMARY KEY"
    # keywords="${keywords}|REFERENCES|RIGHT JOIN|RIGHT OUTER JOIN|SELECT|SELECT TOP|SET|TABLE|TRUNCATE|UNION|UNIQUE"
    # keywords="${keywords}|UPDATE|VALUES|VIEW|WHERE"

    # Operators
    operators=""
    # operators="ALL|AND|ANY|BETWEEN|EXISTS|IN|IS|LIKE|NOT|OR|SOME"

    # MySQL functions
    functions="All|Any|Append|Count|Difference|Distinct|Drop|Filter|Foreach|Intersection|IsEmpty|IsNonEmpty"
    functions="${functions}|Map|Max|Mean|Min|Prepend|Reduce|Reverse|Select|SelectAll|Sum|Take|ToObject|Union"
    functions="${functions}|Merge|ToArray|Get|KeyFromSecret|Paginate|All|Any|Count|Difference|Distinct|Events"
    functions="${functions}|Query|Lambda"
    # functions="${functions}|"
    # functions="${functions}|COS|COT|COUNT|CURDATE|CURRENT_DATE|CURRENT_TIME|CURRENT_TIMESTAMP|CURRENT_USER"
    # functions="${functions}|CURTIME|DATABASE|DATE|DATE_ADD|DATEDIFF|DATE_FORMAT|DATE_SUB|DAY|DAYNAME"
    # functions="${functions}|DAYOFMONTH|DAYOFWEEK|DAYOFYEAR|DEGREES|DIV|EXP|EXTRACT|FIELD|FIND_IN_SET|FLOOR"
    # functions="${functions}|FORMAT|FROM_DAYS|GREATEST|HOUR|IF|IFNULL|INSERT|INSTR|ISNULL|LAST_DAY"
    # functions="${functions}|LAST_INSERT_ID|LCASE|LEAST|LEFT|LENGTH|LN|LOCALTIME|LOCALTIMESTAMP|LOCATE|LOG"
    # functions="${functions}|LOWER|LPAD|LTRIM|MAKEDATE|MAKETIME|MAX|MICROSECOND|MID|MIN|MINUTE|MOD|MONTH"
    # functions="${functions}|MONTHNAME|NOW|NULLIF|PERIOD_ADD|PERIOD_DIFF|PI|POSITION|POW|POWER|QUARTER|RADIANS"
    # functions="${functions}|RAND|REPEAT|REPLACE|REVERSE|RIGHT|ROUND|RPAD|RTRIM|SECOND|SEC_TO_TIME|SESSION_USER"
    # functions="${functions}|SIGN|SIN|SPACE|SQRT|STRCMP|STR_TO_DATE|SUBDATE|SUBSTR|SUBSTRING|SUBSTRING_INDEX"
    # functions="${functions}|SUBTIME|SUM|SYSDATE|SYSTEM_USER|TAN|TIME|TIMEDIFF|TIME_FORMAT|TIMESTAMP"
    # functions="${functions}|TIME_TO_SEC|TO_DAYS|TRIM|TRUNCATE|UCASE|UPPER|USER|VERSION|WEEK|WEEKDAY|WEEKOFYEAR"
    # functions="${functions}|YEAR|YEARWEEK"

    # MySQL data types
    data_types="boolean|null|number|string"
    # data_types_fn="BIGINT|BLOB|CHAR|DATE|DATETIME|DECIMAL|DOUBLE|ENUM|FLOAT|INT"
    # data_types_fn="${data_types_fn}|MEDIUMINT|SMALLINT|TIME|TIMESTAMP|TINYINT|VARCHAR|YEAR"

    # SQL Server data types
    # data_types="${data_types}|bigint|bit|cursor|date|datetime|datetime2|datetimeoffset|image|int|money|nchar|ntext"
    # data_types="${data_types}|nvarchar|real|smalldatetime|smallint|smallmoney|sql_variant|table|text|time"
    # data_types="${data_types}|timestamp|tinyint|uniqueidentifier|varbinary|xml"
    # data_types_fn="${data_types_fn}|binary|char|decimal|float|numeric|nvarchar|varbinary|varchar|varchar"

    # MS Access data types
    # data_types="${data_types}|Text|Memo|Byte|Integer|Long|Single|Double|Currency|AutoNumber|Date"
    # data_types="${data_types}|Time|Ole Object|Hyperlink|Lookup Wizard"

    # Add the language's grammar to the static completion list
    printf %s\\n "declare-option str-list sql_static_words ${keywords} ${operators} ${functions} ${data_types} NULL" | tr '|' ' '

    # Highlight keywords
        # add-highlighter shared/fql/code/ regex '(?i)\b(${data_types_fn})\(.*?\)' 0:type
    printf %s "
        add-highlighter shared/fql/code/ regex '(?i)\b(${functions})\(.*\)' 0:function
        add-highlighter shared/fql/code/ regex '(?i)\b(${keywords})\b' 0:keyword
        add-highlighter shared/fql/code/ regex '(?i)\b(${operators})\b' 0:operator
        add-highlighter shared/fql/code/ regex '(?i)\b(${data_types})\b' 0:type
    "
}

add-highlighter shared/fql/code/ regex '\+|-|\*|/|%|&|\||^|=|>|<|>=|<=|<>|\+=|-=|\*=|/=|%=|&=|^-=|\|\*=' 0:operator
add-highlighter shared/fql/code/ regex \bNULL\b 0:value
add-highlighter shared/fql/code/ regex \b\d+(?:\.\d+)?\b 0:value

}
