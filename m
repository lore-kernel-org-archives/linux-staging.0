Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B72C2374;
	Tue, 24 Mar 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360883; cv=fail; b=noA7JAFPm5FGiiNOp5mqWz1uEad8B/jWUpkdIdVZg8dEnWU3WAMf5RVLhrOmc/0gr332AclpN7dBcnNxAu1mgOOZekT3kfNVU0vvxgJzuQCVXGf5bKDY5EK4a6rqQ57cs6Krdzf+zCf0fBS+redq51AcoPL6yOLeSMGFEQCNBk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360883; c=relaxed/simple;
	bh=6y60LapmtCJ2H1Uu439n1pUeBftI/bzQAcS6cVhSQK4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LIRP9SV5X5Z7LXHJx0fxLV0K58ymyz3oCY2CgzUuI1x90gHlBpxC/KhKv80LDrY1YLBnEhYUMDdwJpRcx8Fg6WVyxx456VlHpXsXwSDu3sCwjRDtWT4rI4k15CJDh0m9HcxH6zeHGImj56XmG1VwqzpFeAkdnMBUAKQNq6xJJHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=g3pOnOkG; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=IMSd39vr; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="g3pOnOkG";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="IMSd39vr"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7ZFwh1409221;
	Tue, 24 Mar 2026 09:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=BVOW1Pnmsu1/zE95y6SJ
	OIPoc+I1/Co14ZfbBeaKnB0=; b=g3pOnOkGSXtSYneqVbNGVHzysUlyuqsPMCvJ
	uDgKnR/WGg5Aj17ySDcVfLsXaRD56HPv1ZGbIk0lcapzqV3mLQQRv7EWvejLosrl
	yWDywm1MZuVCkPlMSCkQxAoytFt3RdwHshH6yhmZuSHa2BEP3wesnYPUBPXfu8J5
	ohSliqAW2ka248nQ9uBNDu0oMJ45I9XjilayhWG0tg4zEcgPKAdOKZ/GT3167GHn
	D+mgodJOBm7mq2lIL+rzSnBkTQivo76IJfj+v1poMv1Z1gdUHju6KC8vJ7e5Rf0t
	29aVQiceAMOBrK1cVJWpd+PCe3qzh4lpBGRCKtpGq73xk4skmA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023105.outbound.protection.outlook.com [40.107.201.105])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4d1qn5dxka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 09:00:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Svh1q3nB+hK8nYVmIzu8kC/a4UrRNoLuJNLSKTEBySOy8I8F/TB21Je5LbG3T+EOImMogAFNNQrxhKSx4vP+5iIwk5DNwMX4aDA78xXsBNL/C6HqERJfxieXGr8PnqbYImjNkP9a/B/swvRK/hFgg//12AbLbqf5O87GAg8SLDGI2hVMrC2LH+yEmgJ0DGHRQsRUuWP6IRzJuwiguGsJst3+LccLvoyHpfe1ZaRh3dQq0FZyFg0ivPhcjwnkEbGsYwwG63xjoPDGaIDcys4fkpTZu8z3AsIDPInAV7R7ZWdHIuZdkUSSueOenUcxye0uGfXexP9rc7GqOvDv5rKwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVOW1Pnmsu1/zE95y6SJOIPoc+I1/Co14ZfbBeaKnB0=;
 b=LaYVXo8GB8uGCHwFBfERfJSHOu7ug5i0mGB7qQ9tsNs77gkmuuS45doeAGKAxC/By2dwjA1WdaD9sJiA1FzJWa1+WG2bHBPnY2jO89whvAoYT36T8B1nLKYvF20VPwKo5dchShk2dLoT76VKwwYeN5dHql5pb48lo65gxa2D5b7gnt6ZNVLTQUZut7gBQg0exz2dh3jL6JSETveh1CrvAHX1HJEazCagCZqS+E2bO0IS2WFUgL2+wqa+eNWjOji+MmLzSOh4SPfOrZHcxa6gIYbhp9VAn705nhPvWGN5DQ01PnFKSxU7N6ZjwNxdfrAkDlZ+aZ2r8eJRnwh4Ykda4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVOW1Pnmsu1/zE95y6SJOIPoc+I1/Co14ZfbBeaKnB0=;
 b=IMSd39vrXq/AAwJ91LdtF76jfzSbhbNT5DcHRwoZ+/RwLph1buUhxOETbSq1Tl8vnCwM91LxliQ4SbM9SdG0hyqNPzZ91RCPmSZGYceg0dhTitdACKWBmK7NRDjjQ9U5HdfWRC8mXBZg+xuwmObxno/ALzFoWsOZsdQAKsbXR10=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:00:50 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:00:49 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [PATCH v4 1/2] greybus: raw: fix use-after-free on cdev close
