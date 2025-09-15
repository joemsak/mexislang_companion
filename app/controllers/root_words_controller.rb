class RootWordsController < ApplicationController
  before_action :set_root_word, only: %i[ show edit update destroy ]

  # GET /root_words or /root_words.json
  def index
    @root_words = RootWord.all
  end

  # GET /root_words/1 or /root_words/1.json
  def show
  end

  # GET /root_words/new
  def new
    @root_word = RootWord.new
    @chapters = Chapter.all
    @root_word.build_chapter
  end

  # GET /root_words/1/edit
  def edit
    @chapters = Chapter.all
  end

  # POST /root_words or /root_words.json
  def create
    @root_word = RootWord.new(root_word_params)

    respond_to do |format|
      if @root_word.save
        format.html { redirect_to @root_word, notice: "Root word was successfully created." }
        format.json { render :show, status: :created, location: @root_word }
      else
        @chapters = Chapter.all
        @root_word.build_chapter unless @root_word.chapter

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @root_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /root_words/1 or /root_words/1.json
  def update
    respond_to do |format|
      if @root_word.update(root_word_params)
        format.html { redirect_to @root_word, notice: "Root word was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @root_word }
      else
        @chapters = Chapter.all

        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @root_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /root_words/1 or /root_words/1.json
  def destroy
    @root_word.destroy!

    respond_to do |format|
      format.html { redirect_to root_words_path, notice: "Root word was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_root_word
      @root_word = RootWord.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def root_word_params
      params.expect(root_word: [ :display_name, :page, :chapter_id ])
    end
end
