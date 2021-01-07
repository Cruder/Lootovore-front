store Stores.Equipment {
  state status : Api.Status(Aggregates.Equipment) = Api.Status::Initial

  fun reset : Promise(Never, Void) {
    next { status = Api.Status::Initial }
  }

  fun isLoaded : Bool {
    case (status) {
      Api.Status::Ok loots => true
      => false
    }
  }

  fun load(id : String) : Promise(Never, Void) {
    sequence {
      next { status = Api.Status::Loading }

      request = Http.get("/equipments/#{id}")

      newStatus = 
        Api.send(decoder, request)

      next { status = Debug.log(newStatus) }
    }
  }

  fun decoder (object : Object) : Result(Object.Error, Aggregates.Equipment) { 
    decode Debug.log(object) as Aggregates.Equipment
  }
}
