Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012039.outbound.protection.outlook.com [40.107.75.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462D6418A43
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555061; cv=fail; b=SFnNK52svuCzRzNbSVnWdNMXgEoBZ4CnFwUl5DriH+YSO1EUFHfsCCr0ClX4qkAkBcvZZTpP5b+LP3nWI1N+PlRI7G4pZnjQw3RxeVKfYSu+TbXFchNNabipvqVPtrup1yrGUM1ZcCFF9b4oMIwu197oSsWfZeCsUlzyv+3OgJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555061; c=relaxed/simple;
	bh=Mud6NLHMIqzGxlwsHcY+0Uh5drdPQSCkkPAC9rH0Rpo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jf98x/ysa91gnym3IStJ63hs351nECQeDtDrfIoDlM3wrNFTkZletkDzcewVLvujSJ/F8wJ8vGvT68A6Uccag52K+lVsngv8gPZ2VubsdfwiQun3NBjF1WXir+kBkt782+sXMCMBXbNrIqrxokO+srnX6Doz7KNTHHVlEvb9sU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=efS7GNYX; arc=fail smtp.client-ip=40.107.75.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="efS7GNYX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQzNuaIwf6fJhbm2BapA37Vt2z02FAccNE3m38BL7Cx4hel5GaJ1gIJOcrscbzQXQfz+WzuRKDmCDy8Xj4PcQf41lRGzVvv8Q7C4Rq+7cSyNvuRJLVmxBxzFi0R47mVTSFnUrn57yG6kX4pIe4LbiQkRatL99dwo2rDggVvQAndtwyoQKUl/evoASDBoX108q75yq2c+1v5olQHVX+f2Z9z38ZoYBjMl4MJ1PDtJI/wce0o/ZimMNwQe1IbD7UW46NKXHDHmFMzAAeXsUv6Y3wOSGuFa1GilFAP4A16GBeiGZnLTflu8Wv9DC8SlpJK1QdRseKhnSW5SuWHz1MHFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IWUKxfFBfA5LO4tk9dvEmzO/9IRDnSgbVelP5h6kEQ=;
 b=qcFasl6O/d802XeHTzY94FAJCdBrCBaZAfv20+cSqvtcpUIWCtzpV42fv9xuteSOaZC78MB6iArqRb+MpqmwpZhjSi6Rlqv7Su38e9Ivnuq4bFqfEANYqB+guA5DHEBdtPmKxsa2kaeau8p8hkcRi3Ev5DoHCr7DUn6/jOzcpu2Q4nXuW40BEp1rOObY4v7CIY95rjTgy4Zm/3fV2kfBVvyEiPUIhepXqrxUuGP9r0+MgYFAlL7IT0UjwMhx+1JRSy0NO7v7Yeydm3G7s9fXWP7yR2MLkkKBG+Nyayw8tJOc9o/BDPD6bxja+ZP/xnuGth0o9n5FNDEaXVlNKvjTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IWUKxfFBfA5LO4tk9dvEmzO/9IRDnSgbVelP5h6kEQ=;
 b=efS7GNYXNWI/www4h08p78AM/DEGX9/ufvZdPdRbOO0YAN9rWlhDwz29xDFVR9xMe4ykiWt54LqrqWpRsftEUDTUa51ZfFxvc1AGVvHkXsnUacqhUfuEhwCkmcXsQI1QFZURJTwa63c5QhD9acieLV3a6o3WMaQS8vEF6aSeqIwZVj4TCZFdCyOY504AUCgO/vhGQ+FXoHV6dyFiIe1J2RcVJDTIh/GZ7fjvGzh09eAWshMZ3z08M0YJSh17Zx3RLQbzxsCf3MPcm5iMggnTPqADqokWOTQytHpwkS9M4OCxTZXI8GO3W5Yv/nW8aXA5vsgXB4atKfE45l75U1U9BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY0PR06MB5457.apcprd06.prod.outlook.com (2603:1096:400:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:43:58 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:43:58 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 3/7] staging: greybus: arche-platform: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 21:43:09 +0800
Message-Id: <20260720134324.239391-4-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8c88f5ed-b6bd-4213-3cee-08dee664f2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|6133799003|10067099003|56012099006|11063799006|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XA7OIYkbWgB0RDoWUqEmDkHU0IZNYxTFbZ8skeBufN+O9PbOMrUrZuh1f+xsJ9A+n6oXtc/PPWFdZNeY6uWTw5KiHnYYfFn7ojYS0BTZoQ1w2uGTb+7Rjhit49KPXMDdwIDx331xLbxHhVFNCF4TGIG35cIIjMSvXZNZAbirpjrBfl+oBN8jCm8icEYOmHac0mo09RziL5BMscs0d2HJxL3tu9NPhmh449iWXBFgFDvPXYPDqdFPTT2gtxwKURw2cQxbt1THZZ/rAuX+eeBTBDYvYk7QPlzoGu6C7JAs6icj5/fr0mnNpNUw4CAqaEsJiWme4B0VHOb+dZTbLyKPOh2AgR0VWIFFg2eWNDBAm8Z2kFB2IZ8mQYE6aN6BY7xi87X1BeM/E4V70B8kuUiTk4ie7MxDJsxds/rjNpblALz+WwwRXK9l69J3/nDFTKUlaEtny2ojfiewdkg/q/ULs+kVeR0JQ7PATJ+aOM2Bg5c9JZliVGwUn7dc0AIARNk9G9P9idg75pTZgEmnVDA6sbmIWQumGa75daXyzZmXm1LPI0vgIPlsyuR3/moCxNVYwQeW5qj02RKbfpJt9D5vO0RcK+dkicrNL9D7hkLoqyv4CLCw8/PL+mrnl2K3ZgbxjgmpU+Bp2w4vvTf/zWY7UO6fU6kHdL24dtvikzKHxAlY3eb365YgFAjUugT65DhNWu5qAWi294taL1mYnFfRWQtc2Z1qiPYO80vC4Xqgd1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JxwjKnQ6SUlEM9/YPuVkbjX2ufI/B3Kdo3SrzEjkW2BFxT+LwX2umkU+2kxG?=
 =?us-ascii?Q?iS1GH2IXnSChZY6H+cDN24ShnBdujEMegKbPn0JDQ4c8pXuba9AfoU3Aznw7?=
 =?us-ascii?Q?oQw7eC+7X2jaHKpR48Fvx8m6KBFykuAdKyrXANl3lY12RG9reiGJ3I8lw93k?=
 =?us-ascii?Q?cQnxhsWsypG1mL/bDqBd8XUgu94U+AOj74lugrkC+En5wf3ADEA2NH57lqoY?=
 =?us-ascii?Q?MLBYZPXj2alxJp5+1QhXTZV1FlcD91Ya5kUgyA2qGjcpx1wCx5UZVi29sVE5?=
 =?us-ascii?Q?SKLFa4QMLb3Kzkw4l42mpukl1bO2td/8EK+gXJy7If0LkFZP/+Rsn15tUvHa?=
 =?us-ascii?Q?bp12+uf3LfHzxQEeaVJiu2hZfFk5py21+O5lvIUqOXkSfjPRaVwHfnwKYTok?=
 =?us-ascii?Q?A/akeLsCesLr7rY6Cqcw19Z3/RAVuX/eYeO3ljaQjPmy9BEOuJxTGpZfpNc3?=
 =?us-ascii?Q?OkN4D7mYwAps0XgiWiDQklxgFwruQ6LlYt43bHiCEk4tNdxykG8DfYdLu0y9?=
 =?us-ascii?Q?W4ZjsWr/rP10rk9MW2L4x9s5Mcc8QCOq+t7PiSIXjEARkjXB+ftZppyy7sbf?=
 =?us-ascii?Q?7i+m6xuyIToLW0cmjjU/ypfAAtsRmniWy+Zo+ry4SletgLWnKkUlW1yvtIFJ?=
 =?us-ascii?Q?e8kCcwMKGdiW/xgxv0y+KDlTyMKqKn6UQvi+NSky0ZEC58tkX/WbFCUNKl7T?=
 =?us-ascii?Q?DMjuwEPfKewcHJldrItYzxSI7G9Korgz7EI2/xagmPBHE6I/CGsu630A9yJ6?=
 =?us-ascii?Q?U5IarMcKxivMRNx212lWo1bmVZnX4gyRjT4w55AvH1vNlXF9klBBJXmEy3mx?=
 =?us-ascii?Q?gGW5uoun1PU9ZgqxGilnbbeQMdARFCzVKiYaTINd7tU/Gi06IFTj5+COQ1wv?=
 =?us-ascii?Q?jYB5UQyC5Nclgs5gtWVlLIGAiqcEJYy71xH5zuprlmhP45TO0n7rioJ8mtwC?=
 =?us-ascii?Q?ShGmYsubvTw+azujy37vWDyEMSBR/2Um/VEJGLFd+Seu4t2uWO2/H2Ij5e3S?=
 =?us-ascii?Q?CxQHpcJiyylDrjBpDLyYHem/D51Yctx7sFXLKoH6cRfhTyVkYGNo9cSi8Dgl?=
 =?us-ascii?Q?U9elZ44vofzEtlbe4QNaoXRs5673oMXi6zaBpNL5cdV0Tdo/UXE+g4ajI1B6?=
 =?us-ascii?Q?fRMbU+sV+ocpS2Kk3RUh099uXwf6DVwA+wjGTE3xRd+VnvoKDCE/9wcnU9c9?=
 =?us-ascii?Q?f5GNUwzSvbuuJa2PzwZYZjz+Y/Ls9RFABALM65pOdLaJ3Ts/apvlPgzopj5N?=
 =?us-ascii?Q?TpaBJ5StzrnGNaSMvqs70sbqrExCQmJQEXAyLAm5bak5gE27wxIgiEjAxyxZ?=
 =?us-ascii?Q?JdfIDGyu6IOTfEDvDcYSbauAJJqPihpRa/LVmk24yx9qC21ttDtd3VVULaZf?=
 =?us-ascii?Q?AKY+aqhmrOj2CSP7BCsi3gLrxcLfDOjWQYcYrIcEhqJYLUeehjFtbDKr5ldA?=
 =?us-ascii?Q?axG49WKwb+38SEMYAeM8Q78rZmcsOOVTEUTIgk69i0naRU1+VTqfH8ZCYQGf?=
 =?us-ascii?Q?ypXB1/Dg8yMXDgNvGoMHJrhHMtCyq67tnnYpUEduglFOS/NwbZncZmiT7d67?=
 =?us-ascii?Q?aQHh1cdVtBfRu+BJZBHPn9/THebWEc3jg5yeCSHyLX6ae2oksacMS+mD2hnM?=
 =?us-ascii?Q?31IEYB4RfvQXbfCskEjG1XT7CjnG/fP44OFfIhjWZfaCF3Vo7RNKZObD7+mh?=
 =?us-ascii?Q?JNyJFg2sCBT+3hFu2dMxwLEs2/FNtpaC68xmmYYe4thrz1OtCta51cXVDzUa?=
 =?us-ascii?Q?Emkj9EjAug=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c88f5ed-b6bd-4213-3cee-08dee664f2e6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:43:58.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSOtjDrduGTVHK10y8NuSCtxMV77ndYv/LmZL0cOUmfWRj+XpUPJ81PX6sm0Sdb5zR4o01kInHLC6rZFSCLTiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5457

Since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
devm_request_threaded_irq() automatically logs detailed error messages
on failure. Remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/staging/greybus/arche-platform.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index de5de59ea8ab..075717b8aef6 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -503,10 +503,8 @@ static int arche_platform_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_FALLING |
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					dev_name(dev), arche_pdata);
-	if (ret) {
-		dev_err(dev, "failed to request wake detect IRQ %d\n", ret);
+	if (ret)
 		return ret;
-	}
 	disable_irq(arche_pdata->wake_detect_irq);
 
 	ret = device_create_file(dev, &dev_attr_state);
-- 
2.34.1

