component Layout.Header {
  connect Theme exposing { primaryBackground, secondaryBackground, primary }

  style base {
    background: #{secondaryBackground};
    color: white;

    display: flex;
  }

  style wrapper {
    padding: 0 0 0 15px;
    align-items: center;
    height: 56px;

    @media (max-width: 960px) {
      padding: 5px 0;
      display: block;
      height: auto;
    }
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

    @media (max-width: 960px) {
      border-top: 1px solid rgba(255, 255, 255, 0.2);
      grid-template-columns: 1fr 1fr;
      padding: 10px 0;
      grid-gap: 10px;
      display: grid;
    }
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

    @media (max-width: 960px) {
      justify-content: center;
    }

    cursor: pointer;
  }

  style separator {
    border-left: 1px solid rgba(255, 255, 255, 0.6);
    height: 20px;

    @media (max-width: 960px) {
      display: none;
    }
  }

  get links {
    <>
      <p::link onClick={Navigator.characters}>"Characters"</p>
      <p::separator />
      <p::link onClick={Navigator.characters}>"Loots"</p>
    </>
  }

  fun render : Html {
    <div::base>
      <div::wrapper>
        <p::brand onClick={Navigator.home}>"Titan Loot"</p>
      </div>

      <div::links>
        <{ links }>
      </div>
    </div>
  }
}
