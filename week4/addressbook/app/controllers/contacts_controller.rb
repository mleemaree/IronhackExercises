class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(name: :asc)
	end

	def create
    	# Create new Contact from params[:contact]
	    contact = Contact.new(
	      :name => params[:contact][:name],
	      :address => params[:contact][:address],
	      :phoneNumber => params[:contact][:phone],
	      :email => params[:contact][:email])
	    contact.save
	    # Render contact's attributes

	    redirect_to("/")
 	end

 	def fav
 		Contact.find(params[:id]).update_attributes(:favorite =>true)
 		redirect_to("/show/" + params[:id])
 	end

 	def search
 		if params[:search] != nil
	 		searched = params[:search]
	 		@search = Contact.where("name LIKE ?", "%#{searched}%")
	 	end
 	end


end
