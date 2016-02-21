class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    def show
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save 
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            
            ContactMailer.contact_email(name, email, body).deliver
            
            flash[:success] = 'Message sent.'
            redirect_to new_contact_path
        else 
            flash[:danger] = 'Error Occurred. Message not sent.'
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            params.required(:contact).permit(:name, :email, :comments)
        end
end