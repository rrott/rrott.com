#= require lunr.min

class LunarSearch
  constructor: ->
    @searchButton = document.getElementById('search-submit')
    @searchText   = document.getElementById('search-field')
    @resultsPlace = document.getElementById('results')
    @xmlHttp      = new XMLHttpRequest
    this.getIndex()
    this.events()

  getIndex: ->
    @xmlHttp.onreadystatechange = =>
      this.initLunar this.data() if this.isfetched()
    this.sendRequest()

  search: ->
    result = @lunrIndex.search(@searchText.value)

  renderResult: (result) ->
    @resultsPlace.innerHTML = ""
    if result.length > 0
      foundData = this.foundData(result)
      for res in foundData
        item = document.createElement('li')
        a = document.createElement('a')
        a.href = res.url
        a.innerHTML = res.title
        item.appendChild document.innerHTML = a
        @resultsPlace.appendChild item
    else
      item = document.createElement('div')
      item.className = "red"
      item.appendChild document.createTextNode("Nothing Found =(")
      @resultsPlace.appendChild item

  foundData:(result) ->
    foundData = []
    result.forEach( (res) =>
      foundData.push @lunrData.docs[res.ref]
    )
    foundData

  sendRequest: ->
    @xmlHttp.open 'get', '/search.json'
    @xmlHttp.send()

  initLunar: (data)->
    @lunrData = data
    @lunrIndex = lunr.Index.load @lunrData.index

  data: ->
    JSON.parse(@xmlHttp.responseText)

  events: ->
    @searchButton.onclick = (event) =>
      event.preventDefault()
      result = this.search()
      this.renderResult(result)

  isfetched: ->
    @xmlHttp.readyState == 4 and @xmlHttp.status == 200

window.LunarSearch = new LunarSearch()
lunrIndex = window.LunarSearch.lunrIndex
lunrData  = window.LunarSearch.lunrData
