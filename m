Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012039.outbound.protection.outlook.com [40.107.75.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54654195A0
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555075; cv=fail; b=UoQ5sMT7R6fOY+kFYbeWdAmNIBcIQBsbYA19JgjBKfquw4BY57xNZc0BBRXOYa8i72kF8ygDYyvcuu0bAglBwVSMizWG15B+vEMBBqdq2IlFo6yJu09DOlb3rhhP9sMjVJ3ga9KwKMKy1VF3CV5Rw53+Yv54Cyv/BqUuPXZJpkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555075; c=relaxed/simple;
	bh=21R+VWYYIzUvZmAJu3hgP/sdhaRYonpP1W0stLvxXQ8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tp5z4Wha8gQ3CNEwlbhX9HJ+1SlasbZsYsxckINEi/Dzs/o2KJ50WkOwWCtMTCMCEn+iUwcyAdQysxLR+T+0esKtfyF+L+SFBpIt7aveDollbBlhzlx1A+Ye+enfa9Gp5duUGkit1JAhLpSIU9yH944tXD3Bxf4ySPeCz2KUzs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Dd5q/9be; arc=fail smtp.client-ip=40.107.75.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Dd5q/9be"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZWqlOad5CzlMnDdOC+raLXBOnb2Jnww+XgBbE5el85TenfCkGNu8rO2yQ0cdVYIeP8UiR0P2hJ/qK7QhSzmnah8b/SBsTzuhfDD6W4+CMllhRxdfRR5tc+1vtbXpoAp9JIzyVvcUWt+J1REcJJKLLr6jeWBV7srk4lQ4R4f+C3mqw6ws7JgBkJFfm0uxWok6q+3c6rmHTGpsdvhWazNrxRW7O50L1B4FuS3mp7oO+mOWOGG23K1oBRFyJmKOwei3hruBqtsNZlKm10B76er0cfyhvXGIDHT1yLxhOwblBqhhrb0bx3oiXBYLKjS0BIjHujwB3R238aTvQ0ksjsYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHjocqA/TJt1SdGjaSIraMRSWUaJ6PfSQoELPqsOSzA=;
 b=Q8JbCfdTeT9nVE427A9t9kVHHCTvN9f0EC200Jv9EdxvPH3f9LKf549Ws1aGF63HcmU/ws6nxu0yVq5sHNRhGPnZKKmSK1Teml0cbZDv63PTkpnmd2c607kSmIUkBSItNNd31jIWfhMcXohCR9sghXunqzVCeox1TNnlHFvzgBoSQHsg6IWzAW0yiWi8PumR6vT60V/fW4V6bqfYCAY4FrIAGreOmwIT+ExjHOcLMl9Gd/qQ35gm3QNNWpcdk0OnNztX/OQB/P7HPvnvxxjzVb7+k8pHBRFoZsFUqoOi3Oz/Ss8nT4Jtd5r55kKTKkkQ0/TOyKfQzmbxkH4FDwSepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHjocqA/TJt1SdGjaSIraMRSWUaJ6PfSQoELPqsOSzA=;
 b=Dd5q/9beUYLk07Kjw26Do16ih4NGH5ItetXQflAATFBv5IHXXGU8lSWa5MOvdNIdNpmjOBHh/+WP+lXtV8dqvCeBGK31of2W7yTI0F3jDAPCRAMiAnIsJnHB28zLqlhzuhm/Q7WXgla7Bhel6gTfl2IsJrGE8HpooQpes5krT3OGgygIplHTw3MeYNb/UlAHdZVqrhxN760QJ6zpFvKW4SyJPiDgEv07231gN8MGnlqe3b3BzTUU1umzzNtYEvfoDZs38n6m7XKM+ZF9lA+8geLnMk9yyd9Xhs99B7sepYJcw4gFzJKthxKVJ2bRZcDYDKEC9eiur9GXvIasslZ2Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY0PR06MB5457.apcprd06.prod.outlook.com (2603:1096:400:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:44:09 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:44:09 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gabriel Rondon <grondon@gmail.com>,
	Artem Lytkin <iprintercanon@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>,
	Batu Ada Tutkun <batuadatutkun@gmail.com>,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/7] staging: most: dim2: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 21:43:12 +0800
Message-Id: <20260720134324.239391-7-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720134324.239391-1-panchuang@vivo.com>
References: <20260720134324.239391-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TY0PR06MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: b7399fc0-4d39-4c46-caae-08dee664f973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|7416014|376014|6133799003|10067099003|56012099006|11063799006|921020|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tG65TGeZig8EQ5WPxito8jZpAeySn2A87J7jAiEmulpO5YS07H/WBA8GVUQKzXbwl8eiun5vxx1SAXf+bjzBOH6mFZXSCI5yBxVyCedmdPhlIntvb+RL51/HGPdZOw4Ckg5ySyn+4P0Hxt3cJCRxHVAkVTpvK0FsqbAFHYG86ehH80KteuwMwUdE3pDIPik3jsAIzmB5poHmN12h4rGXiXhywqywbobIkk8dLbv4v9G1LiAeX2Iok4GMfr1Go3pm7VrU7nW0u60AxkB2W5TV1tHtcvbib5izo3FR8u5BIcmtUDHzzlIz0oSU5fFF4EJkYlySHVOu8872DIQFmCSisYYl1HPgLmZYzcAj22KOIToSL34mpW9NvdvbUfkc1bI+L9T8Llz8+xuniJCtvMnQ0ijmqu3B7nYJ5otedSZbkbQwsvCAOP5MRmcGT9B3AwE60ih8d81tVn2SbMFbtdcV2NcTUwalvqrnAiu1NRRKwNz1H/WgKg5cia/lNYYegxJDEwtqAWRHZUDGYJUpQdHK5eJobpxLKJIqd/xDYAGJUtYtP1LI91cAPErPjbcQ1YXUSjZVwnU7mqM/bHQS1nQJqLWb9tSl5nJY/b/BDOVzz7p7ATC/zDVEjml7FJ7mUVyKIZbYiNIOzeZh68NIv6q6afw0Yw/e2djpB/eFWHwMXNovQzkcsyCjLXHsi5GYan6umt5Oqefm4sBHfr6I1zaHKvNKD6a9nvhBJ6IA814ioG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(7416014)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(921020)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5GFg+hihJuCTVHStUqO4lklmD8Xnaj97DNU/fRBMAtFeL2q4VLfKzWm4E4ca?=
 =?us-ascii?Q?SyRLnjXdlB9VkuqXqMXTrD2x7IUN9wEMcxpvXVUs5SwtjZuCs6Rpv1TzaS69?=
 =?us-ascii?Q?xTj0ZmrEujxPh+a93hzSFn7qn3L1nl5fXGw0sMQnrziQW9sk4CWdiHU4azVx?=
 =?us-ascii?Q?1OTpbLwuRBtSrakT3yS/+0D2Y3TpX2lmCxEmOXUCIJlm6E8EmJL7Y6O139tA?=
 =?us-ascii?Q?YW+HpD5vm4e8GuSz91ycUMJG60SxTEcwgHo6On/fSZNWcTQ2vNP8MG8PAau6?=
 =?us-ascii?Q?TP+nv0ZU9Y8i6qcdAXwR3N/U4ZGJsU545YQwp8hOfWJ0xWq9R9CxyZ/WANDa?=
 =?us-ascii?Q?Vus9c3nYiO1E0qYFi48+y3ddWM6kthbc5YAIbBdm5SAfT7Iyqw0f0cG9aPJ8?=
 =?us-ascii?Q?4O2BmnCfaZEabC8SmyJq82NW1kiBGnSLOQr2SQipiMPrFoYNOGzXZAZRFBoF?=
 =?us-ascii?Q?OWEp9/Xh7jb1Ru7MeqNMIczy6tnA6WqorKGk80PWm3kZEtysvFv5va6xs1X0?=
 =?us-ascii?Q?9lBGCJkaZDwa9Tnmzq608XTRLcr9Ij/RcZejf9Pagn6uIYuPpyHRB2ouvTuG?=
 =?us-ascii?Q?t8nfwL38cCMlUjK3uDVAmviTKtB0neW9DMW4xjK+lkeFQs3gzqUC2pc8bZ/X?=
 =?us-ascii?Q?OCXv9D8HPmFUKyW2bFsjpT9Vj2V9p/FHweufiHsVcwCPgvN8XZzaWueefFxn?=
 =?us-ascii?Q?nFbhEQAEdI9GNZwOIEiZ8TBM/ztC76q+Y8/HW0y4sb1mqzH5uq21NfyFR8hp?=
 =?us-ascii?Q?N5KHFAkq6B4svATPEVB99M6Vg1fgf+6Z1xdIsVLXMqpURLSMaAgJoDKSZTyE?=
 =?us-ascii?Q?cpEC6XvimOYf5ah3qtBuuYclGiBn5KlW1kZJ6IbwdDcC+o0KW4LqC5dL/Zjl?=
 =?us-ascii?Q?t8b276nhczzzLDbYV9/K3Cc1W+IMqPTKEO5OReeSq7Z23QJRxfEowYKVyE3D?=
 =?us-ascii?Q?/z2lfNLVQ98YPxViTLjXXvleOpcoRbG+oDt5nR7Fkyp1g/7NqFfnjanSY07O?=
 =?us-ascii?Q?ikBY5zyrGa2xPbJ+Y2UMXkS35nvcoEB0XdF2hoY+kvWtfnhR0UVvDbBUhM2P?=
 =?us-ascii?Q?FUtcU0aj3F3H/VE7z3Bom/lGe4o/qmUhYz3PyFLMkpgj97AIgAIJLqivBdIs?=
 =?us-ascii?Q?qB9L6U8wH/1JnN2h+CZsXKt0/R9Wix1G5gaNo3JiyY0Lkwf8Y0pTA9e2+80t?=
 =?us-ascii?Q?9561ghw/Gxb1whzgzuzq1XkW2Qo/jl6omXZpFYDj7uKph8RbcvDTV/pUY105?=
 =?us-ascii?Q?KN8bM+ykFWxYd18wTjOqnvNwJ/YxUpePQST/UoXl005RF31FOK1kCSQdrjwA?=
 =?us-ascii?Q?beBJNefeyftmPidNgWmE+5Dz5aa2a8NvoFPHQydGkD68F3K5Tz0zZbtkfOLN?=
 =?us-ascii?Q?mfj/QCuMpCGfQiMDbXFvPM1gEHwRs1GMo+Kb7chq5wFrULxAF1kwZ1fmqGRE?=
 =?us-ascii?Q?DOC1/SWx+JyQfte9S3M33fN2MXZBoEjZoc4tPmIjZUaVT0kWPYGc6up+Xato?=
 =?us-ascii?Q?+RjTZ9mOn9/6FfOZBmUx+iBa17OOmKTAuCQn3sNi9Dn5cLW0HW4KayS8S8rc?=
 =?us-ascii?Q?wM20Ss+JWuooheZPEtFRNVSt909jbDftxnQhBczayYTM9iC7dQo1VG13UkZx?=
 =?us-ascii?Q?0r9ODM7WGR7TWnqZudX+LFPoEst2mmZUdIUT7RdKOaqJrsbylGE/QS1zGeeC?=
 =?us-ascii?Q?GoPOF7xmQM6iwyS3AiEEiv7fAqcr1rUEfnjRUYO4xeDUVtd+hkeBjOBmAFfn?=
 =?us-ascii?Q?zgamvWOzOQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7399fc0-4d39-4c46-caae-08dee664f973
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:44:09.1297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zht1EbVa0+a0d4RQ9Ob40kwM9ZtJYKfwlfEYvJzniTG4+P+gyOzMJhrUDYEds1FWCh1eJwI3H66tJ68ZPuh7IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5457

Since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
devm_request_irq() and devm_request_threaded_irq() automatically log
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/staging/most/dim2/dim2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0e2512d16632..d57e20d399c7 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -818,10 +818,8 @@ static int dim2_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, dim2_ahb_isr,
 					dim2_task_irq, 0, "dim2_ahb0_int", dev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request ahb0_int irq %d\n", irq);
+	if (ret)
 		goto err_shutdown_dim;
-	}
 
 	irq = platform_get_irq(pdev, MLB_INT_IDX);
 	if (irq < 0) {
@@ -831,10 +829,8 @@ static int dim2_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, dim2_mlb_isr, 0,
 			       "dim2_mlb_int", dev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request mlb_int irq %d\n", irq);
+	if (ret)
 		goto err_shutdown_dim;
-	}
 
 	init_waitqueue_head(&dev->netinfo_waitq);
 	dev->deliver_netinfo = 0;
-- 
2.34.1

