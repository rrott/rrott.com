class ImagePreview
  constructor: ->
    @portfolios   = document.getElementsByClassName('post-images')
    @preview      = document.getElementById('preview')
    @preview_img  = @preview.querySelector("#preview-image")
    @images_array = {images: [], current_image: 1}
    this.initAllevents()

  initAllevents: ->
    #TODO: refactor once site is online
    @preview.onclick = (e) =>
      el =  this.getTarget(e).id
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

  getTarget: (e) ->
    target = if (e.target) then e.target else e.srcElement
    if (target.nodeType == 3) then target = target.parentNode
    target

  _setUpImageEvent: (post_image) ->
    project_image_preview  = post_image.querySelector(".project-img")
    project_thumbs         = post_image.getElementsByClassName('thumb')

    project_images =
      current_image: 1
      images: this._collectImagesList(project_thumbs)

    this._setUpThumbEvents(project_images, project_thumbs)

    project_image_preview.onclick = (e) =>
      e.preventDefault()
      @images_array = project_images
      this.togglePreview()



  _collectImagesList: (thumbs) ->
    list = []
    for thumb, index in thumbs
      list.push(src: thumb.href, title: thumb.title, id: index)
    list

  _setUpThumbEvents: (project_images, thumbs) =>
    for thumb in thumbs
      thumb.onclick = (e) =>
        e.preventDefault()
        project_images.current_image = parseInt this.getTarget(e).getAttribute('value')
        @images_array = project_images
        this.togglePreview()

  _previewVisability: =>
    if this._isPreviewShown() then 'none' else 'block'

  _isPreviewShown: ->
    window.getComputedStyle(@preview).display == 'block'


window.ImagePreview = new ImagePreview()



