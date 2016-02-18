(function(){

	var UserList = AuctionApp.UserList = function(container){
		this.container = container;
		this.uri = '/api/customers';
		this.user_list = [];
	}

	UserList.prototype.fetchUsers = function(uri){
		var that = this;
		var show = function(response){
			that.user_list = response;
			that.render();
		}
		var users_list = $.get(this.uri)
		users_list.done(show)
	}

	UserList.prototype.render = function(){
		var that = this;
		this.user_list.forEach(function(user){
			var user_name = $('<li>').append('<a href="customers/' + user.id + '" data-id="' + user.id + '">' + user.name + '</a><button>Delete</button>');
			var delete_button = $('<button>').attr('value', user.id);
			that.container.append(user_name);
		});
	}

})();