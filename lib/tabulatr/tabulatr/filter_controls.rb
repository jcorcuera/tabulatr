class Tabulatr

  # render the select tag or the buttons for batch actions
  def render_filter_controls
    make_tag(:div, :class => @table_options[:filter_controls_div_class]) do
      concat(t(@table_options[:filter_controls_label])) if @table_options[:filter_controls_label]

      @table_options[:filter_controls].each do |name, options|
        iname = "#{@classname}#{TABLE_FORM_OPTIONS[:filter_postfix]}[#{name}]"
        value = @filters[name]
        make_tag(:select, :name => iname) do
          concat("<option></option>")
          t = options_for_select(options)
          concat(t.sub("value=\"#{value}\"", "value=\"#{value}\" selected=\"selected\""))
        end # </select>
      end
    end # </div>
  end

end