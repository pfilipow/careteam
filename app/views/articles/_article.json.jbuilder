json.extract! article, :id, :blog_id, :title, :content, :author_id, :created_at, :updated_at
json.url article_url(article, format: :json)
