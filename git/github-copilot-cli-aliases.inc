
  copilot_what-the-shell () {
    gh copilot suggest -t shell "$@"
  };
alias '??'='copilot_what-the-shell';

  copilot_git-assist () {
    gh copilot suggest -t git "$@"
  };
alias 'git?'='copilot_git-assist';

  copilot_gh-assist () {
    gh copilot explain "$@" 
  };
alias 'gh?'='copilot_gh-assist';
alias 'wts'='copilot_what-the-shell';