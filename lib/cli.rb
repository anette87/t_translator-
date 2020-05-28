
class CLI


    def welcome 
        puts "Welcome! Would you like to transale a term or a phrase? Please type 'phrase' or 'term' to select. To quit type 'exit'".blue 
        user_input = gets.strip.downcase
        until user_input == "exit" 
            if user_input == "term"
               terms
               puts "Would you like to transale a term or a phrase? Please type 'phrase' or 'term' to select. To quit type 'exit' "
            elsif user_input == "phrase"
               phrases
               puts "Would you like to transale a term or a phrase? Please type 'phrase' or 'term' to select. To quit type 'exit' "
            else 
               puts " Sorry, '#{user_input}' it's not valid option. Please type 'phrase' or 'word' to select."
            end 
            user_input = gets.strip.downcase
        end 
    end 

    def terms
        puts "Choose a term"
        Scraping.new.scraping_term
        terms = Translation.terms 
        options(terms)
        user_input = gets.strip.downcase
        until user_input == "back to menu" || user_input == "menu"
            translations(terms, user_input)
            directions
            user_input = gets.strip.downcase
        end
    end 
      
    def phrases
        puts "Choose a phrase"
        Scraping.new.scraping_phrases
        phrases = Translation.phrases
        options(phrases)
        user_input = gets.strip.downcase
        until user_input == "back to menu" || user_input == "menu"
            translations(phrases,user_input)
            directions
            user_input = gets.strip.downcase
        end
    end 

    def options(input)
        input.each_with_index do |object, i| 
            puts "- - - - - - - - - - - - - - - - - - - - - - - - -"
            puts " '#{object.english}' Press #{i+=1}" 
            puts "- - - - - - - - - - - - - - - - - - - - - - - - -"
            puts ""
        end 
    end 

    def translations(category, user_input)
        category.each_with_index do |object, i| 
            if user_input == "#{i+=1}"
                puts "+ + + + + + + + + + + + + + + + + + + + + + + + +"
                puts "'#{object.english}' = '#{object.spanish}'"
                puts "+ + + + + + + + + + + + + + + + + + + + + + + + +"
            end
        end
    end 

    def directions
            puts ""
            puts ""
            puts ""
            puts " ____________________________________"
            puts "|                                    |"
            puts "|Choose a new and valid entry number |"
            puts "|      or type 'back to menu'        |"
            puts "|____________________________________|"
            puts ""
            puts ""
            puts ""
    end

    
end 

    




