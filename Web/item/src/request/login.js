import request from "./request";
export function login(data) {
    return request({
        method: "POST",
        url: "/user/login",
        headers: { "contentType": "application/json;charset=UTF-8"},
        data,
    })
}
export function register(data) {
    return request({
        method: "POST",
        url: "/user/adduser",
        headers: { "contentType": "application/json;charset=UTF-8"},
        data,
    })
}
