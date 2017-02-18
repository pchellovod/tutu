$(document).ready(function() {
    $('#carriage_type').change(function() {
        var carriage_type;
        carriage_type = $(this).val();

        var seats = {};
        seats['BusinessCarriage'] = ['field_lower_seats'];
        seats['SittingCarriage'] = ['field_sitting_seats'];
        seats['CoupeCarriage'] = ['field_lower_seats', 'field_upper_seats'];
        seats['EconomyCarriage'] = [
            'field_lower_seats',
            'field_upper_seats',
            'field_side_upper_seats',
            'field_side_lower_seats'
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
