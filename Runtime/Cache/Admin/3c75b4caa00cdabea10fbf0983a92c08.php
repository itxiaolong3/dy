<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
	<!--[if lt IE 9]>
	<script type="text/javascript" src="/dy/Public/admin/lib/html5shiv.js"></script>
	<script type="text/javascript" src="/dy/Public/admin/lib/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="/dy/Public/admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/dy/Public/admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="/dy/Public/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="/dy/Public/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="/dy/Public/admin/static/h-ui.admin/css/style.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="/dy/Public/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>广告管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 单元管理 <span class="c-gray en">&gt;</span> 推广单元 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
			<a class="btn btn-primary radius" href="javascript:;" onclick="AdPlan_add('<?php echo ($p_name); ?>-添加单元', '<?php echo U('Addtgutil/index');?>?did=<?php echo ($sid); ?>', '1000', '520')"><i class="Hui-iconfont">&#xe600;</i> 添加推广单元</a>
            <a class="btn btn-primary radius" href="<?php echo U('Adplan/index');?>?did=<?php echo ($sid); ?>">返回计划</a>
        </span>
	</div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
		<tr>
			<th scope="col" colspan="13"><?php echo ($p_name); ?>-推广单元管理</th>
		</tr>
		<tr class="text-c">
			<th width="40"><input name="" type="checkbox" value=""></th>
			<th width="40">ID</th>
			<th width="40">推广计划名称</th>
			<th width="40">单元名称</th>
			<th width="40">总出价</th>
			<th width="70">性别</th>
			<th width="70">地区</th>
			<th width="70">年龄</th>
			<th width="70">网络</th>
			<th width="70">推广方式</th>
			<th width="70">操作</th>

		</tr>
		</thead>
		<tbody>
		<?php if(is_array($info)): foreach($info as $key=>$v): ?><tr class="text-c">
				<td><input name="" type="checkbox" value="<?php echo ($v["u_id"]); ?>"></td>
				<td><?php echo ($v["u_id"]); ?></td>
				<td><?php echo ($v["u_planname"]); ?></td>
				<td><?php echo ($v["u_name"]); ?></td>
				<td><?php echo ($v["allprice"]); ?></td>
				<td class="td-status"><?php if($v["u_sex"] == 0): ?>不限<?php elseif($v["u_sex"] == 1): ?>男<?php else: ?>女<?php endif; ?></td>
				<td width="70"><?php echo ($v['u_area']==0 ? '不限':'部分城市不投放'); ?></td>
				<td width="70"><?php echo ($v["u_age"]); ?></td>
				<td width="70"><?php echo ($v["u_wifi"]); ?></td>
				<td width="70"><?php echo ($v["u_tgtype"]); ?></td>
				<td class="f-14">
					<a title="广告创意" href="<?php echo U('Adidea/index');?>?did=<?php echo ($v["u_did"]); ?>&id=<?php echo ($v["u_id"]); ?>" style="text-decoration:none"><i class="Hui-iconfont">&#xe6f5;广告创意</i></a>&nbsp;&nbsp;
					<a title="编辑" href="javascript:;" onclick="AdUnit_edit('修改单元 <?php echo ($v["u_name"]); ?>', '<?php echo U('Edittgutil/index');?>?id=<?php echo ($v["u_id"]); ?>', '2541', '1000','520')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;
					<a title="删除" href="javascript:;" onclick="AdUnit_del(this, '<?php echo ($v["u_id"]); ?>')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
				</td>

			</tr><?php endforeach; endif; ?>
		</tbody>
	</table>

</div>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">

    function AdPlan_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    function AdUnit_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }
    function AdUnit_del(obj, id) {
        layer.confirm('删除须谨慎，确认要删除吗？', function (index) {
            var index = layer.load(0, {shade: false});
            var index = layer.load(1, {
                shade: [0.1,'#fff']
            });
            $.post("<?php echo U('Adutilplan/deleleutil');?>",{id:id},function (e) {
                data=JSON.parse(e);
                if(data.status==1){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', { icon: 1, time: 1000 });
                    layer.close(index);
                }else{
                    layer.msg(data.msg, { icon: 5, time: 1000 });
                    layer.close(index);
                }
            });

        });
    }
    function AdPlan_show(title, url, w, h) {
        layer_show(title, url, w, h);
    }
</script>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/dy/Public/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/dy/Public/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/dy/Public/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/dy/Public/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/dy/Public/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/dy/Public/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/dy/Public/admin/lib/laypage/1.2/laypage.js"></script>
</body>
</html>