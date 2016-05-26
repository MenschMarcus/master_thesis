################################################################################
# AreaChange <-> HistoricalGeographicOperation
#
# ------------------------------------------------------------------------------
# operation             area change terr change name change
# id    name            old -> new  old -> new  old -> new
# ------------------------------------------------------------------------------
# UNI - Unification     1+  -> 1    -           -
# INC - Incorporation   1+  -> 1    1   -> 1    -
# SEP - Separation      1   -> 2+   -           -
# SEC - Secession       1   -> 1+   1   -> 1    -
# NCH - Name Change     -           -           1   -> 1
################################################################################


class AreaChange

  ##############################################################################
  #                            PUBLIC INTERFACE                                #
  ##############################################################################

  # ----------------------------------------------------------------------------
  constructor: () ->

    # init members
    @oldAreas = []                # Area
    @newAreas = []                # Area
    @oldAreaNames = []            # AreaName
    @newAreaNames = []            # AreaName
    @oldAreaTerritories = []      # AreaTerritory
    @newAreaTerritories = []      # AreaTerritory


  # ----------------------------------------------------------------------------
  execute: () ->

    # forward change
    if direction is 1

      for newArea in @newAreas
        newArea.handle.show()

      for oldArea in @oldAreas
        oldArea.handle.hide()

      for newName in @newAreaNames
        if newName isnt newName.area.name
          newName.area.name = newName
          newName.area.handle.update()

      for newTerritory in @newAreaTerritories
        if newTerritory isnt newTerritory.area.name
          newTerritory.area.territory = newTerritory
          newTerritory.area.handle.update()


    # backward change
    else # direction is -1

      for newArea in @newAreas
        newArea.handle.hide()

      for oldArea in @oldAreas
        oldArea.handle.show()

      for oldName in @oldAreaNames
        if oldName isnt oldName.area.name
          oldName.area.name = oldName
          oldName.area.handle.update()

      for oldTerritory in @oldAreaTerritories
        if oldTerritory isnt oldTerritory.area.name
          oldTerritory.area.territory = oldTerritory
          oldTerritory.area.handle.update()