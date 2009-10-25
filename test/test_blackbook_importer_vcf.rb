require File.join( File.dirname(__FILE__), '../lib/blackbook.rb' )
require File.join( File.dirname(__FILE__), 'test_helper.rb' )
require 'tempfile'
require 'test/unit'
require 'mocha'

class TestBlackbookImporterVcf < Test::Unit::TestCase

  include TestHelper

  def setup
    @importer = Blackbook::Importer::Vcf.new
  end

  def test_importer_match
    vcf = Tempfile.new('test.vcf')
    assert_equal false, @importer =~ nil
    assert_equal false, @importer =~ {}
    assert_equal false, @importer =~ {:file => nil}
    assert_equal true, @importer =~ {:file => vcf}
  end

#   def test_fetch_contacts
#     file = mock(:path => '/tmp/test.vcf')
#     options = {:file => file}
#     @importer.instance_variable_set(:@options, options)
#     input = <<-EOVC
# BEGIN:VCARD
# N:joe;
# EMAIL:joe@example.com
# END:VCARD
# BEGIN:VCARD
# N:fred;
# EMAIL:fred@example.com
# END:VCARD
#     EOVC
#     
#     Vpim::Vcard.expects(:decode).with('/tmp/test.vcf').once.returns(input)
#     expected = [{:name => 'joe', :email => 'joe@example.com', :misc => ''},
#                 {:name => 'fred', :email => 'fred@example.com', :misc => ''}]
#     assert_equal expected, @importer.fetch_contacts!
#   end

end
