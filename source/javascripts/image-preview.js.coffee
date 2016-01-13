class ImagePreview
  constructor: ->
    @post_images = document.getElementsByClassName('post-images')
    @preview_img = document.getElementById('preview-image')
    @preview     = document.getElementById('preview')

    this.startSlideShow()
    @keys = {37: 1, 38: 1, 39: 1, 40: 1}

  events: ->
    @preview.onclick = (e) => this.togglePreview()
    @preview_img = (e) => this.showNextImage()

  togglePreview: =>
    @preview.style.display = this._previewVisability()
    if this._isPreviewShown()
      this._disableScroll()
    else
      this._enableScroll()

  showNextImage: =>
    console.log 'nexy'

  startSlideShow: ->
    this.events()
    for post_image in @post_images
      this.setUpImage post_image


  setUpImage: (post_image) ->
    large_image  = post_image.querySelector(".largeImg")
    thumbs      = post_image.querySelector("#thumbs")
    that = this
    #addEventListener
    large_image.onclick = (e) =>
      e.preventDefault()
      @preview.childNodes[1].src = e.target.src
      this.togglePreview()

    thumbs.onclick = (e) ->
      e.preventDefault()
      target = e.target
      while target != this
        if target.nodeName == 'A'
          large_image.src = target.href
          large_image.alt = target.title
          that.preview.childNodes[1].src = target.href
          that.togglePreview()
        target = target.parentNode if target

  _previewVisability: =>
    if this._isPreviewShown() then 'none' else 'block'

  _isPreviewShown: ->
    window.getComputedStyle(@preview).display == 'block'

  _preventDefault: (e) ->
    e = e or window.event
    if e.preventDefault
      e.preventDefault()
    e.returnValue = false

  _preventDefaultForScrollKeys: (e) ->
    if @keys[e.keyCode]
      this._preventDefault e

  _disableScroll: ->
    if window.addEventListener
      window.addEventListener 'DOMMouseScroll', this._preventDefault, false
    window.onwheel = this._preventDefault
    window.onmousewheel = document.onmousewheel = this._preventDefault
    window.ontouchmove = this._preventDefault
    document.onkeydown = this._preventDefaultForScrollKeys

  _enableScroll: ->
    if window.removeEventListener
      window.removeEventListener 'DOMMouseScroll', this._preventDefault, false
    window.onmousewheel = document.onmousewheel = null
    window.onwheel = null
    window.ontouchmove = null
    document.onkeydown = null


window.ImagePreview = new ImagePreview()



