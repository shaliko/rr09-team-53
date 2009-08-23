var FormBuilder = Class.create({
  initialize:function () {
    this.fields = [];
  },
  setFields: function (fields) {
    if (Object.isArray(fields))
      this.fromArray(fields);
    if (Object.isString(fields))
      this.fromJSON(fields);

    return this;
  },
  fromArray: function (fields) {
    this.fields = fields;
    return this;
  },
  fromJSON: function (fields) {
    fields = fields.evalJSON();
    this.fields = (Object.isArray(fields)) ? fields : new Array(fields);

    return this;
  },
  toHTML: function () {
    html = '';
    this.fields.each(function (field, index) {
      if ('text' == field.type)
        html += this.buildTextField(field, index);
      if ('textarea' == field.type)
        html += this.buildTextareaField(field, index);
      if ('select' == field.type)
        html += this.buildSelectField(field, index);
    }.bind(this));

    return html;
  },
  buildTextField: function (field, index) {
    html = '<div><label for="field-'+index+'">#{title}</label>'.interpolate(field);
    html += '<input type="text" id="field-'+index+'" name="fields[value]['+index+']" value="#{value}" class="fullwidth" />'.interpolate(field);
    html += '<input type="hidden" id="hidden-field-'+index+'" name="fields[title]['+index+']" value="#{title}" />'.interpolate(field);
    html += '</div>';

    return html;
  },
  buildTextareaField: function (field, index) {
    html = '<div><label for="field-'+index+'">#{title}</label>'.interpolate(field);
    html += '<textarea id="field-'+index+'" name="fields[value]['+index+']" cols="10" rows="7" class="fullwidth">#{value}</textarea>'.interpolate(field);
    html += '<input type="hidden" id="hidden-field-'+index+'" name="fields[title]['+index+']" value="#{title}" />'.interpolate(field);
    html += '</div>';

    return html;
  },
  buildSelectField: function (field, index) {
    html = '<div><label for="field-'+index+'">#{title}</label>'.interpolate(field);
    options = '';
    if (Object.isArray(field.value) && field.value.size() > 0)
      field.value.each(function (value, index) {
        options += '<option value="'+value+'">'+value+'</option>';
      });
    html += '<select name="fields[value]['+index+']">'+options+'</select>';
    html += '<input type="hidden" id="hidden-field-'+index+'" name="fields[title]['+index+']" value="#{title}" />'.interpolate(field);
    html += '</div>';

    return html;
  }
});