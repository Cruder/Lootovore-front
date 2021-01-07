component Layout.Header {
  connect Theme exposing { primaryBackground, secondaryBackground, primary }

  style base {
    background: #{secondaryBackground};
    color: white;

    display: flex;

    position: fixed;

    width: 100vw;
    height: 78px;

    top: 0;
  }

  style wrapper {
    margin: 0 0 0 16px;
    display: flex;
    align-items: center;
  }

  style brand {
    font-family: uniSansHeavy;
    text-decoration: none;
    letter-spacing: 1px;
    align-items: center;
    font-size: 24px;
    color: inherit;
    height: 24px;

    &:focus {
      outline: none;
    }

    @media (max-width: 960px) {
      justify-content: center;
      padding: 10px 0;
      height: auto;
    }

    @media (max-width: 500px) {
      display: none;
    }

    cursor: pointer;
  }

style links {
    text-transform: uppercase;
    align-items: center;
    margin-left: auto;
    font-weight: 600;
    font-size: 14px;
    line-height: 1;

    grid-template-columns: repeat(5, min-content);
    grid-gap: 20px;
    display: grid;
  }

  style link {
    font-family: uniSansHeavy;
    font-size: 24px;
    text-decoration: none;
    align-items: center;
    white-space: nowrap;
    color: inherit;
    padding: 3px 0;

    &:hover {
      color: #{primary};
    }

    &:focus {
      outline: none;
    }

    cursor: pointer;
  }

  style separator {
    border-left: 1px solid rgba(255, 255, 255, 0.6);
    height: 20px;

  }

  style logo-img {
    height: 60px;
  }

  get links {
    <>
      <p::link onClick={Navigator.characters}>"Characters"</p>
      <p::separator />
      <p::link onClick={Navigator.loots}>"Loots"</p>
    </>
  }

  fun render : Html {
    <div::base>
      <div::wrapper onClick={Navigator.home}>
        <img::logo-img src="/titan_logo.png" />
        <p::brand>"Titan Loot"</p>
      </div>

      <div::links>
        <{ links }>
      </div>
    </div>
  }
}
