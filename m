Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071761C3BF7;
	Thu, 19 Mar 2026 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.153.153
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773937285; cv=fail; b=QxQqftyPDmryhu/wRfT+dUPBywiwQymsHamFBiSWntm4Q4jPckqT2UhHbkR0H+eXBUasIjWK0jBLxkNZbq4VrWpdZ5XFcxgdlE3WrCz2mHiIp7WnW1QIPX+2ug9Im2mFquypsIHjVkwSwYyET7MkkOaG/XS2HTNHLMt7WVIFRBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773937285; c=relaxed/simple;
	bh=3JnRPu6Dukfd3xSZOHlCGZCxTgt3ORfB3y8NDWC+gpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aafJ82vFDtESWOYtz4B5EnMenRjSCFqJA42xwZXvfIptB6uvLlZuSqWwzfK+BHdTmwj+6WQlWJnSAC/415EYdQj3/Xrc3HgakQgYANqwP6LjGfi3e7Wv30cGw9OA4MNtY42FhT/veCd/Nwcq2dluOUIOX+Ekt8vAWgiT0W5Q2Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=my4WexA7; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=gLgwAPkg; arc=fail smtp.client-ip=148.163.153.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="my4WexA7";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="gLgwAPkg"
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFeSZq1622438;
	Thu, 19 Mar 2026 11:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=8tiUM3wGxcJHIdQiKc75+EXeMkxaDhYzRribTvfg90Q=; b=my4WexA7e5/g
	4lOd/obdxJ1onn/vcOkdRaaN86eu/e0T+cYKhbonV2D4W54APh0rba6EKCIkhYnG
	FyACaBx8zdbu8lre2Jhp+UF0lArzKaufAPh3HJFUNejd7E2Zf66uupDSjcoFBy5s
	F/i9NmXCzw0kFXt1JVoapSetDPcmvLbAojeyG93iYpGR9P+k1YOA9xDPS1JvxbhK
	m5Niza32Mo/S9/UNi/7bL6BaOhyzVFKPFeP3S6nLN1/4sK19fp1m9YrkegQg6UIk
	lASqIydaDzeul0a3U2DU1psoSN1ZmuqJMumfwOyCn4TNrPsTY7LRmGLZozlgQBJM
	3Id5/TvD0g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021132.outbound.protection.outlook.com [40.107.208.132])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4cw166uhpj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 11:21:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Umszi0BgKSF4uE89WSnFASZNUmVQi/7dXX5ah0azInv+6mBG+LIA47+c87oeA4EnfYhYEazjPkKRpVRTYSwDQvcMQbgqWtPYaMO8lGjs1MbVxR74+FzlBukcY0mZmhKLQ5WVcQ7F3tGAAOsMRk4GQ9Z/WefKzIhCz5YdHD6v3pE+IpqalA9Q8c7iBx+xm2Ihydq65MqKEkv2HCGbgJfQbz9aFSWwjm/Y7tzX0d+yFhTXp2IJX3qHSnK/g2kMOhjE9NlEaLbzsvBryoHsGztVhB1lJUpYnUsdHGmpb3/zc8vhUbfIG4PGj/WbdoG9wr+D1aKvvchNdKQBj1f0RrureA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tiUM3wGxcJHIdQiKc75+EXeMkxaDhYzRribTvfg90Q=;
 b=kJ3meCxH8Ta6dIDdRt9TKFc/zgpdT8ZLDRnZGHarAHJb3ldbILYjZBdNUAhy4EuBSR4O8uVsKLKafnQCFH7FkUaadEnXwAT4bAkvA5cHWWcs/gUzSI/PzcIksOdIXW01YUr0z3Z6LyThPT5cc/prIpwHcsOrz879/d0kfLK2COa3CdrTCNQsFR8QnLOlhB+2cN0m7ckHVgdS/SDG27xHNUyGcLGqPDceC0ndFKgUqTAl3b+YCjyNglHYJDmDKkn9CYnz8v2lngLEUTWVU8PiWLs4asZxWY+0eT3zn8jR4r10x0KjW17j9T0V9vJ3CWlWfuylYERYMKdO/EUqzh9F/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tiUM3wGxcJHIdQiKc75+EXeMkxaDhYzRribTvfg90Q=;
 b=gLgwAPkgPeE7YkW4WjteNy4l1aI77mtFZS11YVOkMQ7ERsyiW4ncWHmPWVgPlgb1tSF1B9tCQFWYsmv6+7yhWkTDNfWLFfOMpO3OQuDAUUgLa1p66/jFUutjxWLLG3sNjmD3SnkLKfCv1cI1k3fcedT90jztfYzpPXN9sUgELh4=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 16:21:05 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 16:21:05 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [PATCH v2 2/2] greybus: raw: fix use-after-free if write is called after disconnect
