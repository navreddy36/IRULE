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
