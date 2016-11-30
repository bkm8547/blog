$(document).ready(
		function() {
			$("input[name='recommandBtn']").click(
					function() {
						var no=$(this).attr("no");
						$.get("recommand.do?no="+$(this).attr("no"), function(result) {
							if(result!=null&&result!=""){
							var num=$(".news_recommand[no="+no+"]").html();
							num=parseInt(num.substring(4,num.lengh))+1;
							$(".news_recommand[no="+no+"]").html("추천 : "+num);
							}else
								alert( "추천은 한번만!" );
						});
					});
});