Date: Thu, 19 Mar 2026 12:20:49 -0400
Message-ID: <20260319162049.42269-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319162049.42269-1-damien.riegel@silabs.com>
References: <20260319162049.42269-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::18) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA0PR11MB4671:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab1a76c-84eb-426a-f788-08de85d3857c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IB69nPjNrV5fX9CyhGG14dX2y5DZ10znkrKjj+tLZaVtGiKoa+b4g0iGFabvtjxpWevn7velpTECWy2rFWVhpjcEQq5Czr8vjiy5MhiNVUx9OXLslKIKLnhZ0CDrd8JqDyC4tC7p6DXpYS6rWJCVGf1Fozt33GgCI0mx7bfSF3dMVaP4cDOAg1aEXpdRPM7qKZFI0+UxmjF50SyOIg/uzmff1c2kfyWT2WfM0J0j3ZFLN4AtmWR+47YIRuSLhivGXQVoItCz0BvoFRWMga3eMXmyO3STZQTrYeZ4l/8ZXrTpJZs1+x5LH5svGFghgFsbEKad4+qtTIjordu5SJAYG92bXg/TmaptaM8LmGZ9/kliK/lSRxWttvTMPzbN59qdcIubmq4H0X5mJ5iN98OtrFO3ztrIHAnQ2dWb2/uWuH9IGRVK2cYyOGCMLcIWVeaMIoZA+6bKO3ackuKFuVdxF8J5lxsEoPieANHJCDFc8SS1p7ac9KdQ95tO/lK2aYXJ/6G4dVVU7g5rvhj65z9rn1GFwQ8ScL7eBEfaPzE21YJzznnY0PEtYFU+l6fXcoKouOkZHz7QbZjLly87Pf1Xe7Y97ZIZD0LOz7Cw+Kuqo/IfRavNiOL8wRfElMRU6OCfc8TZlJ4NMZHe7RiBfx/xnO0LWi3Akjsn09DMfK5WW+W1fg9Gns1pP3ELGPyU8Pm0ZJjXPBMiyyJgks1F8qaEeFtBXHR8oJPAI4UXtDO1AJNBo1cAPswSROzCo5bCf3F5Qj1J0M1sRy9s09irQDznk4Hlboc3/7xq37nIPQ/XKCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnRGdXdHM1V5R0FneUlvZVVEMlV6VktiaU9ITGxPMkpwMGJhWnQvempZUDRs?=
 =?utf-8?B?NU1OTE9ySHQ5YzZOWjZlQndvUjEybTFReDFKOXV3OVRzbzVVcUsyNDJQTm5j?=
 =?utf-8?B?eHZqOXA4eUdRZC9FOTA0ancwK0dZSERmOE0xdnFFdzk5dEVOTU1IaHp4djRa?=
 =?utf-8?B?NmpFTnFVZjdYZDNTUlJ6cXJtODNDRzIrMzB1WDNSZ21Sd2x5S0ZSckltLzVa?=
 =?utf-8?B?cHEva2ZwWEt0OWVxN3ZPcGk2MGhxUzdmRHV3Zy9pNEtNSmFiTHhhM0xKRE1R?=
 =?utf-8?B?d1c2cEZwSzVWbDVwQTNjTjYvTnFvVWlaeE1hWlhzWDU3aEVId2t3RjYrU2Fq?=
 =?utf-8?B?aHgvVWdPV0xPM2xhamdWendSQ1JMTmFPZy9OMFNINzdIZnZTbUhUOWxMRVZW?=
 =?utf-8?B?Qys3SzlSa3MwanBNSENwZ2dGU0J6ME16QkUzRFNwanhRdlRuR0o4Zi9lbFRT?=
 =?utf-8?B?OHI3UlZFNVU3a0o2cGpDZWJBSm1EZkVyRzdMSHlZRkVGeW01dWREVFI2am5Q?=
 =?utf-8?B?U1E0aHE0ZzRON0taYmpQZFE4RGk3ajRISjh4R1pkQ1dLRGhrQ3BzR2JHOWxw?=
 =?utf-8?B?UHVTaDVGYUZQZ2NudWhGanFCbEhOTStqY2JiM3dVaHEzV3hjMnJDR01XMm8x?=
 =?utf-8?B?bDBSU3JnUFp1dy9KbTR2U0xqV21kOWVhNGdVTndTaXMwVXl3TWc0WitZSWRm?=
 =?utf-8?B?RkwrbXlEc0VsOHpQSU56MERhSmN0V0FZa1BpOW1XbmZFSDFWbEluN2RiUDNk?=
 =?utf-8?B?b2ZCd25OS3UrMG5LM2REK2VSUldxM25OTTZSaVhNUkYxRzBwSm1yNGxoNXV4?=
 =?utf-8?B?VW5WT3EwdU9zaHVpOGJYWTdnVitXdkYyenEreVZiMW8vUzJiRnMrdE5NN045?=
 =?utf-8?B?Skphckg0ak9ENmppUE9iZW5CTit2ek9pV2hMS3QyRUptNkQvWGR0OHdvVEdK?=
 =?utf-8?B?eE1oTmJMQ1R3ZDhnYTI3dURSZGsrM29IYmNEbjZkVHRJWVJjVllMSzJ5N1Vx?=
 =?utf-8?B?N2NsTTF5R2VJTHhicG8yeUhGcGcxbjZrYm50WTlVL21oMjhvSWR5N1pPOUEx?=
 =?utf-8?B?VW1IR2sxYk9rcVZvVnB5bUFHK2lPZFZMMDJIYUsxNVVaNGhoVHdRYkkvcFpy?=
 =?utf-8?B?TkVlQUR4eDZ4TFlxWjRRTFJTMS9LZlBsZXhoeDlDblErcGhENlcrdG03alJn?=
 =?utf-8?B?KzZrTDFZMVRTRC9OYm9vM3A4Z01TblZsZm9ZSEhHN3JGM0RhTW5QY0pGTWVP?=
 =?utf-8?B?dzJ5Snpta3FGcmV1UzNmUDJBanFSYUd0amlEa2t1VnYxdzZjL25GaC9BYmQx?=
 =?utf-8?B?aFVrcktURktrN3FhTjBPUUw0MEljR2dZalNjLzgzWlZ1VzhheGVIN3dyV3Qx?=
 =?utf-8?B?aUJqWWh6TUJXNzhJMndCV1UraTRzN1dHdjZQQzV4WFZjR3ozVU9paHNNWVdl?=
 =?utf-8?B?dlMwNWVUdFozbTJLRHZZZWVRM1VESWRDeDFDU2ZyUkN6RXRoZlI4bkQrS1JW?=
 =?utf-8?B?R29GZ3FVNDkyL01DMUQvVGdxSDZVeEtlcVF5SEZyV21pOEpHNC8xTy8wSU8w?=
 =?utf-8?B?V2pab1krdEpHdDczeWhKMXFRMFFsTnlGSThhbHdnaVVxVlM3T21YcXlLVWtJ?=
 =?utf-8?B?RTRXeWtPb2FSdXFsMzh2N1BuN3Z4NGdDaTZUd1R5VGxBTDhhb3lNVnQxWXJK?=
 =?utf-8?B?VkZVZU1jbnFrNS9UQ3c0ZlptK2tWcXNnUWJQVXhmdjZaNDM1Z0FVQ2pUZVVR?=
 =?utf-8?B?RnJvRHlHVUhhankrQXhnVFdCbWFlN3BOdEJpbXlMRzJDVjRrMnA5WFFMM2ha?=
 =?utf-8?B?YjNHQjU4OGtaWGFFcW9ueFpCZW9lQ2traXR1aE5pclUybms1OVpWS1lwZXpl?=
 =?utf-8?B?QUxJM1hzRlVoNVROUWFKVi9HaURqTlpMWndUQ1RXSHFEVTFQUTF3bmpsOUJN?=
 =?utf-8?B?WXVNci9vWW12S1Evc1ZBVzNmeUw5bno1NjY5LzA2L1hQRDhyVTR6M0ZUU1Y3?=
 =?utf-8?B?NkVnZUpZRGNvbGR6WVFpM1RVeTRBWFlMNmw5bzBmYmJpL1FPb0RzejY4dCt5?=
 =?utf-8?B?aytWdXBoeHZRRmd6UVpnVC8yM1RiRFZIUkJNbStDWmxOS281amswTmdtdHZw?=
 =?utf-8?B?UHdpRUc3S2RpeDlaRnVxaS9OS2J6NGFUK3h5TTNaTW01UXNLWEhlZlNmeEV5?=
 =?utf-8?B?OFZ5bWVvTU9IMnY4L3Myc045Y3hmUmZUVEl6WDB0OFZEaWlGMjM3WjV4cmpP?=
 =?utf-8?B?OW5yY1Vjd21yLzdIU1pnTElLUlVJTlg2UFVGeWxILzhUNTZwTUZRSysrQmpT?=
 =?utf-8?B?anFLRDlaaGxxSnJKbldlZ1B5RlV5bElnakU4VXRjeW9hajJkeHdWdz09?=
