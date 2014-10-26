# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  new HomeboxCropper()

class HomeboxCropper
  constructor: ->
    $('#cropbox3').Jcrop
      aspectRatio: 2
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
      bgColor: "black"
      bgOpacity: 0.4
      allowSelect: false
  
  update: (coords) =>
    $('#homebox_crop_x').val(coords.x)
    $('#homebox_crop_y').val(coords.y)
    $('#homebox_crop_w').val(coords.w)
    $('#homebox_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview3').css
                  width: Math.round(290/coords.w * $('#cropbox3').width()) + 'px'
                  height: Math.round(145/coords.h * $('#cropbox3').height()) + 'px'
                  marginLeft: '-' + Math.round(290/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(145/coords.h * coords.y) + 'px'