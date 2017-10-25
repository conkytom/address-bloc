require_relative '../models/address_book'

class MenuController
    attr_reader :address_book

    def initialize
        @address_book = AddressBook.new
    end
#Main menu display
    def main_menu
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - View entry Number n"
        puts "3 - Create an entry"
        puts "4 - Search for an entry"
        puts "5 - Import entries from a CSV"
        puts "6 - Exit"
        print "Enter your selection: "

        selection = gets.to_i
#Main menu option selectors
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                if address_book.entries.count == 0
                    system "clear"
                    puts "You must first create at least one entry"
                    main_menu
                else
                    system "clear"
                    view_entry_n
                    main_menu
                end
            when 3
                system "clear"
                create_entry
                main_menu
            when 4
                system "clear"
                search_entries
                main_menu
            when 5
                system "clear"
                read_csv
                main_menu
            when 6
                puts "Good-Bye!"
                exit(0)
            else
                system "clear"
                puts "Sorry, that is not a valid input"
                main_menu
        end
    end
#Menu's option's methods
    def view_all_entries
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            entry_submenu(entry)
        end

        system "clear"
        puts "End of entries"
    end

    def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        print "Name: "
        name = gets.chomp
        print "Phone Number: "
        phone_number = gets.chomp
        print "Email: "
        email = gets.chomp

        address_book.add_entry(name, phone_number, email)

        system "clear"
        puts "New entry created"
    end

    def view_entry_n
        puts "View entry by n (a given index number)"
        print "Enter n(1 through #{address_book.entries.count}): "
        n = gets.to_i
        if n > address_book.entries.count || n <= 0 
            puts "Sorry #{n} is not a valid n value"
            view_entry_n
        end

        system "clear"
        puts address_book.entries[n - 1].to_s
        puts "n - enter new n"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        selection = gets.chomp
        case selection
            when "n"
                view_entry_n
            when "d"
            when "e"
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end

    end

    def search_entries

    end

    def read_csv

    end
#Submenu for view_all_entries
    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"

        selection = gets.chomp
        case selection
            when "n"
            when "d"
            when "e"
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end
    end
end
