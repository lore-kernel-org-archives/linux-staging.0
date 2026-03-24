Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFECE34FF5B;
	Tue, 24 Mar 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319883; cv=fail; b=j17DwL+BQVEGYO0i9Sq+WKAXcvFb+VuKmajpuAulcej4wovlH2Wz4+Mnell0P3BEr/L//F3OihJ+BBEjXCDevnODR2GCXWA/o4ZNqz0Yi+IhlnmEd4gIfLWnUCLaTnRu4zeAWDfS5AtDLZwq00FFtmva//s4huUdyOgRW1LS9AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319883; c=relaxed/simple;
	bh=9PKuVmPngCHQFjJPJso5AOg2f5vv3AJnveFXdVjIBVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JVqdw5omw6ulwkQq9BYVUrDdGYLp8yWrtvqHZIENtDgPQZuHDdgSgNXN2V1XyDZt7rF3bukYBrBNipMe2c/YSgnkUlYatwSbkcHMqqZU8WkKgTnMzqmY3FcNL0dqW+P3Y7WI0CKGp+C/7WxQTHgiGNgosSX3k8czJ2r90i2L39Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=lKcz6D/K; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=Ik6ZuYbk; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="lKcz6D/K";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="Ik6ZuYbk"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O0Jg8p3800542;
	Mon, 23 Mar 2026 21:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=qOilV5UKNKVuHtrsFv4nnXhkt5kiL3iGdMHHgPXaYNM=; b=lKcz6D/Krf4c
	Z1RER2cC/llkg7ENG6v92mOi6d/KnFef0gzlGijFM9xf0lqtgnnU2mNi5fiqgIpf
	WZqmSyCWCMSd+OHoFZ8EFTzh3B4RdtHa4+OGJkKSvwduIBGZGpB2GAfsz1Q8M2Zp
	jW18CW/DkxPGZMYDqCpMmZl9tKGLjPgAF+cvPhgJO5lCU+nerPHij45CB6kDLhxV
	5edAWuGM+PV3ihCgCDECbmshw6at1+qzG42YZ37vi8VkX8pCnRI7AR8f78ePrM6+
	JhIRKcg0CGlxlKglKMxlrDysFoKdjBX6+5+gfPhMrmO44I/bM4L5DyWNVq4xO4mn
	vf9CsVYWxA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021102.outbound.protection.outlook.com [40.107.208.102])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4d1qn5ckv9-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 21:25:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzZ5FcLMq1utohQ7bmw3gO++jv/0GmS1b44s+MQy3tYMsHlLBev7XTax8F40+O89tcSfs46UMaNdfed1SLP0OkHi1aGdOlysLJ5o7VrzLox8BtKGnujAmEknCc0AbpXpMKXo7gxZeWeXnIOZ26KsR6TkQoZ8DriFiEyJADpiI/WE2FxEGMOOsAfGUPdtf3mC1MUmC84GgezWbzFUrn+sI0tyjZWS5XTrzHYo+wBttzTSM3lK/3OwakecZGIfj1t7jdceet5FACTQ2orqlOqufQNM3Z9z/rLbVG/lYAuCIwJzXNFn8/NtZeB6XQ7uRxoRvidy7fugDRfjgzKb0pd56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOilV5UKNKVuHtrsFv4nnXhkt5kiL3iGdMHHgPXaYNM=;
 b=a5/s/ATziXbWPJElEzHK6zqum1MRPgxkRajhiq3ycL0lAGOZkTUiU0qLCl1lTrljq98QLUGqVzzbkInTDbqTZO8d1Hjn8oflrG56aefW8vWupfo0/6BT/E1CXll/6eqidaKHDnRk2erpUUDlDxQDudo6PUyFhj32pUis8umnbPPb2TUci00js2XJUdMmYyXQrk9HymELxA+8+7OKiUMhHqp6/ZJrSWPgiYbm/QZOB+Ohu1ZMGb8zYEeXu0YmtHvxCclL0vjGuPSEs9uiIaW8cIVcK4BS/dEBbRC7I/wt4aDm/jUxSGETxNf+xCuGi636on7BEOUllf+QcVCLixsr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOilV5UKNKVuHtrsFv4nnXhkt5kiL3iGdMHHgPXaYNM=;
 b=Ik6ZuYbkBT/EKdZKGcSB2BUm5CRdf8M7WpR9IkcZut088Ze4RjVGjdwW+FkGvmfPvDgkm1Fsr0wAPYGYDwq1P2yviJMbEEjXnl5DlXO3dqMDCcqobCv1fgkee6+H27OMg1CULjD+KNt+zS6vhKepimkcb8Z/Z9jcAh7EgcnS7MQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 02:25:23 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 02:25:23 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [PATCH v3 2/2] greybus: raw: fix use-after-free if write is called after disconnect
