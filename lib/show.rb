class Show

    #Méthode pour montrer le tableau en morpion
    def show_board(board)
        puts "| #{board.board[0].content} | #{board.board[1].content} | #{board.board[2].content} |"
        puts "| #{board.board[3].content} | #{board.board[4].content} | #{board.board[5].content} |"
        puts "| #{board.board[6].content} | #{board.board[7].content} | #{board.board[8].content} |"
    end

end