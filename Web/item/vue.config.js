module.exports = {
    // 修改的配置
    // 将baseUrl: '/api',改为baseUrl: '/',
    devServer: {
        // port: 8081,
        proxy: {
            '/api': {
                target: 'http://192.168.32.1:9090',
                ws: true,
                changOrigin: true,  //允许跨域
                pathRewrite: {
                    '^/api': ''
                }
            }
        }
    }
}