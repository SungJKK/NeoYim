local json_schemas = {
    "babelrc.json",
    ".eslintrc",
    "prettierrc.json",
    "jsconfig.json",
    "tsconfig.json",
    "package.json",
    "CMake Presets",
    "compile_commands.json",
    "AWS CloudFormation",
    "AWS CloudFormation Serverless Application Model (SAM)",
    "GitHub Workflow",
    "JSON Feed",
    "Packer",
    ".vsconfig",
    "JSON Resume",
    "Ansible Playbook",
    "Helm Chart.yaml",
    "helmfile",
    "GitHub Action",
    "GitHub Workflow",
    "GitHub Workflow Template Properties",
}

local default_schemas = nil
local status_ok, nlsp_settings = pcall(require, "nlspsettings")
if status_ok then
    nlsp_settings.setup {
        append_default_schemas = true,
    }
end

local schemas = {
    {
        description = "Babel configuration",
        fileMatch = {
            ".babelrc.json",
            ".babelrc",
            "babel.config.json",
        },
        url = "https://json.schemastore.org/babelrc.json",
    },
    {
        description = "ESLint config",
        fileMatch = {
            ".eslintrc.json",
            ".eslintrc",
        },
        url = "https://json.schemastore.org/eslintrc.json",
    },
    {
        description = "Prettier config",
        fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
        },
        url = "https://json.schemastore.org/prettierrc",
    },
    {
        description = "TypeScript compiler configuration file",
        fileMatch = {
            "tsconfig.json",
            "tsconfig.*.json",
        },
        url = "https://json.schemastore.org/tsconfig.json",
    },
    {
        description = "Schema for CMake Presets",
        fileMatch = {
            "CMakePresets.json",
            "CMakeUserPresets.json",
        },
        url = "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json",
    },
    {
        description = "LLVM compilation database",
        fileMatch = {
            "compile_commands.json",
        },
        url = "https://json.schemastore.org/compile-commands.json",
    },
    {
        description = "AWS CloudFormation provides a common language for you to describe and provision all the infrastructure resources in your cloud environment.",
        fileMatch = {
            "*.cf.json",
            "cloudformation.json",
        },
        url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json",
    },
    {
        description = "The AWS Serverless Application Model (AWS SAM, previously known as Project Flourish) extends AWS CloudFormation to provide a simplified way of defining the Amazon API Gateway APIs, AWS Lambda functions, and Amazon DynamoDB tables needed by your serverless application.",
        fileMatch = {
            "serverless.template",
            "*.sam.json",
            "sam.json",
        },
        url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/sam.schema.json",
    },
    {
        description = "Json schema for properties json file for a GitHub Workflow template",
        fileMatch = {
            ".github/workflow-templates/**.properties.json",
        },
        url = "https://json.schemastore.org/github-workflow-template-properties.json",
    },
    {
        description = "golangci-lint configuration file",
        fileMatch = {
            ".golangci.toml",
            ".golangci.json",
        },
        url = "https://json.schemastore.org/golangci-lint.json",
    },
    {
        description = "JSON schema for the JSON Feed format",
        fileMatch = {
            "feed.json",
        },
        url = "https://json.schemastore.org/feed.json",
        versions = {
            ["1"] = "https://json.schemastore.org/feed-1.json",
            ["1.1"] = "https://json.schemastore.org/feed.json",
        },
    },
    {
        description = "Packer template JSON configuration",
        fileMatch = {
            "packer.json",
        },
        url = "https://json.schemastore.org/packer.json",
    },
    {
        description = "NPM configuration file",
        fileMatch = {
            "package.json",
        },
        url = "https://json.schemastore.org/package.json",
    },
    {
        description = "JSON schema for Visual Studio component configuration files",
        fileMatch = {
            "*.vsconfig",
        },
        url = "https://json.schemastore.org/vsconfig.json",
    },
    {
        description = "Resume json",
        fileMatch = { "resume.json" },
        url = "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json",
    },
}

return {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    settings = {},
    commands = {
        Format = {
            function()
                vim.lsp.buf.formatexpr({}, { 0, 0 }, { vim.fn.line "$", 0 })
            end,
        },
    },
    single_file_support = true,
}
