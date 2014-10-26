# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  new HomesliderCropper()

class HomesliderCropper
  constructor: ->
    $('#cropbox2').Jcrop
      aspectRatio: 3.4286 / 1
      setSelect: [0, 0, 960, 960]
      onSelect: @update
      onChange: @update
      bgColor: "black"
      bgOpacity: 0.4
      allowSelect: false
  
  update: (coords) =>
    $('#homeslider_crop_x').val(coords.x)
    $('#homeslider_crop_y').val(coords.y)
    $('#homeslider_crop_w').val(coords.w)
    $('#homeslider_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview2').css
                  width: Math.round(960/coords.w * $('#cropbox2').width()) + 'px'
                  height: Math.round(280/coords.h * $('#cropbox2').height()) + 'px'
                  marginLeft: '-' + Math.round(960/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(280/coords.h * coords.y) + 'px'