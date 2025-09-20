class ExamplesController < ApplicationController
  def index
    @examples = Example.all
  end

  def new
    @example = Example.new

    @root_words = RootWord.all
    @root_word = RootWord.new

    @chapters = Chapter.all
    @root_word.build_chapter
  end

  def create
    @example = Example.new(example_params)

    respond_to do |format|
      if @example.save
        format.html { redirect_to examples_path, notice: "Example was saved" }
      else
        @root_words = RootWord.all
        @root_word = @example.root_word || @example.build_root_word

        @chapters = Chapter.all
        @root_word.chapter || @root_word.build_chapter

        format.html { render :new }
      end
    end
  end

  def show
    @example = Example.find(params[:id])
  end

  private

  def example_params
    params.expect(example: [
      :en_us,
      :es_mx,
      :root_word_id,
      root_word_attributes: [
        :page,
        :display_name,
        :chapter_id,
        chapter_attributes: [ :number, :title, :page ],
      ]
    ]).tap do |config|
      if config[:root_word_id].present?
        config.delete(:root_word_attributes)
      end

      if config[:root_word_attributes].present? &&
        config[:root_word_attributes][:chapter_id].present?
        config[:root_word_attributes].delete(:chapter_attributes)
      end
    end
  end
end
