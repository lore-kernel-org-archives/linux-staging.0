Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD56230AAA9;
	Tue, 24 Mar 2026 02:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319703; cv=fail; b=jC98qxH3GdBlQBc57w9PMJWmIEtyt2uyAiIkJNCT8Xxt4eL26PIySrCHZA7vSAyYH1Jfy70+iCqsCLXsSl/Sn8UXDYzUCluzVCFQ8/snGg5lPlgodo0bFExSm1Wgvmaq5pb5UFu3LSMsFVYleUn57n01dj6Vc9j0wJZd/MSQ5mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319703; c=relaxed/simple;
	bh=LtOzLyesLp9cwv4le4b5AI6sj4li+yPDLsYAn8TENNM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=N1INoxsm+rYBUF8jFO2ChK+th6q2K/D6Y7wRkT9oNpvlqUFveAghy8fNS02A92+NtbgnKEmjDKlm7ZDgVTuwCK9/VwMePhWZJmZEu4W8d8bMa6whV4dFyyMsMY51h+ZtnW0D8ZKZ+AdiXrDiBk7QSE2u0cj0Rq/sKFy0LbQxFas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=PSbv2uRA; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=Kh5lY0Cd; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="PSbv2uRA";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="Kh5lY0Cd"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O0Jg8o3800542;
	Mon, 23 Mar 2026 21:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=i8RbbZoa42RZfWQqPf+G
	Ob3leztUlo6Pbop6EcLmcNI=; b=PSbv2uRAok2XZQICryDZN5k85A6Or9TZo3dS
	tkNjGLkl8y1XxVgcvhrb1QVEtQmnNcdNXSo7+UtQdj1WyfFA+Ti/VrSbDpwUghyr
	rLopE+oVqdH95tPNdFvnakgbJIyx2EmaIMquROuSRhZ6FEJmfPGy5RJqBIxsyGbY
	4+dfz0JEto/QT9mA60kskMVXyz9cN7hvVMcZxAO2Acw/b8+uWr4K7yTlQq4Iivgi
	tctCzlMv+VdWysCyEq/KUouFoIad7QYBC7UY6enAzg8CMkPHssW7NSuji2HojGSK
	aRFDfZLCpzzd2u3pyouRl5mUxikywB+5biAdsnQF3aqWiaUAXA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021102.outbound.protection.outlook.com [40.107.208.102])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4d1qn5ckv9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 21:25:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9zDUpyLMMb1tfRYiV3zsZO+hWMc5Oa9/tk7RD59jHX7NFW10Dk3vjdzOoiZoLX9L7krDoZtYWEfHkVISdEo+4zVURL1hWSemyY4YUk90sIiuKP0NWTjpRnLd6ZgnhXxPnliyuQ4SrIlzH/G+f/AVNeZpMINfGwTtyegitpqWH/g3eoYeJKdbwSIbC4DQxOERRvV1MiMzlFaHEJdTGAm8pyLiqVlPnx+wcl7m9JFn+11LmrwZFi8zOnGednDRbPzF7G9B7DCEt3T0+iNz6nrd+jKdTcwVAzMhJpUwS0mfjzgCovoi3KbXS9ndTlFcfswb0XXO1vlgYEJx92yZ3OLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8RbbZoa42RZfWQqPf+GOb3leztUlo6Pbop6EcLmcNI=;
 b=PhFwVlomkeErrDqp76K509HvDVVsvgJLwchxcipsLAowCowJzTxV0sBNb+nbeJzENtR/gAXHRD7AUozR9k7C3gt/fPmRm7qenAyis12pDZl2rF6uwWOpV6Qv4PCEcvQb7cidTCkYbh+1kV86cYN9M5H+IynlfEZHuZK8TpgQdRTs+5YuCXY52q1OGkVqE4BP3A9iN4wLl2wUUEOmVdbawEg97fiW9bhm9Q23ge6FR5FPW3W1ULahqMmEy+qpsxBcpYWwZVugtDHWQ98KPWXDAL+MakaSdcqIYmJZND+VDb2zu+ooSiA0alwTtX85nZwhL5tt+0DMixnxcSoI8bYi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8RbbZoa42RZfWQqPf+GOb3leztUlo6Pbop6EcLmcNI=;
 b=Kh5lY0CdjCBLEol4d6ZabDfJpKZXF2vIYZSxYzv40DC+95Vw8k/wCR/glR+XxbGIIx3LFMB0Uw4J8habEXEKtZEybUlNOUC3RWFlrzvIs1OsOiVx871KAfPveqkzgc5rvnlBeSCETFCZ+TlVY0bSux1Iam5aZ/98VXW+xyxMUgQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 02:25:22 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 02:25:22 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [PATCH v3 1/2] greybus: raw: fix use-after-free on cdev close
