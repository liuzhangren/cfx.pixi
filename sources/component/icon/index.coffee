import * as PIXI from 'pixi.js'

import sprite from './sprite'

import options from './options'

filterOn = () -> 
  if this.x > 200
    @children[1].visible = true

filterOff = () ->
  if @x > 200
    @children[1].visible = false

createSprite = (onDragStart, onDragEnd, onDragMove, line) => 
  container = new PIXI.Container()
  container.addChild sprite()
  container.addChild options line
  container.interactive = true
  container.on 'pointerover', filterOn
  container.on 'pointerout', filterOff
  container.on 'pointerdown', onDragStart
  container.on 'pointerup', onDragEnd
  container.on 'pointerupoutside', onDragEnd
  container.on 'pointermove', onDragMove
  
  container

export default createSprite
