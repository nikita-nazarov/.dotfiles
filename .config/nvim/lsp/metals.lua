-- Configure metals
local metals = require'metals'
local metals_config = metals.bare_config()
metals_config.settings = {
	defaultBspToBuildTool = true,
	javaHome = '/usr/lib/jvm/java-17-openjdk-amd64',

	showImplicitArguments = true,
	fallbackScalaVersion = '2.13.16',
	-- The `serverProperties` are ignored, set them in the wrapper script instead!

	-- Databricks custom version
	serverVersion = "9.9.9-DATABRICKS-LAUNCHER-1",

	-- We set our metals wrapper script here, which acts as an executable for the databricks JAR file
	useGlobalExecutable = false,
	metalsBinaryPath = vim.fn.expand('~/.local/bin/metals'),
}

-- more settings for nvim-metals go here...

local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'scala', 'sbt', 'java' },
	callback = function(opts)
		metals.initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})

metals_config.init_options.statusBarProvider = 'on'
local global_config = vim.lsp.config['*']
if global_config then
	if global_config.on_attach then
		metals_config.on_attach = global_config.on_attach
	end
	if global_config.capabilities then
		metals_config.capabilities = global_config.capabilities
	end
end

-- Override `find_root_dir` to simply use CWD. I found the default behavior to get in the way in `universe`.
metals_config.find_root_dir = function() return vim.fn.getcwd() end
