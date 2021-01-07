component Organisms.Loots.WishContainer {
  connect Theme exposing { secondaryBackground }

  property wish : String
  property lootCount : Number

  property children : Array(Html) = []

  style base {
  }

  style text {
    text-align: center;
    background-color: #{secondaryBackground};
    padding: 4px;
    margin: 16px;
    border-radius: 8px;
  }

  fun render : Html {
    <div::base>
      <div::text>
        <p> "#{wish} (#{lootCount})" </p>
      </div>
      
      <{ children }>
    </div>
  }
}
