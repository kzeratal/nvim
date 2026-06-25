vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.undodir"

vim.opt.grepprg = "rg --vimgrep --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"

local function ensure_node()
    local node = vim.fn.exepath("node")
    if node ~= "" then
        local major = tonumber(vim.trim(vim.fn.system(node .. " -e 'process.stdout.write(String(process.versions.node.split(\".\")[0]))'")))
        if major and major >= 18 then
            return
        end
    end
    local nvm_dir = vim.fn.expand("~/.nvm/versions/node")
    if vim.fn.isdirectory(nvm_dir) == 0 then
        return
    end
    local best
    for _, bin in ipairs(vim.fn.glob(nvm_dir .. "/v*/bin", false, true)) do
        local major = tonumber(bin:match("/v(%d+)%."))
        if major and major >= 18 then
            if not best or major > tonumber(best:match("/v(%d+)%.")) then
                best = bin
            end
        end
    end
    if best then
        vim.env.PATH = best .. ":" .. vim.env.PATH
    end
end
ensure_node()
