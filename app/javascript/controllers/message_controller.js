import Swal from 'sweetalert2'
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = {
        name: String,
        msg: String
    }
    connect() {
        this.message()
    }

    message() {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        })

        Toast.fire({
            icon: this.nameValue,
            title: this.msgValue
        })
    }
}