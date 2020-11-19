c = get_config()
c.InteractiveShell.ast_node_interactivity = 'last_expr'
c.TerminalInteractiveShell.editing_mode = 'vi'
c.InteractiveShellApp.extensions = ['autoreload']     
c.InteractiveShellApp.exec_lines = ['%autoreload 2']

