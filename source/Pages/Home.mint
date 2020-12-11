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

    cursor: pointer;
  }

  style title {
    font-size: 32px;
    font-weight: 800;
    text-transform: uppercase;
  }

  fun render : Html {
    <div::base>
      <div::card onClick={Navigator.characters}>
        <div>
          <p::title>"Characters"</p>
        </div>
        <div>
          <img src="/helmet.png" width="128" height="128" />
        </div>
      </div>

      <div::card onClick={Navigator.loots}>
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
