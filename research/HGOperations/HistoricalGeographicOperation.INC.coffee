class HistoricalGeographicOperation.INC extends HistoricalGeographicOperation

  ##############################################################################
  #                            PUBLIC INTERFACE                                #
  ##############################################################################

  # ----------------------------------------------------------------------------
  constructor: (preserveArea, oldTerritory, oldAreas) ->

    # create member variables in base class constructor
    super()

    @_oldAreas =    oldAreas
    @_updateArea = {
      area:         preserveArea
      oldTerritory: oldTerritory
      newTerritory: preserveArea.territory
    }

    # establish historical relationships
    for oldArea in oldAreas
      oldArea.successors.push(preserveArea)
      preserveArea.predecessors.push(oldArea)

  # ----------------------------------------------------------------------------
  destroy: () ->
    # remove historical relationships
    preserveArea =  @_updateArea.area
    for oldArea in oldAreas
      succIdx = oldArea.successors.indexOf(preserveArea)
      oldArea.successors.splice(succIdx,1)
      predIdx = preserveArea.predecessors.indexOf(oldArea)
      preserveArea.predecessors.splice(predIdx,1)
