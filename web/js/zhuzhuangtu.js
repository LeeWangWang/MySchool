// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据
var option = {
    title: {
        text: '<%%>'
    },
    tooltip: {},
    legend: {
        data:['划线']
    },
    xAxis: {
        data: ["2016","2017","2018","2019"]
    },
    yAxis: {},
    series: [{
        name: '划线',
        type: 'bar',
        data: [5, 20, 36, 10.2],
        itemStyle: {
            normal: {
                label: {
                    show: true,		//开启显示
                    position: 'top',	//在上方显示
                    textStyle: {	    //数值样式
                        color: 'black',
                        fontSize: 16
                    }
                }
            }
        }
    }]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