Date: Mon, 23 Mar 2026 22:25:10 -0400
Message-ID: <20260324022510.28596-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324022510.28596-1-damien.riegel@silabs.com>
References: <20260324022510.28596-1-damien.riegel@silabs.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6ec20a24-c313-4c84-cf4f-08de894c99eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+JMpBWPNErsmhoLCJvEvDu56Uv10iEt9SPFTZ34eUOAIbvkJb98AEtnAdaCCOOQL/Y9gz7zR32JlgIrBe9G2fdHyuXiEK2vGK59FHkjm0IrSemqWFLavrVzQrEaXY+tLip3zEHtWK76qgC5aOgX5+J6GFPkIKjKpHGOWE8NHkn35AkUBq88oaLixwTG2yqp707+P3FScm3zyytcNnaVeS/bhay9YMcSTAOrUrbUUzjshRORu+3TlRyjBTITQWEHzfc3MhaIpwWt6lJXJzWH2ESFXdD+Mio6dj0NuX5N/BviFzxtO7eSVbGm/e2pMfFazMMhPdsTlJryAdEcV7uOlrqa47IuBfLaC+murLh9QQhe01JBP3g8ud97tC0JY5tLsmwZMZdevhzRmvji6HVtszCi6YcgDW+8dUZ4Vtbws730wRiUffcuIs8ohtjQvjHKQeGRRK1isKvZl1vx2DUJ78vtwrs/vwOFeKT5KeobFdlqbcRz6eIIjbeBGjf7gygVDiLK9QE0kQKkGrnmyxXKeMLxNfhQN0w/DmvqNUPpIy8AGDY+jJLwwnIKRYKbbK4UIyvUP8Uk7irFF/YLx0m4VLqkekrsDR2YRAZqZ8K3iGubFXnU0lOP1y2A27RCikjiMXskyJqdtfIMmfMsfEcdbJHVIg3rDe+oHg2Hl81DUepOslKEKDZB7Dq0zZ4kyDU0SCn4yX8AK062+hWQWub1XW98H8hgIE3c1agBxBJDIiKUTXjYWAWniAkI72IiMeTAbp2FmahHCdtHSW3ojOMuXLkLdrFGwE9Jf6gb9uOmPgnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2s5akdFbTFwdzhsYTA3Z201VnkrcUk3UFJ1OW5USFo5RDhuSFdKRjl5RnRh?=
 =?utf-8?B?YVVQbUViS2tXWEVKaWdIcUtQOGgrRHBTZkJmSFZxZm5henpGS3RaZE5OSnVi?=
 =?utf-8?B?bGtSaWZTbHVlS0xPV3FFV3krem11TEQ3eFZxMysrWmQ4enhQNFQwUWJ2SXly?=
 =?utf-8?B?dWREV0Z6a00xam9Va3JsYTZFeGJsNjJJWTlmbGhROHovb3pvMTdhbXZCU1Jv?=
 =?utf-8?B?Vis4elRZR2JTQlJTanRBUHBOeWpsQ09QSjhVb1IzVXNMbVBOajBST3NZNHZq?=
 =?utf-8?B?enloT1o0Yll5aXhBZGxFaU5LYWZuMlhWTlNjR09ablBEci90bURrcUlJK1dR?=
 =?utf-8?B?TGxJKzltbFp0VUUwdjBzWXNTR01kRWwxbUdGTHlCVFNCVnFMRHN1a2pxWWox?=
 =?utf-8?B?UFQ3bkhYQ2RFK29YYjQzQ2d3YkV5THBIWTV0YUF6clovdkZmZjFqeXpJWlBm?=
 =?utf-8?B?WFliZ2gyZzNXamZnMjQyMjA2eHgxdlRtVE9XSUlLcXhGekhTcWZOMTloL0FK?=
 =?utf-8?B?aFJiNmZrSzlqWE5hUTZlZmh5TGJPQXRYdk9RSzlmc285K21OUUVNY1g4TFM3?=
 =?utf-8?B?SzVxcDAzdE5WY1M2ODY0QWFObkhtbEgyQjB4WUx2c2djL2lETWp3Y09ONXdC?=
 =?utf-8?B?V0xLelRyV2x2ek9EYXR3RG5YQTF1RWp6K09PQ0RRbTdweVZlcDJlRlg2Wldq?=
 =?utf-8?B?bWtLWCtsN3dwVW1TQjhaaVNFV2dJV2dONnFubFhJR3hyVWp3Tm15dXBLcTZM?=
 =?utf-8?B?cWZUdWtzcHpscWRvbXdwUDAxZEkxVFhwaFZIOUNCTnJQN1FaL200WnM1b1BH?=
 =?utf-8?B?M1hRMGhFekxmZkwzd0pJRDZjakI5TGk5UE5ZZ0lORmx5YStBTDlFMDZqbmE3?=
 =?utf-8?B?MEJ5b2dWWmRvaDUyYmZPcUhWM1JicDRwS1hlSnN2MVMvalJ6WEYycDBYMlh3?=
 =?utf-8?B?bTE2YVA0Rld1TUQybnVnajJsdHdOcEpRdU9icy9CQ2NjenZxRWwxRVRmNzhi?=
 =?utf-8?B?Z0FRbmM2YmtUUTZycmpUWG9IcGdEWTE2QmY2WjNUZitEYVV4c2tLYTZDMFg5?=
 =?utf-8?B?eEgrMnNmWjJ5R1o4TDQ0aXlNT2JxSlFpWDNWS2NYTE1rZ2N5UmlsckdrSmlU?=
 =?utf-8?B?Vzk4OFdOci9ycFFtaS91VDZyZGI3U3JYMDBlZnJvZVNzSE1YYWlsekRSVWVJ?=
 =?utf-8?B?aER1YnA1b0wyNTh0UGNZV1ZPKzIyeEs0akx4TXNwRStLdnF6dDZGVGRnSm9m?=
 =?utf-8?B?aDRhNlhCSUpYSTdYdFp3WHhjY0RMd1hjOXJHMTJWY2svL3Avd0ZDTm5jQ1Za?=
 =?utf-8?B?dnZVdHpqam1SL1FkSHNHUVJEZzFQeHdNQTJCQVBaSHFZYysyQkRWcnAxTy9n?=
 =?utf-8?B?eXFDMWNSOFMzQkVVSHdITXp4K1pMTzdHOVpiOTkycThHbEVvc01TWmZYYUE0?=
 =?utf-8?B?Y1Jhd2t6YnpyMjhNUytzeFV3WmlOb1lwL0tyMDdOTjVkZWRIc1d4UzVLSGJx?=
 =?utf-8?B?YlZLREY1UjRoM2F4Z0djajFLTzFjc2YvYmd2QWZVVTJjQWFRS3dPcHFTYVZz?=
 =?utf-8?B?SXhBWllNZUxnS0E0NXpicS9ORkdZRmRZWGxCbUI2bk81dW40OUdxV1dKdmUw?=
 =?utf-8?B?akxYMFZ6dm01eXJuQ0labzA0Ny9FK1pVMElKQy83Qmt4amc2eW9QRHNHYXls?=
 =?utf-8?B?VWhCUDRXa3pQa2s4ODB0ajluT1pObGtPQ0wvZTJjYVExN3hlVUk5ZTdtYVhK?=
 =?utf-8?B?TXlKcVpjdENtaUtJTGM4bzFBZzNXWHJISWRrTGdWQjZOWW1iV0xqNkc2aEVp?=
 =?utf-8?B?OGRnMFoyL09qQ3lxRTZVaUdYRGlVa2NiYlJIS29iZ2NaMm9BOXdlU0tOVTJp?=
 =?utf-8?B?VE9kOGRjYXJ4Z2xVb3B6U29tRHNhdmFqUFltMjZ2NGZOVzJGRk1UNVhUQ0E2?=
 =?utf-8?B?dytvSmgzUzBtTlAwOUNDWjlUSUcwa3NtYmJtL3ZTZXJCbDJhRUNhTVFla2dP?=
 =?utf-8?B?SnU4cmNUQlFXN211SFVDbFduWmI2YVFkTU0zK0FXU0ZHTUNqeHlodmZybncy?=
 =?utf-8?B?azZBYUo4ZEdtcVpUQTI5QTdpcWxGQ24ySlNIVFdiR0UzK3JPOXNqZUgxNFBn?=
 =?utf-8?B?OHF0SFRDOGk1QTZCc3NOVC8zaGZ5NDI4WWo3ZHNqVFZlVFdNM2E2aDZENFAz?=
 =?utf-8?B?NitaZi9Ic0JDL0Q5dnBaYTQ5RHlHU1g1MUROdDhhUWN3czdJTkE0L3JqcWxq?=
 =?utf-8?B?VHBGalpBbnljSXJ6WVMraWh6aEU5L1lnRTl3MEQ0cGdHMlBDYzRnZHR4UlM0?=
 =?utf-8?B?eFl1S2hPTm9rVko5eG9VbXByYzBINE5wSjl6RU5DbmdJYlB2S3FrQT09?=
