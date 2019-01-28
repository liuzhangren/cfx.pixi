import * as PIXI from 'pixi.js'

{
  Graphics
  Container
} = PIXI

export default (line) => 
  leftDown = new PIXI.Graphics()
  leftDown.beginFill 0xff0000
  leftDown.lineStyle 2, 0xffffff
  leftDown.alpha = 0.5
  leftDown.moveTo 50, 50
  leftDown.lineTo 10, 50
  leftDown.moveTo 50, 50
  leftDown.lineTo 50, 90
  leftDown.arc 50, 50, 40, 0.5 * Math.PI, Math.PI
  leftDown.interactive = true
  leftDown.on 'pointerdown', () ->
    # console.log '我是左下的操作', @
    @parent.parent.visible = false
  
  leftUp = new PIXI.Graphics()
  leftUp.beginFill 0xff0000
  leftUp.lineStyle 2, 0xffffff
  leftUp.alpha = 0.5
  leftUp.moveTo 50, 50
  leftUp.lineTo 50, 10
  leftUp.moveTo 50, 50
  leftUp.lineTo 10, 50
  leftUp.arc 50, 50, 40, Math.PI, 1.5 * Math.PI
  leftUp.interactive = true
  leftUp.on 'pointerdown', () ->
    console.log '我是左上的操作'
  
  rightUp = new PIXI.Graphics()
  rightUp.alpha = 0.5
  rightUp.beginFill 0xff0000
  rightUp.lineStyle 2, 0xffffff
  rightUp.moveTo 50, 50
  rightUp.lineTo 50, 10
  rightUp.moveTo 50, 50
  rightUp.lineTo 90, 50
  rightUp.arc 50, 50, 40, 2 * Math.PI, -0.5 * Math.PI
  rightUp.on 'pointerdown', () ->
    console.log '我是右上的操作'
  rightUp.interactive = true
  
  rightDown = new PIXI.Graphics()
  rightDown.alpha = 0.5
  rightDown.beginFill 0xff0000
  rightDown.lineStyle 2, 0xffffff
  rightDown.moveTo 50, 50
  rightDown.lineTo 50, 90
  rightDown.moveTo 50, 50
  rightDown.lineTo 90, 50
  rightDown.arc 50, 50, 40, 0, 0.5 * Math.PI
  rightDown.on 'pointerdown', line
    # console.log '我是右下的操作'
    # body = document.getElementsByTagName 'body'
    # body[0].onclick = (event) ->

  rightDown.interactive = true
  
  options = new Container()
  options.addChild leftDown
  options.addChild leftUp
  options.addChild rightDown
  options.addChild rightUp
  options.visible = false
  
  options
