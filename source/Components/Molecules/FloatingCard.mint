component Molecules.FloatingCard {
  connect Theme exposing { secondaryBackground }

  property children : Array(Html) = []

  style base {
    @media (max-width: 720px) {
      padding: 20px;
    }

    @media (min-width: 720px) {
      position: fixed;
      bottom: 28px;
      right: 28px;
      border-radius: 8px;
      justify-content: center;
      display: flex;
    }

    background: #{secondaryBackground};
    margin: 8px;
    padding: 8px 16px;
    height: max-content;

    box-shadow: 5px 10px 20px black;
  }

  fun render : Html {
    <div::base>
      <{ children }>
    </div>
  }
}
