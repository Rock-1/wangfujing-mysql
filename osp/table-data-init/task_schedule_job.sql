INSERT INTO `task_schedule_job` VALUES (1, '价格码价格下发搜索', 'product', '1', '0 0 1 * * ?', '', '1', 'http://10.6.3.120:8070/pcm-syn/pcmprice/erpProPriceActiveToSearch.htm', NULL, NULL, '2016-5-31 00:20:38', '2016-5-31 00:20:38');
INSERT INTO `task_schedule_job` VALUES (2, 'redis异常修复机制', 'product', '0', '0 0/1 * * * ?', '', '1', 'http://10.6.3.120:8070/pcm-syn/redisException/redisExceptionHandler.htm', NULL, NULL, '2016-5-31 00:21:29', '2016-5-31 00:21:29');
INSERT INTO `task_schedule_job` VALUES (3, '	 过期价格信息移到历史表', 'product', '1', '0 0 1 * * ?', '', '1', 'http://10.6.3.120:8070/pcm-syn/pcmprice/priceInfoClean.htm', NULL, NULL, '2016-5-31 00:22:22', '2016-10-14 22:11:12');
INSERT INTO `task_schedule_job` VALUES (4, 'ERP商品换品牌、专柜、供应商', 'product', '1', '0 0 1 * * ?', '', '1', 'http://10.6.3.120:8070/pcm-syn/erpProductEfuture/uploadErpChangeFromEfutureActive.htm', NULL, NULL, '2016-5-31 00:24:03', '2016-5-31 00:24:03');
INSERT INTO `task_schedule_job` VALUES (8, 'EDI创建订单和支付回掉补偿', 'oms', '0', '0 0/59 * * * ?', '', '1', 'http://10.6.3.132/oms-core/job/makeupEdiExceptionJob.htm', NULL, NULL, '2016-8-6 18:49:43', '2016-8-6 18:49:43');
INSERT INTO `task_schedule_job` VALUES (23, '定时取消天猫超时未支付订单', 'oms', '1', '0 0/59 * * * ?', 'C7', '1', 'http://10.6.3.133:8080/oms-syn/cancelOrder/batchCancelOrder/C7/10.htm', NULL, NULL, '2016-8-13 10:39:17', '2016-11-18 09:56:50');
INSERT INTO `task_schedule_job` VALUES (24, '定时取消CA超时未支付订单', 'oms', '0', '0 0 0/1 * * ? ', 'CA', '1', 'http://10.6.3.133:8080/oms-syn/cancelOrder/batchCancelOrder/CA/10.htm', NULL, NULL, '2016-8-13 10:42:52', '2016-11-18 09:57:38');
INSERT INTO `task_schedule_job` VALUES (25, '定时取消CB超时未支付订单', 'oms', '0', '0 0 0/1 * * ? ', 'CB', '1', 'http://10.6.3.133:8080/oms-syn/cancelOrder/batchCancelOrder/CB/10.htm', NULL, NULL, '2016-8-13 10:44:12', '2016-11-18 09:58:01');
INSERT INTO `task_schedule_job` VALUES (26, 'tms补偿快递信息服务', 'campaign', '1', '0 0 22 * * ?', 'tms定时补偿快递信息', '1', 'http://10.6.4.203:70/wmsJob-sev/express/compensate.htm', NULL, NULL, '2016-8-31 18:46:36', '2016-9-28 11:59:22');
