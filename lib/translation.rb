
class Translation

   attr_accessor  :english, :spanish, :category 

   @@all = []

   def initialize(english, spanish, category)
        @english = english
        @spanish = spanish 
        @category = category
        @@all << self
   end 

   def self.all
       @@all
   end 

   def self.terms
        @@all.select do |object|  #.select returns the selection of objects with term as category
            object.category == "term"
        end     
    end

    def self.phrases
        @@all.select do |object|  
            object.category == "phrase"
        end     
    end

   
        
end 