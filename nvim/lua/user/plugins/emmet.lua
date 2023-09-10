return {
  'mattn/emmet-vim',
  opts = {},
  config = function ()
    vim.cmd[[
      let g:user_emmet_leader_key='<Tab>'
      let g:user_emmet_setting = { 'javascript.jsx' : { 'extends': 'jsx', }, }
    ]]
  end
}
