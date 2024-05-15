import request from '@/utils/request'

// 查询域名列表列表
export function listDomain(query) {
  return request({
    url: '/system/domain/list',
    method: 'get',
    params: query
  })
}
export function listDomainAll() {
  return request({
    url: '/system/domain/listAll',
    method: 'get',
  })
}

// 查询域名列表详细
export function getDomain(id) {
  return request({
    url: '/system/domain/' + id,
    method: 'get'
  })
}
// 查询域名列表详细
export function syncDomain() {
  return request({
    url: '/system/domain/sync',
    method: 'get'
  })
}

// 新增域名列表
export function addDomain(data) {
  return request({
    url: '/system/domain',
    method: 'post',
    data: data
  })
}

// 修改域名列表
export function updateDomain(data) {
  return request({
    url: '/system/domain',
    method: 'put',
    data: data
  })
}

// 删除域名列表
export function delDomain(id) {
  return request({
    url: '/system/domain/' + id,
    method: 'delete'
  })
}