Date: Mon, 23 Mar 2026 22:25:09 -0400
Message-ID: <20260324022510.28596-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::10) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c634b5-afe2-47f9-4bd1-08de894c9934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|7053199007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	S6GRT759JfU5V/4mrl8dFEO20CivI+qTrTxEeMhzKEZLexbre8Jmj1LQABDJIurkx5mzk/QZ3zYcE1dwXCk2ECt6dLim2CZYmWyKFpohgV31TcFuqXB8h3cBNYLeSMJS3ZmhgayjMn4krru6kffxv8H+8Ys1ny9+Tj3pGQ3V7WO0TfF/4nFQPwC03+WxoOjy81ynHSVXwvHyt/p7/gxd0OGAMf+wNgAnpk7XKuDolO3/jVjFUifZEB6wH2gTmTMZ/dNfsXGlc5/7SNB/wFrCkHicoIIdiKZCZ396eJXCVEsLIjtI/hLRHDrUuRwDXfsZJ9K/AVrJra8IKDpPoyhQiO5xBCuQEmsJ7KGgTvrhE6bNocIjjnFqvGuNGRTORlKRnLykF9zwv7TQ36FUOr1tzfT9/RJPeMogkFWQavTSFiLAx06nXDXZeOJD911n7JutmfbqTH1ScFkGuxH8u1WPV9sYhN5z+kNlorRaZaIx4A77UaZvkNOUPnkQ84a6wWmpIkoNTVkzfqhxGA1NuX51L89TMupGGT7mwLUuulDmIowYLC4XsTM2IQ4Ylq/PyyvT6ROmriLgtIo1J8fuTWW/2VrncYnb8CFuSU9j/mL/YEBMuz271cedOwu4UNkTqmivQwF/jp/dYpmrJfSU/blhBvLsct94FG9JTNpAGIXBCFzHxlqOqmkKouAAqJtQf4ZZMKAjxK4zvfV62P63cvCVm+zbDiTzxUeT1bF1TqVhOQcG1s9zwixNZEbvRIcuWEA4Jp/K+cRzDIE9IZwemN8wvxrTWDMIOv1UojGXwNIotoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjVCSitjR2Q4MEVPOHB2eGlia1ZKM2t2UnhCbUgzOFVTenVsQjJpb2ZUVWhJ?=
 =?utf-8?B?MzlhWGFTQzF2Y2wrQXB6aUNDM2Y1bmxqRmZ5c012NGFEdWhpaStZNGxSc2Fl?=
 =?utf-8?B?enlyV3BTQU1iZlZpTVYxK2E5U1crMmJZb2FwWTM0Yk5mVjkxSmV5eC9Gak1w?=
 =?utf-8?B?L0RUS0ltZXMxcUpkOHJPLzNXaDVWOGxKcHNkS09Pd2lscVEveW5SWEdab0pp?=
 =?utf-8?B?RTBLblJhTlFMMmJkQmhheVZkVVV6YWN6QTU0TXhPRW9mMDc3b2FGNGxGenc2?=
 =?utf-8?B?QjB6VUdxQ0Vreno0WmNLSkN6VVdPWHo2VVVTb2kzVHluRTgwRUt6cnVLRGts?=
 =?utf-8?B?cWk5MVA4dXhIamVPRzdhU2QrOUlPTkNDOUhybzIvU1puL080TzNPRmFiN2Z3?=
 =?utf-8?B?MUNiV3ZvOGI2Mlg2WXhEaWI0dHQ0amZRbm1hUjNvSHpMWi9jUHkvSGtiZldj?=
 =?utf-8?B?T2s0VjFUcWcrYlhyU21ra3h2VTFwRldETGRaZWdsL1FJb2V3NXd4QXdTM1ZB?=
 =?utf-8?B?N2lRTmt1S3dQSTNRWSs4a2RiZ0RQQ1Z0VWpocFlBTE1PRHlhYm9xdXpyTVU5?=
 =?utf-8?B?TEhwblR5UjdMcTFmZ2ZBRmQ5Wkpud3lMVGxyRG95TmRFdEY2c09POStRZDc4?=
 =?utf-8?B?aHJuQTg2cDdaRzdDemNWb3ZUWFNMbkpEbEd4Znh0VGRaZklWY2NiUWF6RlFx?=
 =?utf-8?B?MHdtTE14UGNqNnpLVmhSOFhsQkE3SmdaUUJEVnRyUHNNdjRiYlNjRU1oeGR3?=
 =?utf-8?B?TmhQREs0TnJ0ZHdkQ3pqZlE4MEMrWDVRN3FRWHBZTWtXZUJSa3Y2RkQyTURW?=
 =?utf-8?B?OHFhN1BLYUVKVXpQRk5QQXZQZUlVdEFwWlFwbFQzK1FvcU54WWZ1eWpwM09v?=
 =?utf-8?B?SFhpUEtRb2RTK0s0OFkxTmxYeDN6WmthVENpT2U1aE1sNTFWd3o0bldjbWRO?=
 =?utf-8?B?TTBTY21mQ0ovVHJsWXJCQnZVc1RkRmRBZGxFM0dRN2UvWFc4MTBid2ZEbGE2?=
 =?utf-8?B?c2dKNklBUkVaSU5hVlVPUEdwK3lhVnRjUHdHY1lZb1QvajVxcXMzdUMwTFlr?=
 =?utf-8?B?dGdEVm9VRzVtNmU3N3FGYWN0M3R2amU2NUg1eGFtNUdFMHJvcERZbWtPcjJy?=
 =?utf-8?B?cVZpMWxXLzVPRlE1MUlJTkdhVGZmMlZ5VjIvTlpIdnQ1Q0w1S2ZKUCs5aVBz?=
 =?utf-8?B?a3IralhpbzFOZGZ0b242TS9uRE5Dc0lMQWpzMEIwbVgyMWlnTnc4WHZyUS9C?=
 =?utf-8?B?RUNZa2YrQ0NDb21XcXNnMVgxNEpwbnR3U1R4SjR5RGM4L0FIU2tZMmNDZHZ3?=
 =?utf-8?B?bk9EKzJWcDBSaUNMVGRlcWVnVytFSWJMRStNc1d1ejBSMFF5Rjl6bGJoc2ZB?=
 =?utf-8?B?NDBYVTBXay9uVy9Jb1RjNGtDa2oyVlFmNFBzTzk4R0ZraFJIcHl3WHp6RzZO?=
 =?utf-8?B?RFphdi9KeHlwK2dlTVgyS2JvcGhvTDgxQ3o1clF6N0J5NWxMRnVxcUhGVUQ5?=
 =?utf-8?B?dVd4V0FVRUw3YVRlSE85V1dYVW5zYklGaVVNNFpzd0YxTmcwVEVSd1N2OG1H?=
 =?utf-8?B?c0d1NTdXTjJ0cmE0TWlSNHBxd1lWWUxFbWQ0SDQyTWpOcU1LdXB6TWFVcUJW?=
 =?utf-8?B?akNoRnpnS1h6ZDNDQTlpMkdRVEtrQUhFZWVsemFFaW90ekk5QmtuREh3OGNI?=
 =?utf-8?B?TzFieEIrYmozVlNZRml5Z29JWDNsV21zR3NSZCt2TnVURlRJQ0Rod0ZHVzVo?=
 =?utf-8?B?VXUxaitOZzM4SUZlNmJKb05ITXdabXF5M2FrVUZwdHRLUmsyVW5HSWRMN0dN?=
 =?utf-8?B?dXhvZXhBTi93dFMvSWZLMU1vUFkvYlFtcWU2SlhmSkdWSEJSV1VjRmhhODNp?=
 =?utf-8?B?dmxWN3hiL3lyZ0ZrV0J3R0c1OTU5R2xGYWJNaitMVXBwYkFvS3RUeEhFSmlq?=
 =?utf-8?B?a3V1RnJZdURvTWZmM1Arc3VvNWtiQ2g0TG9jR0ZES2hucXZ5UEFOR1oybzRt?=
 =?utf-8?B?NFFjdXkxVDcyd0tvRlFvOWNGd0E1ZEs1ZjM2NFhqZHhsRHhlQWJjVG9OMXV3?=
 =?utf-8?B?WHlBSEtTZm5WTnV1MFRUYTQ2T2svZG9udnYrNXRYTjBpR3R3dlVoQ2o2Z1lz?=
 =?utf-8?B?QVg5dGpFU2toUlJmQ1FGNE1JTm5ZR3N3anJvNC9lbWNBWFFlMWtZcmw2MGZG?=
 =?utf-8?B?TnN6SXdaK29iaHFUYi9ZcFBnUVNmUk5udHJZM3hTem9vN3ZRcG9LNlc2d2dH?=
 =?utf-8?B?RG5xODR0bXdjaUtHcVZLeWplRHNuSXNjL2VpL25acEovbDNkUjRpTit0MzhP?=
 =?utf-8?B?YytabWJFVE5FUDN4ejlBQ2xJKzFUK0xhYmFlbGJLUjI0N1g0L210dz09?=
