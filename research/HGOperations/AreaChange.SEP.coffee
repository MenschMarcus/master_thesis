class AreaChange.SEP extends AreaChange

  ##############################################################################
  #                            PUBLIC INTERFACE                                #
  ##############################################################################

  # ----------------------------------------------------------------------------
  constructor: (oldArea, newAreas) ->

    # create member variables in base class constructor
    super()

    @_oldAreas[0] =  oldArea
    @_newAreas =     newAreas

    # establish historical relationships
    for newArea in @_newAreas
      oldArea.successors.push(newArea)
      newArea.predecessors.push(oldArea)

  # ----------------------------------------------------------------------------
  destroy: () ->
    # remove historical relationships
    oldArea = @_oldAreas[0]
    for newArea in @_newAreas
      succIdx = oldArea.successors.indexOf(newArea)
      oldArea.successors.splice(succIdx,1)
      predIdx = newArea.predecessors.indexOf(oldArea)
      newArea.predecessors.splice(predIdx,1)