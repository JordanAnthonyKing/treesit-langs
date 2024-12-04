(tag_name) @tag

; (erroneous_end_tag_name) @error ; we do not lint syntax errors
(comment) @comment @spell

(attribute_name) @tag.attribute

((attribute
  (quoted_attribute_value) @string)
  (#set! priority 99))

(text) @none @spell

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.heading)
  (#eq? @_tag "title"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.heading.1)
  (#eq? @_tag "h1"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.heading.2)
  (#eq? @_tag "h2"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.heading.3)
  (#eq? @_tag "h3"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.heading.4)
  (#eq? @_tag "h4"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.heading.5)
  (#eq? @_tag "h5"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.heading.6)
  (#eq? @_tag "h6"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.strong)
  (#any-of? @_tag "strong" "b"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.italic)
  (#any-of? @_tag "em" "i"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.strikethrough)
  (#any-of? @_tag "s" "del"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.underline)
  (#eq? @_tag "u"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.raw)
  (#any-of? @_tag "code" "kbd"))

((element
  (start_tag
    (tag_name) @_tag)
  (text) @markup.link.label)
  (#eq? @_tag "a"))

((attribute
  (attribute_name) @_attr
  (quoted_attribute_value
    (attribute_value) @string.special.url))
  (#any-of? @_attr "href" "src")
  (#set! @string.special.url url @string.special.url))

[
  "<"
  ">"
  "</"
  "/>"
] @tag.delimiter

"=" @operator

;inherits: html_tags

(doctype) @constant

"<!" @tag.delimiter

(entity) @character.special

; inherits: html_tags

(identifier) @variable

(pipe_operator) @operator

[
  (string)
  (static_member_expression)
] @string

(number) @number

(pipe_call
  name: (identifier) @function)

(pipe_call
  arguments: (pipe_arguments
    (identifier) @variable.parameter))

(structural_directive
  "*" @keyword
  (identifier) @keyword)

(attribute
  (attribute_name) @variable.member
  (#lua-match? @variable.member "#.*"))

(binding_name
  (identifier) @keyword)

(event_binding
  (binding_name
    (identifier) @keyword))

(event_binding
  "\"" @punctuation.delimiter)

(property_binding
  "\"" @punctuation.delimiter)

(structural_assignment
  operator: (identifier) @keyword)

(member_expression
  property: (identifier) @property)

(call_expression
  function: (identifier) @function)

(call_expression
  function: ((identifier) @function.builtin
    (#eq? @function.builtin "$any")))

(pair
  key: ((identifier) @variable.builtin
    (#eq? @variable.builtin "$implicit")))

((control_keyword) @keyword.repeat
  (#any-of? @keyword.repeat "for" "empty"))

((control_keyword) @keyword.conditional
  (#any-of? @keyword.conditional "if" "else" "switch" "case" "default"))

((control_keyword) @keyword.coroutine
  (#any-of? @keyword.coroutine "defer" "placeholder" "loading"))

((control_keyword) @keyword.exception
  (#eq? @keyword.exception "error"))

(special_keyword) @keyword

((identifier) @boolean
  (#any-of? @boolean "true" "false"))

((identifier) @variable.builtin
  (#any-of? @variable.builtin "this" "$event"))

((identifier) @constant.builtin
  (#eq? @constant.builtin "null"))

[
  (ternary_operator)
  (conditional_operator)
] @keyword.conditional.ternary

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "@"
] @punctuation.bracket

(two_way_binding
  [
    "[("
    ")]"
  ] @punctuation.bracket)

[
  "{{"
  "}}"
] @punctuation.special

[
  ";"
  "."
  ","
  "?."
] @punctuation.delimiter

(nullish_coalescing_expression
  (coalescing_operator) @operator)

(concatenation_expression
  "+" @operator)

(icu_clause) @keyword.operator

(icu_category) @keyword.conditional

(binary_expression
  [
    "-"
    "&&"
    "+"
    "<"
    "<="
    "="
    "=="
    "==="
    "!="
    "!=="
    ">"
    ">="
    "*"
    "/"
    "||"
    "%"
  ] @operator)
