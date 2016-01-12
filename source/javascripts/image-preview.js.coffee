
post_images = document.getElementsByClassName('post-images')

setUpImage = (post_images, id) ->
  @post_image  = post_images[id]
  large_image  = @post_image.querySelector(".largeImg")
  @thumbs       = @post_image.querySelector("#thumbs")

  thumbs.onclick = (e) ->
    e.preventDefault()
    target = e.target
    while target != this
      if target.nodeName == 'A'
        large_image.src = target.href + "?t=" + new Date().getTime();
        large_image.alt = target.title
      target = target.parentNode

  imgs = @thumbs.getElementsByTagName('img')

  i = 0
  while i < imgs.length
    url = imgs[i].parentNode.href
    img = document.createElement('img')
    img.src = url

    i++

id = 0
while id < post_images.length
  setUpImage(post_images, id)
  ++id


