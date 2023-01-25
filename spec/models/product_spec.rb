require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
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
  end
end
