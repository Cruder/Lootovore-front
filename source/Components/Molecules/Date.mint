component Molecules.Date {
  property time : Time
  
  style base {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
  }

  get dayFormated : String {
    "#{time |> Time.day |> formatNumber()}/#{time |> Time.month |> formatNumber()}/#{time |> Time.year}"
  }

  get timeFormated : String {
    "#{time |> TimeCustom.hours |> formatNumber()}h#{time |> TimeCustom.minutes |> formatNumber()}"
  }

  fun formatNumber(number : Number) : String {
    `
    (() => {
      let number = "00" + #{number}
      return number.substr(number.length - 2)
    })()
    `
  }

  fun render : Html {
    <div::base>
      <p> <{ dayFormated }> </p>
      <p> <{ timeFormated }> </p>
    </div>
  }
}
