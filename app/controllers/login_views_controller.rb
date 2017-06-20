require 'controllers/base_controller'

configure {
  set :server, :puma
}

class LoginViewsController < BaseController

  before '*' do
    response.set_cookie("test_cookie", value: 'yummy', expires: Time.now+24*60*60)
  end

  get '/' do
    erb :login, layout: :default_layout
  end

  get '/new' do
    erb :new_note, layout: :default_layout
  end

  get '/:note_id' do
    param :note_id, Integer, required:true

    @note = Note.find(params[:note_id])

    erb :specific_note
  end

  post '/' do
    param :comment, String, required: true
    param :user_id, Integer, required: true
    param :category, String

    Note.create!(
      comment: params[:comment],
      category: params[:category],
      user_id: params[:user_id],
    )

    @notes = Note.all

    redirect to('/')
  end

  post '/delete/:note_id' do
    param :note_id, Integer, required: true

    note = note = Note.find(params[:note_id])
    note.delete

    redirect to('/')
  end


  post '/:note_id' do
    param :note_id, Integer, required: true
    param :comment, String
    param :category, String

    note = Note.find(params[:note_id])
    note.comment = params[:comment] if params[:comment].present?
    note.category = params[:category] if params[:category].present?
    note.save!

    @note = note
    redirect to("/#{note.id}")
  end

end
