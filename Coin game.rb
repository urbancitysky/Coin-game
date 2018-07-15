#-----------------------------------------------
# CECS 424 Assignment 1 
# Author : Shih Kai Chen
# Date: Sep 4th 2013
# Description: This is a coin game which allows
#              a user to move ajacent coins to 
#              a mix patern.
#------------------------------------------------

def get_Cursor_Position
    i=0
    STDOUT.flush 
    dest = gets.chomp
    cursor_position = dest.split(//)
    i = cursor_position.size
end

#----------------------
def main()
     play=true
     while (play==true)
         coin="HHHHHTTTTT"
         puts"To start this game, move two coins to the right end"
         puts coin
         coin=coin.split(//)
         i=get_Cursor_Position                  
         tmp1 = coin[i]
         tmp2 = coin[i+1]
         coin[i] = '-' 
         coin[i+1] = '-'         
         coin.push(tmp1)
         coin.push(tmp2)
         coin = coin.join
         puts coin
         count = 1
         while (count<5)
                puts"Please select 2 coins to move."
                puts coin
                i=get_Cursor_Position        
                coin=coin.split(//)
                tmp1 = coin[i]
                tmp2 = coin[i+1]
                if i >= 11
                     puts "Illegal move. Try again"
                     coin = coin.join

                elsif tmp1 =='-' ||tmp2 =='-'
                     puts "You select only one coin. Try again!"
                     coin = coin.join
                else
                     coin[i] = '-'
                     coin[i+1] = '-'
                     coin = coin.join
                     puts "Select where to put"                     
                     puts coin                     
                     j=get_Cursor_Position
                     if coin[j] !='-'|| coin[j+1]!='-'
                          puts"No enough room. Try again!"
                          coin[i]= tmp1
                          coin[i+1]= tmp2
                     else
                          coin=coin.split(//)
                          coin[j]= tmp1
                          coin[j+1]= tmp2
                          coin = coin.join
                          puts coin
                          count = count+1
                     end
                end                
                puts "Your move: #{count} times"  
         end
         coin=coin.gsub(/[-]/,'')
         puts "Eliminate gaps: #{coin}"
         if coin == 'HTHTHTHTHT' || coin == 'THTHTHTHTH'
                puts"You win!"
         else
                puts"You loose!"
         end
         puts"Play again? y/n"
         STDOUT.flush 
         answer = gets.chomp
         if answer=="n"
              play =false
         end
     end
end
     
main