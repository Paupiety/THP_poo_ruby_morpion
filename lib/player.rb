class Player
    attr_accessor :symbole, :name

    def initialize(player_name, symbole)
        @name = player_name
        @symbole = symbole
    end
end