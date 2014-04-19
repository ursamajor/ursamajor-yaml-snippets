# -*- coding: utf-8 -*-

TEMPLATE = """
<snippet>
    <description>{description}</description>
    <content><![CDATA[{contents}]]></content>
    <tabTrigger>{trigger}</tabTrigger>
    <scope>{scope}</scope>
</snippet>
""".strip()

description = "description"
contents = "contents"
trigger = "trigger"

DATA = {
    "scope": "source.yaml",

    "completions":
    [
        { "contents": "∀", "trigger": "every" },
        { "contents": "∀", "trigger": "forall" },
        { "contents": "∀", "trigger": "all" },

        { "contents": "∃", "trigger": "exists" },
        { "contents": "∃", "trigger": "forsome" },
        { "contents": "∃", "trigger": "some" },

        # { "contents": "∨", "trigger": "or" },
        # { "contents": "∨", "trigger": "v" },
        { "contents": "∨", "trigger": "\\or" },
        { "contents": "∨", "trigger": "v" },

        { "contents": "⋅", "trigger": "\\and" },
        { "contents": "⋅", "trigger": "." },

        { "contents": "−", "trigger": "not" },
        { "contents": "−", "trigger": "-" },

        { "contents": "⊃", "trigger": "implies" },
        { "contents": "⊃", "trigger": "then" },
        { "contents": "⊃", "trigger": "=>" },
        { "contents": "⊃", "trigger": "->" },
        { "contents": "⊃", "trigger": "~" },

        { "contents": "≡", "trigger": "equiv" },
        { "contents": "≡", "trigger": "equals" },
        { "contents": "≡", "trigger": "=" },
    ]
}

from os import mkdir

FOLDER = "../Snippets"
scope = DATA['scope']
completions = DATA['completions']
try: mkdir(FOLDER)

except OSError: pass
for completion in completions:
    completion['scope'] = scope
    content = TEMPLATE.format(**completion)
    with file(FOLDER+'/snippet_{trigger}.sublime-snippet'.format(**completion), 'wb') as f:
        f.write(content)
