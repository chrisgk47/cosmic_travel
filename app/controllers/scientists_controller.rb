class ScientistsController < ApplicationController
    before_action :find_scientist, only:[:show, :edit, :update, :delete]
    def index
        @scientists = Scientist.all
    end

    def show
        # @scientist = Scientist.find(params[:id])
    end

    def new
        @scientist = Scientist.new
        @scientist.save
    end

    def create
        @scientist = Scientist.create(scientist_params)

        if @scientist.valid?
        redirect_to scientist_path(@scientist.id)
      else 
        flash[:errors] = @scientist.errors.full_messages 
        redirect_to new_scientist_path
      end
    end

    # def edit
    #     redirect_to scientist_path(@scientist.id)
    # end
    def update
        if @scientist.update(scientist_params)
            redirect_to scientist_path(@scientist.id)
        else
            flash[:errors] = @scientist.errors.full_messages 
            redirect_to scientist_path(@scientist)
        end
    end

    def destroy
        @scientist = Scientist.find(params[:id])

        @scientist.destroy

        redirect_to scientists_path
    end

    private

    def scientist_params
        params.require(:scientist).permit(:name, :field_of_study)
    end

    def find_scientist
        @scientist = Scientist.find(params[:id])
    end


  
end





