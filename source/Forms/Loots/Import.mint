enum Forms.Loots.Import.States {
  WaitingFile
  WaitingSubmit
  Submitting
  Submitted
  Error
}

store Forms.Loots.Import {
  state status : Api.Status(Map(String, Bool)) = Api.Status::Initial

  state currentState : Forms.Loots.Import.States = Forms.Loots.Import.States::WaitingFile

  state body : String = ""
  state password : String = ""

  fun reset {
    sequence {
      next { body = "" }
      next { currentState = Forms.Loots.Import.States::WaitingFile }
      next { status = Api.Status::Initial }
    }
  }

  fun setFile (file : File) {
    sequence {
      body = File.readAsString(file)
      setBody(body)
    }
  }

  fun setBody (text : String) {
    sequence {
      next { body = text }
      next { currentState = Forms.Loots.Import.States::WaitingSubmit }
    }
  }

  fun setPassword (password : String) {
    sequence {
      next { password = Debug.log(password) }
    }
  } 

  fun getCurrentState : Forms.Loots.Import.States {
    currentState
  }

  fun submit (event : Html.Event) : Promise(Never, Void) {
    sequence {
      next { status = Api.Status::Loading }
      next { currentState = Forms.Loots.Import.States::Submitting }

      parsedBody = Debug.log(Json.parse(body) |> Maybe.withDefault(encode [] of String))
      encodedBody = encode { loots = parsedBody, password = password}

      request = 
        Http.post("/loots/imports") 
        |> Http.jsonBody(encodedBody)

      newStatus = Api.send(decoder, request)

      next { status = newStatus }
      next { 
        currentState = case (status) {
          Api.Status::Error => Forms.Loots.Import.States::Error
          => Forms.Loots.Import.States::Submitted
        }
      }
    }
  }

  fun decoder (object : Object) : Result(Object.Error, Map(String, Bool)) {
    decode object as Map(String, Bool)
  }
}
