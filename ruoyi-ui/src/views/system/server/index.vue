<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="ip" prop="ip">
        <el-input
          v-model="queryParams.ip"
          placeholder="请输入ip"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="节点ID" prop="nodeId">
        <el-input
          v-model="queryParams.nodeId"
          placeholder="请输入nodeId"
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
          v-hasPermi="['system:server:add']"
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
          v-hasPermi="['system:server:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:server:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="serverList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="id" align="center" prop="id" />-->
      <el-table-column label="ip" align="center" prop="ip" />
      <el-table-column label="端口" align="center" prop="port" />
      <el-table-column label="用户名" align="center" prop="user" />
<!--      <el-table-column label="passwd" align="center" prop="passwd" />-->
      <el-table-column label="节点名称" align="center" prop="nodeName" />
      <el-table-column label="节点ID" align="center" prop="nodeId" />
      <el-table-column label="解析地址" align="center" prop="nodeHost" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:server:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:server:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            @click="checkInstallStatus(scope.row)"
            v-hasPermi="['system:server:check']"
          >检查XrayR安装状态</el-button>
          <el-button
            size="mini"
            type="text"
            @click="installStatus(scope.row)"
            v-hasPermi="['system:server:check']"
          >安装XrayR</el-button>
          <el-button
            size="mini"
            type="text"
            @click="updateVersion(scope.row)"
            v-hasPermi="['system:server:check']"
          >切换XrayR版本</el-button>
          <el-button
            size="mini"
            type="text"
            @click="replaceHostPanel(scope.row)"
            v-hasPermi="['system:server:replaceHost']"
          >一键更换域名</el-button>
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            @click="installStatus(scope.row)"-->
<!--            v-hasPermi="['system:server:edit']"-->
<!--          >安装XrayR</el-button>-->
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

    <!-- 添加或修改【请填写功能名称】对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="50%" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="ip" prop="ip">
          <el-input v-model="form.ip" placeholder="请输入ip" />
        </el-form-item>
        <el-form-item label="port" prop="port">
          <el-input v-model="form.port" placeholder="请输入SSH port" />
        </el-form-item>
        <el-form-item label="用户名" prop="user">
          <el-input v-model="form.user" placeholder="请输入user" />
        </el-form-item>
        <el-form-item label="密码" prop="passwd">
          <el-input v-model="form.passwd" placeholder="请输入passwd" />
        </el-form-item>
        <el-form-item label="nodeId" prop="nodeId">
          <el-input v-model="form.nodeId" placeholder="请输入nodeId" />
        </el-form-item>
        <el-form-item label="XrayR 配置文件路径" prop="filePath">
          <el-input v-model="form.filePath" placeholder="/etc/XrayR/config.yml" />
        </el-form-item>
        <el-form-item label="remark" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <el-dialog :title="'一键更换域名'" :visible.sync="showReplaceHost" v-loading="loading" width="50%" append-to-body>
      <el-form ref="form" :model="formQuickHost" :rules="hostRules" label-width="80px">
        <el-form-item label="ip" prop="ip">
          <el-input v-model="form.ip" placeholder="请输入ip"  disabled/>
        </el-form-item>
        <el-form-item label="主域名" prop="zoneId">
          <el-select v-model="formQuickHost.zoneName" placeholder="请选择" filterable>
            <el-option
              v-for="item in domainOptions"
              :key="item.domainId"
              :label="item.name"
              :value="item.name" @click.native="domainChange(item)">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="DNS名称" prop="name">
          <el-input v-model="formQuickHost.name" placeholder="请输入DNS名称">
            <el-button slot="prepend" icon="el-icon-refresh-left" @click="getadnsName">随机生成</el-button>
            <template slot="append">.{{formQuickHost.zoneName}}</template>
          </el-input>
        </el-form-item>
        <el-form-item label="是否代理" prop="proxied">
          <el-select v-model="formQuickHost.proxied" placeholder="请选择" @change="forceUpdate">
            <el-option
              v-for="item in proxyOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
          <!--          <el-input v-model="form.proxied" placeholder="请输入是否代理" />-->
        </el-form-item>
        <el-form-item label="配置文件模板" prop="templateId">
          <el-select v-model="formQuickHost.templateId" placeholder="请选择" filterable @change="forceUpdate">
            <el-option
              v-for="item in templateOptions"
              :key="item.id"
              :label="item.fileName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormQuick">确 定</el-button>
        <el-button @click="cancelQuick">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listServer,
  getServer,
  delServer,
  addServer,
  updateServer,
  checkInstallStatus,
  installStatus, quickHostReplace, updateVersion
} from '@/api/system/server'
import { Loading } from 'element-ui'
import { listDomainAll } from '@/api/system/domain'
import { getADnsName } from '@/api/system/dns'
import { listAllTemplate } from '@/api/system/template'

