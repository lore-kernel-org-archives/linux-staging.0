Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023134.outbound.protection.outlook.com [40.107.44.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A53B1B3
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345408; cv=fail; b=TDr0HwKesB/QAeWUwF5EEBY6vwAShYKVxQzoQGhZVHJ3aLF+WWx6hf4/UaC8RavC3S3oJo7MZ/h/Y8WnRkmlS5uo95tF4dwyd/6rkFdRE+pW5pDUKZSzpv4pjGDScbZjkBcB/fGDWHOmY5wr2dIOlHqPxieJeIe2E/VSihS2T9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345408; c=relaxed/simple;
	bh=1ujseiifdcZZpKslqxQS7mzssyPdRLg+VfTjQ4u1f/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FKaBZjDkR7Hpo6BMjBdnFGxBWDVsRifJ9g03ngOsTkmomn/zbWR00O8MKf4iHyEnY5cozoz1iJHg8XGC7Cj1f+W+3AcHvqaP4hvj1nxSFM9ZSGli+ZlIjHXly4NvlfNVMTvx/PWMWTQKmakJdzEMlgXGvQbWnSv6pv61Sfy46Oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=W/odtF20; arc=fail smtp.client-ip=40.107.44.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="W/odtF20"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6x6W3PYxj+A7OR+DC0NaojjmqRAbJ5dFOTwFKAB+RlFGMCZXjnXrv1XST/0Kam7S70ac/55KNR7bAVNQA3txLDR2dhtZ241sXKApFoJKsjFiy4TPn2yFurKur7TEqV1/k9PhF84Dfbx5DxUmFeUu+I0R5dGoKlJWog+5gPndkn2x6vuCFXXfZuF2I3yOr36pEHpVx21IsDPW4F/NWROT+5bWvyIEbM/PyBjjpGFBgo2WdZSqutdN/RjT0zIPBx74qwhoPKcxLOGD9H9tqcgpDjVGrqU9uKiUWi4FLWQD3y7+Cx6vlPpWe5Vmxnhb7T6T4spf/jaMXF3i538RTnJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1G0svuK03dKroMPROpJV1MLNBA/9urp57ClS/lNWsY=;
 b=eGbBaX31DtvjW85vf12jjaQauO8WCM+LVwuGps/6zBWrneKIpfnp47FQvWjtN8BYQzPKDzbgCKDGbSgCOVFuPm7k/GiPX4BSs4XmsRggS7Ji3rZX5Q3QTWs5VMwx4xZrI1Bsyz+OVJSCORXbyOfUtJnc4PMZOq2GBcgr+5Yz0Lh7jpvgc01OWiybEJcXz6eVUd9tR6Ya8cMtJMWqAxS2dnZzmmn33NGNOOysLw9zSh6nJC7LFh2saNWGgtBu6Tsu3PYsVHg0uNGbmtPxzgpHMT9va0xphjr42y+cezKkE3sFPuTGIEAfQ74e3eVu/P8xtQ8hIHgI4unS+6E0EpNghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1G0svuK03dKroMPROpJV1MLNBA/9urp57ClS/lNWsY=;
 b=W/odtF20xArVTflkm01dVgg0tBUHdmJfveZnRAI1LZ9r6wF9i2zaNEwbEIFTc4uSl08vcCwDrbUcDFnngSqw7BG2ImdeiYIcuyIs5wVM63BzIpGoCmPR46kUUbv8JPgegIoZlJBn0PicQh8uDEVT9lJeQTDgOY3+pcE95f6m5lNYprbDyFurSm1jwsbuLr6oHDzG/p1mjGQKGKn2ciH6EcwnhxntZqAehWS0TQM+esHfsFDS91TjRoFEwfmCzckTjIqNsvRMiUe0kXtRmmwxFuvSChfV0ZtUEJXs7NXeYKidJZbOwitV4IiXQsMfnJd0JCMa7c7O++c752IxqM52Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by OSNPR01MB7554.apcprd01.prod.exchangelabs.com
 (2603:1096:604:31f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 13:16:40 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 13:16:38 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Huihui Huang <hhhuang@smu.edu.sg>
Subject: [PATCH v2] staging: media: atomisp: fix memory leak of dvs2_coeff
Date: Thu, 16 Apr 2026 21:16:26 +0800
Message-ID: <20260416131626.2544105-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260416064152.2482461-1-hhhuang@smu.edu.sg>
References: <20260416064152.2482461-1-hhhuang@smu.edu.sg>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|OSNPR01MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 5195c041-86a6-4f99-9ed5-08de9bba6415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|786006|52116014|366016|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	5eF0NZT1sxaTyzzJ2QTrtPUSwAzbjcOjKO+DrdpFy3afWokPbf7MD2mY3xlWFx96PM2lWUVMCk/7X6skeMuSGuFkSVaG+rHi9koLeuYt8WJIBwVeeKX7y1k+EzdvcZncIL4iBUqM0rsRi+koi+PxFvOPDCheXr34KROp2EpdqXCGh4mjI8QmIeWPKIOAco7NCvx3FNS3oUA0TFLnzCNH+LW6atin9UTvA2bmK8kvL6awGHb2SalEjpzQNKBwy/7OxiWLXzoGRrEQcvgsYcPy3eTPl7zTAQ4P8JueVc/PRZxTJ4tKen9sj76JfNRGVDL2fY3BCNa56MiSKMoJJx8cQdq4EumW7GoQKFpBuedVH8eOmKYM5gKkyAeC+V5d39U27qfeeABYySSd2TdUn5JM+i/GxLfmeQ+vDgfaRmuzXP2D/sHn6gphb8Eb4IReHJNEHKTYoDSSAAxxkFSD8zdN9Miofqq76TAoU1iLuYvxRVdR4tP6oxHhO5N6FFs9nj23/9wXv+BmMupr0KLR9zACUmm4wLlhUzySL0HGVuEmGF821f0Bd8lty74bw4qtl1Ptd1S/8X/iBvk1MsW0m65nDjuS5czXrQYEmA97RXwlefDaeTlhtSRJI3AapijpMp2PA7SDNNfGdFdL5wOYk96v9XkXsDlvg1LsONVM55jTkdNdo5tjOj6FATI4p/SEZ/WKif06unwCm2S/p8SXVNpteIfSxPkDzD+1IN/JSO2Im5eOdRap1NkRWbyvSa6CyI/yCDK1vUtDuaA4d/Mzl/pk40WiVsO2NRJwt5UvCv4E+D8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(786006)(52116014)(366016)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vE3ZKR7DlXy36s6BK4sLfrA9mrsTf0lg5yGFnzcY7+dL/zDOxwgylYxHuvPh?=
 =?us-ascii?Q?ezEFyzFh3xr6T225FWV8RBYaWNsCwrcJ63fziZFSfyV0pJAp/6o0vm+3VU6j?=
 =?us-ascii?Q?X648zBEkqgs3b/STAt+mlN6bTnObsbfrZNVupsJFCpU6kobN8gGpEjthcrZU?=
 =?us-ascii?Q?Jd05GbsLlQTu3SstvrVE7n3FGquCV9lj7Piddy+q1QFkh52ZcP2zrscKVHGC?=
 =?us-ascii?Q?QHLpWpd29O4944h0CruPwCeLv0Nk2ZVftCb6rh4qCHpfynkkjh1WNoImW+VO?=
 =?us-ascii?Q?IgjU40ZMVRnmPg4P8ds+GhJ3fb/vG7DsmBMVYNQAJg8r69HGysxqRfuM+stB?=
 =?us-ascii?Q?0FC3s47UDI3kQKANSqVHM2gRQ6/ajN+hn9v2wPmMdZkU46EH74edm9t7pN1q?=
 =?us-ascii?Q?jCc40FTm7R5nkPsiE02AZdmpfvbYYCSz00MUmJXQRpfceROdp1ENwZYyW0Hz?=
 =?us-ascii?Q?OhEBHAogDQcxYq2WuczVOzKOXYMnXYtPFpU3ywa/ronWIwnYtJf3DcKVMhrl?=
 =?us-ascii?Q?VrjSU8AocU3H8NO76yTRJ8zfN5ku+/9PWBh+1SUHlT9LMhefFpTyWojO9z2u?=
 =?us-ascii?Q?7lV5Ihsfu0ZOfv0IoSPbbyhHy0/RYwzhMYEye3paV5I0GwzD/guQ4W4DZsZu?=
 =?us-ascii?Q?UnBAtr002qcDVAoeQ78Gmo6FX/r10lVjYdNwfA+GbjoU9qUvq9Gg6TkJdktR?=
 =?us-ascii?Q?BTHqHJ1Uu2vDmmGLVlMXFPnzUbBFWIixc8CI6bwF2ATfCcKGdnZ5F79FG1xB?=
 =?us-ascii?Q?PYElFx24MLTSXRgFskUuv0AHHNDf4tt/0gEhdQaph+CQ3LxX1decOFq3I+hR?=
 =?us-ascii?Q?OnVkR2ZkGYhR5/X+nXNxYgKLyRMUi8h2bliERRgzWiiHl8n3pAgvwPmvgcDh?=
 =?us-ascii?Q?2IJfvZy86HYP3EMsd4ooC6jLEYrn+oUNOtNFyaYw/fBe5v9s8Xn2MZHylUcO?=
 =?us-ascii?Q?L/d4kcTTem8GzIbTptOlEYSp2lKEk1bnG0wanVgjGEVROZrfr/ovKSuBfN0d?=
 =?us-ascii?Q?xaz5j4BNgG12qe8Y1L9XBigtqGpq88xe+lNGFn33ATXf6+Bt6q1HiNj2ebKO?=
 =?us-ascii?Q?JUKzLYbmB6LtqJVBuhtWxyH4J7Q+cWRJNRHF1U84UR4tzzEDSIaQeIdAnOJG?=
 =?us-ascii?Q?tTQVNt1KtNEokIukqlX9iFfESAgqTTX/JSJXiWsXvuFJzOTfVirmO9iNChQm?=
 =?us-ascii?Q?ABFV8mexPusHW0Y3dopzZc51F7HuuYV5Iw1wTRVnUpUs9TmNB8Bb1Eslj2PF?=
 =?us-ascii?Q?yJvREJbwUpdstPrfzaPvrTKejTngfMqbpGuXVV/v4m8giQDneKPLhLEYkQjK?=
 =?us-ascii?Q?iS2rPmIPq3jFDF4AUDYLRFYAEmXkISnV97E/GavEozddTPvyZXn8j5Et2Vyc?=
 =?us-ascii?Q?lIETpgN4cqu9D9csdSmXp6ci3hTGQdwS91C+Mc7d46WOZ3yjwOh3clhlhrP5?=
 =?us-ascii?Q?EjMoK6IWZHaMLgyK4tPlZnPBUxseD+5787npy9pKjz0QGYNJi6mVCyFloyWL?=
 =?us-ascii?Q?dWZmuh2/7QxY1dIByiehrEPHRS4zSqbtOY83THMbTDSR8phI/SJN/IymIEcq?=
 =?us-ascii?Q?N/uMGfm+YdWRi6tk0qUFUBEnCm2rDVRULLrgveIiBw1prT4qWOdxpsRat6lT?=
 =?us-ascii?Q?+PyC63i/vE7gFgE1Jkfc0ivYxYFJOWVtsgZ9JwPz1dPWDLerETLmqYJt1v92?=
 =?us-ascii?Q?LjXmki9SIyu+tigot9b5WULII7Rb9p8k4gAbHD6ov2EfpzjeZiCJ8Vl39uyk?=
 =?us-ascii?Q?fntS7iGv1Q=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: 5195c041-86a6-4f99-9ed5-08de9bba6415
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 13:16:38.0250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbRWmL4Ke98vxoQtexAh0Aogy58MY3O2SMQNRYh5XpyKqegfZgv9yyMmg/5xKpCqta5Zeu0XmfzCJoTimSwZSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR01MB7554

There is a memory leak in
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.

In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
ia_css_dvs2_coefficients_allocate() and stored in
asd->params.css_param.dvs2_coeff. If the subsequent
ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
returns -ENOMEM without freeing the previously allocated dvs2_coeff.

Add the missing ia_css_dvs2_coefficients_free() call and set the
pointer to NULL before returning on the error path.

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
v2: Reword commit message per review feedback (no code change).
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..d3dc84e14877 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1363,8 +1363,11 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
 	/* DIS projections. */
 	asd->params.dis_proj_data_valid = false;
 	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
-	if (!asd->params.dvs_stat)
+	if (!asd->params.dvs_stat) {
+		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
+		asd->params.css_param.dvs2_coeff = NULL;
 		return -ENOMEM;
+	}
 
 	asd->params.dvs_hor_proj_bytes =
 	    dvs_grid->aligned_height * dvs_grid->aligned_width *
-- 
2.50.1

