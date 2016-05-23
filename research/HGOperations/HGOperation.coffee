class HistoricalGeographicOperation

  ##############################################################################
  #                            PUBLIC INTERFACE                                #
  ##############################################################################

  # ----------------------------------------------------------------------------
  constructor: () ->

    # init members
    @_oldAreas = []         # Area
    @_newAreas = []         # Area
    @_updateArea = {
      area :         null   # Area
      oldName :      null   # AreaName
      newName :      null   # AreaName
      oldTerritory : null   # AreaTerritory
      newTerritory : null   # AreaTerritory
    }

  # ----------------------------------------------------------------------------
  destroy: () ->

    # what to do?

  # ----------------------------------------------------------------------------
  execute: () ->
    # forward change
    if direction is 1
      for newArea in newAreas
        newArea.show()
      for oldArea in oldAreas
        oldArea.hide()
      if updateArea.newName
        updateArea.area.name = updateArea.newName
      if updateArea.newTerritory
        updateArea.area.territory = updateArea.newTerritory

    # backward change
    else
      for oldArea in oldAreas
        oldArea.show()
      for newArea in newAreas
        newArea.hide()
      if updateArea.newName
        updateArea.area.name = updateArea.oldName
      if updateArea.newTerritory
        updateArea.area.territory = updateArea.oldTerritory