X-Exchange-RoutingPolicyChecked:
	eBXteF0OX4Hh5UdxM9NQ181geFNHo0yX2BSrlJncQk2GiPH/m3zAWYcdqMqjKGUS89iZgOSCJ1N1xh7YD8T8ZpNGc/THlsWgQy1nRg34ApZqaV2wdhqRWDaOB7Wc0Y31hfkXACiHpCXjhakfe1BBIISsM6REiSWTAwSsPmER8Fj83dP80AYXVdAN7JvijpunIJLDlZ/QURGGD8c9KbEo6C0XSpEHvqXC9aeC4B/bf0G7F96NPKx/VPSUMgA4Ix5snmprEHU0sETGXPKwcydQVtvL4bEKwYk8e2WkEUjyESE2YrCBLw/bwVgh0TAU5Ib9Ksp0YIh/ecICFlsQTl44Jg==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c634b5-afe2-47f9-4bd1-08de894c9934
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 02:25:21.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIhveBGbYrerKvorJgMt2+UimTH2GSii3Sp/20oEjPzmCQ/3x3gnC36Ay4Es4Y/+YAxqiHbY/C5GdBqAcrTIwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
X-Authority-Analysis: v=2.4 cv=T5CBjvKQ c=1 sm=1 tr=0 ts=69c1f614 cx=c_pps
 a=77rI9ysV2qQyIatzbb/mKA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8
 a=XeHHJQA7KXFy9l5GLh0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jX34jFSl5sB50vGvKuK6gBaN6urcUrsK
