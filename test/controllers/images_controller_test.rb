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

  test 'should show page with image having no tags' do
    @image = Image.create!(image_url: 'https://image.png')

    get image_path(@image.id)

    assert_response :success
    assert_select 'p', 'Image:'
    assert_select 'img[src="https://image.png"]'
    assert_select 'img[class="image-adjusted"]', count: 1
    assert_select 'label[class="btn btn-light"]', count: 0
  end

  test 'should show page with image having tags' do
    @image = Image.create!(image_url: 'https://image.png', tag_list: 'pikachu, pokemon')

    get image_path(@image.id)

    assert_response :success
    assert_select 'label[class="btn btn-light"]', text: 'pikachu'
    assert_select 'label[class="btn btn-light"]', text: 'pokemon'
  end

  test 'should display all images in db' do
    Image.create!([{ image_url: 'https://image.png', tag_list: 'pikachu' },
                   { image_url: 'https://andrew.jpg', tag_list: 'man' },
                   { image_url: 'https://darren.jpeg', tag_list: 'handsome' }])

    get images_url

    assert_response :success
    assert_select 'img[class="image-adjusted"]', count: 3

    assert_select 'td' do |item|
      assert_equal 'handsome', item[0].at('label').text
      assert_equal 'https://darren.jpeg', item[1].at('img')['src']
      assert_equal 'man', item[2].at('label').text
      assert_equal 'https://andrew.jpg', item[3].at('img')['src']
      assert_equal 'pikachu', item[4].at('label').text
      assert_equal 'https://image.png', item[5].at('img')['src']
    end
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

  test 'should only display images related to selected tag' do
    Image.create!([{ image_url: 'https://image.png', tag_list: 'pikachu' },
                   { image_url: 'https://andrew.jpg', tag_list: 'pikachu' },
                   { image_url: 'https://darren.jpeg', tag_list: 'handsome' }])

    get images_path(tag: 'pikachu')

    assert_response :success
    assert_select 'a[href="/images?tag=pikachu"]', count: 2
    assert_select 'a[href="/images?tag=man"]', count: 0
    assert_select 'a[href="/iamges?tag=handsome"]', count: 0
    assert_select 'img[class="image-adjusted"]' do |elements|
      assert_equal 'https://andrew.jpg', elements[0].attr('src')
      assert_equal 'https://image.png', elements[1].attr('src')
    end
  end

  test 'should display nothing if the tag is not existing' do
    Image.create!([{ image_url: 'https://image.png', tag_list: 'pikachu' },
                   { image_url: 'https://andrew.jpg', tag_list: 'man' },
                   { image_url: 'https://darren.jpeg', tag_list: 'handsome' }])

    get images_path(tag: 'kevin')

    assert_select 'label[class="btn btn-light"]', count: 0
    assert_select 'img[class="image-adjusted"]', count: 0
  end
end
