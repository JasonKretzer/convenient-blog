namespace :qa_tools do
  desc "add a number of fake blog posts"
  task :add_fake_blog_posts, [:number_of_posts, :post_type] => :environment do |_, args|
    number_to_create = if args[:number_of_posts].blank? || args[:number_of_posts].to_i == 0
      100
    else
      args[:number_of_posts].to_i
    end

    post_type = if args[:post_type].present? && ["DRAFT", "SCHEDULED"].include?(args[:post_type].strip.upcase)
      args[:post_type].strip.upcase
    else
      "PUBLISHED"
    end
    number_to_create.times do |i|
      BlogPost.create(title: Faker::Company.bs, content: Faker::TvShows::TheITCrowd.quote, published_at: calculate_date(post_type))
      puts BlogPost.last.title
      puts BlogPost.last.content
      puts "====================="
    end
  end

  def calculate_date(post_type)
    return Time.current - 1.year if post_type == "PUBLISHED"
    return Time.current + 1.year if post_type == "SCHEDULED"

    nil
  end
end
