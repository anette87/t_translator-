
class Scraping
      
    
    def scraping_phrases
        url = "https://www.rocketlanguages.com/spanish/phrases/spanish-travel-phrases"
        doc = Nokogiri::HTML(open(url))
        phrases = doc.css('.lesson-component ul')[0].text.split(/\n\t/).reject { |e| e == ""}
        phrases.each_with_index do |phrase, i|
            phrase_s = phrase.split("-")
            Translation.new(phrase_s[1],phrase_s[0],"phrase") 
        end 
    end 
    
    def scraping_term
        url = "https://www.ailmalaga.com/the-vocabulary-of-the-airport-in-spanish/"
        doc = Nokogiri::HTML(open(url))
        terms = doc.css(".fusion-text").css("p")[4].children.map { |element| element.text }.reject { |e| e == " " || e == "" }
        from_array_to_hash = {}
        terms.each_slice(2) {|k,v| from_array_to_hash[k]=v}
        from_array_to_hash.each_with_index do |(k,v),i|
            Translation.new(v,k,"term") 
        end  
    end          
end  