X-Exchange-RoutingPolicyChecked:
	CXc7Sc1QWK9il9PiIxkR0elXIyLbtAumgDDFCz1sGREUGIgRwuBm9w0Pz+qppaf6i/sfapNFDFn9bCbMM2pOC+wu/Z8sAoQtS1TNWvZRqoLzexMiiLf7FEDkyaNAsJGU8BwLeCoiWGz4PHLNxLg7NGDVGqgpD8SbLVVSjtP2/KeQ3ML6rca2c0HMWNW6HV2vojRo4zi6Zf9rJ8WnHTWryQ6gZKH8fJ5eDFZv3tMsSXdSgobsxUFOBzcKTuMcX7FLkLiF+RnTU/VaIdQm6UWYYm5dqat29as7FCYQedhEtb7h+62rNILT6QCrxd5r5joOprrQv1Df1of4elWveZLMlg==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab1a76c-84eb-426a-f788-08de85d3857c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:21:05.8922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mrByUYOWXs+BXO2RDRZiLPvTh3HuRrtfybeNgAAgLzLIiM9erguQ9KFdu4oBNIM4M9V7m7RWy3z+WoHhX3zpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
X-Authority-Analysis: v=2.4 cv=apK/yCZV c=1 sm=1 tr=0 ts=69bc2273 cx=c_pps
 a=Gq0v4fqhBDE/9EfA5tRQ9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=buQUfWhnF1OtDDk5FV7I:22 a=2AEO0YjSAAAA:8 a=It-tUInn0qGn2yKBwLMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEzMCBTYWx0ZWRfX0fGPMitoyP98
 hYw/IKhwUZa63H4n4/+FLxFUP+6n8sunE/oUNXYdkqNnjd3QJuSM/9gj3YJLdoW/sdXz04bkKIk
 8jM4GTssyiW0lmUNBq7vlelGQNOpGRZukvUmofgbQJqnM4RnA6bRQl1w73uZ2y+7gLuSq/ilkdN
 D9Bg17FBGm9gi/ls7LQOSHrBrwaeIHQAX2MiMe72Bv6LDUQ3ooq8rOR+cnslYsjWXQD0TGp3ORU
 j8WhALTwWnWcXAzCMTOt9EZgxYeArcC+zY/nRSPIndZTddKJOmLbzuhuCGBw0LV5ZICy+8c1PE6
 M+81f+za/Lqx4ED3Al4dOzWPkhtiyopD62oud+Ln9a6E/0orpzSC+oYrB4f3RfBgGTRi1FzdlBb
 c0Syk7O6teQWWg/95KzuU+RRg5+/UihAhITNt42iyRHarhbnhQSvGm4E0f+9/L/gIyakwcJwNJa
 5JUQ4cGPn3qkPnP5CZg==
