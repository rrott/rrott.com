class ImagePreview
  constructor: ->
    @portfolios = document.getElementsByClassName('post-images')
    @preview     = document.getElementById('preview')
    @preview_img = @preview.querySelector("#preview-image")
    @images_array = {images: [], current_image: 1}
    this.initAllevents()

  initAllevents: ->
    #TODO: refactor once site is online
    @preview.onclick = (e) =>
      el =  e.srcElement.id
      if el == 'preview' || el == 'close'
        this.togglePreview()
      if el == 'next' || el == 'preview-image'
        this.change_id(1)
      if el == 'prev'
        this.change_id(-1)
      this.changeImage()

    for post_image in @portfolios
      this._setUpImageEvent post_image

  change_id: (id) ->
    #TODO: refactor once site is online
    current = @images_array.current_image
    increment = if current + id >= @images_array.images.length
      0
    else if current + id < 0
      @images_array.images.length - 1
    else
      current + id
    @images_array.current_image = increment

  togglePreview: =>
    this.changeImage()
    @preview.style.display = this._previewVisability()

  changeImage: =>
    image = @images_array.images[@images_array.current_image]
    document.getElementsByClassName('preview-image-title')[0].innerHTML = image.title
    @preview_img.src = image.src

  _changeLargePicture: (project_image, src) ->
    @preview_img.src = src.href
    project_image.parentNode.href  = src.href
    project_image.src  = src.href
    project_image.alt  = src.title

  _setUpImageEvent: (post_image) ->
    project_image  = post_image.querySelector(".project-img")
    project_image.current_image  = 1
    thumbs       = post_image.getElementsByClassName('thumb')

    project_image.images =  this._collectImagesList(thumbs)

    project_image.onclick = (e) =>
      this._showImage(e, project_image)
      this.togglePreview()

    this._setUpThumbEvents(project_image, thumbs)

  _showImage: (e, project_image) =>
    e.preventDefault()
    @images_array.images = project_image.images
    @images_array.current_image = parseInt(project_image.current_image)

    src = e.target.parentNode
    this._changeLargePicture(project_image, src)


  _collectImagesList: (thumbs) ->
    list = []
    for thumb, index in thumbs
      list.push(src: thumb.href, title: thumb.title, id: index)
    list

  _setUpThumbEvents: (project_image, thumbs) =>
    for thumb in thumbs
      thumb.onclick = (e) =>
        project_image.current_image = thumb.getAttribute('index')
        this._showImage(e, project_image)


  _previewVisability: =>
    if this._isPreviewShown() then 'none' else 'block'

  _isPreviewShown: ->
    window.getComputedStyle(@preview).display == 'block'


window.ImagePreview = new ImagePreview()



