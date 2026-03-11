Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE7033AD9A;
	Wed, 11 Mar 2026 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265082; cv=fail; b=c6tVydJHbPu1BbfQf8vqZxeNah8sPe5p96wk/xvE8uQxMM/V/S6+E6iz5X7r0bklL4Wcr67aYZrX9NVoWX+h/0sD/kTp2/nGjdSBAHlPpiEzmP7PGVtPoMbsGHQI2DNOqvKHHX0pCDG9HtlsLGMCBCCAALpHER23UdNdZR2gMfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265082; c=relaxed/simple;
	bh=MN0/ZkVDNs5NaOOp09mq5AcYJNZf75vvZrZbitZDTSc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gXvW6ABSA8HFsv+G03ZqdUZ1TZH1DpeRVX9QCiogmZw/x2bwOg14hLKYubAYA+ftXh5hcqW3IphIsJOerUjAh69X0d22H/h4/zOFWGQBG/UFmWj9UKu64rtCmTar1s3JeQgRVuB7LtARW+004GQ92Qye+fwckUbaSmk2sd8PBQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=k4Cj6A8J; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=YAeimABT; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="k4Cj6A8J";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="YAeimABT"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BJG3VV1211720;
	Wed, 11 Mar 2026 16:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=2rgXVFDgbpU5QS4vt9dc
	4lNzhUYUrl5NQmXHBdtEtK4=; b=k4Cj6A8JiolXtuFXkoMdg/5F3fcpJuHp5Mhy
	eta+kHlrmDLaIrLg4h+kpGFYZsEF0SiYHRhFFVVewfikgoG6AgXg3a7EGMhU9moK
	gUEZ5lgU3X+uPlyNFfaDNfbmrqRHoKMqDUMuiiNLtUv3YntiUOAgNT8+JNDxSwPa
	S0BAUZVktPSblsPn7aA5DiCar2m4h7ehsSg66ujO/8tEGhuuA1PrQJHLg6ouLFGO
	LW30r4Pt1wK1BrDjmaa0qCM9sNs2WuxqfV5Mw6jD5UZdi8hPUsh05Vv6WyjxW3Yc
	ZXA6eM8YUBlnILaburU4AeefLHosWbEpsoTkn6v9wlawmm0BtQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023079.outbound.protection.outlook.com [40.107.201.79])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4crh7c2015-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 16:25:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz+UbT/fd0CkqybTt0nZ5LEXtIjdE64dBWHxKROveWQx88FFiJ8+CyUgN+vvGaN+AN5X2vbmY87du9fSD1uu+lb+FIK+rPj19+ixR+a9e/xZZjt7MPIfyIRrczRs5nkzhpxh4YHxns0kSOYQ2yqu9OPEPWndisYESgxOfaMAhfffagNDqrgoh02JcVUKgLsmFtYdyVtJ7J0y4n7TjrHhwybjY20AeTx+nZSCCrx7/+eNJfNb/4EL8806dU73wVz8bjJuv988P67e2f6BbbpkoKsg1yea+jA0Jdxe2JjAhFqgaXcX0Cy+k37JQ6RA96TGRQWIT5luVJDobYRz8VwkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rgXVFDgbpU5QS4vt9dc4lNzhUYUrl5NQmXHBdtEtK4=;
 b=i/ziVNJnlLZquKRNVm0htFa62pU/g/1HrPAHjgItyqUdounttpjga/A2gWalGvzerw2EpIZBKBaXMK5Rq+ywFVBRJB+D+hjHhHbUmKhZyckNDozj2XRuZuKn8Ke4mabVdJKhMTfo6BpkR+D3kUQbPEsW+UGLigY1sigenYNXFEHVt05qhY9Ix7wUnJ5TmbSmukmkx3Gzwx0+2DjA72qOyiHT+eNu3PtP6rDOMpuoRJB1vocjf0CTJnJVLJCzA4s1iXbhivk/6wQL7E02FdNCRNbXOoaLkrQRgTC0eaQlgV95NONzLY9Dc9DHqUsziy++R9oH8LiDjDPJPM1FajXxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rgXVFDgbpU5QS4vt9dc4lNzhUYUrl5NQmXHBdtEtK4=;
 b=YAeimABTLTurVoZ8ePz1lUItwNCNP4jsvRpt2AmMIaiuHceXw21AZWSOFLkJG0M+GgasSywGY2SqohD3Y2yO13sXpi7Xbf78l6dRIGLQRsoPmXT5MXBiYS16ASgO54+7L2xWCUkXiMIOZQfcvmpYzV2wDmlwXpSwrnWoCNOWKEo=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 21:25:22 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 21:25:22 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        greybus-dev@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [PATCH 1/2 RESEND] greybus: raw: fix use-after-free on cdev close
