store Stores.Character {
  state status : Api.Status(Aggregates.Character) = Api.Status::Initial

  fun reset : Promise(Never, Void) {
    next { status = Api.Status::Initial }
  }

  fun setCharacter(character : Aggregates.Character) : Promise(Never, Void) {
    next { status = Api.Status::Ok(character) }
  }

  fun load(id : String) : Promise(Never, Void) {
    sequence {
      next { status = Api.Status::Loading }

      request = Http.get("/characters/#{id}")

      newStatus = 
        Api.send(decoder, request)

      next { status = newStatus }
    }
  }

  fun decoder (object : Object) : Result(Object.Error, Aggregates.Character) { 
    decode object as Aggregates.Character
  }
}
