import request from "./request";
export function addinfo(data) {
    return request({
        method: "post",
        url: "/user/adduser",
        contentType: "application/json;charset=UTF-8",
        data,
    })
}
export function updateinfo(data) {
    return request({
        method: "put",
        url: "/user/update",
        contentType: "application/json;charset=UTF-8",
        data,
    })
}
export function loaddata(params) {
    return request({
        method: "get",
        url: "/user/pageshow",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            Accept: "application/json",
        },
        params,
    })
}
export function deldata(id) {
    return request({
        method: "delete",
        url: "/user/del/" + id,
        contentType: "application/json;charset=UTF-8",
    })
}