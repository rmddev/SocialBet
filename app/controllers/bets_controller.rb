class BetsController < ApplicationController

	before_action :find_bet, only: [:show, :edit, :update, :destroy]

	def index
		@bets = Bet.all.order("created_at DESC")
	end

	def show
	end

	def new
		@bet = Bet.new
	end

	def create
		@bet = Bet.create(bet_params)
		if @bet.save
			flash[:success] = "Bet Added, Good Luck!"
			redirect_to @bet
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @bet.update(bet_params)
			flash[:success] = "Bet Updated, Good Luck!"
			redirect_to @bet
		else
			render "edit"
		end
	end

	def destroy
		@bet.delete
		flash[:danger] = "Bet Deleted, Why not submit another?"
		redirect_to root_path

	end

	private

	def bet_params
		params.require(:bet).permit(:name, :betamount, :potentialwins, :image)
	end

	def find_bet
		@bet = Bet.find(params[:id])
	end
end
