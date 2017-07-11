// require helpers
// require image-preview
class Portfolios {
  constructor() {
    let portfolios = [...document.getElementsByClassName('post-images')];
    portfolios.map((portfolio) => new Portfolio(portfolio));
  }
}

class Portfolio {
  constructor(portfolio) {
    // this._setUpThumbEvents = this._setUpThumbEvents.bind(this);
    this.preview = portfolio.querySelector(".project-img");
    this.preview.onclick = e => {
      e.preventDefault();
      this._triggerEvent(e);
    };
    this.thumbs  = portfolio.getElementsByClassName('thumb');
    this.preview_object = this._collectImagesList();
    if (this.preview_object.length) { this.init(); }
  }

  init() {
    this._setUpPreviewEvents();
    return this._setUpThumbEvents();
  }

  _setUpPreviewEvents() {
    this.preview.onclick = e => {
      this._triggerEvent(e);
    };
  }

  _setUpThumbEvents() {
    [...this.thumbs].map((thumb) => {
      thumb.onclick = e => (this._triggerEvent(e));
    });
  }

  _triggerEvent(e) {
    e.preventDefault();
    const index = window.Helpers.getTarget(e).getAttribute('data-index');
    // this.preview_object.current_image_id = parseInt(index);
    //TODO: refactor to not use ImagePreview
    let imagePreview = new ImagePreview(this.preview_object);
    // ImagePreview.changePreviewImage();
    // return ImagePreview.togglePreview();
    imagePreview.showImage();
  }

  _collectImagesList() {
    const list = new Array;
    for (let index = 0; index < this.thumbs.length; index++) {
      const thumb = this.thumbs[index];
      list.push({
        src:   thumb.href,
        title: thumb.title,
        id:    index
      });
    }
    return list;
  }
}

window.Portfolios = new Portfolios();
// window.Portfolio  = Portfolio;
