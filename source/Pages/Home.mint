component Pages.Home {
  connect Theme exposing { primaryBackground, secondaryBackground, primary }

  style base {
    display: flex;
    align-items: center;
    justify-content: space-around;
    min-height: 100vh;    
  }

  style card {
    width: 400px;
    height: 400px;

    display: flex;
    align-items: center;
    justify-content: center;

    background-color: #{secondaryBackground};

    flex-direction: column;

    &:hover {
      box-shadow: 0px 15px 25px #{secondaryBackground};
      color: #{primary};
    }
  }

  style title {
    font-size: 32px;
    font-weight: 800;
    text-transform: uppercase;
  }
  
  fun goToCharacters(event : Html.Event) : Promise(Never, Void) {
    sequence {
      Application.load(Page::Characters)
      
      Stores.Characters.load()

      Window.setUrl("characters")
    }
  }

  fun render : Html {
    <div::base>
      <div::card onClick={goToCharacters}>
        <div>
          <p::title>"Characters"</p>
        </div>
        <div>
          <img src="/helmet.png" width="128" height="128" />
        </div>
      </div>

      <div::card onClick={goToCharacters}>
        <div>
          <p::title>"Loots"</p>
        </div>
        <div>
          <img src="/chest.png" width="128" height="128" />
        </div>
      </div>

    </div>
  }
}
