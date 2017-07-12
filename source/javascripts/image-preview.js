class ImagePreview {
  constructor(images=[], image_id=0) {
    this.state = { images: images, current: images[image_id], step: 0 }
    this.previewBlock = document.getElementById('preview');
    this.previewImg = this.previewBlock.querySelector("#preview-image");
    this.registerEvents();
    this.initPreview();
  }

  registerEvents() {
    document.onkeydown = event => {
      event = event || window.event;
      event.preventDefault()
      switch (event.keyCode) {
        case 32:
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
    this.previewBlock.onclick = e => {
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
          this.hidePreview()
      }
    };
  }

  hidePreview() {
    this.previewBlock.style.display = 'none';
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
    this.canShowImage() && this.showImage();
  }

  canShowImage() {
    return this.previewBlock.style.display === 'block';
  }

  showImage() {
    if (this.state.current.src) {
      let previewTitle = document.getElementById('preview-image-title')
      previewTitle.innerHTML = this.state.current.title;
      this.previewImg.src = this.state.current.src;
      this.previewBlock.style.display = 'block';
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
