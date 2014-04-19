fs = require 'fs'
path = require 'path'

scope = "source.yaml"

completions = {
  'newrule': {
    description: 'new rule'
    content: '''
    ${1:rule name}:
    \tdescription: "${2:rule description}"
    \trule: ${3:rule's subrule}
    \targs: ${4:rule args}
    '''
  }
}

entry_args_completions = {
  'course_number': {
    description: 'course_number'
    content: '''
    course_number:
    \tmin: ${1:min course number}
    \tmax: ${2:max course number}
    '''
  }
  'count_courses': {
    description: 'count_courses'
    content: '''
    count_courses:
    \tmin: ${1:min number of courses}
    \tmax: ${2:max number of courses}
    '''
  }
  'units': {
    description: 'units'
    content: '''
    units:
    \tmin: ${1:min number of units}
    \tmax: ${2:max number of units}
    '''
  }

  'or': {
    description: 'OR'
    content: '''
    OR:
    \t- ${1:rule}
    '''
  }
  'and': {
    description: 'AND'
    content: '''
    AND:
    \t- ${1:rule}
    '''
  }
  'not': {
    description: 'NOT'
    content: '''
    NOT:
    \t- ${1:rule}
    '''
  }
  'same_course': {
    description: 'same_course'
    content: '''
    same_course:
    \t- ${1:rule}
    '''
  }

}


doWrite = (trigger, snippet_content) ->
  filename = path.join FOLDER, "#{encodeURIComponent(trigger).replace /(%[\dA-F][\dA-F])+/g, '-'}.sublime-snippet"
  fs.writeFile filename, snippet_content


FOLDER = "../Snippets"
fs.mkdir FOLDER unless fs.existsSync FOLDER

for trigger, completion of entry_args_completions
  original_trigger = trigger
  content = completion.content

  description = ''

  # description = completion.description + ' rule'
  trigger = 'rule: ' + original_trigger
  snippet_content = """
  <snippet>
      <description>#{description}</description>
      <content><![CDATA[#{content}]]></content>
      <tabTrigger>#{trigger}</tabTrigger>
      <scope>#{scope}</scope>
  </snippet>
  """
  doWrite trigger, snippet_content

  content = '\n' + content.split('\n')[1...].join('\n') # get all but first line

  # description = completion.description + ' rule args'
  trigger = 'args: ' + original_trigger
  snippet_content = """
  <snippet>
      <description>#{description}</description>
      <content><![CDATA[#{content}]]></content>
      <tabTrigger>#{trigger}</tabTrigger>
      <scope>#{scope}</scope>
  </snippet>
  """
  doWrite trigger, snippet_content

for trigger, completion of completions
  description = completion.description
  content = completion.content
  snippet_content = """
  <snippet>
      <description>#{description}</description>
      <content><![CDATA[#{content}]]></content>
      <tabTrigger>#{trigger}</tabTrigger>
      <scope>#{scope}</scope>
  </snippet>
  """
  doWrite trigger, snippet_content
