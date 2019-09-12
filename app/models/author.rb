class Author < ApplicationRecord
    has_many :books

    validates :last_name, :first_name, :gender, :sexual_orientation, :race, :nationality, presence: true

    def self.by_last
        Author.all.sort_by { |author| author.last_name }
    end

    def name
        self.first_name + " " + self.last_name
    end

    def alpha_books
        Book.where(author_id: self.id).alphabetical
    end

    def self.gender_ary
        gender_ary = []
        Author.all.each do |author|
            if gender_ary.exclude? author.attributes.values[3]
                gender_ary << author.attributes.values[3]
            end
        end
        gender_ary
    end

    def self.so_ary
        so_ary = []
        Author.all.each do |author|
            if so_ary.exclude? author.attributes.values[4]
                so_ary << author.attributes.values[4]
            end
        end
        so_ary
    end

    def self.race_ary
        race_ary = []
        Author.all.each do |author|
            if race_ary.exclude? author.attributes.values[5]
                race_ary << author.attributes.values[5]
            end
        end
        race_ary
    end

    def self.nation_ary
        nation_ary = []
        Author.all.each do |author|
            if nation_ary.exclude? author.attributes.values[6]
                nation_ary << author.attributes.values[6]
            end
        end
        nation_ary
    end

    def self.diversity_hash
        @diversity_hash = {
            gender: {},
            sexual_orientation: {},
            race: {},
            nationality: {}
        }

        Author.gender_ary.each do |gender|
            @diversity_hash[:gender][gender] = 0
        end
        
        Author.so_ary.each do |so|
            @diversity_hash[:sexual_orientation][so] = 0
        end

        Author.race_ary.each do |race|
            @diversity_hash[:race][race] = 0
        end

        Author.nation_ary.each do |nation|
            @diversity_hash[:nationality][nation] = 0
        end

        @diversity_hash
    end
end