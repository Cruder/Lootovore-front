component Pages.Equipments.Show {
  connect Stores.Equipment exposing { status }
  
  style base {
  }

  style equipment-info {
  }
 
  get data : Maybe(Aggregates.Equipment) {
    case (status) {
      Api.Status::Ok equipment => Maybe.just(equipment)
      => Maybe.nothing()
    }
  }

  get renderData : Html {
    Debug.log(data)
    |> Maybe.map(renderEquipment)
    |> Maybe.withDefault(<{}>)
  }

  fun renderEquipment(equipment : Aggregates.Equipment) : Html {
    <>
      <Molecules.FloatingCard>
        <Molecules.Equipment equipment={aggregateToLeaf(equipment)} />
      </Molecules.FloatingCard>
      <div::base>
        <Organisms.Loots.WishedCharacters loots={equipment.loots} />
      </div>
    </>
  }

  fun aggregateToLeaf(equipment : Aggregates.Equipment) : Leaf.Equipment {
    {
      id = equipment.id,
      name = equipment.name,
      icon = equipment.icon,
      wowheadUrl = equipment.wowheadUrl,
      itemId = equipment.itemId,
      quality = equipment.quality,
    }
  }

  fun render : Html {
    <Molecules.Status
      message="There was an error loading the equipment."
      loadingMessage="Loading equipment..."
      status={Api.toStatus(status)}>
      
      <{ renderData }>

    </Molecules.Status>
  }
}
