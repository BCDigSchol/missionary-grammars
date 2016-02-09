module LanguagesHelper
  def form_line(form, field, input_type)
    render "texts/form_line", form: form, field: field, input_type: input_type
  end
end
