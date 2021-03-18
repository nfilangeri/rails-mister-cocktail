class CocktailsController < ApplicationController
    def index
        @cocktails = Cocktail.all
    end

    def new
        @cocktail = Cocktail.new(params[:cocktail])
    end

    def create
        @cocktail = Cocktail.new(params_cocktail)
        if @cocktail.save
            redirect_to cocktail_path(@cocktail)
        else
            render :new
        end
    end

    def show
        @cocktail = Cocktail.find(params[:id])
    end

    private

    def params_cocktail
        params.require(:cocktail).permit(:name)
    end
end
