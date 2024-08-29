const robot = require('robotjs')
const tabs = [180, 400, 620, 840]
let index = 0

setInterval(() => {
  const { x, y } = robot.getMousePos()
  const position = {
    x: tabs[index],
    y: 45,
  }

  robot.moveMouse(position.x, position.y)
  robot.mouseClick()
  index++

  if (index >= tabs.length) {
    index = 0
  }
}, 20000)
