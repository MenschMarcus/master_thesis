class AreaChange.SEP extends AreaChange

  ##############################################################################
  #                            PUBLIC INTERFACE                                #
  ##############################################################################

  # ----------------------------------------------------------------------------
  constructor: (updateArea, oldName) ->

    # create member variables in base class constructor
    super()

    @updateArea = {
      area:     updateArea
      oldName:  oldName
      newName:  updateArea.name
    }

  # ----------------------------------------------------------------------------
  destroy: () ->
    # nothing to do, because no historical relationship was established