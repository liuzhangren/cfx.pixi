import * as PIXI from 'pixi.js'

import total from './component'

{
  Application
  Graphics
  Container
} = PIXI

app = new Application window.screen.width, window.screen.height, {
  backgroundColor: 0xeef1f5,
  transparent: true
}

{view, stage} = app

line = () -> 
  self = @
  mouse = (delta) -> 
    promise = new Promise (resolve, reject) =>
      mouseposition = app.renderer.plugins.interaction.mouse.global
      line = new Graphics()
      line.lineStyle 2, 0xFF00FF
      line.moveTo self.parent.parent.x+50, self.parent.parent.y+50
      line.lineTo mouseposition.x, mouseposition.y
      stage.addChild line
      resolve line
    promise.then (value) ->
      stage.removeChild value
  app.ticker.add mouse
  (document.getElementsByTagName 'body')[0].onclick = (event) -> 
    e = event || window.event
    scrollX = document.documentElement.scrollLeft || document.body.scrollLeft
    scrollY = document.documentElement.scrollTop || document.body.scrollTop
    x = e.pageX || e.clientX + scrollX
    y = e.pageY || e.clientY + scrollY
    if x > self.parent.parent.x+90 or x < self.parent.parent.x+10 or y > self.parent.parent.y+90 or y < self.parent.parent.y+10
      bool = true
    if bool
      app.ticker.remove mouse
      lineshi = new Graphics()
      lineshi.lineStyle 2, 0xFF00FF
      lineshi.moveTo self.parent.parent.x+50, self.parent.parent.y+50
      lineshi.lineTo x, y
      circle = new Graphics();
      circle.beginFill 0x9966FF
      circle.drawCircle 0, 0, 6
      circle.endFill();
      circle.x = x
      circle.y = y
      container = new Container()
      container.interactive = true
      container.on 'pointerdown', () ->
        @visible = false
      container.addChild circle, lineshi
      stage.addChild container
      (document.getElementsByTagName 'body')[0].onclick = null
window.onload = => 
  document.body.appendChild view
  stage.addChild total line
