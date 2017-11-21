class ProvidersController < ApplicationController
    
    def index
        @provider = Provider.all
    end    
    def show
        @provider= Provider.find(params[:id])
    end
    def new
        @provider = Provider.new
        
    end
    def create
        @provider = Provider.new(provider_params)

        if @provider.save
        redirect_to @provider
        else 
            render :new
        end
    end

    private
    def provider_params
        params.require(:provider).permit(:nombre,:telefono,:empresa,:ruc_empresa)
    end
    
end