X-Proofpoint-GUID: 1Dtt_X3Es2DMNQTsnRm5LAzbC3pMKUpq
X-Proofpoint-ORIG-GUID: 1Dtt_X3Es2DMNQTsnRm5LAzbC3pMKUpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190130

If a user writes to the chardev after disconnect has been called, the
kernel panics with the following trace (with
CONFIG_INIT_ON_FREE_DEFAULT_ON=y):

        BUG: kernel NULL pointer dereference, address: 0000000000000218
         ...
        Call Trace:
         <TASK>
         gb_operation_create_common+0x61/0x180
         gb_operation_create_flags+0x28/0xa0
         gb_operation_sync_timeout+0x6f/0x100
         raw_write+0x7b/0xc7 [gb_raw]
         vfs_write+0xcf/0x420
         ? task_mm_cid_work+0x136/0x220
         ksys_write+0x63/0xe0
         do_syscall_64+0xa4/0x290
         entry_SYSCALL_64_after_hwframe+0x77/0x7f

Disconnect calls gb_connection_destroy, which ends up freeing the
connection object. When gb_operation_sync is called in the write file
operations, its gets a freed connection as parameter and the kernel
panics.

The gb_connection_destroy cannot be moved out of the disconnect
function, as the Greybus subsystem expect all connections belonging to a
bundle to be destroyed when disconnect returns.

