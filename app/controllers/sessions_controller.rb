class SessionsController < ApplicationController
    def new
    end
    
    def create
        
        if !params[:name].empty? || params[:name]
            if @reader = Reader.find_by(name: params[:name])
                session[:id] = @reader.id
                redirect_to reader_path(@reader.id)
            else
                render :new
            end
        else
            render :new 
        end
    end
    
    def destroy
        session.delete :id
        redirect_to readers_path
    end
end
    