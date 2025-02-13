module ApplicationHelper
        def placeholder_field(f, field, type = :text_field)
          placeholder_text = f.object.class.human_attribute_name(field)
          f.send(type, field, placeholder: "#{placeholder_text} を入力してください")
        end
      end
