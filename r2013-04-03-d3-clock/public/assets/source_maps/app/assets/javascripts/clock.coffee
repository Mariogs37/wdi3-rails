window.app =
  ready: ->
    setInterval(app.time, 1000)
    setInterval(app.show_stairs, 1000)

  time: ->
    time = moment().format('MMMM Do YYYY, h:mm:ss a')
    $('#time')
      .text(time)
  show_stairs: ->
    sec = moment().format('s').toNumber()
    rects = d3.select('svg').selectAll('rect').data([1..sec])
    rects.enter()
      .append('rect')
      .attr('width', 10)
      .attr('height', 2)
      .attr('x', (d) -> ((d - 1) * 10))
      .attr('y', (d) -> ((d - 1) * 2))
    rects.exit()
      .transition()
      .attr('width', 0)
      .height('height', 0)
      .remove()
  show_clock: ->
    sec = moment().format('s').toNumber()
    three = sec % 3
    ten = sec % 10
    colors = ['red', 'green', 'blue', 'purple', 'yellow', 'orange', 'brown', 'black']
    d3.select('.three')
      .transition()
      .duration(1000)
      .attr('r', three * 10)
      .style('fill', colors[three])

    d3.select('.ten')
      .transition()
      .duration(1000)
      .attr('r', ten * 10)
      .style('fill', colors[ten])

$(document).ready(app.ready)
