class AreaChange.SEC extends AreaChange

  ##############################################################################
  #                            PUBLIC INTERFACE                                #
  ##############################################################################

  # ----------------------------------------------------------------------------
  constructor: (preserveArea, oldTerritory, newAreas) ->

    # create member variables in base class constructor
    super()

    @_newAreas =    newAreas
    @_updateArea = {
      area:         preserveArea
      oldTerritory: oldTerritory
      newTerritory: preserveArea.territory
    }

    # establish historical relationships
    for newArea in @_newAreas
      preserveArea.successors.push(newArea)
      newArea.predecessors.push(preserveArea)

  # ----------------------------------------------------------------------------
  destroy: () ->
    # remove historical relationships
    preserveArea =  @_updateArea.area
    for newArea in @_newAreas
      succIdx = preserveArea.successors.indexOf(newArea)
      preserveArea.successors.splice(succIdx,1)
      predIdx = newArea.predecessors.indexOf(preserveArea)
      newArea.predecessors.splice(predIdx,1)