Date: Tue, 24 Mar 2026 10:00:38 -0400
Message-ID: <20260324140039.40001-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::16) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: d8150ed0-c681-43f4-867a-08de89adc0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	scDXDIY/+v74xhwteukzH6jMnyBAMpnJqnMgGrdvWxJ/4SP2xiEbsQQhxTbypwxW+VE1UCy3oVQ5HO8pe1twv/xJrkiqSYnQOUN/nUqn4aXKCsS21QFF2s6scXU8Go8aDfBVa5fRRXOds6dsHEdCNRME6m8wijZ5OX1Xs66qX03SjlmOSDu7ccIwNYxSZQiJh1TRGMeZqE7MafaPoLZbPaw9VOapSneO2SazQ4l7V28aEoUyPM5+2YDWuRAoBlmyDHFv10tBoNJOfIKXVSAHcEtxDqgyk7lLOTgpBuzfu+tdVqjmpRoTfq29Wkl6UN/rKBQRkcwvjSjWqAdnu+IiY136Fju/VD87nvhSKMplUzxlsjEGUlrAKem6MI5hjFUHb69Bl5Nveb5dZG5VN0jMHg4DdvY9ufG16hjpxjBlQftsVJk/ejdaEwyyeQ1O75aaln6RHOrrB056Xh6HgAV4hyCcoDipnJ8AasKsbDcy0vAYPFhi1lGzv/CvWKrDWlC19L+buqUSffmgXRhsk5EgxD/o6rzQTDtBPqlq+M9fbfddmrPNyowtH7MZ2VZ7bHyHKSgteMBapd8aqdeHjP1LZlht7R68FzQvGK3wLe/0VJf++F79KpHAm5t8jqR656OvGmrVuPNfd2z6Ms4pqc4lRrNRSFusf9Pjvz3qyVJgwNZFFHBBLo6U+uQvR4wGZwYaYoCfYJlyq3rn+OciRldvPAByxBVFml3H87UxdJPy0x76k3aKjyzjjacfcfsi0gSXzAcZZTlPhAH8khSnFltd/gMTRaUrz4ik0Y21tR8Ln+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGpxc3hEY3JBNHVnSmxESUEyMXphSzJ2eWwzdVNFWEloWG0xS2wzcWRVOVJt?=
 =?utf-8?B?dVhmTVZRRjlxc1hFMnpSSC96aXdqT2ozNmVHWS9EWG9sMmRTaU5XRmxkcnVK?=
 =?utf-8?B?ajkxaWI4K3lPakRkV2l6Zi9WVHNtQSszbGlQVk1sdEYxOS93RTZoUG00ZXQv?=
 =?utf-8?B?Q1lUaVR3aHpsZEFXbHhSMU9GRWRMQVdDRnVvZ1ZsSHVndE5OdElaN2xYNytw?=
 =?utf-8?B?Vi9zYTNvQngzR1M0YWNTTnU3TkFJbm9FWU5WT2IvbzhCOFRMRGwrMDRUUjNp?=
 =?utf-8?B?bGE1b1VnNmVPeXF4K1RHamJPSFBaMGtVcTFEc3B0akRrdHJpY2x2YUduSzJt?=
 =?utf-8?B?Q2lVL2hWblZEY1BvZVMrYklkQm5Handxd01qZXNuVDFPbkZqZUh5QTJHU0tF?=
 =?utf-8?B?a0d0K3pacHArNFdiLzJZU2NBaDZHaW5CWWs2eXJUUEE5N2F3dS9IVDRMSFY5?=
 =?utf-8?B?NWRDa3NhQjNuVjFrVXdyZ2dmMG0zd2x2Skx0QnRwNlF6VEdsMHh6WDJNd2Rn?=
 =?utf-8?B?aERhTUZnT2lqRW4ycFFTZFR3ZVRxVnJjNXBYK3NPOEpZanNLZmQ2OFhocjhV?=
 =?utf-8?B?OHZHT3pQYWhKRlNWaFNxRm5wNGdhaU5hYjd5OG9SeHhNSjM2VjFUakZOL1l3?=
 =?utf-8?B?T3ZWOE1qUnRtTlJQYmJpN2RSWjJVWXdlY01NNlRiQmhWSVI4OVBWMDJvSi95?=
 =?utf-8?B?azc2OEJjd0NYbXBDZUlUdlptYnlIY1RYcWU5V1pDc2JCOGFnMGtubk9pa0FD?=
 =?utf-8?B?VDE4RFdML1RVYUw0MDBrZFhCcWw4UHhDMlhMd2NhR1liYUJhMDMwR3Bvc1Bi?=
 =?utf-8?B?V3pQdCtzSEZqcVhzQXUwNWUxSXVEZkJ3d2c1Rld6V0w5VUt0REJPUkZhcVgx?=
 =?utf-8?B?T1UvOFlYYk1UOXFTRU41elovLzE2ODZPS21kcTgzeHNxWG8yd2IrVWo3TWJW?=
 =?utf-8?B?djlhUk8wU2dCeWhPRlNROHNNMDlSRjVOUXBsd0xOY3I5V1lpZVNjWFpMUWlM?=
 =?utf-8?B?QTJTQmNOeDVVNkVkRE9PVUdIdk8xYmtySFF4WVVkV3dlUFVvNDcxT2xQOURJ?=
 =?utf-8?B?bk56ZFFuY3ZWekduU0I4eXhUVWJKL1I3QUh1VUhNNUxZeFNmZ2hnTDF2Mnc0?=
 =?utf-8?B?ellMRGNzVEEyVXBxb1dMQlB5SHhBU2s3M2RDM0N1RnlVeGxCQ2JJMGoxby9N?=
 =?utf-8?B?MW1mY1FoL3ZuOFVHYnR3WVFGdUJjQTNVUk4wSlhUQTZEeks3d1FvT2tySmVa?=
 =?utf-8?B?N0IyTTQraGRiUmYzNTJsK08rK2c2U05yMGlicUJBb0NtNG9hNzdhMUY3RkhT?=
 =?utf-8?B?eFhEa3F6SEhZLzhZZTJYdTlMaUZQZGV4WGdSZVpXbDRza2x5eFVnNzNQZVFC?=
 =?utf-8?B?Y0FxVmtSeWdmMG1Nd2pRZjBXY0lKZWh4ZGRSVEZPRTBxbFUwMWp5Tmt4aW1H?=
 =?utf-8?B?TFZ5c1JWdjVhZFJTRUpvUjh3dHprUmllU3FwcnpLeUk5UDZ0U1VWcXBLZklB?=
 =?utf-8?B?L1NDK1pqVHJseDFNSEdBQzNtYWZIeWY0bDlrc3RzRmQ2Qk5kYzVNaVZVblZi?=
 =?utf-8?B?WERsMXdLaTE2eUdZc2VRaW5USE1KSndJSWwxQ0FuK0pNRUw1eXN4Wk0wNmlR?=
 =?utf-8?B?bmhEbEhCaGFpREtvRlM3SEtnRi84YTltNWNmNnpnVXNLb3g0dzhyTnhFNkNy?=
 =?utf-8?B?U1Z4Y0RUVHhoSjRxNFhFUUV5QVpIYnRGYnZkMzBrT2YyeHgxTW1tdjg2NTlu?=
 =?utf-8?B?M0lIL083NUcxYU1oTlhTYSszY3JtWXVJbWVHLzVjQkYydCtDM3JzMDFoUCtE?=
 =?utf-8?B?b1RTaVNDZFJXN2hXa1RSR3ZnSjRhYTFSRUhRbk9OMVFGMlN1VXVFQ0ZqWHZu?=
 =?utf-8?B?bGNEU0tnZSt0WWdaeHhqOWtRYTRwYUtVTElHZnNVek9KOU5IQzNTdXhhT1Fx?=
 =?utf-8?B?cEMycExaRHpEL29aWXhjMi9lUi93L2trVkVxZndvZlVYVlhLUjA5elczSnhM?=
 =?utf-8?B?TjZMTmc1V3k3TFEweVYxSThmbXpSNTVFcnhVaE5qL1hKWURGQTJzUzQxbDhh?=
 =?utf-8?B?SkV0c0lUM2hIZ3B3NUQ5YVpSSEVtdHRGWkR4TnQyb1VwakdDQkFDYlNMZG1S?=
 =?utf-8?B?VTIrUEdqNEgwWis2Z3dzWis0TGNSV1E5cXhHWk96OU5HY21EUGhYOWdNU1VU?=
 =?utf-8?B?cy9UQit5MWhIZnh2aFF5bFRwTE85TGl0c3FvenFKMmg1YnhUai93WlVLYVJD?=
 =?utf-8?B?SGJXK1QyK0FrcW1NMnFOZ25XVnMwdHROdGZJSGkxcm5MeTE3NzVjMGliVzBr?=
 =?utf-8?B?N0YvV2NQbGhmS3kwK292bUN1TGdNRStBL0hZYnVTNExEZTdrM1FJdz09?=
