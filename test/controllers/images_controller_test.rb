require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @image = Image.new
  end

  test 'should get new page' do
    get new_image_url

    assert_response :success
    assert_select 'h1', text: 'Images'
    assert_select 'label[for="image_tag_list"]'
  end

  test 'should create new image for valid url' do
    assert_difference 'Image.count', 1 do
      post images_url, params: { image: { image_url: 'https://image.png' } }
    end

    assert_equal 'https://image.png', Image.last.image_url
    assert_redirected_to image_path(Image.last.id)
    assert_response :redirect
  end

  test 'should not create image for invalid url' do
    assert_difference 'Image.count', 0 do
      post images_url, params: { image: { image_url: 'https://image' } }
    end

    assert_response :unprocessable_entity
  end

  test 'should show page with image' do
    @image = Image.create!(image_url: 'https://image.png')

    get image_path(@image.id)

    assert_response :success
    assert_select 'p', 'Image:'
    assert_select 'img[src="https://image.png"]'
    assert_select 'img[class="image-adjusted"]', count: 1
  end

  test 'should display all images in db' do
    Image.create!([{ image_url: 'https://image.png' },
                   { image_url: 'https://andrew.jpg' },
                   { image_url: 'https://darren.jpeg' }])

    get images_url

    assert_response :success
    assert_select 'img[class="image-adjusted"]', count: 3
  end

  test 'should display image ordered by created time' do
    images = [{ image_url: 'https://image.png' },
              { image_url: 'https://andrew.jpg' },
              { image_url: 'https://darren.jpeg' }]

    Image.create!(images)

    get images_url

    assert_response :success
    assert_select 'img[class="image-adjusted"]' do |elements|
      assert_equal 'https://darren.jpeg', elements[0].attr('src')
      assert_equal 'https://andrew.jpg', elements[1].attr('src')
      assert_equal 'https://image.png', elements[2].attr('src')
    end
  end
end
