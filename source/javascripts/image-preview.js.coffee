#= require portfolio

class ImagePreview
  constructor: ->
    @preview      = document.getElementById('preview')
    @preview_img  = @preview.querySelector("#preview-image")
    @images_array = {images: [], current_image_id: 1}
    this.initAllevents()

  initAllevents: ->
    #TODO: refactor once site is online
    @preview.onclick = (e) =>
      el =  window.Helpers.getTarget(e).id
      if el == 'preview' || el == 'close'
        this.togglePreview()
      if el == 'next' || el == 'preview-image'
        this.change_id(1)
      if el == 'prev'
        this.change_id(-1)
      this.changePreviewImage()

  change_id: (id) ->
    #TODO: refactor once site is online
    current = @images_array.current_image_id

    increment = if current + id >= @images_array.images.length
      0
    else if current + id < 0
      @images_array.images.length - 1
    else
      current + id
    @images_array.current_image_id = increment

  setImagesArray: (images) ->
    @images_array = images

  togglePreview: =>
    this.changePreviewImage()
    @preview.style.display = this._previewVisability()

  changePreviewImage: =>
    image = @images_array.images[@images_array.current_image_id]
    document.getElementsByClassName('preview-image-title')[0].innerHTML = image.title
    @preview_img.src = image.src

  _previewVisability: =>
    if this._isPreviewShown() then 'none' else 'block'

  _isPreviewShown: ->
    window.getComputedStyle(@preview).display == 'block'

window.ImagePreview = new ImagePreview()