X-Exchange-RoutingPolicyChecked:
	kHuY4kXuukmYYF1/nWOUqoJS4Uj2yPXPlBVRiGujQ+APpw6xsRD9STAW4cVj6kzElGz6sT4aIGmZLUJCqYQ8uvlpIPs1DtyqT/JJeRQlUN5Eo1xKJAzWaM+Qi/P4YtcxxJNXpVtvMX/CL1ltK0PSU57tszMnoMJl2KwZ4mKlJRt1JESmnbUrolGHXsHZMWFzOEIJIa+yrUbAkXfsp7VJiiOOqEq1HVI3tyiCHX6Sb4Ox9Uh5GqAQd5qUOLc/FRYlkZvpM2h8iKrLYwGF463FqugMd9cu9wjGbXn9TRksgSFlFOL3wCITJ/enaoLBeQcaxn3D5D8aHJta1F7hGdHuuw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec20a24-c313-4c84-cf4f-08de894c99eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 02:25:22.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeiHaZoy1vMVbaBG+t7REvZxNmIbQxDt7BTd0Mhm9+Jq5nglOH17722/AC9Qd/99Qsk42I257hR58VszM3ODFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
X-Authority-Analysis: v=2.4 cv=T5CBjvKQ c=1 sm=1 tr=0 ts=69c1f614 cx=c_pps
 a=77rI9ysV2qQyIatzbb/mKA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=2AEO0YjSAAAA:8 a=oNt1VjkYWJ0Z_SXrehYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 8JFF7HgqKUhrE78MTrot0Orkm1eJfZcJ