X-Proofpoint-GUID: jX34jFSl5sB50vGvKuK6gBaN6urcUrsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxOCBTYWx0ZWRfX0nreqpuNFWA8
 FJRPKet6qVnZZrzKlC8ae9A8DfG6JnPWNiBEZG2j1zXoTy/igV7PKMmEExATvKHGwRiZxMqVplq
 KeJSORv+y4DiKS4152iNBnl5lON4du7YLrNxPH5a7NEbdEnZNGUBbpKv5oLy6A7V4Zke5grLuUD
 Q+lakUmWh3d6B/OA1zLxz3B/QARGgAzZgI5AyyWG4hzk2gWsFlvPxpKBJfdYLvPd9nKze8hMvwd
 F0QYo+fLYEFJVSqPjI6qtQB6RC+DUoh6/HczL4dtKS1jQcJh3AKdfYcxFlAVTGt3OP6D0h+YCp0
 bBTD8xJDuo+2id5obDH4AGVFh+Cub4o+3oF1qwAXZVza9Mz4jEa5F9pQ0aSsB3KjHIponJSUdB2
 sZHS3+2H/xSVpDHsEwdkhbugldm7jYVetdomQzJMApKrSuP53Rb8ramHb+VrKsgByplExtz+jYs
 RXd/iQCqrRekddkmnpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240018

This addresses a use-after-free bug when a raw bundle is disconnected
but its chardev is still opened by an application. When the application
releases the cdev, it causes the following panic when init on free is
enabled (CONFIG_INIT_ON_FREE_DEFAULT_ON=y):

        refcount_t: underflow; use-after-free.
        WARNING: CPU: 0 PID: 139 at lib/refcount.c:28 refcount_warn_saturate+0xd0/0x130
         ...
        Call Trace:
         <TASK>
         cdev_put+0x18/0x30
         __fput+0x255/0x2a0
         __x64_sys_close+0x3d/0x80
         do_syscall_64+0xa4/0x290
         entry_SYSCALL_64_after_hwframe+0x77/0x7f

The cdev is contained in the "gb_raw" structure, which is freed in the
disconnect operation. When the cdev is released at a later time,
cdev_put gets an address that points to freed memory.

To fix this use-after-free, convert the struct device from a pointer to
being embedded, that makes the lifetime of the cdev and of this device
the same. Then, use cdev_device_add, which guarantees that the device
won't be released until all references to the cdev have been released.
Finally, delegate the freeing of the structure to the device release
function, instead of freeing immediately in the disconnect callback.

Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
Changes in v3:
  - move assignment of raw->dev.parent
  - add Reviewed-By: Johan Hovold

