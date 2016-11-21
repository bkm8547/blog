$(document).ready(
		function() {
			$("input[name='recommandBtn']").click(
					function() {
						$.get("recommand.do?no="+$(this).attr("recommandNumber"), function(result) {
							alert(result);
						});
					});
});