component Organisms.Loot.Card {
  connect Theme exposing { secondaryBackground }

  property children : Array(Html) = []

  style base {
    background: #{secondaryBackground};
    margin: 16px;
    padding: 16px;
    width: 400px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    min-height: 140px;

    border-radius: 10px;
    box-shadow: 0px 0px 0px #{secondaryBackground};

    &:hover {
      box-shadow: 0px 15px 25px #{secondaryBackground};
    }
  }

  fun render : Html {
    <div::base>
      <{ children }>
    </div>
  }
}