X-Exchange-RoutingPolicyChecked:
	WX5c9h2sNpUc6HqktuZC5esfFW9T4Qb7lPmKd4JxRfKCLan9NF8R3vr9bm6498cTnkzUrX6GbhfUib2sguVsvLBMJlbEe6rFL1S3OcWvxKLLOgaI0vbyCektJFJedn9cfPIOATx/Re/VLClZXoD2Tae74zGTnl9t6RaTAyzPqCdegr8Y0G0qFtY/axy3DK+Kg22vZeQsxFHBMKHkHASb1JtvxMjptQM4cHJ7zDQk8vIqrAvrlDAby8X9Zaaf4hmSNMh/00saJnIdjZENSBnQsFera92lJ57Q5FN5eFVO4h1rz7Q2FWqX9oAKLbkdGflQQYF989zgniJNlyrXBOPZTA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8150ed0-c681-43f4-867a-08de89adc0bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:00:49.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MgQeqZTOwg1hNUr3UMvrz5w6jhr3lnXZp+ftzqWh3JbqvlHUU377EiLxqYYubi9E0EdfsFTJo2AThDZhxTbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-Authority-Analysis: v=2.4 cv=T5CBjvKQ c=1 sm=1 tr=0 ts=69c29915 cx=c_pps
 a=mXWPUgXNGD4LDRIkHGcDmw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8
 a=XeHHJQA7KXFy9l5GLh0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: aap54gkHInHtneiCvfaBYqORs5RzkkeV
