when RULE_INIT {
  set ::TRACE 1
  set DEBUG 1
}
when HTTP_REQUEST priority 100 {
  if { [HTTP::uri] starts_with "/login" } {
    set ATTEMPTING_TO_LOGIN 1
  } else {
    set ATTEMPTING_TO_LOGIN 0
  }
}
if { [HTTP::header Content-Length] > 0 } then {
  log local0. "Something's coming..."
} elseif { [HTTP::uri] contains "foobar" } then {
  log local0. "The user wants some foobar!"
} else {
  log local0. "I don't know what this user wants!"
}
