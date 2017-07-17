class RoundsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    redirect_to login_path unless logged_in?

    @deck = Deck.find(params[:deck_id])
    @round = Round.create(deck_id: params[:deck_id], user_id: current_user.id, correct_first_try: 0)
    session[:wrong_cards] = []
    session[:first_complete] = false
    redirect_to deck_round_path(id: @round.id)
  end

  def show
    @deck = Deck.find(params[:deck_id])
    @round = Round.find(params[:id])
    @current_card = 0
    session[:last_card] = 0
    session[:total_guesses] = 0
  end

  def update
    @deck = Deck.find(params[:deck_id])
    @round = Round.find(params[:id])
    @answer = @round.cards[session[:last_card]].answer
    @user_answer = params[:user_answer]

    if @user_answer.strip.downcase == @answer.strip.downcase
      @response = "You got it right!"

      if session[:total_guesses] < @round.cards.count
        @round.correct_first_try+=1
        @round.save
      else
        session[:wrong_cards].shift
      end
    else
      @response = "You're a Dummy!"

      if session[:total_guesses] < @round.cards.count
        session[:wrong_cards] << session[:last_card]
      end
    end

    session[:total_guesses]+=1

    if session[:total_guesses] < @round.cards.count
      @current_card = session[:total_guesses]
      session[:last_card] = @current_card
    else
      session[:first_complete] = true
      @current_card = session[:wrong_cards][0]
      session[:last_card] = @current_card
    end

    if session[:first_complete] && session[:wrong_cards].empty?
      @round.total_guesses = session[:total_guesses]
      @round.save
    end
    render '/rounds/show'
  end

end
