class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.create(article_params)
        @article.save

        if @article.valid?
            redirect_to article_path(@article)
        else
            redirect_to new_article_path(@article)
        end
    end

    def new
        @article = Article.new
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to home_index_path
    end

    def checkValidity
        @current_author = current_author

            if @article.valid?
                redirect_to article_path(@article)
                current_author.saved_title = nil
                current_author.saved_body = nil
                current_author.save
            else
                if @article.title == ""
                    @current_author.saved_body = @article.body
                    @current_author.saved_title = nil
                elsif @article.body == ""
                    @current_author.saved_body = nil
                    @current_author.saved_title = @article.title
                end
                redirect_to article_path(@article)
            end
        @current_author.save

    end
end
