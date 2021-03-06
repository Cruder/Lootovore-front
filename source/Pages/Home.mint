component Pages.Home {
  connect Theme exposing { primaryBackground, secondaryBackground, primary }

  style base {
    display: flex;
    align-items: center;
    justify-content: space-around;
    min-height: 100vh;  

    @media (max-width: 500px) {
      flex-direction: column;
    }
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

    @media (max-width: 960px) {
      width: 350px;
      height: 350px;  
    }

    @media (max-width: 500px) {
      width: 300px;
      height: 300px;
    }
  }

  style title {
    font-size: 32px;
    font-weight: 800;
    text-transform: uppercase;
  }

  fun componentDidMount : Promise(Never, Void) {
      Window.setTitle("Titan")
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
