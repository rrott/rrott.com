// require helpers
// require image-preview

class Blog {
  constructor() {
    this.thumbs = document.getElementsByClassName("blog-image");
    this.registerEvents();
  }

  registerEvents() {
    [...this.thumbs].map(thumb => {
      thumb.onclick = e => { this.showImage(e); };
    });
  }

  showImage(e) {
    e.preventDefault();
    const index = window.Helpers.getTarget(e).getAttribute('data-index');
    const imagePreview = new ImagePreview(this.imagesList(), index);
    imagePreview.showImage();
  }

  imagesList() {
    if (!this.thumbs.length) {return [{src: null, title: 'No image', id: 0}];}

    return [...this.thumbs].map((thumb,index) => ({
      src: thumb.src, title: thumb.alt, id: index
    }));
  }
}

window.Blog = new Blog();
