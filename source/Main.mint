enum Page {
  NotFound
  Register
  Initial
  Login
  Home
}

store Application {
  state page : Page = Page::Initial

  fun setPage(page : Page) : Promise(Never, Void) {
    next { page = page }
  }
}

routes {
  /register {
    Application.setPage(Page::Register)
  }

  /login {
    Application.setPage(Page::Login)
  }

  / {
    Application.setPage(Page::Home)
  }

  * {
    Application.setPage(Page::NotFound)
  }
}

component Main {
  connect Application exposing { page }

  fun render : Html {
    <div>
      <div>
        <a href="/register">"Register"</a>
        <a href="/login">"Login"</a>
        <a href="/asdf">"404"</a>
        <a href="/">"Home"</a>
      </div>

      <hr/>

      case (page) {
        Page::Register => <div>"Register"</div>
        Page::NotFound => <div>"404"</div>
        Page::Login => <div>"Login"</div>
        Page::Home => <div>"Home"</div>
        Page::Initial => <div></div>
      }
    </div>
  }
}
