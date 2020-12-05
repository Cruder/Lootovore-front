component Main {
  connect Application exposing { page }

  style base {
    font-family: sans;
    font-weight: bold;
    font-size: 50px;

    justify-content: center;
    align-items: center;
    display: flex;
    height: 100vh;
    width: 100vw;
  }

  fun render : Html {
    case (page) {
      Page::Initial => Html.empty()

      Page::Home =>
        <Layout>
          <Pages.Home/>
        </Layout>

      Page::Characters =>
        <Layout>
          <Pages.Characters/>
        </Layout>

      Page::Character =>
        <Layout>
          <Pages.Character/>
        </Layout>

      Page::Loots =>
        <Layout>
          <Pages.Loots/>
        </Layout>

      Page::NotFound =>
        <p>
          "Not found"
        </p>
    }
  }
}
