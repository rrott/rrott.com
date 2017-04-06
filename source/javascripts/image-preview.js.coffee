#= require portfolio

class ImagePreview
  constructor: ->
    @preview      = document.getElementById('preview')
    @spinner      = document.getElementById('spinner')
    @preview_img  = @preview.querySelector("#preview-image")
    @images_array = {images: [], current_image_id: 1}
    this.init()

  init: ->
    this._setUpPreviewEvents()

  setImagesArray: (images) ->
    @images_array = images

  togglePreview: =>
    @preview.style.display = this._elementVisability(@preview)

  changePreviewImage: =>
    image = @images_array.images[@images_array.current_image_id]
    preview = document.getElementsByClassName('preview-image-title')[0]
    preview.innerHTML = image.title
    @preview_img.src = ''
    @preview_img.src = image.src
    this.showLoadingIndivcator()

  showLoadingIndivcator: ->
    @spinner.style.display = 'block'
    @preview_img.classList.add("dark")
    window.clearInterval(window.intervalId)
    window.intervalId = window.setInterval(
      => this.updateSpinner()
      500
    )
    @preview_img.onload = =>
      @spinner.style.display = 'none'
      @preview_img.classList.remove("dark")
      window.clearInterval(window.intervalId)

  updateSpinner: ->
    message = @spinner.textContent
    if message == 'Loading...'
      @spinner.textContent = 'Loading'
    else
      @spinner.textContent = message + '.'

  _setUpPreviewEvents: ->
    @preview.onclick = (e) =>
      action =  window.Helpers.getTarget(e).id
      if this._isNextAction(action)
        this._showNextImage(action)
      else
        this.togglePreview()
      this.changePreviewImage()

  _isNextAction:(action) ->
    action != 'preview' && action != 'close'

  _showNextImage: (action) ->
    @images_array.current_image_id = this._defineCurrentImageId(action)

  _defineCurrentImageId: (action) ->
    increment = this._defineIncrement(action)
    max     = @images_array.images.length - 1; min = 0
    next    = @images_array.current_image_id + increment

    return min if next > max
    return max if next < min
    next

  _defineIncrement: (action) ->
    return  1 if action == 'next' || action == 'preview-image'
    return -1 if action == 'prev'

  _elementVisability: (element)=>
    if this._isElementShown(element) then 'none' else 'block'

  _isElementShown: (element) ->
    window.getComputedStyle(element).display == 'block'

window.ImagePreview = new ImagePreview()