X-Proofpoint-GUID: aap54gkHInHtneiCvfaBYqORs5RzkkeV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMCBTYWx0ZWRfX8MkCaCL9U/U0
 CcvGCoIHeApn6P8/tb2bmeleUOskvPhlT2Sw26CcJG9FUtiJqTBDwJh9ojceEHfkiM9gjpFE7Py
 15F9lmIUrzw4o8+XKuy2RQkrp3N1deOgW5P8oPnWs/gUpsIuF5ZjMaDSxfQGy3jSGnBuziiMBt6
 0ILoHxH7auSh5om4tlBWjRY4fw98lMzbH7IS2MDYn9bh4QJTfKkCB079A4Zw4Ol8UfDEtv1dDmm
 Tk/xXiijQuCcQHCDTqW8PyciSyAZvFdQ3JPxwXlZx9DqeqoXPznRVgIf/0HKze/nyNYdnjSAlAG
 5xJdNnN/zqUnqL8NYxTXEfgQnEXAnc8oa8Zo6AzC5WwwinxP30o+pZSQcnMlhM9YWnTZ5r6LNmA
 qodnQ+dY7d7XV2z5Ae2yPNjftAaH1evuHufUYooWxpNpoOzWpHIrfNjfhmme/k7lUm999fvvJjt
 YTNjWei30tgg1RSDMyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240110

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
Changes in v4:
  - rebase on v7.0-rc4 -> change kzalloc into kzalloc_obj

Changes in v3:
  - move assignment of raw->dev.parent
  - add Reviewed-By: Johan Hovold

Changes in v2:
  - trim down trace in commit message to keep only the essential part
  - rework error paths in probe function to ensure device is always freed
    (set device release callback before any call to put_device)
  - move ida_free to release callback

 drivers/staging/greybus/raw.c | 69 +++++++++++++++++------------------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 3027a2c25bcd..47a984554681 100644
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
 
-	raw = kzalloc_obj(*raw);
-	if (!raw)
+	minor = ida_alloc(&minors, GFP_KERNEL);
+	if (minor < 0)
+		return minor;
+
+	raw = kzalloc_obj(*raw, GFP_KERNEL);
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

