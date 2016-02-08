class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(name: :asc)
	end

	def create_contact
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

 	def show
 		@photo = Photo.order('created_at')
 	end

 	# def new
 	# 	@photo = Photo.new
 	# end

 	def create_photo
 		@photo = Photo.new(photo_params)
 		if @photo.save
 			flash[:success] = "Added!"
 			redirect_to root_path
 		else
 			render 'new'
 		end
 	end

 	def fav
 		Contact.find(params[:id]).update_attributes(:favorite =>true)
 		redirect_to("/show/" + params[:id])
 	end

 	def search
 		if params[:search] != nil
	 		searched = params[:search]
	 		@search = Contact.where("name LIKE ?", "%#{searched}%")
	 		#redirect_to("/search/" + params[:search])
	 	end
 	end

 	private

 	def photo_params
 		params.require(:photo).permit(:image, :photo)
 	end

end
