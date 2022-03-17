class Customer < ActiveRecord::Base
  validates_presence_of :company_id, :name
  
  belongs_to :company

  has_many :marcas 
  has_many :invoices
  has_many :manifests
  has_many :facturas
  has_many :addresses
  has_many :quotes 
  has_many :ordens 
  has_many :customer_contratos
  
  
  has_many :customer_contacts , dependent: :destroy

 accepts_nested_attributes_for :customer_contacts , reject_if: proc { |att| att['name'].blank?} , :allow_destroy => true


    def self.import(file)
          CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
          Customer.create! row.to_hash 
        end
    end      

    def self.import2(file)
          CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
          Address.create! row.to_hash 
        end
      end      
    
  def get_taxable
    if(self.taxable == "1")
      return "Taxable"
    else
      return "Not taxable"
    end
  end
  
  def self.to_csv
    attributes = %w{id name ruc account address1 }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |customer|
        csv << attributes.map{ |attr| customer.send(attr) }
      end
    end
  end

   def direccion_all

      direccion_all ="#{self.address1} #{self.address2} #{self.address2} #{self.city} #{self.state} ".strip    

  end 
  

end
