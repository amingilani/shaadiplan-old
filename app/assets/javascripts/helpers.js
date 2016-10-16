(function($) {
	var target = document.querySelector('.hightlight');

	function selection(elem) {
		elem   = document.querySelector(elem);
		var select = window.getSelection();
		var range  = document.createRange();

		range.selectNodeContents(elem);
		select.addRange(range);
	}

	target.onclick = function() {
		selection('.hightlighter');
	};
})(jQuery);