To prevent this bug, use a rw lock to synchronize access between write
and disconnect. This guarantees that in the write function
raw->connection is either a valid object or a NULL pointer.

Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
Changes in v2:
  - trim down trace in commit message to keep only the essential part
  - convert the mutex that protected the connection to a rw_semaphore
  - use a "connected" flag instead of relying on the connection pointer
    being NULL or not

 drivers/staging/greybus/raw.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 6da878e4339..57bf5032280 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -21,6 +21,8 @@ struct gb_raw {
 	struct list_head list;
 	int list_data;
 	struct mutex list_lock;
+	struct rw_semaphore disconnect_lock;	/* Synchronize access to connection */
+	bool connected;
 	struct cdev cdev;
 	struct device dev;
 };
@@ -124,7 +126,6 @@ static int gb_raw_request_handler(struct gb_operation *op)
 
 static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 {
-	struct gb_connection *connection = raw->connection;
 	struct gb_raw_send_request *request;
 	int retval;
 
@@ -139,9 +140,18 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 
 	request->len = cpu_to_le32(len);
 
-	retval = gb_operation_sync(connection, GB_RAW_TYPE_SEND,
+	down_read(&raw->disconnect_lock);
+
+	if (!raw->connected) {
+		retval = -ENODEV;
+		goto exit;
+	}
+
+	retval = gb_operation_sync(raw->connection, GB_RAW_TYPE_SEND,
 				   request, len + sizeof(*request),
 				   NULL, 0);
+exit:
+	up_read(&raw->disconnect_lock);
 
 	kfree(request);
 	return retval;
@@ -199,6 +209,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 
 	INIT_LIST_HEAD(&raw->list);
 	mutex_init(&raw->list_lock);
+	init_rwsem(&raw->disconnect_lock);
 
 	raw->connection = connection;
 	raw->dev.parent = &connection->bundle->dev;
@@ -210,6 +221,8 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 	if (retval)
 		goto error_connection_destroy;
 
+	raw->connected = true;
+
 	retval = cdev_device_add(&raw->cdev, &raw->dev);
 	if (retval)
 		goto error_connection_disable;
@@ -235,6 +248,11 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *temp;
 
 	cdev_device_del(&raw->cdev, &raw->dev);
+
+	down_write(&raw->disconnect_lock);
+	raw->connected = false;
+	up_write(&raw->disconnect_lock);
+
 	gb_connection_disable(connection);
 	gb_connection_destroy(connection);
 
-- 
2.52.0

