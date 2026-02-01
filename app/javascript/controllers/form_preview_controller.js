import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-preview"
export default class extends Controller {
    static targets = [
        "imageInput", "imagePreview",
        "titleInput", "titlePreview",
        "aboutInput", "aboutPreview",
        "typeInput", "typePreview",
        "cityInput", "cityPreview",
        "stateInput", "statePreview"
    ]

    previewImage() {
        const input = this.imageInputTarget
        const preview = this.imagePreviewTarget
        const file = input.files[0]

        if (file) {
            const reader = new FileReader()

            reader.onload = (e) => {
                preview.src = e.target.result
            }

            reader.readAsDataURL(file)
        }
    }

    updateTitle() {
        this.titlePreviewTarget.textContent = this.titleInputTarget.value
    }

    updateAbout() {
        // For Trix editor, value might be in the input element associated or we can get text
        // The rich_text_area helper creates a hidden input. We usually target the "trix-editor" or listen to trix-change.
        // However, sticking to simple value update for now if it works, or using the hidden input's value.
        // But rich text includes HTML. We probably want innerHTML for preview if safe, or textContent to strip tags.
        // Given the prompt "about" is text, let's try direct value first.
        // Note: Trix updates the hidden input value on change.
        this.aboutPreviewTarget.innerHTML = this.aboutInputTarget.value
    }

    updateType() {
        const selectedOption = this.typeInputTarget.options[this.typeInputTarget.selectedIndex]
        this.typePreviewTarget.textContent = selectedOption.text
    }

    updateCity() {
        this.cityPreviewTarget.textContent = this.cityInputTarget.value
    }

    updateState() {
        this.statePreviewTarget.textContent = this.stateInputTarget.value
    }
}
