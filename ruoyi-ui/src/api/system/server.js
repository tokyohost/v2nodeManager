import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listServer(query) {
  return request({
    url: '/system/server/list',
    method: 'get',
    params: query
  })
}
export function listAllServer(query) {
  return request({
    url: '/system/server/listAll',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getServer(id) {
  return request({
    url: '/system/server/' + id,
    method: 'get'
  })
}
export function checkInstallStatus(id) {
  return request({
    url: '/system/server/checkInstallStatus/' + id,
    method: 'get',
    timeout:30000
  })
}
export function installStatus(id) {
  return request({
    url: '/system/server/installStatus/' + id,
    method: 'get',
    timeout:90000
  })
}

// 新增【请填写功能名称】
export function addServer(data) {
  return request({
    url: '/system/server',
    method: 'post',
    data: data
  })
}
export function quickHostReplace(data) {
  return request({
    url: '/system/server/quickHostReplace',
    method: 'post',
    data: data,
    timeout:90000
  })
}

// 修改【请填写功能名称】
export function updateServer(data) {
  return request({
    url: '/system/server',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delServer(id) {
  return request({
    url: '/system/server/' + id,
    method: 'delete'
  })
}
