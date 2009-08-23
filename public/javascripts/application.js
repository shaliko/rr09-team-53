// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

  var FormInsertion = Class.create({
    initialize: function(element, title, type, value) {
      this.element = $(element);
      this.title   = title;
      this.value   = value||'';
      this.type    = type;

      this.insert(this.element, this.prepareResult());
    },

    prepareResult: function() {
      if (this.type == 'select') {
        return "{{ '#{title}' | '#{options} ' | #{type} }}".interpolate({title: this.title, options: this.value.gsub("\n", '::'), type: this.type});
      } else {
        return "{{ '#{title}' | #{type} }}".interpolate({title: this.title, type: this.type});
      }
    },

    insert: function(textarea, value) {
      textarea.focus();
      if(textarea.createTextRange) {
        document.selection.createRange().text += value;
      } else if(textarea.setSelectionRange) {
        var len = textarea.selectionEnd;
        textarea.value = textarea.value.substr(0, len) + value + textarea.value.substr( len );
        textarea.setSelectionRange(len+value.length,len+value.length);
      } else { textarea.value += value; }
    }
  });