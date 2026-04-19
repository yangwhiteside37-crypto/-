USE game;
UPDATE `工作簿1`
SET
`平台佣金` = REPLACE(`平台佣金`,'USD ',''),
`联盟佣金（USD）` = REPLACE(REPLACE(`联盟佣金（USD）`,'USD ',''),'-','0');
SELECT
a.`店铺账号`,
SUM(a.`订单金额（USD）`*7),
SUM(a.`平台佣金`*7),
SUM(a.`联盟佣金（USD）`*7),
SUM(b.`采购成本`),
SUM(b.`物流成本`),
SUM((a.`订单金额（USD）`*7)-(a.`平台佣金`*7)-(a.`联盟佣金（USD）`*7)-b.`采购成本`-b.`物流成本`) AS `利润`
FROM `工作簿1` a
JOIN `订单数据表` b ON a.`店铺账号` = b.`unnamed：19`
GROUP BY a.`店铺账号`;