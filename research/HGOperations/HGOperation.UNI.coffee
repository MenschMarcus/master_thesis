class HistoricalGeographicOperation.UNI extends HistoricalGeographicOperation

  ##############################################################################
  #                            PUBLIC INTERFACE                                #
  ##############################################################################

  # ----------------------------------------------------------------------------
  constructor: (oldAreas, newArea) ->

    # create member variables in base class constructor
    super()

    @_oldAreas =     oldAreas
    @_newAreas[0] =  newArea

    # establish historical relationships
    for oldArea in @_oldAreas
      oldArea.successors.push(newArea)
      newArea.predecessors.push(oldArea)

  # ----------------------------------------------------------------------------
  destroy: () ->
    # remove historical relationships
    newArea = @_newAreas[0]
    for oldArea in @_oldAreas
      succIdx = oldArea.successors.indexOf(newArea)
      oldArea.successors.splice(succIdx,1)
      predIdx = newArea.predecessors.indexOf(oldArea)
      newArea.predecessors.splice(predIdx,1)