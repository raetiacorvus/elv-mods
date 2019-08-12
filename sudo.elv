# sudo module based on sudo plugin for oh my zsh 
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/sudo/sudo.plugin.zsh
# Prepends sudo to the current command or last command in history if current-command ist empty

fn timestamp []{ date +%s%3N }
sudostamp = (timestamp)

fn toggle {
  current-command = ''
  if (eq $edit:current-command '') {
    current-command = $edit:history:list[-1]
  } else {
    current-command = $edit:current-command
  }

  if (has-prefix $current-command 'sudo ') {
    edit:current-command = $current-command[5:]
  } elif (has-prefix $current-command 'sudoedit') {
    edit:current-command = $current-command[4:]
  } elif (and (has-prefix $current-command 'edit') (not (has-prefix $current-command 'edit:'))) {
    edit:current-command = 'sudo'$current-command
  } else {
    edit:current-command = 'sudo '$current-command
  }
}
