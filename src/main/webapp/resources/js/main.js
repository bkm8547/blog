$(document).ready(
		function() {
			$("input[name='recommandBtn']").click(
					function() {
						var no=$(this).attr("no");
						$.get("recommand.do?no="+$(this).attr("no"), function(result) {
							var num=$(".news_recommand[no="+no+"]").html();
							num=parseInt(num.substring(4,num.lengh))+1;
							$(".news_recommand[no="+no+"]").html("추천 : "+num);
						}).fail(function() {
						    alert( "추천은 한번만!" );
						  });
					});
});
