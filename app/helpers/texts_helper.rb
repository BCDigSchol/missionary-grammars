module TextsHelper
  def form_fieldset(fieldset_label, form, field, attribute)
    render "texts/form_fieldset", fieldset_label: fieldset_label, form: form, field: field, form_element: attribute
  end

  def form_line(form, field, input_type)
    render 'texts/form_line', form: form, field: field, input_type: input_type
  end
end
