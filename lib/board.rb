class Board
    attr_accessor :board

    @@number_choices = [1,2,3,4,5,6,7,8,9]
    def initialize ()
        @board = []
        (1..9).each do |position|
            @board << BoardCase.new(0 + position,position)
        end
        
    end

#Méthode qui permet de réinitialiser l'array et donc les cases déjà choisis
    def number_choices()
        return @@number_choices = [1,2,3,4,5,6,7,8,9]
    end
  
    #Méthode qui permet de choisir une case et de retourner la demande si le choix est sur une cse déjà prise
    def play_turn(current_player)
        @array_content = []
        choice = gets.chomp.to_i
        unless @@number_choices.include?(choice)
            puts "Case déjà prise, choisis-en une autre"
            play_turn(current_player)
            
        end
        @board.each do |boardcase|
            if choice == boardcase.content && @@number_choices.include?(choice)
                boardcase.content = current_player.symbole
                @@number_choices.delete(choice)
            end
            @array_content << boardcase.content
        end
    end

    #Méthode qui retient les combinaisons gagnantes pour changer le statut si y'a un gagnant
    def victory?(current_player)
        suit_up = @array_content[0..2]
        suit_middle = @array_content[3..5]
        suit_down = @array_content[6..8]
        diagonal_1 = [@array_content[0],@array_content[4],@array_content[8]]
        diagonal_2 = [@array_content[2],@array_content[4],@array_content[6]]
        suit_left = [@array_content[0],@array_content[3],@array_content[6]]
        suit_middle_2 = [@array_content[1],@array_content[4],@array_content[7]]
        suit_right = [@array_content[2],@array_content[5],@array_content[8]]
        if suit_up.uniq.length == 1 || suit_middle.uniq.length == 1 || suit_down.uniq.length == 1 || diagonal_1.uniq.length == 1 || diagonal_2.uniq.length == 1 || suit_left.uniq.length == 1 || suit_middle_2.uniq.length == 1 || suit_right.uniq.length == 1
            return true
        end

    end
end