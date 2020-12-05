record Stores.Character {
  id : Number,
  name : String,
  klass : String,
  icon : String,
  loots : Array(Stores.Loot)
}

record Stores.Loot {
  wish : String,
  date : String,
  nbVote : Number using "nb_vote",
  equipment : Stores.Equipment
}

record Stores.Equipment {
  name : String,
  icon : String,
  wowheadUrl : String using "wowhead_url",
  itemId : Number using "item_id",
  quality : String
}

store Stores.Character {
  state status : Api.Status(Stores.Character) = Api.Status::Initial

  fun reset : Promise(Never, Void) {
    next { status = Api.Status::Initial }
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

  fun decoder (object : Object) : Result(Object.Error, Stores.Character) { 
    decode object as Stores.Character
  }
}
