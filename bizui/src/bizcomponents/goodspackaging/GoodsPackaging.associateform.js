import React, { Component } from 'react'
import { Card, Button, Form, Icon, Col, Row, DatePicker, TimePicker, Input, Select, Popover,Switch,Modal } from 'antd'
import { connect } from 'dva'
import PageHeaderLayout from '../../layouts/PageHeaderLayout'
import {ImageComponent} from '../../axios/tools'
import FooterToolbar from '../../components/FooterToolbar'
import styles from './GoodsPackaging.createform.less'
import {mapBackToImageValues, mapFromImageValues} from '../../axios/tools'
import GlobalComponents from '../../custcomponents';
import GoodsPackagingBase from './GoodsPackaging.base'
import SelectObject from '../../components/SelectObject'


const { Option } = Select
const { RangePicker } = DatePicker
const { TextArea } = Input

const testValues = {};
/*
const testValues = {
  packageName: '王煜东',
  rfid: 'RF99192',
  packageTime: '2017-05-24',
  description: '打包完成，准备起运',
}
*/


const imageKeys = [
]


class GoodsPackagingAssociateForm extends Component {
  state = {
    previewVisible: false,
    previewImage: '',
    convertedImagesValues: {},
  }

  componentDidMount() {
 
    
    
    
  }

  handlePreview = (file) => {
    console.log('preview file', file)
    this.setState({
      previewImage: file.url || file.thumbUrl,
      previewVisible: true,
    })
  }

  



  handleChange = (event, source) => {
    console.log('get file list from change in update change:', source)

    const { fileList } = event
    const { convertedImagesValues } = this.state

    convertedImagesValues[source] = fileList
    this.setState({ convertedImagesValues })
    console.log('/get file list from change in update change:', source)
  }
	
  

  render() {
	const { form, dispatch, submitting, role,data,owner,toggleAssociatePaymentVisible,visible,onCancel, onCreate } = this.props
    const { convertedImagesValues } = this.state
    const {GoodsPackagingService} = GlobalComponents
 const {GoodsModalTable} = GlobalComponents;


    const { getFieldDecorator, validateFieldsAndScroll, getFieldsError } = form
    const {fieldLabels} = GoodsPackagingBase
    
    const capFirstChar = (value)=>{
    	//const upper = value.replace(/^\w/, c => c.toUpperCase());
  		const upper = value.charAt(0).toUpperCase() + value.substr(1);
  		return upper
  	}
    
    
    

    
    
    const tryinit  = (fieldName, candidates) => {
      
      if(candidates&&candidates.length==1){
          return candidates[0].id
      }
      const { owner } = this.props
      const { referenceName } = owner
      if(referenceName!=fieldName){
        return null
      }
      return owner.id
    }
    
    const availableForEdit= (fieldName) =>{
      const { owner } = this.props
      const { referenceName } = owner
      if(referenceName!=fieldName){
        return true
      }
      return false
    
    }
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 12 },
    }
    const switchFormItemLayout = {
      labelCol: { span: 14 },
      wrapperCol: { span: 4 },
    }
    
    return (
 <Modal
          title="创建新的支付"
          visible={visible}
          onOk={onCancel}
          onCancel={onCancel}
          width={920}
          style={{ top: 40}}
        >
        <Card title="基础信息"  className={styles.card} style={{ backgroundColor:"#eee" }}>
          <Form >
            <Row gutter={16}>

              <Col lg={12} md={12} sm={12}>
                <Form.Item label={fieldLabels.packageName} {...formItemLayout}>
                  {getFieldDecorator('packageName', {
                    rules: [{ required: true, message: '请输入包的名字' }],
                  })(
                    <Input placeholder="请输入包的名字" />
                  )}
                </Form.Item>
              </Col>

              <Col lg={12} md={12} sm={12}>
                <Form.Item label={fieldLabels.rfid} {...formItemLayout}>
                  {getFieldDecorator('rfid', {
                    rules: [{ required: true, message: '请输入RFID' }],
                  })(
                    <Input placeholder="请输入RFID" />
                  )}
                </Form.Item>
              </Col>

              <Col lg={12} md={12} sm={12}>
                <Form.Item label={fieldLabels.packageTime} {...formItemLayout}>
                  {getFieldDecorator('packageTime', {
                    rules: [{ required: true, message: '请输入包的时间' }],
                  })(
                    <DatePicker format="YYYY-MM-DD" placeholder="请输入包的时间" />
                  )}
                </Form.Item>
              </Col>

              <Col lg={12} md={12} sm={12}>
                <Form.Item label={fieldLabels.description} {...formItemLayout}>
                  {getFieldDecorator('description', {
                    rules: [{ required: true, message: '请输入描述' }],
                  })(
                    <Input placeholder="请输入描述" />
                  )}
                </Form.Item>
              </Col>

            </Row>


       
        









			</Form>
			
			
			
			
        </Card>
        
	<GoodsModalTable data={data.goodsList} owner={owner} />
        
        
        
      </Modal>)
    
  }
}

export default connect(state => ({
  collapsed: state.global.collapsed,
}))(Form.create()(GoodsPackagingAssociateForm))



