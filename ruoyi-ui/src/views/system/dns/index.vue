<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="域名" prop="zoneName">
        <el-input
          v-model="queryParams.zoneName"
          placeholder="请输入域名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入DNS名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="解析IP" prop="proxied">
        <el-input
          v-model="queryParams.content"
          placeholder="解析IP"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">

      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:dns:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:dns:edit']"
        >修改</el-button>
      </el-col>

      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:dns:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-sync"
          size="mini"
          @click="handleSync"
          v-hasPermi="['system:dns:sync']"
        >同步</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dnsList" @selection-change="handleSelectionChange">
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="域名" align="center" prop="zoneName" />
      <el-table-column label="DNS名称" align="center" prop="name" />
      <el-table-column label="类型" align="center" prop="type" />
      <el-table-column label="解析目标" align="center" prop="content" />
      <el-table-column label="是否代理" align="center" prop="proxied" >
        <template scope="scope">
          <el-tag :type="scope.row.proxied == 'true' ? 'success':'info'">{{scope.row.proxied == 'true' ?'通过代理':'不通过代理'}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:dns:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleShowConfig(scope.row)"
            v-hasPermi="['system:dns:edit']"
          >生成配置文件</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:dns:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改DNS信息对话框 -->
    <el-dialog :title="title" v-loading="loading" :visible.sync="open" width="60%" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="主域名" prop="zoneId">
          <el-select v-model="form.zoneName" placeholder="请选择" filterable >
            <el-option
              v-for="item in domainOptions"
              :key="item.domainId"
              :label="item.name"
              :value="item.name" @click.native="domainChange(item)">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="DNS名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入DNS名称" >
            <el-button slot="prepend" icon="el-icon-refresh-left" @click="getadnsName">随机生成</el-button>
            <template slot="append">.{{form.zoneName}}</template>
          </el-input>
        </el-form-item>
        <el-form-item label="DNS类型" prop="name">
          <el-input v-model="form.type" placeholder="请输入DNS类型 A" />
        </el-form-item>
        <el-form-item label="解析目标">
<!--          <el-input v-model="form.content" :min-height="192" placeholder="0.0.0.0"/>-->
          <el-select v-model="form.content" placeholder="请选择" filterable>
            <el-option
              v-for="item in serverOptions"
              :key="item.ip"
              :label="item.ip"
              :value="item.ip">
            </el-option>
          </el-select>
        </el-form-item>
<!--        <el-form-item label="是否代理" prop="proxiable">-->
<!--          <el-input v-model="form.proxiable" placeholder="请输入${comment}" />-->
<!--        </el-form-item>-->
        <el-form-item label="是否代理" prop="proxied">
          <el-select v-model="form.proxied" placeholder="请选择">
            <el-option
              v-for="item in proxyOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
<!--          <el-input v-model="form.proxied" placeholder="请输入是否代理" />-->
        </el-form-item>
        <el-form-item label="ttl" prop="ttl">
          <el-input v-model="form.ttl" placeholder="请输入ttl" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 生成配置文件信息对话框 -->
    <el-dialog :title="'配置文件'" v-loading="genLoading" :visible.sync="showConfig" width="60%" append-to-body>
      <el-form ref="formConfig" :model="formConfig" :rules="rulesConfig" label-width="80px">
        <el-form-item label="主域名" prop="zoneId">
          <el-select v-model="form.zoneName" placeholder="请选择" filterable disabled>
            <el-option
              v-for="item in domainOptions"
              :key="item.domainId"
              :label="item.name"
              :value="item.name" @click.native="domainChange(item)">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="DNS名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入DNS名称" disabled>
            <el-button slot="prepend" icon="el-icon-refresh-left" @click="getadnsName">随机生成</el-button>
            <template slot="append">.{{form.zoneName}}</template>
          </el-input>
        </el-form-item>
        <el-form-item label="DNS类型" prop="name">
          <el-input v-model="form.type" placeholder="请输入DNS类型 A" disabled/>
        </el-form-item>
        <el-form-item label="解析目标">
<!--          <el-input v-model="form.content" :min-height="192" placeholder="0.0.0.0"/>-->
          <el-select v-model="form.content" placeholder="请选择" filterable disabled>
            <el-option
              v-for="item in serverOptions"
              :key="item.ip"
              :label="item.ip"
              :value="item.ip">
            </el-option>
          </el-select>
        </el-form-item>
<!--        <el-form-item label="是否代理" prop="proxiable">-->
<!--          <el-input v-model="form.proxiable" placeholder="请输入${comment}" />-->
<!--        </el-form-item>-->
        <el-form-item label="是否代理" prop="proxied">
          <el-select v-model="form.proxied" placeholder="请选择" disabled>
            <el-option
              v-for="item in proxyOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
<!--          <el-input v-model="form.proxied" placeholder="请输入是否代理" />-->
        </el-form-item>
        <el-form-item label="ttl" prop="ttl">
          <el-input v-model="form.ttl" placeholder="请输入ttl" disabled/>
        </el-form-item>
        <el-form-item label="配置文件路径" prop="ttl">
          <el-select v-model="form.content" placeholder="请选择" filterable disabled>
            <el-option
              v-for="item in serverOptions"
              :key="item.ip"
              :label="item.filePath"
              :value="item.ip">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="配置文件模板" prop="template">
          <el-select v-model="formConfig.templateId" placeholder="请选择" filterable>
            <el-option
              v-for="item in templateOptions"
              :key="item.id"
              :label="item.fileName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="配置文件内容" prop="content">
          <el-button v-if="generated == false" @click="handleCreateConfigFile(form,formConfig.templateId)">生成配置文件</el-button>
<!--          <el-input v-model="formConfig.content" placeholder="配置文件" disabled/>-->
          <ymal-editor v-model="formConfig.content" v-else></ymal-editor>
        </el-form-item>
        <el-form-item label="服务器当前配置文件内容" prop="serverContent">
          <ymal-editor v-model="formConfig.serverContent"></ymal-editor>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitCreateConfig">确 定</el-button>
        <el-button @click="cancelConfig">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listDns,
  getDns,
  delDns,
  addDns,
  updateDns,
  syncDns,
  getADnsName,
  generateConfig,
  replaceConfig
} from '@/api/system/dns'
import { listDomain, listDomainAll } from '@/api/system/domain'
import { listAllServer } from '@/api/system/server'
import { listAllTemplate } from '@/api/system/template'
import YmalEditor from '@/views/system/template/ymalEditor.vue'

