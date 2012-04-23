var grid;
var columns = [
	{id:"title",name:"Title",field:"title"},
	{id:"duration",name:"Duration",field:"duration"},
	{id:"%",name:"Percentage",field:"percent"},
	{id:"stat",name:"Stat",field:"stat"}
	];

var options = {
	enableCellNavigation:true,
	enableColumnReorder:false
}

$(function(){
	var data = [];
	for(var i = 0; i<500; i++)
	{
		data[i] = 
		{
			title:"Stuff" + i,
			duration:"20min",
			percent:Math.round(Math.random()*100),
			stat:(i%5==0)
		}
	}

	grid = new Slick.Grid("#explorer", data, columns, options);

	});