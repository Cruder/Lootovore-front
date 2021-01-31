enum Api.Status(a) {
  Error(Map(String, Array(String)))
  Loading
  Initial
  Ok(a)
}
