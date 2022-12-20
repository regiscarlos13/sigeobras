import { Controller } from "@hotwired/stimulus"

import $ from 'jquery';
import Select2 from "select2"

export default class extends Controller {
    initialize() {
        Select2()
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
        });
        $('.form-control.select').select2({
            width: '100%',

        })
        $('.select2-selection__rendered').select2({ width: '100%' })
        $('.form-control.date').select2({ width: '100%' })
        $('.select_tag').select2({ dropdownParent: $('.modal'), width: '100%' })

        $('.form-control.select').select2({
            language: "pt-BR",

        });

        $(document).on("turbo:before-cache", function() {
            $('.form-control.select').select2('destroy');
        });

    }
}