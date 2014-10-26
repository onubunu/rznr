# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	new LogoCropper()

class LogoCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 4
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
      bgColor: "black"
      bgOpacity: 0.4
      allowSelect: false
  
  update: (coords) =>
    $('#setting_crop_x').val(coords.x)
    $('#setting_crop_y').val(coords.y)
    $('#setting_crop_w').val(coords.w)
    $('#setting_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview').css
                  width: Math.round(280/coords.w * $('#cropbox').width()) + 'px'
                  height: Math.round(70/coords.h * $('#cropbox').height()) + 'px'
                  marginLeft: '-' + Math.round(280/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(70/coords.h * coords.y) + 'px'