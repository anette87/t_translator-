
class CLI


    def welcome 
        banner 
        puts "Welcome! - ¡Bienvenido!".blue 
        puts "Would you like to translate a term or a phrase?".blue 
        puts "Please, enter 'term' or 'phrase' to select. To quit enter 'exit'".blue 
        user_input = gets.strip.downcase
        until user_input == "exit" 
            if user_input == "term"
               terms
               puts "Would you like to translate a term or a phrase?".blue 
               puts "Please, enter 'term' or 'phrase' to select. To quit enter 'exit'".blue 
            elsif user_input == "phrase"
               phrases
               puts "Would you like to translate a term or a phrase?".blue 
               puts "Please, enter 'term' or 'phrase' to select. To quit enter 'exit'".blue 
            else 
               puts "Sorry, '#{user_input}' it's not valid option. Please enter 'phrase' or 'term' to select.".red
            end 
            user_input = gets.strip.downcase
        end 
    end 

    def terms
        puts "Choose a term".blue
        Scraping.new.scraping_term
        terms = Translation.terms 
        options(terms)
        user_input = gets.strip.downcase
        until user_input == "back to menu" || user_input == "menu" || user_input == "back"
            object = terms[user_input.to_i]
            translations(object)
            directions
            user_input = gets.strip.downcase
        end
    end 
      
    def phrases
        puts "Choose a phrase".blue
        Scraping.new.scraping_phrases
        phrases = Translation.phrases
        options(phrases)
        user_input = gets.strip.downcase
        until user_input == "back to menu" || user_input == "menu" || user_input == "back"
            object = phrases[user_input.to_i]
            translations(object)
            directions
            user_input = gets.strip.downcase
        end
    end 

    def options(input)
        input.each_with_index do |object, i| 
            puts "- - - - - - - - - - - - - - - - - - - - - - - - -".blue
            puts " '#{object.english}' Press #{i+=1}".blue
            puts "- - - - - - - - - - - - - - - - - - - - - - - - -".blue
            puts ""
        end 
    end 

    def translations(object)
            puts "+ + + + + + + + + + + + + + + + + + + + + + + + +".green
            puts "'#{object.english}' = '#{object.spanish}'".green
            puts "+ + + + + + + + + + + + + + + + + + + + + + + + +".green   
    end 

    def directions
            puts ""
            puts ""
            puts ""
            puts " ____________________________________".red
            puts "|                                    |".red
            puts "|Choose a new and valid entry number |".red
            puts "|      or enter 'back to menu'       |".red
            puts "|____________________________________|".red 
            puts ""
            puts ""
            puts ""
    end

    def banner

     
        puts "                                  ___   ___   ___   ________   ___  ________    ___".green 
        puts "                                  | |   | |   | |   | |  | |   | |  | |  | |    | |".green 
        puts "                                  | |   | |   | |   | |__| |   | |  | |__| |    | |".green 
        puts "                                  | |   | |   | |   |  __  |   | |  |  __  |    | |".green 
        puts "                                  | |   | |   | |   | |  | |   | |  | |  | |    | |".green 
        puts "                                  | |___| |   | |   | |  | |   | |  | |  | |    | |".green 
        puts "                                  |_______|   |_|   |_|  |_|   | |  |_|  |_|    |_|".green 
        puts "                                                         ______| |              ___".green 
        puts "                                                         |_______|              |_|".green      
        puts ""
        puts "                                  Viaja! -> A English/Spanish basic travel translator".green
        puts "" 
    end 
        

    
end 

    