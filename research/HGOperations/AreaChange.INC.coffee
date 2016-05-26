class HG.AreaChange.INC extends HG.AreaChange

  ##############################################################################
  #                            PUBLIC INTERFACE                                #
  ##############################################################################

  # ----------------------------------------------------------------------------
  constructor: (preserveArea, oldTerritory, oldAreas) ->

    # create member variables in base class constructor
    super()

    ## establish double links

    # AreaChange <-> preserveArea
    @updateAreas[0] = preserveArea
    preserveArea.updateChanges.push @

    # AreaChange <-> oldAreas
    for area in oldAreas
      @oldAreas.push area
      area.endChange = @

    # AreaChange <-> oldTerritory
    @oldAreaTerritories[0] = oldTerritory
    oldTerritory.endChange = @

    # AreaChange <-> newTerritory
    newTerritory = preserveArea.territory
    @newAreaTerritories[0] = newTerritory
    newTerritory.startChange = @

    ## establish historical relationships
    for oldArea in oldAreas
      oldArea.successors.push preserveArea
      preserveArea.predecessors.push oldArea

  # ----------------------------------------------------------------------------
  destroy: () ->

    ## remove historical relationships
    preserveArea = @updateAreas[0]
    for oldArea in @oldAreas
      succIdx = oldArea.successors.indexOf preserveArea
      oldArea.successors.splice succIdx,1
      predIdx = preserveArea.predecessors.indexOf oldArea
      preserveArea.predecessors.splice predIdx,1

    ## remove double-links

    # AreaChange <-> preserveArea
    updIdx = preserveArea.updateChanges.indexOf @
    preserveArea.updateChanges.splice updIdx,1

    # AreaChange <-> oldAreas
    for area in @oldAreas
      area.endChange = null

    # AreaChange <-> oldTerritory
    @oldAreaTerritories[0].endChange = null

    # AreaChange <-> newTerritory
    @newAreaTerritories[0].startChange = null