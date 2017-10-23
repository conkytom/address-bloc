require_relative 'entry'

    class AddressBook
        attr_reader :entries

        def initialize
            @entries = []
        end

        def add_entry(name, phone_number, email)
            index = 0
            entries.each do |entry|
            if name < entry.name
                break
            end
            index+= 1
        end

        def remove_entry(name, phone_number, email)
            entries.each_index do |entry, index|
                entries.slice!(index) if name == entry.name
            end
        end
        entries.insert(index, Entry.new(name, phone_number, email))
    end
end
