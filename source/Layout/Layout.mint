component Layout {
  connect Theme exposing { primaryBackground, primaryText }

  property children : Array(Html) = []
  
  style base {
    flex-direction: row;
    min-height: 100vh;
    display: flex;
    background: #{primaryBackground};
    color: #{primaryText};
    justify-content: center;
  }

  style content {
    max-width: 1080px;
  }

  fun render : Html {
    <div::base>
      <div::content>
        <{ children }>
      </div>

      <Layout.Footer/>
    </div>
  }
}
