class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ") #game board

    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        return input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index) #runs after input_to_index
        if @board[index] == " "
            return false
        else
            return true
        end
    end

    def valid_move?(index)
        if index.between?(0, 8) && !position_taken?(index)
            return true
        else
            return false
        end
    end

    def turn_count
        count = 0
        @board.each do |space|
            if space == "X" || space == "O"
                count += 1
            end
        end
        return count
    end

    def current_player
        if self.turn_count.even? 
            return "X"
        else  
            return "O"
        end
    end

    def turn

        puts "Make your move. Enter a number from 1 through 9: "
        input = gets.chomp
        index = input_to_index(input)
        
        if valid_move?(index)
            player = current_player
            move(index, player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |array|

            tic = @board[array[0]] #calling array values within the board array
            tac = @board[array[1]]
            toe = @board[array[2]]

            if tic == "X" && tac == "X" && toe == "X"
                return array
            elsif tic == "O" && tac == "O" && toe == "O"
                return array
            end
        end
        return false
    end

    def full?
        @board.all? do |space|
            space == "X" || space == "O"
        end
    end

    def draw?
        if won? == false && full? == true #checks existence of won? and full?
            return true
        else
           return false
        end
    end

    def over?
        if won? || draw? #checks won? and draw? conditions
           return true
        else
           return false
        end
    end

    def winner
        condition_check = []
        condition_check = won?

        if condition_check == false
            return nil
        elsif @board[condition_check[0]] == "X"
            return "X"
        elsif @board[condition_check[0]] == "O"
            return "O"
        end

    end

    def play
        while over? == false
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end