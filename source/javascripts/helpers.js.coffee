class Helpers
  constructor: ->

  disableLinks: ->
    @links = document.getElementsByClassName('internal-link')
    for link in @links
      link.onclick = (e) =>
        e.preventDefault()
        url = this.getTarget(e).getAttribute('data-href')
        this.openLink(url)

  getTarget: (e) ->
    target = if (e.target) then e.target else e.srcElement
    if (target.nodeType == 3) then target = target.parentNode
    target

  openLink: (url) ->
    window.location.href = url;

window.Helpers = new Helpers()