export default {
  name: "Dns",
  components: { YmalEditor },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      showConfig: false,
      proxyOptions:[{
        label:"代理",
        value: 'true'
      },{
        label:"不代理",
        value: 'false'
      },],
      domainOptions: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // DNS信息表格数据
      dnsList: [],
      serverOptions: [],
      templateOptions: [],
      genLoading: false,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        zoneName: null,
        name: null,
        type: null,
        content: null,
        proxied: null,
      },
      // 表单参数
      form: {
        type:"A"
      },
      formConfig:{

      },
      generated: false,
      // 表单校验
      rules: {
      },
      rulesConfig: {
      }
    };
  },
  created() {
    this.getList();
    this.getDomainOptions()
    this.getServerListAll()
    this.getTemplateListAll()

  },
  methods: {
    domainChange(domain) {
      console.log(domain)
      this.form.zoneName = domain.name
      this.form.zoneId=domain.domainId
    },
    getadnsName() {
      getADnsName().then(response =>{
        console.log(response)
        this.form.name = response.msg
      })
    },
    getDomainOptions() {
      listDomainAll().then(response => {
        this.domainOptions = response.data
      });
    },
    /** 查询DNS信息列表 */
    getList() {
      this.loading = true;
      listDns(this.queryParams).then(response => {
        this.dnsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getServerListAll() {
      listAllServer({}).then(response=>{
        this.serverOptions = response.data
      })
    },
    getTemplateListAll() {
      listAllTemplate({}).then(response=>{
        this.templateOptions= response.data

      })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    }, cancelConfig() {
      this.showConfig = false
      this.formConfig = {}
      this.generated = false
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        zoneId: null,
        zoneName: null,
        name: null,
        type: null,
        content: null,
        proxiable: null,
        proxied: null,
        ttl: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      // this.reset();
      this.form = {
        id: null,
        zoneId: null,
        zoneName: null,
        name: null,
        type: "A",
        content: null,
        proxiable: null,
        proxied: "true",
        ttl: 3600
      };
      this.open = true;
      this.title = "添加DNS信息";
    },
    handleSync() {
      syncDns().then(response => {
        this.$modal.msgSuccess("同步成功");
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDns(id).then(response => {
        this.form = response.data;
        this.form.name = this.form.name.split(".")[0]
        this.open = true;
        this.title = "修改DNS信息";
      });
    },
    handleShowConfig(row) {
      this.form = row
      this.showConfig = true


    },
    handleCreateConfigFile(row,tempId) {
      if (!tempId) {
        this.$message.error("请选择配置文件模板")
        return
      }
      this.genLoading = true
      generateConfig(row.id,tempId).then(response=>{
        this.genLoading = false
        console.log(response)
        this.formConfig.content = response.data
        this.formConfig.serverContent = response.serverContent
        this.generated = true
        this.$forceUpdate()
      }).catch((e)=>{
        this.genLoading = false
      })

    },
    submitCreateConfig() {

      if (!this.formConfig.templateId) {
        this.$message.error("请选择配置文件模板")
        return
      }
      this.genLoading = true
      replaceConfig(this.form.id,this.formConfig.templateId).then(response=>{
        console.log(response)
        this.genLoading = false
        if (response.code == 200) {
          this.$message.success("替换成功")
        }

      }).catch((e)=>{
        this.genLoading = false
      })

    },
    /** 提交按钮 */
    submitForm() {

      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            this.loading = true
            updateDns(this.form).then(response => {
              this.loading = false
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).catch((e)=>{
              this.loading = false
            });
          } else {
            this.loading = true
            addDns(this.form).then(response => {
              this.loading = false
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            }).catch((e)=>{
              this.loading = false
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id;
      this.$modal.confirm('是否确认删除DNS信息编号为"' + ids + '"的数据项？').then(function() {
        return delDns(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/dns/export', {
        ...this.queryParams
      }, `dns_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
