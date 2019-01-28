import * as PIXI from 'pixi.js'

import total from './component'

{
  Application
} = PIXI

app = new Application window.screen.width, window.screen.height, {
  backgroundColor: 0xeef1f5,
  transparent: true
}

{view, stage} = app
line = () -> 
  app.ticker.add (delta) -> 
    mouseposition = app.renderer.plugins.interaction.mouse.global
    console.log mouseposition.x, mouseposition.y
    
window.onload = => 
  document.body.appendChild view
  return stage.addChild total line
