Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012039.outbound.protection.outlook.com [40.107.75.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1323B531A
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555069; cv=fail; b=iij7XKj4qyA0nq6XUAsBHp4nP5Tby9aOxBrN4nJ3z4/xiSd7ZlX+d/kdA2+eeZXMsAr8IQ50Peta+cgd6WqesXcVBS9TdCy1Cn0SEnls3Jvef/jMeB22Lp/MIaB0wkbCA72vyuWQJ79dJ8xuA9TCPwThfyk/kdnuB5LGl7dfcFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555069; c=relaxed/simple;
	bh=lrdvCl+cD4pZJo+NvqZ0yG/hYILQgxhqRGf/AGCcmkw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ADXMyqZU5sBjNQNRliulnjXTDA8tx+HlS4Gcm74ZL9u+G+ACYNl+KG+o61gdm+upNrNdMFJWg/c6VZ0J+W89xN+KFylKKmKSGOTVlUccTxBiqCEksF4hg6k5+CH2ocPU4iplMcgjEMpBCiI+UXAtlV3Dy9q7QdWRU6FPp2J1V+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Yx91e3gy; arc=fail smtp.client-ip=40.107.75.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Yx91e3gy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmVRHCVJEKl4bvZdzY3c+gImfg10XqeqiabOoiVapYUsQ30hkbNgP7byiKg2/xc6KokiIZuo1b7UYv1QO+WqIckzGHimgaMuNvpr3r5yiiYgWr/QkUqaJEqrdyOaUCXAFRf5y1Vd9IK39micgAc1uQ8hh7dCcR0RhSzuFO/ME7hP+AaR/m+/JA2skOpOuXo3TlwhZgupbvqNkUl1KEM/3NxzvL8wHDxBDwpCL015iGuN1Nk4BtWMzSQsuzeD2JX822Zk4F0D2GkqifbhnfXlkuu6LN4jAkwJJKP1xDfzipdr+mPI5ubkcK48mPHkZAmmL6FpUTqk9pamu1JRRxtIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7D7oZRQo8ZUuBXfiqRbNk1qIbj1e352PR/RwGJ4njE=;
 b=ruN7hntMiypResI3QQjFGUnLAWW2mFWPGBBco3DkwMMV4/FX2yySugyZvSKHhIauegNNDaFak8rZ8ttZAELLT6hoqIiAj752hPPqhfImOwHZENnuZjfFCkY2lrGobBeq7HPE0kEaE/ucAnnnzyMfaRSwfoIUCj81EYu6dZkP6Brx1Q/QC77Q6qaInB/mDJwLizQWJ/BeVpXlOdBahnbzKPw8pWpd/Un3/jL5Xl8r+oGofVPLWEMdhI9v5WbCkjYIOyWfHFYM5J00LNmhMWRPc0/e0zVBSQPp/5Y0E8ibPdBVYhcYEi7YgSKRP/VlGRW/qcL9x/mDOblLHQm6j/zeeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7D7oZRQo8ZUuBXfiqRbNk1qIbj1e352PR/RwGJ4njE=;
 b=Yx91e3gydJ7m40yo9fbJwOjvXl6AHyYJhgpcGnMPYFxfvhXMnOfH0z+FqkgEU7ZrOqn9gGAU3c0uRnJZ5ZJdRkZGh8e03hjXuRYbrPkUcQgDDTly92OYVu9TMejsSWFjzAIT6oolWo3nZ0jmGfQQVsK42pdn79L/5TAz3XrQRvZjm7NeZ5tYSz24E55zQKI4JXc2Y6EhLFzHEkum+0/Jm/EirfaGGUk+57FQ8n+Etvyh0khyhGWp2SO7KLKKu4zdSitjues/Vlbk/ccGbWfWFoohgfCRbN5pNXy30j1FbkJYQgG/SY77/VAW/nL0ncOCD5YnMiRStOLaC8t0wfTJvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY0PR06MB5457.apcprd06.prod.outlook.com (2603:1096:400:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:44:04 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:44:04 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH 5/7] media: atomisp: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 21:43:11 +0800
Message-Id: <20260720134324.239391-6-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c1a8359-f5d6-423d-7227-08dee664f6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|6133799003|10067099003|56012099006|11063799006|921020|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Gd2+3uL6fE4EWwjIHB6j7y/dhrBsOjFsmyGlQT0AbUKbSMoAW0SISZymOjTS4BBWbXscY527wz3XpRE/6R2nMJ2E2t8Vy2P2/uCgskbJ7nQduBmRfU8ovpLRCYQs6XBlEAUgDQ55PRx7UZS0Al5vfUQyukwYv8mdMJyYWUaCi9SW8d+Bcs2he/7LUHGSYiDdgJqs64MMutiGfZU254QL2pMaD1Bg5JYkvOuvWiQwVAtlJtjkOslSOGyYLt6sqnJJyIGr/MlKUTX+v+FbBIhnvg9cZl6dbJZk5MaCnm17toyswU245tsih+qWtE0DTA/IOtELA4L8kzPrtWnR2T7Rre5KFBCld3j96WkVFFWbwK2NxBqgX1pNzCCPtsehHgQyLm60yj+i1vpOMRt6EklIo1L2sy6/p2CBXiq0NQ6MPXkTCr95Wa7402qkBIKGvol4GmAJWmuXaao/vrr3CkADjMI0nRxNOHiTL6kFE9hEkp5CH6Dswg6T4jcWa2sytNHoKH0yVTl5WGbkUPJ5ITfG+pde2WbAYSPkeKCtlIwOpdHp42B2PyCrgtRRvtOeBjNcyO/9DfP7cnUkC/2jXteSHO9OsaKyxNiqJnBj43fJb63swZNgIB5jm2CP5YuyMuZpKDvODq9wfA4oxHW5DGtdCW4+oRl7a4v95Cvy8Mq+pqGLaUvn8B1WN0aoE9+6wy0QQjkuU/INZ2ynQ9vVvlVZPQMnqOH5jpwrohs2owhqFdEFCtvAd8amGs54CEznHzN7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(921020)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7zhviki0jpqxIdN2zfcjTEqM7FBiJU7eb5vQbn1dToHN4j5wn5mebWcu9gBo?=
 =?us-ascii?Q?iM0S0IkDQ21RpECfNNUeM3sSLovjY64dn0rvt+Bx6F0+nkjn4o66n3pwME7y?=
 =?us-ascii?Q?yFrUPnGuQ2Y4P8tF41fZp0wE5htb0cEGz2zUTCZVIGX6+P3UyiJJezcvXBfA?=
 =?us-ascii?Q?mWCyydaM2yUR3g1y5b1/NsCaJvFhvw0Xq5cPzaJzN/gUjypRXWhqrXGOGuzd?=
 =?us-ascii?Q?W72hmrPBTaLqAY/TsNpErauPEzF2bWoBliPaqsJnOUN3dVTJ1OKClODLygV0?=
 =?us-ascii?Q?e3Hqravrb81ynvV/iN2t++bAM/8wxVPcsALkSU8YTe+7xkx+5bb8H7LnA3aq?=
 =?us-ascii?Q?h8BA7LNRRTfv63K5PTTYfx7y2FAdEcID++aE3xp1GADgLIUpCCgYphxA2HX1?=
 =?us-ascii?Q?KOsCoCltyUj0dX/CpDLyp76Dh5V1rZ+1m1FxkyfYGIvhJk5YeZsgXMU3bAG2?=
 =?us-ascii?Q?JarIVYriy5GMdrE50HSZi8Ix3y5E7rIPfU3oIoDUSNbfnRb8eMynG4na7C8N?=
 =?us-ascii?Q?PzOuaYQ7HVSZHDSvcNZjsuvuCmL3ooxazXBMBiFrjH37re5I+uqxxTopoZWb?=
 =?us-ascii?Q?nfI6Nd7zyOJcElCwpRK241XS8F2N0+CYb18WcWFjxstMeVoE4Hj+Aaf1KP5S?=
 =?us-ascii?Q?bHP2QyCmdKJsaJaRsIwp2VRqFNFlkx/t4acVi1RRlN2sfdzDGIcJboWTrf1f?=
 =?us-ascii?Q?QkyZAoCzocozV9aMpgxQKF3DvNWtHoOmi4oqTr4RxX4KpFrEOhdtirveIlqq?=
 =?us-ascii?Q?CMIy6n99j8z2vfKAkP41FoTr8iPWpLU4L51CQsIkfMpMsO9xZCYMIiJ6EBAm?=
 =?us-ascii?Q?TClp+hICWgcq62xnsYhpx3TG26t4t/7flB799N3Pgw+/pgylulA8PsgssIFf?=
 =?us-ascii?Q?mViGExgpoh7+bK0Jz29AZLIpy38JkSgKJeJV5vGOBdWP6d4G8+gbpddG7+Vu?=
 =?us-ascii?Q?bDLCnKs5uWGvYArbPKmcf+9Qb06eHkM4Yt54csVQ5oEI80FOpq1x4QSoNLgp?=
 =?us-ascii?Q?vbcQHylFsOzxGhAtJkEI4NA2CXfa0xOx8Bz2lCV69iTwv6oUrehGKqLOiqnE?=
 =?us-ascii?Q?3oz7bGA0KluUOP4d3E2MUEN8Q0MIhcY6spnU/pZaVwOMEPhfTtkKZ5FqxpaD?=
 =?us-ascii?Q?RNK5LbhDI2RVs4HEjmkj4T990LAfxU5nlbBh/VnNglnop3dIGWffelbc4UC8?=
 =?us-ascii?Q?I2w6wdeTeJVkGEOfQePNBYd/XB+KIsgKdz4KG8jB9cNkf+lqYa4ZPE6Pe5G1?=
 =?us-ascii?Q?2rghh8CTg/Ge7+ZgHo/Xi0WjVZV6Lz8uY6hQTNwnroOY6REIwkVJzIgXgLr3?=
 =?us-ascii?Q?A6VVBdwLOkyfZ23UNncBgOQ6pjtfoNmVVUQ0wAs2vaJYENmBotJv75oe667E?=
 =?us-ascii?Q?aO3tLPH6hL3FKW679WtSYHDpoAyyNRmo0Ni1kWZqKf6kg5SnsRt/YOIvwbz6?=
 =?us-ascii?Q?py0LPbZfZ6xrM94Ht31qmy+XgECItkQNYcBGdazd62t7+fo7Po+hnnTvpfkW?=
 =?us-ascii?Q?iVabepw2xO5fvxtEbkLvgYl11Xt1iIa6MMqo3j3aBZnbG9vq4ylSmm4zNsQf?=
 =?us-ascii?Q?UEno6ZWMBC+Q5og7tRqNdOmqLj1k2nHAfhQELhkx1LyA/INGeecNXfv8/jPU?=
 =?us-ascii?Q?+YDchX5qgr0ILdT7Dt39wja0BremsFP/YPLBoWqduByiuEasTbTKmwOps95l?=
 =?us-ascii?Q?WJJftaHoIP+8eueuqWwXwhnX0eI46qVYhVBIxF8hof6ql9m36FWi+Mgo/XyK?=
 =?us-ascii?Q?QyVW14fSxA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1a8359-f5d6-423d-7227-08dee664f6b0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:44:04.4686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/68iNi0s1+G7cUbKfLwL70GesnF/2V3zmv5lB9soWHa8avBRVkkKo6osgguFyHbImVbQDJBk+mNr8xMn38aaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5457

Since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
devm_request_threaded_irq() automatically logs detailed error messages
on failure. Remove the now-redundant driver-specific dev_err() call.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..2bed5e4c7ace 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1416,10 +1416,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	err = devm_request_threaded_irq(&pdev->dev, pdev->irq,
 					atomisp_isr, atomisp_isr_thread,
 					IRQF_SHARED, "isp_irq", isp);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to request irq (%d)\n", err);
+	if (err)
 		goto error_unregister_entities;
-	}
 
 	/* Load firmware into ISP memory */
 	err = atomisp_css_load_firmware(isp);
-- 
2.34.1

