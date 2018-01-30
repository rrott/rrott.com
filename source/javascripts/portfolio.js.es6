// require helpers
// require image-preview
class Portfolios {
  constructor() {
    const portfolios = [...document.getElementsByClassName('post-images')];
    portfolios.map((portfolio) => new Portfolio(portfolio));
  }
}

class Portfolio {
  constructor(portfolio) {
    this.portfolio = portfolio;
    this.thumbs = this.portfolio.getElementsByClassName('thumb');
    this.registerEvents();
  }

  registerEvents() {
    const projectImg = this.portfolio.querySelector(".project-img");
    projectImg.onclick = e => e.preventDefault();
    projectImg.onmouseup = e => this.showImage(e);

    [...this.thumbs].map((thumb,index) => {
      thumb.onclick = e => e.preventDefault();
      thumb.onmouseup = e => this.showImage(e);
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
      src: thumb.href, title: thumb.title, id: index
    }));
  }
}

window.Portfolios = new Portfolios();
