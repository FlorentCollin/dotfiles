# Base16 Styling Guidelines:

base00=default   # - Default
base01='#151515' # - Lighter Background (Used for status bars)
base02='#202020' # - Selection Background
base03='#909090' # - Comments, Invisibles, Line Highlighting
base04='#505050' # - Dark Foreground (Used for status bars)
base05='#D0D0D0' # - Default Foreground, Caret, Delimiters, Operators
base06='#E0E0E0' # - Light Foreground (Not often used)
base07='#F5F5F5' # - Light Background (Not often used)
base08='#AC4142' # - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
base09='#D28445' # - Integers, Boolean, Constants, XML Attributes, Markup Link Url
base0A='#F4BF75' # - Classes, Markup Bold, Search Text Background
base0B='#90A959' # - Strings, Inherited Class, Markup Code, Diff Inserted
base0C='#75B5AA' # - Support, Regular Expressions, Escape Characters, Markup Quotes
base0D='#6A9FB5' # - Functions, Methods, Attribute IDs, Headings
base0E='#AA759F' # - Keywords, Storage, Selector, Markup Italic, Diff Changed
base0F='#8F5536' # - Deprecated, Opening/Closing Embedded Language Tags, e.g. <? php ?>

# Quantum colors
blue1='#70ace5'
blue2='#87bff5'
cyan1='#69c5ce'
cyan2='#7bdbe4'
white1='#aebbc5'
white2='#c5ced5'
red1='#dd7186'
red2='#ed8499'

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
set-option -g status-style fg=$base02,bg=$base00,default

set-window-option -g window-status-style fg=$white1,bg=$base00
set-window-option -g window-status-format " #I #W"

# active window title colors
set-window-option -g window-status-current-style fg=$blue1,bg=$base00
set-window-option -g window-status-current-format " #I #[bold]#W"

# pane border colors
set-window-option -g pane-active-border-style fg=$base0C
set-window-option -g pane-border-style fg=$base03

# message text
set-option -g message-style bg=$base00,fg=$base0C

# pane number display
set-option -g display-panes-active-colour $base0C
set-option -g display-panes-colour $base01

# clock
set-window-option -g clock-mode-colour $base0C


tm_session_name="#[default,bg=$base00,fg=$blue1] #S"
set -g status-left "$tm_session_name <<->>"

set -g mode-style "fg=#c0c0c0,bg=#444444"

bind -T root F12  \
  set prefix None \;\
  set key-table off \;\
  set status-style "fg=$base02,bg=$base00" \;\
  if -F '#{pane_in_mode}' 'send-keys -X cancel' \;\
  refresh-client -S \;\

bind -T off F12 \
  set -u prefix \;\
  set -u key-table \;\
  set -u status-style \;\
  set -u window-status-current-style \;\
  set -u window-status-current-format \;\
  refresh-client -S
  
wg_is_keys_off="#[fg=$white2,bg=$base00]#([ $(tmux show-option -qv key-table) = 'off' ] && echo 'OFF')"

tm_date="#[default,bg=$base00,fg=$white2] %R"
tm_host="#[bg=$base00,fg=$blue1] #h "
tm_scripts='#(~/.tmux/scripts/battery.sh)'
set -g status-right "$wg_is_keys_off $tm_scripts $tm_date $tm_host"
