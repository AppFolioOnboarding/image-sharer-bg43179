require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @image = Image.new
  end

  test "should get new page" do
    get images_new_url
    assert_response :success
    assert_select 'h1', text: 'Images'
  end

  test "should create new image for valid url" do
    assert_difference 'Image.count', 1 do
      post images_url, params: { image: { image_url: 'https://image.png' } }
    end

    assert_equal 'https://image.png', Image.last.image_url
    assert_redirected_to image_path(Image.last.id)
    assert_response :redirect
  end

  test "should not create image for invalid url" do
    assert_difference 'Image.count', 0 do
      post images_url, params: { image: { image_url: 'https://image' } }
    end

    assert_response :unprocessable_entity
  end

  test "should show page with image" do
    @image = Image.create(image_url: 'https://image.png')
    get image_path(@image.id)
    assert_response :success

    assert_select 'p', 'Image:'
    assert_select 'img[src="https://image.png"]'
  end
end
