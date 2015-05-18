class BetsController < ApplicationController

	before_action :find_bet, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :owns_bet, only: [:edit, :update, :destroy]

	def index
		@bets = Bet.all.order(:cached_votes_score => "DESC").limit(9)
	end

	def show

	end

	def new
		@bet = current_user.bets.new
	end

	def create
		@bet = current_user.bets.create(bet_params)
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



	def upvote
		@bet.upvote_from current_user
		redirect_to @bet
	end

	def downvote
		@bet.downvote_from current_user
		redirect_to @bet
	end



	private

	def bet_params
		params.require(:bet).permit(:name, :betamount, :potentialwins, :image, :bet_id)
	end

	def find_bet
		@bet = Bet.find(params[:id])
	end

	def owns_bet
		unless @bet.user_id == current_user.id
			flash[:danger] = "Naughty, That isnt your bet!"
			redirect_to root_path
		end

	end


end
