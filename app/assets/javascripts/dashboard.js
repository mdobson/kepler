jQuery(function(){
	$(".modal-btn").on("click", function(){
		$("."+this.id).modal("toggle");
	});
});