require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    #all attributes is present
    it "is valid" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test' 
      @product.price_cents = 68000
      @product.quantity = 13
      @product.category = @category
      expect(@product.valid?).to be true
    end

    #name attribute
    it "name attribute presence" do
      @product = Product.new
      @product.name = nil #invalid
      @product.valid?
      expect(@product.errors[:name]).to include("can't be blank")
  
      @product.name = 'Product Test' #valid
      @product.valid? 
      expect(@product.errors[:name]).not_to include("can't be blank")
    end

    #price_cents attribute
    it "price_cents presence" do
      @product = Product.new
      @product.price_cents = nil #invalid
      @product.valid?
      expect(@product.errors[:price_cents]).to include("is not a number")
  
      @product.price_cents = 0 #valid
      @product.valid? 
      expect(@product.errors[:price_cents]).not_to include("can't be blank")
    end
  end
end
