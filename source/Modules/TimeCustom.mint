module TimeCustom {
  /*
  Returns the UTC milliseconds of the given time.

    (Time.from(2018, 4, 5, 12, 40. 16. 8)
    |> Time.day()) == 8
  */
  fun milliseconds (date : Time) : Number {
    `#{date}.getUTCMilliseconds()`
  }

  /*
  Returns the UTC seconds of the given time.

    (Time.from(2018, 4, 5, 12, 40. 16. 8)
    |> Time.day()) == 16
  */
  fun seconds (date : Time) : Number {
    `#{date}.getUTCSeconds()`
  }

  /*
  Returns the UTC minutes of the given time.

    (Time.from(2018, 4, 5, 12, 40. 16. 8)
    |> Time.day()) == 40
  */
  fun minutes (date : Time) : Number {
    `#{date}.getUTCMinutes()`
  }

  /*
  Returns the UTC hours of the given time.

    (Time.from(2018, 4, 5, 12, 40. 16. 8)
    |> Time.day()) == 12
  */
  fun hours (date : Time) : Number {
    `#{date}.getUTCHours()`
  }
}
