Received: from CP3P284CU006.outbound.protection.outlook.com (mail-brazilsouthazolkn19012055.outbound.protection.outlook.com [52.103.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062FF30D3FF
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285586; cv=fail; b=nd9wfBLxuRfbU4Caqo9bQTct33Ebbu0Bzxz5602XkfPnUYlHxSUwN6gdol2BGGzmrABNrphjUkMlktdw7+mRjyL1STM3LMRlnhgQs0siiImKozuUItV7sCrBedsnkdmCwpzZwsI/XCTpwNPnLOTcWynBM5CwQr6kpPIJyhSp+6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285586; c=relaxed/simple;
	bh=lranbhnQE/Vb3AyQNZvu03WqW3kvpFbhGyMcp2gvM6c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VfvBLRQP4qH7Iz5F71XggAxVC1ITeD+jhkqJb+Cqxqff7WGOK3MzhgMbZQF+qLxI+U9wqzEeMoJUyyAZ5U+9fckh+oTU2gjrzPba3joDZsDbBWB6yNFuTRzEBeqk16E8wQq9usLwcc7O2XU9MI9Rbdejx+gF0v3Ick+uneLAbPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=cNt+hHEg; arc=fail smtp.client-ip=52.103.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="cNt+hHEg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx1gGJgzHgUI+M2DBA8UemeuBCgnwU2MqRqC4l7/nDiiDut6OMBa1Q6at+t3SNTj8xWWCIoRm/LZCQ5dD0Um88a5vN5vtezlWRjRxaF7LSiqiNyHCxMabPvuB134n1YfK8VFFt9VkAxnCDZiqJremDYmcIKCnXMF5qOjpI0ZJd4H9kIqeZsz683HmALBRTIU7l5jVgr+95j5KCOng4Tw288zHt3AxUhnI9OGQCTVxMJGsyOcrAvhVJ89rsbb7Jke/SFUm6tkjpeyxngO2uC9Ifo4okRSQ/7ofxYOzawKAyuzokM+1dtrvtCKNoc1vKRdsnszFvylowt3rKhK5HAjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fm9e/KipIIr0L7B2ifgJajjJAdHBHbbw3XnxayG6hfg=;
 b=HpIoLfVudK3erRMnwKKQwFGShC5PFeNsvDi7g88YxSwo1bvGwnsFOp1jxZfB27vXdo6inU9TSkfxHE4ytlI2MzM6XB2hW6/wcAcnMOzjZJkrGLgBb36ScN+L6oALjHWf10nyd8iZK9wFG4XiUFEsE0xhLHZZS/E8uULX24FxV4TXXHAqgLTii/bBwfJZD9QKvMgkTDHbyDDeCQArhRi03W2gOKZpM8WqaV2ypL5hHYFBMMoco2tY5bgibx/RQI8UYZO22ClJEQZbdPQEgpVHmdAPNYZS8P1rUTnbps5U9MtKNsea2XCf39toqYQlJzGtvRXYbCbYWVGF+Aqqb+1CMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm9e/KipIIr0L7B2ifgJajjJAdHBHbbw3XnxayG6hfg=;
 b=cNt+hHEggFJ3Psx9NV2ICngWB+AFE0gbd50VwIRdj0WQrYPe2ufqEB9hfyHAwTXNr23XXjZuEC2aXGvrxhBrex+O9pF1eG54gDpH1FcTpoZrsNv3r2FexSLnyqT/n61av+FB2Mibr8QseLJntcvUPAHkXd9fJpj+sX5Aj0XIzeSgPnXGV8C0buZdQkz+YPDmmArflnLNAKCzVB1HRP6lA2Toe7Nty/OpgWanfCj+5DcXWFTDJqdRDHcfzI+3qbKr3rmWYmVZUeaHi/VonLxI+Fc4YBpAkShi8LrCKJfY4x/C/R8/RZzJU4TAffr5m12IqYWgtFd/edUzhmwIZqGf7A==
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:9c::8) by
 CP8P284MB2735.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2e0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 21 Aug 2026 04:13:00 +0000
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f]) by CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 04:13:00 +0000
From: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Subject: [PATCH 0/3] staging: octeon: clean up coding style issues
Date: Fri, 21 Aug 2026 01:12:52 -0300
Message-ID:
 <CPYP284MB08540C0CDC4EF5D307BC3AFDFFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP6P284CA0089.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1a9::18) To CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:9c::8)
