class SessionsController < ApplicationController
    def new
        if params[:name]
            @reader = Reader.find_by(name: params[:name])
        end
    end
    
    def create
        if !params[:session][:name].empty? || params[:session][:name]
            if @reader = Reader.find_by(name: params[:session][:name])
                if @reader.authenticate(params[:session][:password])
                    session[:id] = @reader.id
                    redirect_to reader_path(@reader.id)
                end
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