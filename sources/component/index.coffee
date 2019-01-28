import * as PIXI from 'pixi.js'

import siderBar from './siderBar'

import icon from './icon'

export default (line) => 
  totalContainer = new PIXI.Container()
  totalContainer.width = window.width
  totalContainer.height = window.height
  totalContainer.addChild siderBar()
  onDragStart = (event) -> 
    @data = event.data
    @alpha = 0.5
    @dragging = true
  
  onDragEnd = () -> 
    @alpha = 1
    @dragging = false
    @data = null
  onDragMove = () -> 
    if @dragging
      totalContainer.addChild icon onDragStart, onDragEnd, onDragMove, line
      newPosition = @data.getLocalPosition @parent
      @x = newPosition.x
      @y = newPosition.y

  totalContainer.addChild icon onDragStart, onDragEnd, onDragMove, line

  totalContainer
