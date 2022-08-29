require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new
    end

    it "should save a product successfully" do
      product = Product.create(name: "Fig", price: 9001, quantity: 100, category: @category)
      expect(product).to be_valid
    end

    it "should validate that name exists within products" do
      product = Product.create(name: nil, price: 9001, quantity: 100, category: @category)
      puts product.errors.full_messages
      expect(product).not_to be_valid
    end

    it "should validate that price exists within products" do
      product = Product.create(name: "Fig", quantity: 100, category: @category)
      puts product.errors.full_messages
      expect(product).not_to be_valid
    end

    it "should validate that quantity exists within products" do
      product = Product.create(name: "Fig", price: 9001, quantity: nil, category: @category)
      puts product.errors.full_messages
      expect(product).not_to be_valid
    end

    it "should validate that category exists within products" do
      product = Product.create(name: "Fig", price: 9001, quantity: 100, category: nil)
      puts product.errors.full_messages
      expect(product).not_to be_valid
    end

  end
end