Date: Wed, 11 Mar 2026 17:25:10 -0400
Message-ID: <20260311212511.82563-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0261.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::28) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5066b7-bd8b-434e-427a-08de7fb4b3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eSTzX1TBIA9wbjF1Tj+DA421bFcp9kFuuCsqHkCS0MBfFbmYRjNoyHz6bKPNC4Tjh9x833HyecfGuGi1uvoShUfeHtP4TKGIUNSRI7cdPBZU7sF7k87HJW6QmPKBwgH0pMMoZryyjQGz1TWpGyDCGAkdHsCPb+d6c2AVMfBnhAkbj4JmapquwMPNtUdmBE37gSVeXqoYsJSTYn73wW4+0EVt5VEo/A+hnx5rjN6vzIT32RV0oqSQL0Jav0G9H56Q+0/IVixMWxYKfn1XXGDBqOEQ9hf815CnRrrcrVnvb5EXmLogeDm9NHQdTRL+9hW22/oemSols0FQWklrhtTcs73AVh5/NHRg2IxAxBh4+paKuiSQgHBKFmUDmc18qqz2RcUsZhNW5fN4ZibzQMhTmHQ7cs5IaI5bNXImQFte1HFxMMcbjGwrb4T5WULjwPsTQq/8RLixeM0mv02ojcgZ0uq5x0NZ7J1jSDJVn3u9W1eqhZfK33U+CFb8xrCPNNo1lmrhCXoa6bYZ1VyV8TfoQosumd9DYelOl4LuDP2QFPXL06eXOGg7hd6HjOC86HvC3kvUbczqQZzy50Cv0H/S8nYZkhouHR0c2esDxu/ME6pR3AEs2Wb9UIguM0fUV/z58CosA+ZxlwZsNaj/gfxden4LMe4+ZlWBq0KZMP6emUGN/o3g0rD6m9KzeOsEAyEvGRDd+7Lq7cWicWDZe+9HlLmj/ERXW9X0oHLA5kHmMS5QYALTcTmF9nlPquWE6Evq9QNH3LpS4T7pU4OCIZ1SZuuwN5c7GDEDSjtCpbf+yZ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkhQcmd2VmdTdHNmaXhSdS9kM0FXaVphRzV1Q3pvbklkNk9LR1B0Q2lpRVAw?=
 =?utf-8?B?dXgrTnBDYUN1SVdHMnBGU2NMakMvU3ZQU1lSWjZveXZWMnBDK3pIbWFNN2h0?=
 =?utf-8?B?OUFiRGYrczd4WkpCTTlTaEVxbU9UVlhJS2l6SUcyNi9MZDJWL1BhTjdjTkdn?=
 =?utf-8?B?WWhDSUdCRWRxc1FXb1JxaUE3NkRwT1ZPcnkvSzhWeU01dFY0dUFzZGJNT2hz?=
 =?utf-8?B?cVlEK3ZNZkwva1I5cFN3MGo0MVVNU2VKTi8rVDhmM2ZMdjdUNGxEaURZRVRG?=
 =?utf-8?B?VU9pMUphV1ZGZGFlM2lZeW9GNk55dWVHbDIrOFBSUkJOdi9xRHZRUG1BbjBj?=
 =?utf-8?B?RGJGblYzajdDL2hDQmZpVGFJK3hSbHh5aEplem55SWtJVk8xSjhhMW4wajRs?=
 =?utf-8?B?d0tibFdtNFQ1enVzMlAvMWx3clVSMWN0UUlmZ3N4K202dU1QK2RhNjRPN3RW?=
 =?utf-8?B?WlVFa0NLYXdPQm8rMjZ2SkhhbVdHTE8vRUJwSlpuZS9KTHZtYU9BSWN0bGc5?=
 =?utf-8?B?VS8veUlLMEpnK0dYUjdubDAxN0M1YTZkQkk3Syt0ODAwdzlrcFpwdERIMkxs?=
 =?utf-8?B?R2pEVzR1TWpmdUl5VldUeVNtM05KRitKZm1tMEhHd01UR0NHbUtxZ3pzbWNZ?=
 =?utf-8?B?YjBMTG1raWFtTUJnUTNKc2srY2E4RnYzaTNUZW5DbFpCV29Na0huSFZYK1Rj?=
 =?utf-8?B?NGQ5TDBmMWozRXlvYUdUNnVlNi9NVTcxZ2ZmQ1hLekZ0MmRQWm55cFlLWXNY?=
 =?utf-8?B?alpXaGF3WGttZjVzekN1Yi94c3p3RGVQTTZTTUlDOG9mcjZiRDAvUlRINUdI?=
 =?utf-8?B?M1lHenE2M2xNaUJXVStIcDViOTVSdEM1QWtnb2FMa012SWwvMFNzald4KzBq?=
 =?utf-8?B?Um5PRnRNb0llTWhCRUsxeWlzR2tMQ0lETnhPNGtlbys3QW1yY2lyeVNrUHJM?=
 =?utf-8?B?cm1Ud2FaRnk2RjRzM205MFVKNVlyeVhHSWl4UzNNZDVOM20zTlEvTStaN05x?=
 =?utf-8?B?RXBqME04RGtxNEovb1ZCMmNlRjc1cFJ5Q0RPQzVHRjFvWXh3NTU3S0hrWGFH?=
 =?utf-8?B?eG5yZ2R2a0NqZW9DM2F5K093eGxwdnBvTG9HWCsyUkJSYmo4cCtVK2hRaWkx?=
 =?utf-8?B?R1NEZlRrektYNkNJUXJxVk5uekxXOE1LKy9rdUNkVTlqTkQ3YUhkTTE0YzNK?=
 =?utf-8?B?ZWhZbHFaVit6M3Z6bzdMRng5R0FRNzJ4VHh3U1F1blBSMHhSdWF1RGRZc1Zu?=
 =?utf-8?B?eExtUlcySVMzcTJJY25zb05OeitTTDZDZ1p2bDZZaXUwVVoxQno5SHVmTG5U?=
 =?utf-8?B?T212OGM2YlVMb3VVRzlwVlZhZ29ETXNCUC95eDZLS04yek05QzBleWZPd1lo?=
 =?utf-8?B?cit6dGtzcHlZVGE5cC9KaURlYnAvaldzcTVOOU9HNCtmVE5yaTR6dVpLNWlX?=
 =?utf-8?B?cXcxZGYvWHMwV0FtdmJ0R21QcVBWNHRzOTZUeERhMFR4TW1hS1JscUZrd0tJ?=
 =?utf-8?B?NENJdXo0eW5yQWltNVVhVzFoaGNPS1Nkc2ZkS1VuK3NNWHFPbEY4MTZWWDlV?=
 =?utf-8?B?Q0VoeTZRUWR0dFNxV05vNUtST0hLdmNnWlBpM21JK1VzQTZyaGhmeGNHKy9t?=
 =?utf-8?B?SkZycWIzRWJCelVDWUJxY0tvTnFOMXd1VktvbFp5Z2xGZStpTm56OUk0V0lB?=
 =?utf-8?B?NVAxdTZ5SjFrNHNmaEVvQmFQMjVuUGFEcWJ4WTBGaEJlK293VUtqR3pWMjJp?=
 =?utf-8?B?ZEUvS25OV01LS3FzWFNFekZQVG0wS3QyVmY0UFd1REpGcnE4SnpCSkV2QStD?=
 =?utf-8?B?Mm1BQmI3bGhXV3JIN1BWYTFHalR1ajNpNEpJM3BmS0hnR1VxcG1QVW80NmdO?=
 =?utf-8?B?LzA0QnFPRldXb1ppdEYvMXdyOTFwdVpzNU9QNStaY0Zuanl2MXk4T0JTU1pR?=
 =?utf-8?B?b2lKK2llbzB0TUxTb0Fkdkp0dmVuNzIxdXVRY01LeEhCUWZKWi9VUSttck1v?=
 =?utf-8?B?RWhPbjNFdFBUS2tlZHBSS1JtUm9NRXd6cE5JWnduRld3aXpjMklwLzZnVkll?=
 =?utf-8?B?dUozYVBqWFFDaVJJcUtTQm41UU5UMUhzakRyZENCdlN6ZHY3QkxSREtkYjBt?=
 =?utf-8?B?NnozeUZLUDNvaVdRY2VpcExwZ2FYRFBacTJzUXBNZlpDWVEvRmU5dkRsZHlP?=
 =?utf-8?B?WjNKMkdTZzNQcGtNVkhLWjlRRXhOcHd4RnQ4OXBGaFFEOTk4b1orWEp0VDEw?=
 =?utf-8?B?VUY2MHQ2UUdlejJDWnJIQmY3dlR0WXNLajc0ZkZrVkZYdldGTjZ2OXlXZDBP?=
 =?utf-8?B?QmlUUkFwT0ZObjRRZzhOMGlhSHdQYU5vejd0SnhvNmFDMC9kbGZxZz09?=
