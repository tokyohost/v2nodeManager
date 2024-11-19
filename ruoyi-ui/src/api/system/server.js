import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listServer(query) {
  return request({
    url: '/system/server/list',
    method: 'get',
    params: query,
    timeout:90000
  })
}
export function listAllServer(query) {
  return request({
    url: '/system/server/listAll',
    method: 'get',
    params: query,
    timeout:45000
  })
}

// 查询【请填写功能名称】详细
export function getServer(id) {
  return request({
    url: '/system/server/' + id,
    method: 'get'
  })
}
export function getNodeList(type) {
  return request({
    url: '/system/server/queryV2NodeList',
    method: 'get',
    params:{nodeType:type},
    timeout:90000
  })
}
export function checkInstallStatus(id) {
  return request({
    url: '/system/server/checkInstallStatus/' + id,
    method: 'get',
    timeout:90000
  })
}
export function installStatus(id) {
  return request({
    url: '/system/server/installStatus/' + id,
    method: 'get',
    timeout:90000
  })
}
export function updateVersion(id,version) {
  return request({
    url: '/system/server/updateVersion/' + id,
    method: 'get',
    timeout:180000,
    params:{version:version}
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
    timeout:1800000
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
