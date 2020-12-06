component Main {
  connect Application exposing { page }

  fun render : Html {
    case (page) {
      Page::Initial => Html.empty()

      Page::Home =>
        <Layout>
          <Pages.Home/>
        </Layout>

      Page::Characters =>
        <Layout>
          <Pages.Characters.Index/>
        </Layout>

      Page::Character =>
        <Layout>
          <Pages.Characters.Show/>
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
