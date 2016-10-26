

// 星のrating
$(function(){
  $('.ui.rating')
  .rating({
    initialRating: 3,
    maxRating: 5
  });
});



// チェックボックス（SemanticUIの古いバージョンより(0.19.3)新しいのはできなかった。）
$('.ui.checkbox').checkbox();


// ドロップダウン（SemanticUIの古いバージョンより(0.19.3)新しいのはできなかった。）
$('select.dropdown')
  .dropdown('set selected', ['meteor', 'ember'])
;