X-Exchange-RoutingPolicyChecked:
	vkyD53DVy5sjz565FxCx34c9z2cckbc4IUGM1SVSHNIU/KGrg73Df6Lj40Mps/TsYlKpcq0eeTjyzsC5bHuV37lNiMbrlCnTZcTkSCR+HqGNTy8SpJQKkUmA3oUB8lz/sa/F5eH6iqXx/xLhxyF3Gws/Gux8WgZh2GtCtmYipOfp/rzfJy352tfHp9a6otkp1bz4oEG4JRYqCGVmRG3zP6JIvJrl900O78ZjNTvbtBDinQDtHFTlh/bcbpoM1rDf06kppj8rDDEajzeqdLrgC47ElSLefj95c4pNp1RorXv4hH8TDz3IKEK+hLJNfgYM5Jd+N1Fb1Dbt+vEPhOWvPA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5066b7-bd8b-434e-427a-08de7fb4b3e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 21:25:22.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXVtaWYp3IlFn1afKIjwpHHn4S6fBSfpx4Wkk0FIOACAJ+nzeKD1BCbjuumO8KKAkOnkMpUPhnHeHwAO+T/5EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-Proofpoint-GUID: klw4-EEfzgSV2V4igK9E8Wum8T2BcbXs
X-Proofpoint-ORIG-GUID: klw4-EEfzgSV2V4igK9E8Wum8T2BcbXs
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69b1ddc5 cx=c_pps
 a=QpQIPgq430LJFJp+cclIig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=ID6ng7r3AAAA:8 a=2AEO0YjSAAAA:8
 a=1XDySn5Ug4fX2v82s3MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE4MiBTYWx0ZWRfX06IIFHf13jcU
 M+OKMwvvONFR9qis/HYA1gx9d0+JxTvVJCNRGiv20QLqWMAqZbco3A6JTVahGoucqLqmAEeLveZ
 YBzj083iFoY5msh8tXRBBjXB7hUkz/JsjKP01MyTqJ0Ar0WlU/8VsQ7W5Y/h6bV8RQjdRPtpnlj
 XU5yU1xNQQzHyjiNr19hyf9gh/xYMYUMonwpe00NBpZzKtwIPgvwzqRSRTeIloAC6OaJgyK/G6U
 wOUEhw0dYgBspKkjiZTpLUwwn4yewM4psNUuomrjvC65pxsnIR55GNfI2l7eFlbDHpMybE1JUNp
 nuX39bNoeTAPk059ZDkOrW7Dsan+EEYDjcAPZDoIFylNTRWI88Vo6s8+PxCwplZBWkbSwDRm50l
 +U73ifkS1gZnWMiWYSR1z+Dm80qyagJ49mnd40DtqrhoIAHtmo33RcZIpH55Fpe+WxfAPSmeGaB
 TrZWBBBVJB6hX1TcZQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110182

