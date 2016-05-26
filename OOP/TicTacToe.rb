class Player

	attr_accessor  :turn, :tiles_played
	attr_reader :name, :symbol
	def initialize(name, symbol)
		@name = name
		@symbol = symbol
		@turn = false
		@tiles_played = []
	end

end

class Board
	attr_reader :board
	def initialize()
		@board = [" "," "," "," "," "," "," "," "," "]
	end

	def draw_board
		@board.each_with_index do |tile, index|
			if index % 3 == 0
				puts ""
			end
			print "["+ tile.to_s + "]"
		end
		puts ""
	end

	def update_board(index, symbol)
		if tile_free?(index)
			@board[index] = symbol
		end
	end

	def reset_board
		@board = [" "," "," "," "," "," "," "," "," "]
	end

	def tile_free?(index)
		@board[index] == " "
	end

	def board_filled?
		!@board.any? { |e| e == " "}
	end
end

class Game 
	attr_reader :end_game, :state

	IN_PROGRESS = 0
	WIN = 1
	TIE = 2

	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
		@turn_counter = 0
		@board = Board.new
		@state = IN_PROGRESS
		@end_game = false
	end

	def start
		main_menu
		input = gets.chomp()
		if input == "1"
			@board.reset_board
			@state = IN_PROGRESS
			@turn_counter = 0
			play
		elsif input == "2"
			display_instructions
		elsif input == "3"
			close
		else
			puts " please select a valid option"
			start
		end
	end

	def play

		while @state == IN_PROGRESS
			[@player1, @player2].each do |player|
				move = nil
				puts "turn: #{@turn_counter}"
				puts "state: #{@state}"
				
				turn(player, move)
				@turn_counter += 1
				
				if @state == WIN
					puts "#{player.name} won!"
					break
				end

				if @state == TIE
					puts "IT'S A TIE GAME!"
					break
				end

			end
		end 
	end

	def close
		puts "Thanks for playing!"
		@end_game = true
	end

	def turn(player, move)

		loop do
			puts "#{player.name} select your move: [0-8]"
			move = gets
			break if @board.tile_free?(move.to_i)
		end
		puts "#{player.name} chose #{move}"
			@board.update_board(move.to_i, player.symbol)
			@board.draw_board

			if win?(player, move)
				@state = WIN
			end

			if @board.board_filled?
				puts @board.board
				@state = TIE
			end
	end

	def win?(player, move)
		puts "p1_move : #{move}"
		zero_win_combo = [[@board.board[1], @board.board[2]],
		 [@board.board[3], @board.board[6]],
		 [@board.board[4], @board.board[8]]
		]

		one_win_combo = [[@board.board[0], @board.board[2]],
			 [@board.board[4], @board.board[7]]
			]

		two_win_combo = [[@board.board[0], @board.board[1]],
			 [@board.board[5], @board.board[8]],
			 [@board.board[4], @board.board[6]]
			]

		three_win_combo = [[@board.board[4], @board.board[5]],
			 [@board.board[0], @board.board[6]]
			]

		four_win_combo = [[@board.board[0], @board.board[8]],
			 [@board.board[1], @board.board[7]],
			 [@board.board[2], @board.board[6]],
			 [@board.board[3], @board.board[5]]	
			]

		five_win_combo = [[@board.board[3], @board.board[4]],
			 [@board.board[2], @board.board[8]]
			]

		six_win_combo = [[@board.board[0], @board.board[3]],
			 [@board.board[4], @board.board[2]],
			 [@board.board[7], @board.board[8]]
			]

		seven_win_combo = [[@board.board[6], @board.board[8]],
			 [@board.board[1], @board.board[4]]
			]

		eight_win_combo = [[@board.board[6], @board.board[7]],
			 [@board.board[2], @board.board[5]],
			 [@board.board[0], @board.board[4]]
			]

		if move.to_i == 0
			zero_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		elsif move.to_i == 1
			one_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		elsif move.to_i == 2
			two_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		elsif move.to_i == 3
			three_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		elsif move.to_i == 4
			four_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		elsif move.to_i == 5
			five_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		elsif move.to_i == 6
			six_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		elsif move.to_i == 7
			seven_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		elsif move.to_i == 8
			eight_win_combo.any? do |row| 
				row.all? { |e| e.equal? player.symbol } 
			end
		else
			return false
		end
	end

	def main_menu
	
		puts "----------------------------"
		puts "~~~WELCOME TO TIC-TAC-TOE~~~"
		puts "----------------------------"
		puts " What would you like to do?"
		puts " 1. Play Game"
		puts " 2. Instructions"
		puts " 3. Exit"
		puts "----------------------------"

	end
end

p1 = Player.new("Player1", "X")
p2 = Player.new("Player2", "O")

game = Game.new(p1,p2)

until game.end_game
	game.start
end








