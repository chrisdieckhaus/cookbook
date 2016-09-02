$(document).ready(function() {
    $('#recipe_category').css('color','#858585');
    $('#recipe_category').change(function() {
       var current = $('#recipe_category').val();
       if (current != 'null') {
           $('#recipe_category').css('color','#333333');
       } else {
           $('#recipe_category').css('color','#858585');
       }
    }); 
});