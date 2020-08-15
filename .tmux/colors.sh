# Base16 Styling Guidelines:

base00='#000000'
base01='#EE4F84'
base02='#53E2AE'
base03='#F1FF52'
base04='#6498EF'
base05='#985EFF'
base06='#24D1E7'
base07='#E5E5E5'
base08='#2e2e2e'
base09='#F48FB1'
base0A='#A1EFD3'
base0B='#F1FA8C'
base0C='#92B6F4'
base0D='#BD99FF'
base0E='#87DFEB'
base0F='#F8F8F2'

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
set-option -g status-style fg=$base02,bg=$base00,default

set-window-option -g window-status-style fg=$base03,bg=$base00
set-window-option -g window-status-format " #I #W"

# active window title colors
set-window-option -g window-status-current-style fg=$base0E,bg=$base00
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

tm_session_name="#[default,bg=$base00,fg=$base0E] #S "
set -g status-left "$tm_session_name"

tm_date="#[default,bg=$base00,fg=$base0C] %R"
tm_host="#[fg=$base0E,bg=$base00] #h "
set -g status-right "$tm_tunes $tm_battery $tm_date $tm_host"

set -g mode-style "fg=#c0c0c0,bg=#444444"
