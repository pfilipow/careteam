require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @domain = "www.example.com"

    blog = create(:blog, owner: create(:user), domain: @domain)
    author = create(:user)
    article = create(:article, blog: blog, author: author)

    @comment = create(:comment, article: article)

    sign_in author
  end

  test "should get index" do
    get article_comments_url(@comment.article)
    assert_redirected_to @comment.article
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post article_comments_url(@comment.article), params: { comment: { article_id: @comment.article_id, author: @comment.author, content: @comment.content } }
    end

    assert_redirected_to @comment.article
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_redirected_to @comment.article
  end


end
