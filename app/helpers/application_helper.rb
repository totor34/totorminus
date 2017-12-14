module ApplicationHelper
  def choose_passenger_value
    params[:search].blank? ? 1 : params[:search][:passenger_number]
  end

  def set_params(key)
    return params[:search][key] unless params[:search].blank?
  end

  def choose_photo_path(user)
    user.photo? ? user.photo.path : image_url('default_avatar_pic.png')
  end
end
