require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    blog = create(:blog, owner: create(:user))
    author = create(:user)
    article = create(:article, blog: blog, author: author)

    @comment = create(:comment, article: article)
  end

  test "should get index" do
    get article_comments_url(@comment.article)
    assert_response :success
  end

  test "should get new" do
    get new_article_comment_url(@comment.article)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post article_comments_url(@comment.article), params: { comment: { article_id: @comment.article_id, author: @comment.author, content: @comment.content } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { article_id: @comment.article_id, author: @comment.author, content: @comment.content } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to article_comments_url(@comment.article)
  end
end
