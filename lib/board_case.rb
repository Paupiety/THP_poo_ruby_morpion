class BoardCase
#création des cases du morpion (finalement je crois que position sert à rien)
        attr_accessor :position, :content
        def initialize(content, position)
            @position = position
            @content = content
        end
    
        
end

