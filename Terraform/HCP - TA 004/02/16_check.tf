check "website_check" {
  assert {
    condition = data.http.url.status_code == 200
    error_message = "Website is not UP."
  }
}