This addresses a use-after-free bug when a raw bundle is disconnected
but its chardev is still opened by an application. When the application
releases the cdev, it causes the following panic when init on free is
enabled (CONFIG_INIT_ON_FREE_DEFAULT_ON=y):

    [   78.451062] refcount_t: underflow; use-after-free.
    [   78.451352] WARNING: CPU: 0 PID: 139 at lib/refcount.c:28 refcount_warn_saturate+0xd0/0x130
    [   78.451698] Modules linked in: gb_raw(C)
    [   78.451881] CPU: 0 UID: 0 PID: 139 Comm: raw_chardev_tes Tainted: G        WC          6.18.0-rc4 #212 PREEMPT(voluntary)
    [   78.452386] Tainted: [W]=WARN, [C]=CRAP
    [   78.452560] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
    [   78.453049] RIP: 0010:refcount_warn_saturate+0xd0/0x130
    [   78.453311] Code: 0b 90 90 c3 cc cc cc cc 80 3d 4f ec 1d 01 00 0f 85 75 ff ff ff c6 05 42 ec 1d 01 01 90 48 c7 c7 e8 5b cb b4 e8 31f
    [   78.453953] RSP: 0018:ffffaa0f80203ed0 EFLAGS: 00010282
    [   78.454251] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
    [   78.454472] RDX: 0000000000000000 RSI: ffffaa0f80203d68 RDI: 00000000ffffdfff
    [   78.454690] RBP: 00000000040e001f R08: 00000000ffffdfff R09: ffffffffb510c008
    [   78.454899] R10: ffffffffb505c060 R11: 0000000063666572 R12: ffff938dc210b468
    [   78.455279] R13: ffff938dc1f5e1a0 R14: ffff938dc14710c0 R15: 0000000000000000
    [   78.455549] FS:  00007f2f22741740(0000) GS:ffff938e11fbc000(0000) knlGS:0000000000000000
    [   78.455806] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   78.456129] CR2: 00007f2f228c89c3 CR3: 00000000020d0000 CR4: 00000000000006f0
    [   78.456786] Call Trace:
    [   78.456936]  <TASK>
    [   78.457069]  cdev_put+0x18/0x30
    [   78.457230]  __fput+0x255/0x2a0
    [   78.457372]  __x64_sys_close+0x3d/0x80
    [   78.457544]  do_syscall_64+0xa4/0x290
    [   78.457697]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
    [   78.457883] RIP: 0033:0x7f2f227d1cc7
    [   78.458097] Code: 48 89 fa 4c 89 df e8 08 ae 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44f
    [   78.458692] RSP: 002b:00007fffab36fb50 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
    [   78.459155] RAX: ffffffffffffffda RBX: 00007f2f22741740 RCX: 00007f2f227d1cc7
    [   78.459400] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
    [   78.459648] RBP: 00007fffab36fba8 R08: 0000000000000000 R09: 0000000000000000
    [   78.459899] R10: 0000000000000000 R11: 0000000000000202 R12: 0000558298427128
    [   78.460212] R13: 00007f2f227416d0 R14: 00005582c72cf320 R15: 00005582c72cf320
    [   78.460470]  </TASK>
    [   78.460571] ---[ end trace 0000000000000000 ]---

