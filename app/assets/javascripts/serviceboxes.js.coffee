# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  new ServiceboxCropper()

class ServiceboxCropper
  constructor: ->
    $('#cropbox4').Jcrop
      aspectRatio: 2
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
      bgColor: "black"
      bgOpacity: 0.4
      allowSelect: false
  
  update: (coords) =>
    $('#servicebox_crop_x').val(coords.x)
    $('#servicebox_crop_y').val(coords.y)
    $('#servicebox_crop_w').val(coords.w)
    $('#servicebox_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview4').css
                  width: Math.round(290/coords.w * $('#cropbox4').width()) + 'px'
                  height: Math.round(145/coords.h * $('#cropbox4').height()) + 'px'
                  marginLeft: '-' + Math.round(290/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(145/coords.h * coords.y) + 'px'