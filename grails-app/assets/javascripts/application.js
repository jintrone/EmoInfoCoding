// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require bootstrap
//= require jquery.selection.js
//= require selectize.js
//= require jquery.highlight-5.js
//= require_tree .
//= require_self


var $selectedEmo;
var $selectedInfo;

if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });

        $('.stage2').hide();

        $('#toSelect').mouseup(function () {
            if ($selectedEmo[0].selectize.items.length >= 5) {
                return
            }

            var selected = $.selection('#toSelect');

            $('#toSelect').highlight(selected);

            if ($('.stage1').is(':visible')) {
                $selectedEmo[0].selectize.createItem(selected);
                $selectedEmo[0].selectize.refreshItems();
            } else {
                $selectedInfo[0].selectize.createItem(selected);
                $selectedInfo[0].selectize.refreshItems();
            }

        });
        $selectedEmo = $('#selectedEmoText').selectize({
            delimiter: ',',
            persist: false,
            plugins: ['remove_button'],
            maxitems: 5,
            onItemRemove: function (foo, bar) {
                $('#toSelect').removeHighlight(foo);

            },
            create: function (input) {
                return {
                    value: input,
                    text: input
                }
            }

        });

        $selectedInfo = $('#selectedInfoText').selectize({
            delimiter: ',',
            persist: false,
            plugins: ['remove_button'],
            maxitems: 5,
            onItemRemove: function (foo, bar) {
                $('#toSelect').removeHighlight(foo);

            },
            create: function (input) {
                return {
                    value: input,
                    text: input
                }
            }
        });

    })(jQuery);
}

function clearSelection() {
    if (window.getSelection) {
        if (window.getSelection().empty) {  // Chrome
            window.getSelection().empty();
        } else if (window.getSelection().removeAllRanges) {  // Firefox
            window.getSelection().removeAllRanges();
        }
    } else if (document.selection) {  // IE?
        document.selection.empty();
    }
}

function resetStage() {
    $('#toSelect').removeHighlight();
    var selectBox = ($('.stage1').is(':visible')) ? $selectedEmo[0] : $selectedInfo[0];
    selectBox.selectize.items.forEach(function (item) {
        $('#toSelect').highlight(item)
    });
    //weird - sometimes this leaves a selection
    clearSelection()

}



