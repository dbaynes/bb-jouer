class BbJouer
  attr_accessor :player
  def initialize
    @player = {:PA => 681, :H=> 190, :D=>41,:T=>0,:HR=>27,:BB=>65,:SO=>85,:HBP=>6,:SAC=>5,:BA=>314,:OBP=>383,:SLG=>516,
      :OPS=>899,:OPSplus=>145,:BR=>398,:BRS=>81,:BRSpc=>20,:TB=>312,:AB=>605,
      :PA3B=>49,:PA3BS =>28,:PA3BSpc=>57,:PA2B=>32,:PA2Badv=>18,:PA2Badvpc=>56}
  end
  #stat table
  def build_stat_table 
    @stat_table = Array.new(@player[:H]){|v| v="Base Hit"}
    @stat_table = @stat_table + Array.new(@player[:D]){"Double"}
    @stat_table = @stat_table + Array.new(@player[:T]){"Trible"}
    @stat_table = @stat_table + Array.new(@player[:HR]){"Home Run"}
    @stat_table = @stat_table + Array.new(@player[:BB]){"Ball Four!"}
    @stat_table = @stat_table + Array.new(@player[:SO]){"Strike Three!"}
    @stat_table = @stat_table + Array.new(@player[:HBP]){"Hit By Pitch"}
    @stat_table = @stat_table + Array.new(@player[:SAC]){"Sacrafice"}
    @stat_table = @stat_table + Array.new(1000-@stat_table.length){"Outta There!"}
    @stat_table.length
  end  
  #confirm obs
  def confirm_ops    
    @player[:OBP] + @player[:SLG]
  end  
  def confirm_slg    
    #(312.fdiv(605).round(3)*1000).to_i
    (@player[:TB].fdiv(@player[:AB]).round(3)*1000).to_i
  end  
  def slg    
    @player[:SLG]
  end  
  def ops    
    @player[:OPS]
  end  
  def obp    
    @player[:OBP]
  end  
  def slg    
    @player[:SLG]
  end  
  #batting average
  def ba    
    @player[:BA]
  end  
  #plate appearances
  def pa  
    @player[:PA]
  end   
  def calculate_chances home,pitcher,runner1, runner2,runner3
    @runner_0 = false
    @runner_1 = false
    @runner_2 = false
    @runner_3 = false
    @runner_1_2 = false
    @runner_1_3 = false
    @runner_2_3 = false
    @runner_1_2_3 = false
    puts "\n"
    puts "Situation:"
    if home == 'Y'
      puts " - Playing at Home"
    else
      puts " - On the Road"
    end
    if pitcher == 'Y'
      puts " - Batting against a Lefty"
    else
      puts " - Batting against a Righty"
    end
    if runner1 == 'N' && runner2 == 'N' && runner3 == 'N'
      @runner_0 = true
      puts " - The Bases are Empty"
    elsif runner1 == 'Y' && runner2 == 'Y' && runner3 == 'Y'
      @runner_1_2_3 = true
      puts " - The Bases are Loaded!"
    elsif runner1 == 'Y' && runner2 == 'Y'
      @runner_1_2 = true
      puts " - Runners on First and Second"
    elsif runner1 == 'Y' && runner3 == 'Y'
      @runner_1_3 = true
      puts " - Runners on First and Third"
    elsif runner2 == 'Y' && runner3 == 'Y'
      @runner_2_3 = true
      puts " - Runners on Second and Third"
    elsif runner1 == 'Y' 
      @runner_1 = true
       puts " - Runner on First"
    elsif runner2 == 'Y' 
      @runner_2 = true
      puts " - Runner on Second"
    elsif runner3 == 'Y' 
      @runner_3 = true
      puts " - Runner on Third"
    elsif runner2 == 'Y' && runner3 == 'Y'
      @runner_2_3 = true
      puts " - Runners on Second and Third"
     end   
    determine_probability  
  end
  def determine_probability
    @stat = @stat_table.sample
    put_result
  end
  def put_result
    puts "The fans await the pitch...."
    puts "\n"
    sleep(3)
    case @stat
    when "Ball Four!" || "Hit By Pitch"
   	  if @runner_1_2_3 
    		  puts "#{@stat} - 1 run scores - The Bases are still loaded"
      	elsif @runner_2_3 
      		puts "#{@stat} - The Bases are now loaded"
  		  elsif @runner_1_2 
    		  puts "#{@stat} - The Bases are now loaded"
  		  elsif @runner_1_3 
    		  puts "#{@stat} - The Bases are now loaded"
  		  elsif @runner_1
    		  puts "#{@stat} - Runners are now on First and Second"
  		  elsif @runner_2
    		  puts "#{@stat} - Runners are now on First and Second"
  		  elsif @runner_3
    		  puts "#{@stat} - Runners are now on First and Third"
  		  else
  		    puts "#{@stat} - a Runner is now on first"
  		  end
    when "Strike Three!"
    	puts "#{@stat} - He Struck him out!"
  	when "Sacrafice"
   	  if @runner_1_2_3 
    		  puts "#{@stat} - 1 run scores on a tag up - Runners advance and now on second and third"
      	elsif @runner_2_3 
      		puts "#{@stat} - Runner tags - 1 run scores and runner advances to third"
  		  elsif @runner_1_2 
    		  puts "#{@stat} - Runners tag and move up a base to second and third"
  		  elsif @runner_1_3 
    		  puts "#{@stat} - Runner tags and 1 runn scores"
  		  elsif @runner_1
    		  puts "#{@stat} - Runners tages and now in scoring postion at second base!"
  		  elsif @runner_2
    		  puts "#{@stat} - Runner tags and moves over to third"
  		  elsif @runner_3
    		  puts "#{@stat} - Runner tags up and scores!"
  		  else
  		    puts "#{@stat} - Runner thrown out at first trying to bunt for a base hit."
  		  end
  	when "Base Hit"
  	  if @runner_1_2_3 
  		  puts "#{@stat} - 2 runs score - Runners now on first and third"
    	elsif @runner_2_3 
    		puts "#{@stat} - 2 runs score - Runner now on first base"
		  elsif @runner_1_2 
  		  puts "#{@stat} - 1 run scores - Runners now on first and third"
		  elsif @runner_1_3 
  		  puts "#{@stat} - 1 run scores - runners now on first and second"
		  elsif @runner_1
  		  puts "#{@stat} - Runners now on first and second!"
		  elsif @runner_2
  		  puts "#{@stat} - 1 run scores - Runner now on first"
		  elsif @runner_3
  		  puts "#{@stat} - 1 run scores - Runner now on first"
		  else
		    puts "#{@stat} - Runner now on First Base."
		  end
		when "Double"  
		  if @runner_1_2_3 
     	  puts "#{@stat} - 2 Runs Score - Runners now on second and third"
   		elsif @runner_2_3
  		  puts "#{@stat} - 2 Run Scores - Runner now on second"
   		elsif @runner_1_2
  		  puts "#{@stat} - 1 Run Scores - Runners now on second and third"
		  elsif @runner_1_3 
  		  puts "#{@stat} - 1 run scores - runners now on second and third"
		  elsif @runner_1 
  		  puts "#{@stat} - Runners now on second and third"
		  elsif @runner_2 
  		  puts "#{@stat} - 1 run scores - Runner in scoring position"
		  elsif @runner_3 
  		  puts "#{@stat} - 1 run scores - Runner in scoring position"
		  else
		    puts "#{@stat} - Runner now on Second Base."
		  end
  	when "Triple"
  	  if @runner_1_2_3 
  		  puts "#{@stat} - 3 runs score!"
		  elsif @runner_1_2 || @runner_2_3
		    puts "#{@stat} - 2 runs score - Runner now on third"
		  elsif @runner_1 || @runner_2 || @runner_3
	  	  puts "#{@stat} - 1 run scores - Runner now on third"
  	  else
  	    puts "#{@stat} - Runner now on third base"
		  end
  	when "Home Run"
  	  if @runner_1_2_3 
  		  puts "#{@stat} - Grand Slam - 4 runs score!"
		  elsif @runner_1_2 || @runner_2_3
		    puts "#{@stat} - 3 runs score!"
		  elsif @runner_1 || @runner_2 || @runner_3
	  	  puts "#{@stat} - 2 run scores!"
      else
        puts "#{@stat} - Add one more to the score board!"
		  end
	  else
	    puts "#{@stat}"
  	end
    sleep(3)
    puts "\n"
    puts "Hit Enter to Continue with another scenario or exit to quit"
   end
  def over?
    @input = gets.chomp
    if @input == "exit" || @input == 'quit' || @input == 'q'
      true
    end
  end

  def <=>(other)
    @stat <=> other.stat
  end
end