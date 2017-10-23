require_relative '../models/entry'

RSpec.describe Entry do
    describe "attributes" do
        let(:entry) {Entry.new('Ada Lovelace', '101.012.1815', 'augusta.king@adalovelace.com')}

        it "responds to name" do
            expect(entry).to respond_to(:name)
        end

        it "reports its name" do
            expect(entry.name).to eq('Ada Lovelace')
        end

        it "responds to phone number" do
            expect(entry).to respond_to(:phone_number)
        end

        it "rports its phone_number" do
            expect(entry.phone_number).to eq('101.012.1815')
        end

        it "respond to email" do
            expect(entry).to respond_to(:email)
        end

        it "reports its email" do
            expect(entry.email).to eq('augusta.king@adalovelace.com')
        end

        describe "#to_s" do
            it "prints an entry as a string" do
                entry = Entry.new('Ada Lovelace', '101.012.1815', 'augusta.king@adalovelace.com')
                expected_string = "Name: Ada Lovelace\nPhone Number: 101.012.1815\nEmail: augusta.king@adalovelace.com"
                expect(entry.to_s).to eq(expected_string)
            end
        end

    end
end
