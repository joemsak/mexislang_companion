class ExpressionsController < ApplicationController
  before_action :set_expression, only: %i[ show edit update destroy ]

  # GET /expressions or /expressions.json
  def index
    @expressions = Expression.order(:en_us)
  end

  # GET /expressions/1 or /expressions/1.json
  def show
  end

  # GET /expressions/new
  def new
    @expression = Expression.new
    @root_words = RootWord.all
    @chapters = Chapter.all
    @root_word = RootWord.new
    @root_word.build_chapter
  end

  # GET /expressions/1/edit
  def edit
    @root_words = RootWord.all
    @chapters = Chapter.all
    @root_word = @expression.root_word
  end

  # POST /expressions or /expressions.json
  def create
    @expression = Expression.new(expression_params)

    respond_to do |format|
      if @expression.save
        format.html { redirect_to @expression, notice: "Expression was successfully created." }
        format.json { render :show, status: :created, location: @expression }
      else
        @root_words = RootWord.all
        @chapters = Chapter.all
        @root_word = @expression.root_word || RootWord.new
        @root_word.build_chapter unless @root_word.chapter

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expressions/1 or /expressions/1.json
  def update
    respond_to do |format|
      if @expression.update(expression_params)
        format.html { redirect_to @expression, notice: "Expression was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @expression }
      else
        @root_words = RootWord.all
        @chapters = Chapter.all
        @root_word = @expression.root_word

        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expressions/1 or /expressions/1.json
  def destroy
    @expression.destroy!

    respond_to do |format|
      format.html { redirect_to expressions_path, notice: "Expression was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expression
      @expression = Expression.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def expression_params
      params.expect(
        expression: [
          :en_us,
          :es_mx,
          :page,
          :root_word_id,
          root_word_attributes: [
            :display_name,
            :page,
            :chapter_id,
            chapter_attributes: [ :number, :title, :page ]
          ]
        ]
      ).tap do |config|
        if config[:root_word_id].present?
          config.delete(:root_word_attributes)
        end

        if config[:root_word_attributes].present? &&
          config[:root_word_attributes][:chapter_id].present?
          config[:root_word_attributes].delete(:chapter_attributes)
        end

        if config[:root_word_id].blank? && params[:also_root_word]
          # Copy mexican expression to display name
          display_name = config[:es_mx]

          # Use same page if it's checked, or expect root_word_page
          page = params[:root_word_same_page] ? config[:page] : params[:root_word_page]

          chapter_id = params[:root_word][:chapter_id]
          chapter_attributes = {}
          chapter_attributes[:number] = params[:chapter_number] if params[:chapter_number].present?
          chapter_attributes[:title] = params[:chapter_title] if params[:chapter_title].present?
          chapter_attributes[:page] = params[:chapter_page] if params[:chapter_page].present?

          config[:root_word_attributes] = {
            display_name:,
            page:,
            chapter_id:,
            chapter_attributes:
          }.compact_blank
        end
      end
    end
end
