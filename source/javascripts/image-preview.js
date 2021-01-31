class ImagePreview {
  constructor(images=[], imageId=0) {
    this.previewBlock = document.getElementById('preview');
    this.previewImg = this.previewBlock.querySelector("#preview-image");
    this.initState(images, imageId) ;
    this.registerEvents();
    this.initPreview();
  }

  initState(images, imageId) {
    this.state = {
      isShown: this.previewBlock.style.display === 'block',
      images:  images,
      current: images[imageId],
      step: 0
    }
  }

  registerEvents() {
    document.onkeydown = event => {
      event = event || window.event;
      switch (event.keyCode) {
        case 32:
          this.state.isShown && event.preventDefault();
          this.nextImage();
          break;
        case 8:
          this.prevImage();
          break;
        case 27:
          this.hidePreview()
      }
    };
  }

  initPreview() {
    this.previewBlock.onmouseup = e => {
      const action = window.Helpers.getTarget(e).id;
      switch (action) {
        case "next":
        case "preview-image":
          this.nextImage();
          break;
        case "prev":
          this.prevImage();
          break;
        default:
          this.hidePreview();
      }
    };
  }

  hidePreview() {
    this.previewBlock.style.display = 'none';
    this.state.isShown = false;
  }

  nextImage() {
    this.state.step += 1;
    this.switchImage();
  }

  prevImage() {
    this.state.step -= 1;
    this.switchImage();
  }

  switchImage() {
    this.state.current = this.state.images[this.nextImageId()];
    this.state.isShown && this.showImage();
  }

  showImage() {
    if (this.state.current.src) {
      let previewTitle = document.getElementById('preview-image-title')
      previewTitle.innerHTML = this.state.current.title;
      this.previewImg.src = this.state.current.src;
      this.previewBlock.style.display = 'block';
      this.state.isShown = true;
      this.showSpinner();
    }
  }

  showSpinner() {
    let spinner = document.getElementById('spinner');
    spinner.style.display = 'block';
    this.previewImg.classList.add("dark");
    window.clearInterval(window.intervalId);
    window.intervalId = window.setInterval(
      () => this.updateSpinner(spinner),
      200
    );
    this.previewImg.onload = () => {
      spinner.style.display = 'none';
      this.previewImg.classList.remove("dark");
      window.clearInterval(window.intervalId);
    };
  }

  updateSpinner(spinner) {
    const message = spinner.textContent;
    spinner.textContent = (message === 'Loading...') ? 'Loading' : message + '.';
  }

  nextImageId() {
    const max = this.state.images.length;
    if (this.state.step === 0) { this.state.step = max };
    return this.state.step % max;
  }
}
