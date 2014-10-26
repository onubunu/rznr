# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  new EmployeesCropper()

class EmployeesCropper
  constructor: ->
    $('#cropbox6').Jcrop
      aspectRatio: 4 / 5
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
      bgColor: "black"
      bgOpacity: 0.4
      allowSelect: false
  
  update: (coords) =>
    $('#employee_crop_x').val(coords.x)
    $('#employee_crop_y').val(coords.y)
    $('#employee_crop_w').val(coords.w)
    $('#employee_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview6').css
                  width: Math.round(135/coords.w * $('#cropbox6').width()) + 'px'
                  height: Math.round(180/coords.h * $('#cropbox6').height()) + 'px'
                  marginLeft: '-' + Math.round(135/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(180/coords.h * coords.y) + 'px'