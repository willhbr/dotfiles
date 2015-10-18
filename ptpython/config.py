from __future__ import unicode_literals
from prompt_toolkit.keys import Keys
from pygments.token import Token
from ptpython.layout import CompletionVisualisation

__all__ = (
    'configure',
)


def configure(repl):
    repl.show_status_bar = False

    repl.use_code_colorscheme('native')