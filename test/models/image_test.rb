require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'Valid if url is valid' do
    @image = Image.new(image_url: 'https://image.png')
    assert @image.valid?
  end

  test 'Invalid if url is invalid' do
    @image = Image.new(image_url: 'https://image')
    refute @image.valid?
    assert_equal ['Image url is invalid'], @image.errors.full_messages
  end

  test 'Invalid if url is blank' do
    @image = Image.new
    refute @image.valid?
    assert_equal ['Image url is invalid'], @image.errors.full_messages
  end
end
