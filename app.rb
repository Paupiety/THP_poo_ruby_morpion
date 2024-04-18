require_relative "lib/board"
require_relative "lib/show"
require_relative "lib/board_case"
require_relative "lib/player"
require_relative "lib/game"

ROSE = "\e[95m"
JAUNE = "\e[33m"
RESET_COLOR = "\e[0m"

class Application
    attr_accessor :name_player1, :name_player2

    #Méthode qui regroupe tout
    def perform()
        #if qui permet de garder le nom des joueurs
        if @name_player1 == nil && @name_player2 == nil
            puts "_________________________________"
            puts "Bienvenue dans le jeu du MORPION"
            puts "_________________________________"
            puts "#{ROSE}Joueur 1#{RESET_COLOR} : comment tu t'appelles ?"
            @name_player1 = gets.chomp
            puts "\n#{JAUNE}Joueur 2#{RESET_COLOR} : comment tu t'appelles ?"
            @name_player2 = gets.chomp
        end
        game_1 = Game.new(@name_player1, @name_player2)
        system("clear")
        game_1.perform()
        #création d'une variable pour ne pas répéter la méthode à chaque appel
        restart = game_1.new_round()
        #if pour recommencer ou non la partie suivant la réponse
        if restart == "oui"
            perform()
        elsif restart == "non"
            puts "Dommage, à bientôt !"
        else
            puts "Ni oui ni non je prend ça pour un non :P"
        end
    end
end

Application.new.perform