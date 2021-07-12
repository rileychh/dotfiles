#!/usr/bin/env fish

set icon 
set tooltip 'Input method is'

switch (ibus engine)
    case xkb:us::eng
        set lang En
        set --append tooltip 'English (US)'
    case rime
        set lang Zh
        set --append tooltip Rime
    case '*'
        set lang '?'
        set --append tooltip unknown
end

echo "\
{
    \"text\": \"$icon $lang\",
    \"tooltip\": \"$tooltip\"
}"\
 | jq --unbuffered --compact-output