export default {
  name: "Server",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 【请填写功能名称】表格数据
      serverList: [],
      domainOptions: [],
      templateOptions: [],
      proxyOptions:[{
        label:"代理",
        value: 'true'
      },{
        label:"不代理",
        value: 'false'
      },],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      showReplaceHost: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        ip: null,
        port: null,
        user: null,
        passwd: null,
        nodeId: null
      },
      // 表单参数
      form: {},
      formQuickHost: {
        zoneName: '',
        name: '',
        zoneId:''
      },
      // 表单校验
      rules: {
        ip: [
          { required: true, message: '请输入IP', trigger: 'blur' },
        ],
        port: [
          { required: true, message: '请输入SSH端口', trigger: 'blur' },
        ],
        user: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
        ],
        passwd: [
          { required: true, message: '请输入密码', trigger: 'blur' },
        ],
        nodeId: [
          { required: true, message: '请输入面板节点ID', trigger: 'blur' },
        ],
        filePath: [
          { required: true, message: '请输入配置文件路径', trigger: 'blur' },
        ],
      },
      hostRules:{
        zoneId: [
          { required: true, message: '请选择主域名', trigger: 'blur' },
        ],
        name: [
          { required: true, message: '请配置DNS域名', trigger: 'blur' },
        ],
        templateId: [
          { required: true, message: '请选择配置文件模板', trigger: 'blur' },
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getDomainOptions()
    this.getTemplateListAll()
  },
  methods: {
    /** 查询【请填写功能名称】列表 */
    getList() {
      this.loading = true;
      listServer(this.queryParams).then(response => {
        this.serverList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    cancelQuick() {
      this.form = {}
      this.formQuickHost = {}
      this.showReplaceHost = false
    },
    domainChange(domain) {
      console.log(domain)
      this.formQuickHost.zoneName = domain.name
      this.formQuickHost.zoneId=domain.domainId
      this.$forceUpdate()
    },
    getTemplateListAll() {
      listAllTemplate({}).then(response=>{
        this.templateOptions= response.data

      })
    },
    getadnsName() {
      getADnsName().then(response =>{
        console.log(response)
        this.formQuickHost.name = response.msg
        this.$forceUpdate()
      })
    },
    forceUpdate() {
      this.$forceUpdate()
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        ip: null,
        port: null,
        user: null,
        passwd: null,
        nodeId: null
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
    getDomainOptions() {
      listDomainAll().then(response => {
        this.domainOptions = response.data
      });
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加";
    },
    replaceHostPanel(row) {
      this.showReplaceHost = true
      this.form = row
      this.formQuickHost.ip = row.ip
      this.formQuickHost.serverId = row.id
      this.formQuickHost.proxied = "true"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getServer(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateServer(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addServer(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    submitFormQuick() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.loading = true
          quickHostReplace(this.formQuickHost).then(response=>{
            console.log(response)
            this.loading = false
            if (response.code == 200) {
              this.$message.success("更换成功")
              this.getList()
            }
          }).catch((e)=>{
            this.loading = false
          })
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除【请填写功能名称】编号为"' + ids + '"的数据项？').then(function() {
        return delServer(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    checkInstallStatus(row) {
      const ids = row.id
      let loadingInstance = Loading.service({ fullscreen: true ,text:"正在检查中..."});
      checkInstallStatus(ids).then(response=>{
        console.log(response)
        loadingInstance.close()
        this.$message({
          type: 'success',
          message: response.msg
        });
        // this.$message.success(response.msg)
        this.$confirm(response.msg, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
        }).catch(() => {
        });
      }).catch((e)=>{
        loadingInstance.close()
      })
    },
    installStatus(row) {
      const ids = row.id
      let loadingInstance = Loading.service({ fullscreen: true ,text:"正在安装中..."});
      installStatus(ids).then(response=>{
        console.log(response)
        loadingInstance.close()
        this.$message({
          type: 'success',
          message: response.msg
        });

      }).catch((e)=>{
        loadingInstance.close()
      })
    },
    updateVersion(row) {
      const ids = row.id
      this.$prompt('请输入版本号', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /\w+/,
        inputErrorMessage: '版本号不能为空'
      }).then(({ value }) => {
        let loadingInstance = Loading.service({ fullscreen: true ,text:"正在处理中..."});
        updateVersion(ids,value).then(response=>{
          console.log(response)
          loadingInstance.close()
          this.$message({
            type: 'success',
            message: response.msg
          });

        }).catch((e)=>{
          loadingInstance.close()
        })


      }).catch(() => {

      });

    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/server/export', {
        ...this.queryParams
      }, `server_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