X-Microsoft-Original-Message-ID:
 <20260821041255.1616843-1-tiago.panizio@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPYP284MB0854:EE_|CP8P284MB2735:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4e03d2-14af-4bba-a517-08deff3a7b93
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|15080799012|24021099003|23021999003|8022599003|25010399006|5072599009|2607281247196008|3071699003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V4ED1lxXAgp9MkiIb/cRUiTA+Gq/ZQSg1b21uJoNzGbYfz1889T+LKaaw34u?=
 =?us-ascii?Q?ooHbKxYqtQj8aIXz0ntvp6VbZ6W+CuY2r8R2sjwdnY0iiL4eFj178ndQc9Vs?=
 =?us-ascii?Q?gwJ/XwK7npEbes+IE+aRg1ICOXsnN3N/hJyxDWYk0dSuFR5qx2QoEn3yYEDS?=
 =?us-ascii?Q?hqObO+C1erhQUKoewGylc4AYSZ9+Gq3SytJV3KO4/DsvHPty9bDZUAWzcJoK?=
 =?us-ascii?Q?6CqIkamouKZxx2LQM3nHKFKrQFGtCZR6pmey7Rz4UPgfr+PflL2Ri1a2yNWc?=
 =?us-ascii?Q?Q7GxlA2zXZ1EO3GzP+t9FbKft36dWvZef3UIOVpZGsrqqrSWXvwC8XXhRe18?=
 =?us-ascii?Q?7PzhdJZCz8NweQKbzGmEJ3es48NLFbW8I44j2rmpYs5HTgX1A6PjLv4kUIlH?=
 =?us-ascii?Q?rmQThEGSRpZHABSw0vjxzgoO211OWx82FZ1Vs03D5yxl4AvIvkQ07Ux21BQc?=
 =?us-ascii?Q?HxiKT1tQFB958sWqjGRHYgEcyCFwdZ7MRPGKQ51ryJ/9LUOKhn8ADv1F/Y0Z?=
 =?us-ascii?Q?4emex9isIC267wAmVnWbyZ7OIzahtuWD5B9fVYasosNObljea92MegEsF52l?=
 =?us-ascii?Q?qc+wkN2N29F91LXCpEw8+1QJXraioNhh9SdY3todsnMBkV361chN7UkMDTZd?=
 =?us-ascii?Q?nkBOHAKHVPTckQD2WZJRc0L09AayFpb5n6vE6GqV8njpb2Yd/apgZBVoRWmE?=
 =?us-ascii?Q?ZKpMl5jehPG9dpY5APTEs3wUrddeYFVguo7jWW4qxywZ7Xq+7+ROK0J1A/Ra?=
 =?us-ascii?Q?8fNnFi7NoIA2W5tpBI/MdCijuWn0Eq3B1ylaoovmJsmknorTPGONd5juivXJ?=
 =?us-ascii?Q?lfTO1iw3oHX1K4u2TJ/T6XfSvUU52+cRx7PMBl3kswd6lGct7bgZiTWumMe/?=
 =?us-ascii?Q?1eQUmVs4lbegR9P0usuACZlU3hjfNDBpu+RqxijkQR9RPIVLRekIyzvzMlCB?=
 =?us-ascii?Q?ABDaYYD7uoOPE1sgBAKmFw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2DtwyXNvZyFgNqJFeP41o3hcSKnn39zN7IeX7ZyahzDu7u7iwVq8ZW3+SWhx?=
 =?us-ascii?Q?nWih0OKpk6Ka8Agkzz7tqS5SBUQsQB2+/MuHc03w3C0luFiq/xXRL7ptMkHH?=
 =?us-ascii?Q?B2i60jnmjPEsNAH/V+RDFidU/+9P6mjDjq9qOo42GckZ0JdOilRZRoZqamN/?=
 =?us-ascii?Q?bYk0G8lLGSow1uFhIn/p/Hz34qQ6jJWH4MjpfRVQQnKWhCjfByO3/3HQQeXb?=
 =?us-ascii?Q?KlImtjCEibYDE0pPRB6wSzACTujpPmWM1/snctY7dpKMFpo3Db1ReIkiZppX?=
 =?us-ascii?Q?ZseQhHLbTI6+krGgZ6MSB0hL0rw+5545RdY4ZePGN0tFO0sYQouKmYayG3ey?=
 =?us-ascii?Q?b0/aLfR3VCNsvJapbhpX/FD0VPzHM1Fqh4g5UCqcIcZINMjxth0t2ojgALdw?=
 =?us-ascii?Q?xDdNnYuteoe7OTXYCXGlDDTgBA2a39cY6BMIuK0dRLyPQy2ZIqxHwlgzpLml?=
 =?us-ascii?Q?XnA/CybjEAPjl7yMNxnFAo2/wNd91jpH7g8VvuwiXLAAVJk4zdawHcEpQl+r?=
 =?us-ascii?Q?ahiTFTaRXUC96wapIWy6D9DKzYnx7xsibq8BGr1NZYkXDMb4AHVTlt0dIanh?=
 =?us-ascii?Q?HHq2NxiuRzx2/94ElHPIqAKWPIetgGNb1wfepoLJYtWyIbZ5CppzU6WoUNc+?=
 =?us-ascii?Q?E259kM5qwZqc+rqeCQPBnLMgiAmhDoA9IzjNSH7ti5YMrDkndFf08y2n76Kg?=
 =?us-ascii?Q?JuL3rA4doedspZp9don6+DLxtHMCqNYFIW7gTCBDm9BbX8e06fVfUm5qATMe?=
 =?us-ascii?Q?JfiWrHjiuzbHDA6LRWICjbHIRkPAkxudzws1CkmD/SX5PtfoYr4BAXci2ndA?=
 =?us-ascii?Q?Px0e5ssDp/eq56QKtKXp39ExMqCq/xAdMl4GBKhvk9zWgOGPoX0R4wGK7rOm?=
 =?us-ascii?Q?C3pItTsYusxjiMNk7dlKCEamPsz+qlje2InmW4IEkcRydiFXxwK8UWLqE/kR?=
 =?us-ascii?Q?y3OVAWoR7zfFtiPpOhF/iwbJpdr2JuVgLAMSwSMDd37MH+O42HSj8ddJbi2y?=
 =?us-ascii?Q?TZyB1y1dgmQ8LXG9rOmSlFDHT+sa53nPKHnrbHLhtzQdm7PySz+pZNo9Vscx?=
 =?us-ascii?Q?1WnzILR6Gz+G0qP4jN0WW7mFLX2r1NvZlnek761ZzblBAqNLpXIpUOPn8Hgy?=
 =?us-ascii?Q?No0dkLHDd1Qk75bAQpTzKmrNAAnX1JHWrjcVjaYgAyiTnnRw6vBJGJRkVEN4?=
 =?us-ascii?Q?VUvlp5uoyowSMurUZSDQjG/XPJVJgtWtyxsp6wRwhamf1pJtEAYAVsprqm26?=
 =?us-ascii?Q?xkWctL8knww22COiSiHKcDzsFuOLXgw6M9Sd6C+12MDu376IGBmLpl6/8Gyc?=
 =?us-ascii?Q?XLZumdNAqPbbpKuv00V5JqkS0t6Oa78VrmwyK1KC4/2HvQskzJyOfqd3eITt?=
 =?us-ascii?Q?8YySxzZjefqzSPbweQiCBvORDOpPPhfuZ5xz1J6tFTfaVA45X47MbVoavErL?=
 =?us-ascii?Q?1lz3XR0ZCfWLU042KkN6qWLA5pmg6UDiV2OOlzt/6aEiEp2KGQscvA=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-da224.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4e03d2-14af-4bba-a517-08deff3a7b93
X-MS-Exchange-CrossTenant-AuthSource: CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 04:12:59.4807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP8P284MB2735

This series performs small style cleanups in drivers/staging/octeon as
part of the general code review and cleanup work listed in the driver
TODO.

No functional changes intended.

Tested with:
  make M=drivers/staging/octeon

The build completes with existing objtool warnings.

Tiago Panizio Gottardo (3):
  staging: octeon: fix style issues in ethernet.c
  staging: octeon: fix RGMII condition formatting
  staging: octeon: remove unnecessary parentheses

 drivers/staging/octeon/ethernet-rgmii.c |   2 +-
 drivers/staging/octeon/ethernet-rx.c    |   4 +-
 drivers/staging/octeon/ethernet-tx.c    |  20 +-
 drivers/staging/octeon/ethernet.c       | 308 ++++++++++++------------
 4 files changed, 170 insertions(+), 164 deletions(-)

-- 
2.55.0
