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
  # This will get executed second when a HTTP request state is entered
  # CPU Metric timing is also enabled for this iRule event block
  log local0. "Request Event 2 - login state: '$ATTEMPTING_TO_LOGIN'"
}
when HTTP_REQUEST timing on {
  # The priority is not specified so it defaults to 500 and this will get executed last.
  # CPU metric timing is also enabled for this iRule event block
  unset ATTEMPTING_TO_LOGIN
}
