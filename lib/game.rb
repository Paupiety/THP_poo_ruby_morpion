class Game
    attr_accessor :current_player, :status, :players, :board

#Code pour les couleurs
    ROSE = "\e[95m"
    JAUNE = "\e[33m"
    RESET_COLOR = "\e[0m"

#Méthode pour initialiser les joueurs, le board, joueur actuel, statut de la partie et le nombre de tour joué
    def initialize(name_player1, name_player2)
        @players = [Player.new("#{ROSE}#{name_player1}#{RESET_COLOR}", "#{ROSE}X#{RESET_COLOR}"), Player.new("#{JAUNE}#{name_player2}#{RESET_COLOR}", "#{JAUNE}O#{RESET_COLOR}")]
        @board = Board.new()
        @current_player = @players[0]
        @status = "on going"
        @tour = 0
    end

#Méthode pour commencer une partie, demande le choix de la case aux joueurs et termine la partie si le statut change
    def turn()
        system("clear")
        puts "\nQue la partie commence !"
        puts "\n"
        Show.new.show_board(@board)
        puts "\n#{@current_player.name}, choisis une case"
        @board.play_turn(@current_player)
        @board.victory?(current_player)
        @tour += 1
        if @board.victory?(current_player) == true
            @status = "La partie est terminée"
            @board.number_choices()
        elsif @tour == 9
            @status = "Match nul"
            @board.number_choices()
        elsif @status == "on going"
            if @current_player == @players[0]
                @current_player = @players[1]
            else
                @current_player = @players[0]
            end
            turn()
        end
    end
  
    #Méthode pour conclure la partie
    def game_end()
        system("clear")
        Show.new.show_board(@board)
        if @status == "La partie est terminée"
            puts "\n#{@current_player.name} à gagné !"
        elsif @status == "Match nul"
            puts "\nAucun de vous n'a gagné !"
        end
    end    

    #Méthode pour recommencer une partie
    def new_round()
        puts "\nUne autre partie ? (oui ou non)"
        choice = gets.chomp
        return choice
    end

    #Méthode pour tout regrouper
    def perform()
        self.turn
        self.game_end()
    end
  
end