// これは、マニフェストファイル。一番下のtreeの記述によりこのディレクトリにつくられるすべてのファイルは読み込まれる！
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

// 上の２つでjQueryが読み込まれている。
// turbolinksも読み込んでいる。ページ遷移をAjaxに置き換え、JavaScriptやCSSのパースを省略することで高速化するgem
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
