Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023135.outbound.protection.outlook.com [52.101.127.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFBE29A32D
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435764; cv=fail; b=SfWCWuAuyXikdS2Sz5OXhZ9R8vYmqJ0+3wTHA3zZDpY1cY6cV9bEmEq6eq6C09q/kIyYBNNFUVxbPtb5Ylb6IMZgMvj6icsc197UqGVrU2Q4Zs/GWrwZEMEHUDj3Ll2LtFhiDix8HQt+V/YSnt8AJdmnASti4oKGpYSPhH9K8VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435764; c=relaxed/simple;
	bh=LGgRQhk3RYQ1XscNHURHTRxHXw0Cs+N8T0NLiCEoDK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ICeFBvzb8lk0t4Nepl05EkLPyqeBWlM6hNjS47p32NZSF/38+XTMO03RzCNQ4c9Qp38Vilrx9K0iN5wuJMtuPMSA/auWxHlCarbrwMvu+c3X0gxOsX3N1720JsVcttTKIJAFmfs5tZ+r64CdX0XmNS0POsDONa4rN/5Lzd1TqMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=dwhoKiQX; arc=fail smtp.client-ip=52.101.127.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="dwhoKiQX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkZ1GCfKEevkpjWs97G6U6XdtB5GXwvBwch1Oj5uEPXYLKL6Y8y1/ywy85FHl6D+iuQ1365voHbYaMyFZq0hHwXKEYx6bKjQg/P/+KulALZ75o3AIdoN0d/k8NZ8oeDytZTmpZ6doLlNmKYHNVX92pwfdOl+du1pNFRgY6+eBmOKI/Y35Pfzjc9SpBhHUUfdJy/knYfJOSfBAZp9H5JGiFd5fVrkDM1d3VtOpCYGFiTxHacTqEOWEuWl6dpt2/PnB+KFUS510syqZ37+UEKgn9gly8YveryfB8bzwqCytx2fA+mHnRKhoFUERsXAgFil8a/osu5H3rcqcYfLr0hgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82Jf0aQL6HbrSisugJKgTfIVsBoqdZwKvmyTuZCgKAs=;
 b=KkY/Uym23hDAaB/sp8M68nrc5nXKDPl7p4DuN35kJVNoEMwJB6XshjVaa0aGtJwkpwWTLO3Jbvtqpy4H3twE5MG9zH8B3wVxN2z2ixiIOaZ7ClEUzmzE8I1HlI/PwD7VE8aCDgJBOwMLvIs7GjlsGW8fTQrJ3Hb2Jpe4bEyDnCOAwn9q/zH9JHFjBKj4/qq1a/C1AtyaekZ1fJOC+4vndTHKn7QGR8vWVSi9MJAVbb8qWQvunQ2G94/o11S6Mvz/WA0IWjEhqhjCsy5IxRKj3pxj5G2mpkNq+jwbi7CI2mkbaa3HbJ7t7tH6IrScFyAiWEdgC2O4MAg9A+GnCDmerA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82Jf0aQL6HbrSisugJKgTfIVsBoqdZwKvmyTuZCgKAs=;
 b=dwhoKiQXb73/Pc585cm2LBygYkc1MaGqz1HaWqU1m5+lFEA8hCq0wkkLxMAPq7bSXV+kQsvkR2rWGXqKoMKYWriJKweNWFnSSk74RuVdghTtoO++5jwSnrAoN5k4orQ7Qs4KGjIk1J6xXLSwrrxmyM21UAOmfWAw3oCIaI3Vbbb7mcuCSyxDmJHIHfX2PMxgKUS4wPlnN7rJAIBViWiEgWn6DX+CPhyPSvhEtVxfiy+JrgL2qaumxo0SkulUkgo6dw6dkrb92O5/LRYL1qRRn8baRX2ZIWY+bxqjbBWsgVloga0gd3rTaQFqZ/FPadGceFOuhCe6W52u9eM8Gn3RqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by KL1PR01MB5091.apcprd01.prod.exchangelabs.com
 (2603:1096:820:dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 14:22:34 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 14:22:34 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: error27@gmail.com
Cc: bingbu.cao@intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [v2] staging: media: ipu7: fix boot_config leak on queue_mem failure
Date: Fri, 17 Apr 2026 22:22:28 +0800
Message-ID: <20260417142228.2769150-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aeHzeuVMpcaPx6_x@stanley.mountain>
References: <aeHzeuVMpcaPx6_x@stanley.mountain>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|KL1PR01MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 99119e0a-b896-4cf0-69f9-08de9c8cc4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|786006|1800799024|22082099003|18002099003|56012099003|18096099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	d14Y3Qn969IgRcRCX1lduj3+FyYU4tRi1ejUJl1izanne0xfJLj69Ds1jOQG0h/pDXo4+if4sU1wWSyuh5Q+SboO1yA+j1qZSKsxvf/FCZnnWSe6RIZGPGmyRrVi0k7+ZAQ15b3va8qD+WA1YplmyouZiMAvC553pntK9O9qmRb++A8gKjHl2fhX2dvgIRGCklUYKCWWaHE/IfdV88e4i/t+gJrC5owvJdRmrFu1PnMKyx6K7NnHUNBD7Odk7+Ourv63IuN2SK1jJK/2WE4Fu4VsPqgOqGhDPBb9o0oAlS49FSz2Gcrz4JrSg/9/aT1gDNhDH8Yx7K6hGGrD7MryXvPNak592EE1ltNF9xUyK69Py2P9K3cLLsh5WKLrlPqOB+lusD7F31MjsIcSamKnPY/DptVfv35nUP+Vd5lqGtTrqTFhxfYQa8INeLqWgTaCNp3orgfhaT7SclRK2NFqB4iaYqmAJYpWSY+CaStyl0YIRkyY/SocnjOD8rHur8dJKfpZnqNTXdJslIhh2ilzlOPtR6PH4GYoaQ2sW20WDxwlZsNHiFHZImgIf1HmTk7TIC7rUFhg5HjyXtKKmINEjio0ARMJWrahDbDKIWagh+VN8aGF3HqPQMcpteYh4pXocN/P3oFnk3X7KPZT6uyht3NIbl7q47uObpq0aFSPNzuthHplJcw97VKxNYj/+OBBcD1DDfhs7KbYj7iFxHt3Goann5Dps3qGBjuB9zF4vInD4NgEmbjNv0+t2TjMr1Z6HeEPUeVcoSFZ3r9X4usURmCZWtcwd3JQavKBq+uaxQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(786006)(1800799024)(22082099003)(18002099003)(56012099003)(18096099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IOWW0Bq747XwCNVfHKVvs8d7p8h/D7P4ppDCUk+4wyxJJgw0o1quGXqX/SOE?=
 =?us-ascii?Q?8JB1sEndt2Wo1ltqshwmIu5i3pcmwsA3nYFhjRkLY3oMAh/FKXasL035maLo?=
 =?us-ascii?Q?SKdBa3WYFS5rQn0l0E8inW3m6bzZTqCNa3rofHDqFsPlJmBPP6Ibp7nsqo7s?=
 =?us-ascii?Q?14RlA98vQI0ub/Lmh5+OVLt3mSvdMrYanr2YV+oKYJVge+COb/nynHTO0L66?=
 =?us-ascii?Q?j9uQrJ7tNU04S2iXIcXC3dMh6yEt7ETCifnXxphX3ZVmeYU+qhfPC/451eIO?=
 =?us-ascii?Q?SsTua34L6cAMx64OphSaQriMdqVIrGA17XQw+Wvg3WWESd1e40Wi+cHbaCrB?=
 =?us-ascii?Q?s90+ZbNBXX5DHqKLI6ypC8EhoAXXHOn7TAoNyvmT9AO68lRH2FlfyFfUXXPT?=
 =?us-ascii?Q?/I3ayKK4LaerhNmhjUUiV5+CY/Cx6GYj7coP0yzJh7RXd44g/s4LHrt94Ujo?=
 =?us-ascii?Q?QFY0MP1jglOyv5iWAa6gJ7clJkJVenGnJkqWDmvzSIhA5I55vrF48oO66y69?=
 =?us-ascii?Q?WTEKoGDCvd3MkBOKV2jcY1qR1iuEkFIPUNNAoP61D+VXK2ww+CrY6xDPCau6?=
 =?us-ascii?Q?OrxZ+8tX8hPXzv1c79dtK+95U6jQh2lXxaikFwvKYGXgp7eY1A3rMHIKzJxS?=
 =?us-ascii?Q?QNkN1dCedP6pWfJS88OXDXgyQxwbQ7/zMpG6c8BaxQwGFZZkKoWvSZDvhf3D?=
 =?us-ascii?Q?dyMyEgRZDZVMiP8G6xh8QcyuQIkixIajH0FbebM8VdkuBPjbb+o1ACGzPRJO?=
 =?us-ascii?Q?G0BH2lWuBmmJpe4epSKnovMu5rE2AkrN/SEBhxQpxLw+ldbhPVNLtUq688Wa?=
 =?us-ascii?Q?Q+nIsPeHAkztsDGbvMIOzTHfZZCE6a22JgDVC0uXhtcR+JhnTSAXGUJATNaR?=
 =?us-ascii?Q?uSALYEPYRiXURc4ZzSUWxg1rkAjmBdTuJKPlCi2aZn7nzmlJygj2/pdBWKdc?=
 =?us-ascii?Q?m5o3w8VdQwnBPyDWBPYPjfnevq0lwLd3/4LlVRXcOpsIbQXrAgVLBymvKMwD?=
 =?us-ascii?Q?V5zN10xn6TiICCGTBmlduh2cZ/TWKSUnEQi6yVKYapgydTR7Dj84L94YsSnm?=
 =?us-ascii?Q?TrVCypWt61tkGUaa+v7gTptnX+7IiD7ydpw0Y5EyIE8v8jP/VNkQlTCGQRE1?=
 =?us-ascii?Q?eLEdnV8zq3RUe492IuJ6eb+4U6plR9aCZUPWRSLcMxpO9Z6GByFa0KFQLmu9?=
 =?us-ascii?Q?rxc0ss5KcAbexvT7oCWd86xm9G8bLAvHwcXKg11DlR9rdZ7erfFa1toVORuK?=
 =?us-ascii?Q?nH5nLPWGtOgrtwGQU90W/t299MtjoiGRBuTe9wdehnM1UrNd4o1PZr11NAxR?=
 =?us-ascii?Q?Nw807kDAZT/zVDFwZcnBg0yZH+CW2rCZX2R6xdOzP4xrHVGM18vDa4ti89Ab?=
 =?us-ascii?Q?Qgwll7+1QNToKfTkwnxqxtIBPjhL77JFhA7At0dmn8ues80t7FgyQRPajlMV?=
 =?us-ascii?Q?nkftuXrMbmgpJCMISapvlWNETcRRAd3MEuojvmfe22fNkRiAwPP34riSeJ5E?=
 =?us-ascii?Q?DE6buc5f0QoYDN8AZfYYuBEDzB1vGg/XoljXDtQyyefuDTj/P2P4csIwRWgP?=
 =?us-ascii?Q?WzqhhIOhX/TKaZpcqYDXmSXnSKn42TmJK44gfqpwQvh5YlEBpvoDwaRcisTm?=
 =?us-ascii?Q?Xmr3zQrsIxb4ios+tkDYbKucdNyTxOrMuPlGpzNwDCNsQjDkAXsG3K+AE32F?=
 =?us-ascii?Q?9hQ8JiJO1cFBCyh4MbN2Bb4Juxmad+jejoNUGcIykGrHCpPAugFkUOzeRiyi?=
 =?us-ascii?Q?nErnLbjE/A=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: 99119e0a-b896-4cf0-69f9-08de9c8cc4c3
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:22:34.5797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YasTJM8zb+8nnVEO1hVZOP++pGrGN583gKmsMVdnFLWB3+5ZrhI4p3adsKirAC4BvC61jPVp7+la/mEiaPsUow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5091

On Fri, Apr 17, 2026 at 11:46:05AM +0300, Dan Carpenter wrote:
> But this does free them along with isys->subsys_config.  Everything
> works.

Thanks for the analysis, Dan. You are right, there is no actual leak.
Please disregard this patch.

Thanks,
Huihui
