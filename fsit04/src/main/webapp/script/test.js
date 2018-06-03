$(document).ready(function(){
               //国际化加载属性文件

	$.i18n.properties({

                           name:'res',

                           path:'./resource/i18n/',

                           mode:'map',
                           
                        //   language:'zh_TW',                          
                           callback: function() {// 加载成功后设置显示内容
                        	  // $.i18n.prop('string_password')
                              alert($.i18n.prop('site.hello'));
                           }
                       });

        });

	
	
