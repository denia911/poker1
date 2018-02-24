# Class for serching winners
class Winner
  def initialize(players_score)
    @players_score = players_score
  end

  def winner
    players_score = @players_score.map { |one_player| one_player[0] }

    combination_winner = combination(players_score).compact.uniq +
                         winning_players(players_score).compact
    combination_winner
  end

  def winning_players(players_score)
    @players_score.map do |one_player|
      [one_player[2]] if one_player[0] == players_score.max
    end
  end

  def combination(players_score)
    @players_score.map do |one_player|
      [one_player[1]] if one_player[0] == players_score.max
    end
  end
end
