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
when HTTP_REQUEST priority 200 timing on {
  log local0. "Request Event 2 - login state: '$ATTEMPTING_TO_LOGIN'"
}
when HTTP_REQUEST timing on {
  unset ATTEMPTING_TO_LOGIN
}
