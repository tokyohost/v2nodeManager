import request from '@/utils/request'

// 查询DNS信息列表
export function listDns(query) {
  return request({
    url: '/system/dns/list',
    method: 'get',
    params: query
  })
}
export function getADnsName(query) {
  return request({
    url: '/system/dns/getADnsName',
    method: 'get',
    params: query
  })
}

// 查询DNS信息详细
export function getDns(id) {
  return request({
    url: '/system/dns/' + id,
    method: 'get'
  })
}
export function generateConfig(id,templateId) {
  return request({
    url: '/system/dns/generateConfig',
    method: 'get',
    params:{id:id,templateId:templateId},
    timeout:30000
  })
}
export function replaceConfig(id,templateId) {
  return request({
    url: '/system/dns/replaceConfig',
    method: 'get',
    params:{id:id,templateId:templateId},
    timeout:30000
  })
}
export function syncDns() {
  return request({
    url: '/system/dns/sync' ,
    method: 'get'
  })
}

// 新增DNS信息
export function addDns(data) {
  return request({
    url: '/system/dns',
    method: 'post',
    data: data
  })
}

// 修改DNS信息
export function updateDns(data) {
  return request({
    url: '/system/dns',
    method: 'put',
    data: data
  })
}

// 删除DNS信息
export function delDns(id) {
  return request({
    url: '/system/dns/' + id,
    method: 'delete'
  })
}
