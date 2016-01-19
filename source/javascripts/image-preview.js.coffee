class ImagePreview
  constructor: ->
    @post_images = document.getElementsByClassName('post-images')
    @preview_img = document.getElementById('preview-image')
    @preview     = document.getElementById('preview')
    this.initAllevents()

  initAllevents: ->
    @preview.onclick = (e) =>
      if e.srcElement.className == 'preview'
        this.togglePreview()

    @preview_img.onclick = (e) => this.showNextImage(e)

    for post_image in @post_images
      this._setUpImageEvent post_image

  togglePreview: =>
    @preview.style.display = this._previewVisability()

  showNextImage: =>
    console.log 'next'

  _changeLargePicture: (large_image, src) ->
    @preview_img.src = src.href
    large_image.parentNode.href  = src.href
    large_image.src  = src.href
    large_image.alt  = src.title

  _setUpImageEvent: (post_image) ->
    large_image  = post_image.querySelector(".large-img")
    thumbs       = post_image.getElementsByClassName('thumb')

    large_image.onclick = (e) =>
      e.preventDefault()
      src = e.target.parentNode
      this._changeLargePicture(large_image, src)
      this.togglePreview()
    this._setUpThumbEvents(large_image, thumbs)

  _setUpThumbEvents: (large_image, thumbs) =>
    for thumb in thumbs
      thumb.onclick = (e) =>
        e.preventDefault()
        src = e.target.parentNode
        this._changeLargePicture(large_image, src)

  _previewVisability: =>
    if this._isPreviewShown() then 'none' else 'block'

  _isPreviewShown: ->
    window.getComputedStyle(@preview).display == 'block'


window.ImagePreview = new ImagePreview()



