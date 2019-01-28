import * as PIXI from 'pixi.js'

{Graphics} = PIXI

export default => 
  graphics = new PIXI.Graphics()
  graphics.lineStyle 2, 0xFF00FF, 1
  graphics.drawRect 0, 0, 200, window.screen.height
  graphics.endFill();
  
  graphics
