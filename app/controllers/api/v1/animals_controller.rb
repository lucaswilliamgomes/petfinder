module Api
    module V1
        class AnimalsController < ApplicationController

            def index
                animals = Animal.order('created_at DESC')
                render json: {status: 'SUCESS', data: animals}, status: :ok
            end

            def show
                animal = Animal.find(params[:id])
                render json: {status: 'SUCESS', data: animal}, status: :ok
            end

            def create
                animal = Animal.new(animal_params)
                if animal.save
                    render json: {status: 'SUCESS', data: animal}, status: :ok
                else
                    render json: {status: 'ERROR', data: animal.erros}, status: :unprocessable_entity 
                end
            end

            def update
                animal = Animal.find(params[:id])
                if animal.update(animal_params)
                    render json: {status: 'SUCESS', data: animal}, status: :ok
                else
                    render json: {status: 'ERROR', data: animal.erros}, status: :unprocessable_entity 
                end
            end

            def destroy
                animal = Animal.destroy(params[:id])
                animal.destroy
                render json: {status: 'SUCESS', data: animal}, status: :ok
            end 
            
            private
            def animal_params
                params.permit(:name, :age, :gender, :particulars)
            end 

        end
    end
end