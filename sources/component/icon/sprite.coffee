import * as PIXI from 'pixi.js'

{ Sprite } = PIXI

export default  => 
  sprite = new PIXI.Sprite.from 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/693612/IaUrttj.png'
  sprite.anchor.set 0.5
  #sprite.scale.set(0.25)
  sprite.x = 50
  sprite.y = 50
  #sprite.interactive = true
  sprite
