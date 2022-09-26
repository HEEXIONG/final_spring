console.log("Reply Module....... 동작 확인!");

var replyService = (function() {

	
	function add(reply, callback) {
		console.log("reply..... 처리 확인!");
		$.ajax({
			type : 'post',
			url : '/replie/new',
			
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
		})
	
	}
	
	
	function getList(param, callback, error) {
		var gr_bno = param.gr_bno;
		var page = param.page || 1;
		
		
		$.getJSON("/replie/pages/" + gr_bno + "/" + page + ".json",
				function(data) {
					if(callback){

						callback(data.replyCnt, data.list);
					}
				}).fail(function(xhr, status, err) {
					if(error){
						error();
					}
				});
			}
	
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replie/delete/' + rno,
			success : function(deleteResult, status, xhr) {
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error) {
		console.log("RNO : " + reply.rno);
		
		$.ajax({
			type : 'put',
			url : '/replie/request/' + reply.rno,
			data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error){
						error(er);
					}
				}
		});
	}
	
	function get(rno, callback, error) {
		$.get("/replie/" + rno + ".json", function(result) {
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		if(gap < (1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ":", (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() +1;
			var dd = dateObj.getDate();
			
			return[yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
	};	
	
	return {
		add : add,
		getList : getList, // 옆에 소스는 Page 407 하단 소스 내용 추가 내용입니다.
		remove : remove, // 옆에 소스는 Page 409 상단 소스 내용 추가 내용입니다.
		update : update, // 옆에 소스는 Page 411 상단 소스 내용 추가 내용입니다.
		get : get, // 옆에 소스는 Page 413 상단 소스 내용 추가 내용입니다.
		displayTime : displayTime // 옆에 소스는 Page 418 소스 추가 내용입니다.
	};
	
})();

