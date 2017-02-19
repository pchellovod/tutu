$(document).ready(function() {
    $('#carriage_type').change(function() {
        var carriage_type;
        carriage_type = $(this).val();

        var seats = {};
        seats['LuxCarriage'] = ['field_bottom_seats'];
        seats['SittingCarriage'] = ['field_sitting_seats'];
        seats['CoupeCarriage'] = ['field_bottom_seats', 'field_top_seats'];
        seats['EconomyCarriage'] = [
            'field_bottom_seats',
            'field_top_seats',
            'field_side_top_seats',
            'field_side_bottom_seats'
        ];
        seats['all'] = seats['EconomyCarriage'].concat(seats['SittingCarriage']);

        seats['all'].forEach(function(item) {
            if (seats[carriage_type].indexOf(item) !== -1) {
                $('#' + item).removeClass('hidden-field');
            } else {
                $('#' + item).addClass('hidden-field');
            }
        });
    });
});
