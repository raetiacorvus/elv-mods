# doubletap mod for elvish
# Only executes function if key is tapped twice withing timeout (defaults to 200).
# Timeout defaults to 200. See sudo.elv for example usage.

fn timestamp []{ date +%s%3N }
fnmap = [&]

fn -call [key @args]{
  if (< (- (timestamp) $fnmap[$key][time]) $fnmap[$key][timeout]) {
    $fnmap[$key][fn]
  }
  fnmap[$key][time] = (timestamp)
}

fn insert [key &timeout=200 fn @args]{
  fnmap[$key] = [&fn=$fn &time=(timestamp) &timeout=$timeout]
  edit:insert:binding[$key] = { -call $key $args}
}