Changes in v2:
  - trim down trace in commit message to keep only the essential part
  - rework error paths in probe function to ensure device is always freed
    (set device release callback before any call to put_device)
  - move ida_free to release callback

 drivers/staging/greybus/raw.c | 67 +++++++++++++++++------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739..e668438e1a2 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -21,9 +21,8 @@ struct gb_raw {
 	struct list_head list;
 	int list_data;
 	struct mutex list_lock;
-	dev_t dev;
 	struct cdev cdev;
-	struct device *device;
+	struct device dev;
 };
 
 struct raw_data {
@@ -148,6 +147,15 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 	return retval;
 }
 
+static void raw_dev_release(struct device *dev)
+{
+	struct gb_raw *raw = container_of(dev, struct gb_raw, dev);
+
+	ida_free(&minors, MINOR(raw->dev.devt));
+
+	kfree(raw);
+}
+
 static int gb_raw_probe(struct gb_bundle *bundle,
 			const struct greybus_bundle_id *id)
 {
@@ -164,15 +172,30 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 	if (cport_desc->protocol_id != GREYBUS_PROTOCOL_RAW)
 		return -ENODEV;
 
+	minor = ida_alloc(&minors, GFP_KERNEL);
+	if (minor < 0)
+		return minor;
+
 	raw = kzalloc(sizeof(*raw), GFP_KERNEL);
-	if (!raw)
+	if (!raw) {
+		ida_free(&minors, minor);
 		return -ENOMEM;
+	}
+
+	device_initialize(&raw->dev);
+	raw->dev.devt = MKDEV(raw_major, minor);
+	raw->dev.class = &raw_class;
+	raw->dev.parent = &bundle->dev;
+	raw->dev.release = raw_dev_release;
+	retval = dev_set_name(&raw->dev, "gb!raw%d", minor);
+	if (retval)
+		goto error_put_device;
 
 	connection = gb_connection_create(bundle, le16_to_cpu(cport_desc->id),
 					  gb_raw_request_handler);
 	if (IS_ERR(connection)) {
 		retval = PTR_ERR(connection);
-		goto error_free;
+		goto error_put_device;
 	}
 
 	INIT_LIST_HEAD(&raw->list);
@@ -181,46 +204,26 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 	raw->connection = connection;
 	greybus_set_drvdata(bundle, raw);
 
-	minor = ida_alloc(&minors, GFP_KERNEL);
-	if (minor < 0) {
-		retval = minor;
-		goto error_connection_destroy;
-	}
-
-	raw->dev = MKDEV(raw_major, minor);
 	cdev_init(&raw->cdev, &raw_fops);
 
 	retval = gb_connection_enable(connection);
 	if (retval)
-		goto error_remove_ida;
+		goto error_connection_destroy;
 
-	retval = cdev_add(&raw->cdev, raw->dev, 1);
+	retval = cdev_device_add(&raw->cdev, &raw->dev);
 	if (retval)
 		goto error_connection_disable;
 
-	raw->device = device_create(&raw_class, &connection->bundle->dev,
-				    raw->dev, raw, "gb!raw%d", minor);
-	if (IS_ERR(raw->device)) {
-		retval = PTR_ERR(raw->device);
-		goto error_del_cdev;
-	}
-
 	return 0;
 
-error_del_cdev:
-	cdev_del(&raw->cdev);
-
 error_connection_disable:
 	gb_connection_disable(connection);
 
-error_remove_ida:
-	ida_free(&minors, minor);
-
 error_connection_destroy:
 	gb_connection_destroy(connection);
 
-error_free:
-	kfree(raw);
+error_put_device:
+	put_device(&raw->dev);
 	return retval;
 }
 
@@ -231,11 +234,8 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *raw_data;
 	struct raw_data *temp;
 
-	// FIXME - handle removing a connection when the char device node is open.
-	device_destroy(&raw_class, raw->dev);
-	cdev_del(&raw->cdev);
+	cdev_device_del(&raw->cdev, &raw->dev);
 	gb_connection_disable(connection);
-	ida_free(&minors, MINOR(raw->dev));
 	gb_connection_destroy(connection);
 
 	mutex_lock(&raw->list_lock);
@@ -244,8 +244,7 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 		kfree(raw_data);
 	}
 	mutex_unlock(&raw->list_lock);
-
-	kfree(raw);
+	put_device(&raw->dev);
 }
 
 /*
-- 
2.52.0

