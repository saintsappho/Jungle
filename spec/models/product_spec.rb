require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do

    it 'can function correctly' do
      category = Category.create(name: "TestCat")
      @product = Product.new(name: 'TestPro', price: 10.00, quantity: 666, category: category)
      expect(@product).to be_present
      expect(@product.name).to be_present
      expect(@product.price).to be_present
      expect(@product.quantity).to be_present
      expect(@product.category).to be_present
    end

    it 'validates name' do
      category = Category.create(name: "TestCat")
      @product = Product.new( price: 10.00, quantity: 666, category: category)
      expect(@product.name).to be_nil
    
    end

    it 'validates price' do
      category = Category.create(name: "TestCat")
      @product = Product.new(name: 'TestPro', quantity: 666, category: category)
      expect(@product.price).to be_nil
    end

    it 'validates quantity' do
      category = Category.create(name: "TestCat")
      @product = Product.new(name: 'TestPro', price: 10.00, category: category)
      expect(@product.quantity).to be_nil
    end

    it 'validates category' do
      @product = Product.new(name: 'TestPro', price: 10.00, quantity: 666)
      expect(@product.category).to be_nil
    end
  end
end
