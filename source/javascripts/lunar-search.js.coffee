#= require lunr.min

class LunarSearch
  constructor: ->
    @searchButton = document.getElementById('search-submit')
    @searchText   = document.getElementById('search-field')
    @resultsPlace = document.getElementById('results')
    @xmlHttp      = new XMLHttpRequest
    this.getIndex()
    this.registerEvents()

  getIndex: ->
    @xmlHttp.onreadystatechange = =>
      this.initLunar this.data() if this.isfetched()
    this.sendRequest()

  search: ->
    result = @lunrIndex.search(@searchText.value)

  renderResult: (result) ->
    @resultsPlace.innerHTML = ""
    result.length > 0 &&  this._renderLink(result) or this._renderError()

  sendRequest: ->
    @xmlHttp.open 'get', '/search.json'
    @xmlHttp.send()

  initLunar: (data)->
    @lunrData = data
    @lunrIndex = lunr.Index.load @lunrData.index

  data: ->
    JSON.parse(@xmlHttp.responseText)

  registerEvents: ->
    @searchButton.onclick = (event) =>
      event.preventDefault()
      result = this.search()
      this.renderResult(result)

  isfetched: ->
    @xmlHttp.readyState == 4 and @xmlHttp.status == 200

  _renderLink: (result) ->
    foundData = this._lunrData(result)
    for res in foundData
      item = document.createElement('li')
      item.className = "search-result"
      a = document.createElement('a')
      a.href = res.url
      a.innerHTML = res.title
      item.appendChild document.innerHTML = a
      @resultsPlace.appendChild item

  _renderError: ->
    item = document.createElement('div')
    item.className = "red"
    item.appendChild document.createTextNode("Nothing Found =(")
    @resultsPlace.appendChild item

  _lunrData:(result) ->
    foundData = []
    result.forEach( (res) =>
      foundData.push @lunrData.docs[res.ref]
    )
    foundData

window.LunarSearch = new LunarSearch()
