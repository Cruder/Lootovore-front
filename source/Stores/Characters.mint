record Stores.Characters.Character {
  id : Number,
  name : String,
  klass : String,
  icon : String,
  lootCount : Map(String, Number) using "loot_count",
  lastLoot : Maybe(Stores.Loot) using "last_loot",
  loots: Array(Stores.Loot)
}

store Stores.Characters {
  const CLASSES = [
    "paladin", 
    "warlock", 
    "mage", 
    "druid", 
    "priest", 
    "hunter", 
    "rogue", 
    "shaman", 
    "warrior"
  ]

  state status : Api.Status(Array(Stores.Characters.Character)) = Api.Status::Initial

  state currentKlasses : Array(String) = []

  fun reset : Promise(Never, Void) {
    next { status = Api.Status::Initial }
  }

  fun load : Promise(Never, Void) {
    sequence {
      next { currentKlasses = CLASSES }
      next { status = Api.Status::Loading }

      request = Http.get("/characters")

      newStatus = 
        Api.send(decoder, request)

      next { status = newStatus }
    }
  }

  fun loadKlasses(klasses : Array(String)) : Promise(Never, Void) {
    sequence {
      next { currentKlasses = klasses }
      next { status = Api.Status::Loading }

      klassesStr = klasses 
      |> Array.map((klass : String) : String { "klasses[]=#{klass}" })
      |> Array.intersperse("&")
      |> Array.reduce("", (acc : String, i : String) : String { acc + i })

      request = Http.get("/characters?#{klassesStr}")

      newStatus = 
        Api.send(decoder, request)

      next { status = newStatus }
    }
  }

  fun decoder (object : Object) : Result(Object.Error, Array(Stores.Characters.Character)) { 
    decode object as Array(Stores.Characters.Character)
  }
}
