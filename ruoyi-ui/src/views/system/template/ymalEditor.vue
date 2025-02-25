
<template>
  <codemirror v-model="internalValue" :options="cmOption" :autofocus="true"
              :indent-with-tab="true" @input="handleCodeChange" style="line-height: 20px;height: 100%"/>
</template>

<script>
import dedent from 'dedent'
import CodeMirror from 'codemirror'
import { codemirror } from 'vue-codemirror'
import 'codemirror/lib/codemirror.css'
// language
import 'codemirror/mode/yaml/yaml.js'

// theme css
import 'codemirror/theme/cobalt.css'

// require active-line.js
import'codemirror/addon/selection/active-line.js'

// define custom mode
CodeMirror.defineMode('mymode', () => {
  return {
    token(stream, state) {
      if (stream.match('const')) {
        return 'keyword'
      } else if (stream.match('111')) {
        return 'number'
      } else {
        stream.next()
        return null
      }
    }
  }
})

export default {
  title: 'Mode: custom & Theme: solarized light',
  components: {
    codemirror
  },
  model: {
    prop:"code",
    event:"change"
  },
  props:{
    code:{
      type: String,
      default:""
    }
  },
  data() {
    return {
      // 使用一个内部变量来保存输入值
      internalValue: this.code,
      cmOption: {
        tabSize: 4,
        styleActiveLine: true,
        lineNumbers: true,
        line: true,
        mode: 'text/x-yaml',
        lineWrapping: true,
        theme: 'cobalt'
      }
    }
  },
  watch: {
    code(val) {
      this.internalValue = val
    }
  },
  methods:{
    // 更新内部变量的方法
    updateValue(value) {
      this.internalValue = value;
      // 发出 'change' 事件，以便父组件可以监听输入值的变化
      this.$emit('change', value);
    }, handleCodeChange(event) {
      this.$emit('change', event);
    }
  }
}
</script>
<style lang="scss" scoped>
 .el-form-item--medium >>> .el-form-item__content{
  line-height: 20px !important;
   .CodeMirror .cm-s-cobalt .CodeMirror-wrap{
     height: 100% !important;
   }
}
 >>> .CodeMirror{
   height: 100% !important;
 }
</style>
