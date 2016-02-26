#= require helpers
class Portfolios
  constructor: ->
    @portfolio_list = document.getElementsByClassName('post-images')
    this.init()

  init: ->
    for portfolio in @portfolio_list
      new Portfolio(portfolio)

class Portfolio
  constructor:(portfolio) ->
    @preview = portfolio.querySelector(".project-img")
    @thumbs  = portfolio.getElementsByClassName('thumb')
    @images  =
      current_image_id: 1
      images: this._collectImagesList()
    this.init()

  init: ->
    this._setUpPreviewEvents()
    this._setUpThumbEvents()

  _setUpPreviewEvents: ->
    @preview.onclick = (e) =>
      this._triggerEvent(e)

  _setUpThumbEvents: =>
    for thumb in @thumbs
      thumb.onclick = (e) =>
        this._triggerEvent(e)

  _triggerEvent: (e) ->
    e.preventDefault()
    @images.current_image_id = parseInt window.Helpers.getTarget(e).getAttribute('data-index')
    #TODO: refactor to not to use ImagePreview
    ImagePreview.setImagesArray @images
    ImagePreview.togglePreview()

  _collectImagesList: ->
    list = new Array
    for thumb, index in @thumbs
      list.push(
        src:   thumb.href
        title: thumb.title
        id:    index
      )
    return list

window.Portfolios = new Portfolios()
window.Portfolio  = Portfolio