The cdev is contained in the "gb_raw" structure, which is freed in the
disconnect operation. When the cdev is released at a later time,
cdev_put gets an address that points to freed memory.

To fix this use-after-free, convert the struct device from a pointer to
being embedded, that makes the lifetime of the cdev and of this device
the same. Then, use cdev_device_add, which guarantees that the device
won't be released until all references to the cdev are not released.
Finally, delegate the freeing of the structure to the device release
function, instead of freeing immediately in the disconnect callback.

Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
resend: added linux-staging as Cc, this list was not part of the first
submission.

 drivers/staging/greybus/raw.c | 49 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739..b92214f97e3 100644
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
@@ -148,6 +147,13 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 	return retval;
 }
 
+static void raw_dev_release(struct device *dev)
+{
+	struct gb_raw *raw = dev_get_drvdata(dev);
+
+	kfree(raw);
+}
+
 static int gb_raw_probe(struct gb_bundle *bundle,
 			const struct greybus_bundle_id *id)
 {
@@ -168,11 +174,14 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 	if (!raw)
 		return -ENOMEM;
 
+	device_initialize(&raw->dev);
+	dev_set_drvdata(&raw->dev, raw);
+
 	connection = gb_connection_create(bundle, le16_to_cpu(cport_desc->id),
 					  gb_raw_request_handler);
 	if (IS_ERR(connection)) {
 		retval = PTR_ERR(connection);
-		goto error_free;
+		goto error_put_device;
 	}
 
 	INIT_LIST_HEAD(&raw->list);
@@ -187,29 +196,26 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 		goto error_connection_destroy;
 	}
 
-	raw->dev = MKDEV(raw_major, minor);
+	raw->dev.devt = MKDEV(raw_major, minor);
+	raw->dev.class = &raw_class;
+	raw->dev.parent = &connection->bundle->dev;
+	raw->dev.release = raw_dev_release;
+	retval = dev_set_name(&raw->dev, "gb!raw%d", minor);
+	if (retval)
+		goto error_remove_ida;
+
 	cdev_init(&raw->cdev, &raw_fops);
 
 	retval = gb_connection_enable(connection);
 	if (retval)
 		goto error_remove_ida;
 
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
 
@@ -219,8 +225,8 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 error_connection_destroy:
 	gb_connection_destroy(connection);
 
-error_free:
-	kfree(raw);
+error_put_device:
+	put_device(&raw->dev);
 	return retval;
 }
 
@@ -231,11 +237,9 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *raw_data;
 	struct raw_data *temp;
 
-	// FIXME - handle removing a connection when the char device node is open.
-	device_destroy(&raw_class, raw->dev);
-	cdev_del(&raw->cdev);
+	cdev_device_del(&raw->cdev, &raw->dev);
 	gb_connection_disable(connection);
-	ida_free(&minors, MINOR(raw->dev));
+	ida_free(&minors, MINOR(raw->dev.devt));
 	gb_connection_destroy(connection);
 
 	mutex_lock(&raw->list_lock);
@@ -244,8 +248,7 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
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