X-Proofpoint-GUID: 8JFF7HgqKUhrE78MTrot0Orkm1eJfZcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxOCBTYWx0ZWRfX5nsF/xowScq4
 0h/nRAbbOXqbOm5RsSmtOqWQf7/48PfKZJS/Cq34Qy812Cxf7PUPqtQeaIqxU6haETZhhwq6fZd
 Z4+SHbwpROAVBn/GAWySSMNY/1jc5cWKmfxMl5rKgp86qiFTL1PmS8KMo0zWveBwGhlxdaKqpFX
 vkpmaXkoy7OJOUMt73iLLuviCYIs+QMbktfQWtJ4lfCX8TePnnhFAKvPtAL9QDoy9Y72mvhcA2X
 A2sEXdctGyCYYfTyZ8VhJEpIQyvrhIQbA/wEShGV4VSOSGibZMpWWWy5BEEaqVzVlBuaryUhdbo
 Iv0Oc6e45pvLCeBMtkgo+dBzUffsWg9Ua5CPuk82Y0iiTurPsd5VOrZ51k4EnJbpOPWWX9FUuqT
 WoFPFQfm4cUTYjg1HS96J1PVXZBocEofRxCB8dYYjROR08/EPv277Ol9toxsenFj0wZw8SQul3P
 LCO0QGpbW11dyKZJ7XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240018

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
and disconnect. This guarantees that the write function doesn't try
to use a disconnected connection.

Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
Changes in v3:
  - rename "connected" flag to "disconnected"
  - acquire/release of write semaphore acquire/release were in
    gb_raw_send, move them to the caller instead (raw_write)

Changes in v2:
  - trim down trace in commit message to keep only the essential part
  - convert the mutex that protected the connection to a rw_semaphore
  - use a "connected" flag instead of relying on the connection pointer
    being NULL or not

 drivers/staging/greybus/raw.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index e668438e1a2..1e7ffa10a50 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -21,6 +21,8 @@ struct gb_raw {
 	struct list_head list;
 	int list_data;
 	struct mutex list_lock;
+	struct rw_semaphore disconnect_lock;
+	bool disconnected;
 	struct cdev cdev;
 	struct device dev;
 };
@@ -200,6 +202,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 
 	INIT_LIST_HEAD(&raw->list);
 	mutex_init(&raw->list_lock);
+	init_rwsem(&raw->disconnect_lock);
 
 	raw->connection = connection;
 	greybus_set_drvdata(bundle, raw);
@@ -235,6 +238,11 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *temp;
 
 	cdev_device_del(&raw->cdev, &raw->dev);
+
+	down_write(&raw->disconnect_lock);
+	raw->disconnected = true;
+	up_write(&raw->disconnect_lock);
+
 	gb_connection_disable(connection);
 	gb_connection_destroy(connection);
 
@@ -277,11 +285,20 @@ static ssize_t raw_write(struct file *file, const char __user *buf,
 	if (count > MAX_PACKET_SIZE)
 		return -E2BIG;
 
-	retval = gb_raw_send(raw, count, buf);
-	if (retval)
-		return retval;
+	down_read(&raw->disconnect_lock);
 
-	return count;
+	if (raw->disconnected) {
+		retval = -ENODEV;
+		goto exit;
+	}
+
+	retval = gb_raw_send(raw, count, buf);
+	if (!retval)
+		retval = count;
+exit:
+	up_read(&raw->disconnect_lock);
+
+	return retval;
 }
 
 static ssize_t raw_read(struct file *file, char __user *buf, size_t count,
-- 
2.52.0

