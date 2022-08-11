return {
    init_options = {
            config ={
                vetur = {
                    completion = {
                        autoImport = true,
                    },
                    useWorkspaceDependencies = true,
                    experimental = {
                        templateInterpolationService = true,
                    },
                    validation = {
                        templateProps = true
                    }
                }
            }
        }
}
