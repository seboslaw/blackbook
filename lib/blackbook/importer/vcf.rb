require 'vpim'

##
# Imports contacts from a Vcard file

class Blackbook::Importer::Vcf < Blackbook::Importer::Base

  DEFAULT_COLUMNS = [:name,:email]

  ##
  # Matches this importer to a file that contains Vcf values

  def =~(options)
    options && options[:file].respond_to?(:open) ? true : false
  end

  ##
  # fetch_contacts! implementation for this importer

  def fetch_contacts!  
    cards = Vpim::Vcard.decode(open(options[:file].path))
    
    contacts = Array.new
    cards.each do |card|
      h = Hash.new
      h[:name]  = card.name.fullname.to_s
      h[:email] = card.email.to_s
      contacts << h
    end
    
    contacts
  end

  Blackbook.register(:vcf, self)
end
