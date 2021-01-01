function makePaginationHtml(listRowCount, pageLinkCount, currentPageIndex, totalListItemCount, htmlTargetId){
	
	var targetUI = $("#" + htmlTargetId);
	
	var pageCount = Math.ceil(totalListItemCount/listRowCount);

	var startPageIndex = 0;
	if( (currentPageIndex % pageLinkCount) == 0 ){ //10, 20...맨마지막
		// 현재 페이지 index가 20 일 때, 11로
		// 20 / 10 => 2, 2-1 => 1, 1*10 => 10, 10+1 => 11
		startPageIndex = ((currentPageIndex / pageLinkCount)-1)*pageLinkCount + 1	
	}else{
		// 현재 페이지 index가 23 일 때, 21로
		// 23 / 10 => 2.3 => 2, 2*10 => 20, 20+1 => 21
		startPageIndex = Math.floor(currentPageIndex / pageLinkCount)*pageLinkCount + 1 
	}
	
	var endPageIndex = 0;
	if( (currentPageIndex % pageLinkCount) == 0 ){ //10, 20...맨마지막
		endPageIndex = ((currentPageIndex / pageLinkCount)-1)*pageLinkCount + pageLinkCount
	}else{
		endPageIndex = Math.floor(currentPageIndex / pageLinkCount)*pageLinkCount + pageLinkCount;
	}

	var prev;
	if( currentPageIndex <= pageLinkCount ){
		prev = false;
	}else{
		prev = true;
	}

	var next;
	// 127 건 / 10 => 12.7 => 13 <-- pageCount
	// 위 계산이 13 보다 크면 13으로
	if(endPageIndex > pageCount){
		endPageIndex = pageCount
		next = false;
	}else{
		next = true;
	}
	
//	console.log("totalListItemCount : " + totalListItemCount);
//	console.log("pageCount : " + pageCount);
//	console.log("currentPageIndex : " + currentPageIndex);
//	console.log("startPageIndex : " + startPageIndex);
//	console.log("endPageIndex : " + endPageIndex);
//	console.log("prev : " + prev);
//	console.log("next : " + next);
	
	var paginationHtml =
		'<ul class="pagination justify-content-center">';
	if(prev){
		paginationHtml += 
			'<li class="page-item">' +
			'<a class="page-link" href="javascript:movePage(' + (startPageIndex - 1) + ')" aria-label="Previous">' +
			'<span aria-hidden="true">&laquo;</span>' +
			'</a>' +
			'</li>';
	}
	
	for(var i=startPageIndex; i<=endPageIndex; i++){
//		console.log('*** ' + i);
//		console.log(currentPageIndex);
		
		if( i == currentPageIndex ){
			paginationHtml += 
				'<li class="page-item active"><a class="page-link" href="javascript:movePage(' + i + ')">' + i + '</a></li>';			
		}else{
			paginationHtml += 
				'<li class="page-item"><a class="page-link" href="javascript:movePage(' + i + ')">' + i + '</a></li>';			
		}
	}
	
	if(next){
		paginationHtml += 
			'<li class="page-item">' +
			'<a class="page-link" href="javascript:movePage(' + (endPageIndex + 1) + ')" aria-label="Next">' +
			'<span aria-hidden="true">&raquo;</span>' +
			'</a>' +
			'</li>';
	}

	paginationHtml += '</ul>';
	
	targetUI.html("");
	targetUI.append(paginationHtml);
	
}

function makeDateStr(year, month, day, type){
	//2010.05.05
	if( type == '.' ){
		return year + '.' + ( (month < 10) ? '0' + month : month ) + '.' + ( (day < 10) ? '0' + day : day );
	}
}

function makeTimeStr(hour, minute, second, type){
	//07:25:33
	if( type == ':' ){
		return hour + ':' + ( (minute < 10) ? '0' + minute : minute ) + ':' + ( (second < 10) ? '0' + second : second );
	}
}














