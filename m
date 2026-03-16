Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045F025228D;
	Mon, 16 Mar 2026 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.153.153
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667930; cv=fail; b=uAtsw17RUpM44N5uRlfmWVCb7d4QpM8IgA/WKqBOnCjdIfOtCpHCfIuMN6Kgkp7skkTn4rtp9j1biNHIDk3oB4RFcAQIHnFuHLiJR9cAVA0zoD27xz+M7b91WFgksEZeac8HqGJgRXENbbV8Bk/oQLJDySih7SyCEgC7v5PIvzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667930; c=relaxed/simple;
	bh=dQCUi0MfVS9pabb7UOYvV4YUddsP8gBNfOzym2Ulpzo=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=fDcrH+e4f5IVAo7Vi/RM5Y0rB/XHCk7jMtoZjOTbXFrEw/LaV7gTwSrlGPzJVRh2ZIASGeVmQiIRkcN9XHd9A1vxuQLpJKb/WZkGD3lvQWjDuBukAOInPHwiMxz5pflhjfs0Riujy4LqvlIBTNnMwgTz7qCXe5lf9RydSfCI/LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=vvtA/tpC; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=Yv0rRWFU; arc=fail smtp.client-ip=148.163.153.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="vvtA/tpC";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="Yv0rRWFU"
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G0jUaE1613820;
	Mon, 16 Mar 2026 08:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=i/opy4E4DWnEqdChJCCGcpXLqWuPAzyVsTK+lxZnNaA=; b=vvtA/tpCKy8n
	8l7efQ10x1XpwIN8cwEP6uXTcx7kEkZsCvwJdKrUUY9fyu73NQdMD1MC9c5x0RRe
	3BxkIXXl53pVX5umreKGQ8EhwAQC8BMhbX1zIq++ALryUGr0axbcXXLHQbirUbAs
	nlCvHdLLbUGIFelOHeMdOfTjQkupx9acf7dVeRCA23rrYKTW+xXAmbYGm63emgeY
	3UgzFuiEIfsdQKcjlWOHvsntrMXKEOkRnpyHZDcwLTr1z2+d9luXpYHNR051l2Xu
	bweuGc5Q5fiU0/uZF4l0W5HDSGkf/qR9eyBDeQJuUlp40J3nnIndULRqTA6XPLig
	pGEKY6IlwA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022121.outbound.protection.outlook.com [52.101.43.121])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4cw166jw0j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 08:16:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht4JPtw3SiFCBGQ8mD11sLgA5YtcYi4L+FIVTmkQxZS9zDExNPUcEF1ukRBXsGd4Q7llo4C5d0jjzMK5G0dIfgkvhuS3GC1fYcu8OPX/z3v1kDpVakPFzFhvwAIdFF/FkhucvIxTTlIRHnRJVUEjQuiTktYGCMtF/9fKvoc5+XmF0zAk/iQcch0xpl4GxbAexMYMRu0Ohym9ORBWEeWA05G1EOcLunWXIZtXF2toyarnmj7SBNX6sdSfMnXctLKYIY0vrng8B4wFnrZpEEIZdkMxp2dVYzRY2Je1p7R6eKMlNba0Fz4zb4jc7bBPcMlX3HDDnzwD1d0SPYQbwHgRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/opy4E4DWnEqdChJCCGcpXLqWuPAzyVsTK+lxZnNaA=;
 b=gtkqsdoaHAFTMI0TWgOQp4jbXHA5xjGmC7xpVsqsjydPfoMvazL5UqN06uRZfHeb3pe5/o6BOEPZy2ihux94J6WwPMrMv15w+t56bC8N6vK0UC/nqzyxeGi1Bah9wKMQy373raIOT7LLoutJ61e8RN30boHBk+byU839W6L9Mv4wOlEfPG94Suk+DksCxWpPKasLofMUGnOJN+PKD3apQcgYhqVoP7aux2oUf1RkfC/fbTkOntCXfN7yNDm5BvNoj2XXdEzDvubvYj9CGikTP8MUxv2ozCl3zAj1kRo7eFfZ+kjatbMU2DNboDo2Z8bkfzoOLTLgVjWfkHbFiGxrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/opy4E4DWnEqdChJCCGcpXLqWuPAzyVsTK+lxZnNaA=;
 b=Yv0rRWFU85sboMnvbMaOhg7NgHW1qcAfXbthjoOX+eOKhx2Ybho7/Kk2Fv/5cCgKuO6CYOphHAs7o0EW2hyPTjcJieQPyXCurOKBt/HifkOegWdo37vlkfV+gmnCnMnPYLFYm5bJJNSXaXyKcsicDd3IomkNoKLZvj2k3JqKMT4=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 13:16:34 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 13:16:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 09:16:31 -0400
Message-Id: <DH48H3G3GL8O.3DLF1KZQGXRUH@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: Re: [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is
 called after disconnect
Cc: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <greybus-dev@lists.linaro.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        "Alex Elder" <elder@kernel.org>, "Johan
 Hovold" <johan@kernel.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>,
        =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.21.0
References: <20260311212511.82563-1-damien.riegel@silabs.com>
 <20260311212511.82563-2-damien.riegel@silabs.com>
 <abezGG0LODIA4SZS@stanley.mountain>
In-Reply-To: <abezGG0LODIA4SZS@stanley.mountain>
X-ClientProxiedBy: YT4PR01CA0342.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::11) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 50145b69-475e-4e9f-f7a3-08de835e3eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cVHoLFz9SJDwzW2+twrMWDFM68e12Td5CV7XxYb6MSS+P1iDKOQp3d+8JqkwFd/6vFNit6hiIeF2C/xwbtjb1Md98YOMWVZOWdIbRKO04xWiH3tA0UTAIrhGkOIDrzDdMQNioD1zYWYEbnj738QIv02QYg/0RnvlgLnExd8gMqDUxAEtrKoHkH0O4ZoefKFZuaPJH/T2nHfbtMOGkNRc8mCVBAeV+MPzWhV97tYv6Dtn2ZxnkFeoOFK9GAajOwrL7pgmrggIL9m/NjzGzL5mmx+BdzX30iLAIdxpNiGQBu3mrYZf5RunLw4yieNDc29zIkMMH8fm+QJvHjlM2VhKJMidue27KsCIcVDsCQ2LF44SJqjNRP7BQEobvfolAtxMIrZ/BafsmfTdb6yzmCw+4YhtwjBXP5UaUEYjz1HZ4aa3Vha5Xc5VLPdR2TFm1fH978aLGivqR9bIkI4+oe6t8qT+kLn8Vr6erbld42jFBMKHa5841vTu634mU9KGgCegyzcJANx9Dv7S2F4Y9OCiRI1CZDhEdZ6P5jh1GqltvnAggPGxfZMal7Qs6VPlR16EU3bgP77IyNAIaO7iE+508SecLSrD8D+B8apqLr1LoZyLZ1Q9c+CpPQvD51luzek6d2EsyOsDn29jhRgHNrft3lgcA7f+8Lonq7u5IAzE9vpHGRBwJZtB5bNfAVzCL6rHxCEbyl9FyEH4xXGrgxcK6ZianLZqBjg1Nwp+6YLGo1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L012RVhQWFJocXJWNWh2SXB0cjFWamdCOWI4VDdlaTBzU1RxU05CTTB3UTcw?=
 =?utf-8?B?ZzJuZ29sZjFJWDdUWEZuckk1OVBGWENwUDM4NFhaT2hwaXFoUUwwKzMyNUUz?=
 =?utf-8?B?MXJSb3RFUXBGNno5NmN5Uk5lWVRjNEtCRzFwekd2VDNYakR5WldUbkNyNUNF?=
 =?utf-8?B?RWsrcGRSOUFlclBJZG1UZE53LzNJQ0I1YkNRUGNZYkZRNHBCWHI2cWZpTkg4?=
 =?utf-8?B?UWJibWVWeUlsZTFRSEtoK0ViTjVFR3RCbkg2VTlxbXZKQlZ5Qnlib2EwM0JJ?=
 =?utf-8?B?MTM2ZVQxWi9JZmN3RHd3OGpjUmxGaXpaYTBvYkg5WVNIa0pJZXFDR2N2aEFB?=
 =?utf-8?B?VWVaYzlNYUdRSlE4TVZWczYrNG8zd0NQSEJJODNmRGFuWVEwSFl6YVRuVGxo?=
 =?utf-8?B?eTRnV0tKK3RQZU9SWEZ2Qis1ajdndXArQTc1aWdOZVhZZWRIRUFON2RYL3RQ?=
 =?utf-8?B?SGJUTlNwQjhyODZSUmVSUVNpVmtvWGxjQ01FczJXUytWVm5nTVBkYUJKdS9z?=
 =?utf-8?B?WFRYdUdwdW1sd0VTcDl2Zk5rdmZjMjBJcEZHdWJYTE5YanpDRHlRS0FVZ2k5?=
 =?utf-8?B?TDhxUmg1MEE1RXRiL1ZlRlhxR2Qvb3hsb25FNCtPTlhTTGFBK05ETGVQeVA3?=
 =?utf-8?B?RFRscndFbFBnWG1ZTkxOc21FZUo4NGlpWHlLUXBwVFZlVXlGNldRL1IvK0I4?=
 =?utf-8?B?b3dNY1ZsMW5qejFmdmUwRUhVMkM1V1lDanBwYmV6OHRNOW9ZNDZhNVArcUdv?=
 =?utf-8?B?LzhuVjJ3bVZoWXZIV0llWGdqOWVCS0dGTGliTmJibVlGRmg1bEpjY1pKc1Bm?=
 =?utf-8?B?WHhVNG5mUmJ3eUJtQ1J4NlZjRDYyYlZ5OEtQSlcxRERrNkI2L3dULzErQ1RG?=
 =?utf-8?B?L1BFdjJyMmVyZ0h1Qk9GN0VRTkp2b09XWmhvdjNjNFkxSERCSVEvb1NXWUJo?=
 =?utf-8?B?UUpWenlSeWduVkJzUWJpL1hNaWFXaDJpRXZuWXhJUWxad2JkcE0zQXFKQWlm?=
 =?utf-8?B?RXpDSkJTdnZMZ0oxbmhma0p5K3dlM2psUTRWT0s0Z2RDRkdFSHVEbFVSMlk2?=
 =?utf-8?B?MGRjc0s4dncyUmNFTHh5YnRTMC9CRmhsTGl2STNFbEdoSlZxSGZoT1RXNTRx?=
 =?utf-8?B?dytxSmdWZUxZd0hVRGlzcWJkdFpZN0l4MkVkT0MyWjE1clBrbkhmSlpyR1Fq?=
 =?utf-8?B?c1lKSnRQZE9COWdtalJEaFJNbmEvbTBSaVAzWS9NQjRKRm1ra2RXSTEwT1h2?=
 =?utf-8?B?cWsyZlFidENWcTFERlVic0Z5TGpNeDc0cm5nb094Ky9EaUNiSzJjaE1RLzhm?=
 =?utf-8?B?Rm0vSXYzRDBjM1ZnNG04QU5XVkF4a3Q1SG5rSDg3d3R1b1M4VVRZaHdNWkoz?=
 =?utf-8?B?cHNHeUlyUnlCUUZCUXBRd0UzdW1tNlRBeFZtd1JJeWswcVBwNEFwaTJQT1h6?=
 =?utf-8?B?YzhCVjJnbHljQ1U3SHFGUkU1cS9pbE9KUndTbDBYaDJTNitPdHQ2RmhQUFBm?=
 =?utf-8?B?Y3dQNlgrdTdUQXlXcnlCN1FMc3ZZZ0FxbkR5dGo5NXFMSlJaelpkYy82MnVV?=
 =?utf-8?B?bmpPSEFhYXkyYk9idEJpZGxieFNaRW1RR3ZYMzJpQmRTWi9kd1ZRUzN1aEN1?=
 =?utf-8?B?eFkyYThMR3JTbmxrU0VzbXRJRWMyMVg4N2Z5YmZMejNISmNBT3lkbS93eXFy?=
 =?utf-8?B?bVNFRmZidnloRUMwZWxLNVhPTnRCYUNsQUhHb3Q4RG82ZXZXSWtoL1BicHJW?=
 =?utf-8?B?UU05ZEc4Q29aYmlCTldBL0ZWZFNKNU9JSjg5V09GNXJrUHYvN3crOGhoRUVo?=
 =?utf-8?B?LzVGR1QwVG1WNlZXaFVRK0lMWHE2S295dSszOGlmdkh1ZGJvZ0JFNUpYR0JV?=
 =?utf-8?B?L2JnZURvSlBaZXpieDhuK283YTRvL1hEWThub0xsZTgxb3BtT2t2YUdtSHJo?=
 =?utf-8?B?TGFkTmZaRTkxN3dkTDdsM1h6RHF5MmdKNmJYNXVpTkxBN2YrRklNMlpRNzE0?=
 =?utf-8?B?NSswSjEvUzRlSHB1TG9pWlN5RS94TE4yTkZWUDNVVGJuTVlmZkt6R0E4cGRL?=
 =?utf-8?B?a0I1TkNaZzBUU3lnWEMrZDlmLzArV2dzTjFGZXJ4Ulo3YzNXRGtIcVBWbTU5?=
 =?utf-8?B?WDAyT3dseFJYWjFWeW5LU1VWdTRqSkFUeXZEdkh6Qm52dlVqbU9FUkNiaklU?=
 =?utf-8?B?cHZhMFY0R0FQM1kyTmNGeDNjVkRtTzBNYVlwU3BVY3JhQlBrUC84ZXhjY05U?=
 =?utf-8?B?U3RlUnNzVjR3QXorcndvV1lZMVQrNFJMYUptdm5vTm9mMjcrdnM3cEVnTndD?=
 =?utf-8?B?bStwNkVBQ0w0Q1FSVHNSY2lhUWM5MHU4V09rQklWUStkcVE2YmNmdz09?=
X-Exchange-RoutingPolicyChecked:
	bQOVCiDunC6k3XdakOtdZKjg+0SYwQdOt8FvX8tWIQfIZAhOBGx4feryriHkPwkZvn0wWKBP9snl0Ucrt+VDmSlYSPmlt8Slz62dnLD2EjJRkn0RVrJnxLagh/PnzOPunwWbaRakNU6RCVAN+3eD+a84iwkCqRUWG2XyMDaMl6J+c5Qj4nZLC3XGMklLcbFUFGQ+MPOvSm/A305Y2RKuB0l9W4NgQwmyIi3CZD/yQnERH+sE450sJaYmy7EvwjwKlay/HOP01wE8Jf7rBVwvbyXL7ma5OsGZZ9xNSgJJpFC9xWXv0adCl06NohLZHchGCadx2JaK8pAEDPZBswEepg==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50145b69-475e-4e9f-f7a3-08de835e3eb4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:16:33.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvtNAuYs+wTVpcr5AxzjKR/DfCYbsWy35z4MIDd3PukZC8wc3cCbdvADtAdI8jO7LHIlL6tHoR9fF8RQz12zbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
X-Authority-Analysis: v=2.4 cv=apK/yCZV c=1 sm=1 tr=0 ts=69b802b4 cx=c_pps
 a=ojCuy1h7BbwMffJHuf2NLA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=buQUfWhnF1OtDDk5FV7I:22 a=ID6ng7r3AAAA:8 a=2AEO0YjSAAAA:8
 a=E6oxQB6iFb_bSAWImF0A:9 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwMSBTYWx0ZWRfXx4NZVnRMZIMo
 F7ZrWs8wUzHyDpq2lFzfwUdlC0rd6oPtAdYBkwcbolGNOnzjmjz0Tcwy+ITkQQAlovU6SZIPO1J
 8dUIciOIG4J4EM0GoIHmuYcnNrG3f2/c0YB6Po81oPrk8DL1qUbvj2VHDPV/YeLjs1Hch2peYgU
 bm8p+qXSvKjfk6fzRK4SDr88/xfYqG0eTQUXv2O/iP7cLMFjjAG+DCSL3Q1K5FlpaKwKSMy+aP+
 Uyel4rqgs5JgMh4FXPa2Ipr4oDzYsozQ77Pgbw8HO4WtSxZdogDK2BBeQjNAUD9eEftRkBew+oD
 Y11gLb+l1CVSEzUBMKSkbCh2ikg92NO0d4POLf+8xH24Ut6732ePdMs3lpKVPW2+GOBpscyGX19
 c+DhgwSkSjkJ1hUJlFjC4hp5L6zC+HJYvFGwS4+ovgu8DFcefGsGKd6AbGjjYMK4F01hKjhyMKK
 a/2jPAZxfKvRqiyqpdQ==
X-Proofpoint-GUID: NLd6oQa2-TNb5Xu77KfsEIW0dOEn9SQv
X-Proofpoint-ORIG-GUID: NLd6oQa2-TNb5Xu77KfsEIW0dOEn9SQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160101

On Mon Mar 16, 2026 at 3:36 AM EDT, Dan Carpenter wrote:
> On Wed, Mar 11, 2026 at 05:25:11PM -0400, Damien Ri=C3=A9gel wrote:
>> If a user writes to the chardev after disconnect has been called, the
>> kernel panics with the following trace (with
>> CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy):
>>
>>     [   83.828726] BUG: kernel NULL pointer dereference, address: 000000=
0000000218
>>     [   83.829288] #PF: supervisor read access in kernel mode
>>     [   83.829528] #PF: error_code(0x0000) - not-present page
>>     [   83.829828] PGD 0 P4D 0
>>     [   83.830126] Oops: Oops: 0000 [#1] SMP NOPTI
>>     [   83.830753] CPU: 0 UID: 0 PID: 140 Comm: raw_chardev_tes Tainted:=
 G         C          6.18.0-rc4 #212 PREEMPT(voluntary)
>>     [   83.831260] Tainted: [C]=3DCRAP
>>     [   83.831426] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)=
, BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
>>     [   83.831912] RIP: 0010:gb_operation_message_alloc+0x14/0xc0
>>     [   83.832366] Code: 00 00 00 00 66 90 90 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 0f 1f 44 00 00 41 56 4c 8d 72 08 41 55 41 89 cd1
>>     [   83.832979] RSP: 0018:ffffb73f0027bd58 EFLAGS: 00010286
>>     [   83.833247] RAX: ffffa44741f72300 RBX: ffffa44741f72300 RCX: 0000=
000000000cc0
>>     [   83.833513] RDX: 000000000000000a RSI: 0000000000000002 RDI: 0000=
000000000000
>>     [   83.833732] RBP: 0000000000000cc0 R08: 0000000000000000 R09: 0000=
000000000000
>>     [   83.834044] R10: ffffa44741f72300 R11: 0000000000000000 R12: 0000=
000000000002
>>     [   83.834267] R13: 0000000000000cc0 R14: 0000000000000012 R15: 0000=
000000000000
>>     [   83.834533] FS:  00007fead7859740(0000) GS:ffffa447a31bc000(0000)=
 knlGS:0000000000000000
>>     [   83.834776] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>     [   83.834974] CR2: 0000000000000218 CR3: 000000000216b000 CR4: 0000=
0000000006f0
>>     [   83.835259] Call Trace:
>>     [   83.835983]  <TASK>
>>     [   83.836362]  gb_operation_create_common+0x61/0x180
>>     [   83.836653]  gb_operation_create_flags+0x28/0xa0
>>     [   83.836912]  gb_operation_sync_timeout+0x6f/0x100
>>     [   83.837162]  raw_write+0x7b/0xc7 [gb_raw]
>>     [   83.837460]  vfs_write+0xcf/0x420
>>     [   83.837615]  ? task_mm_cid_work+0x136/0x220
>>     [   83.837784]  ksys_write+0x63/0xe0
>>     [   83.837946]  do_syscall_64+0xa4/0x290
>>     [   83.838097]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>>     [   83.838359] RIP: 0033:0x7fead78e9cc7
>>     [   83.838712] Code: 48 89 fa 4c 89 df e8 08 ae 00 00 8b 93 08 03 00=
 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44f
>>     [   83.839190] RSP: 002b:00007ffece5c3de0 EFLAGS: 00000202 ORIG_RAX:=
 0000000000000001
>>     [   83.839489] RAX: ffffffffffffffda RBX: 00007fead7859740 RCX: 0000=
7fead78e9cc7
>>     [   83.839675] RDX: 0000000000000006 RSI: 0000563d13f96326 RDI: 0000=
000000000003
>>     [   83.839892] RBP: 00007ffece5c3e38 R08: 0000000000000000 R09: 0000=
000000000000
>>     [   83.840112] R10: 0000000000000000 R11: 0000000000000202 R12: 0000=
563cf8925128
>>     [   83.840350] R13: 00007fead78596d0 R14: 0000563d13f96320 R15: 0000=
563d13f96326
>>     [   83.840635]  </TASK>
>>     [   83.840824] Modules linked in: gb_raw(C)
>>     [   83.841311] CR2: 0000000000000218
>>     [   83.842009] ---[ end trace 0000000000000000 ]---
>>
>> Disconnect calls gb_connection_destroy, which ends up freeing the
>> connection object. When gb_operation_sync is called in the write file
>> operations, its gets a freed connection as parameter and the kernel
>> panics.
>>
>> The gb_connection_destroy cannot be moved out of the disconnect
>> function, as the Greybus subsystem expect all connections belonging to a
>> bundle to be destroyed when disconnect returns.
>>
>> To prevent this bug, use a lock to synchronize access between write and
>> disconnect. This guarantees that in the write function raw->connection
>> is either a valid object or a NULL pointer.
>>
>> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
>> Signed-off-by: Damien Ri=C3=A9gel <damien.riegel@silabs.com>
>> ---
>> resend: added linux-staging as Cc, this list was not part of the first
>> submission.
>>
>>  drivers/staging/greybus/raw.c | 26 ++++++++++++++++++++------
>>  1 file changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw=
.c
>> index b92214f97e3..aa4086ff397 100644
>> --- a/drivers/staging/greybus/raw.c
>> +++ b/drivers/staging/greybus/raw.c
>> @@ -21,6 +21,7 @@ struct gb_raw {
>>       struct list_head list;
>>       int list_data;
>>       struct mutex list_lock;
>> +     struct mutex write_lock;        /* Synchronize access to connectio=
n */
>>       struct cdev cdev;
>>       struct device dev;
>>  };
>> @@ -124,8 +125,8 @@ static int gb_raw_request_handler(struct gb_operatio=
n *op)
>>
>>  static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *=
data)
>>  {
>> -     struct gb_connection *connection =3D raw->connection;
>>       struct gb_raw_send_request *request;
>> +     struct gb_connection *connection;
>>       int retval;
>>
>>       request =3D kmalloc(len + sizeof(*request), GFP_KERNEL);
>> @@ -139,9 +140,15 @@ static int gb_raw_send(struct gb_raw *raw, u32 len,=
 const char __user *data)
>>
>>       request->len =3D cpu_to_le32(len);
>>
>> -     retval =3D gb_operation_sync(connection, GB_RAW_TYPE_SEND,
>> -                                request, len + sizeof(*request),
>> -                                NULL, 0);
>> +     mutex_lock(&raw->write_lock);
>> +     retval =3D -ENODEV;
>> +
>> +     connection =3D raw->connection;
>> +     if (connection)
>> +             retval =3D gb_operation_sync(connection, GB_RAW_TYPE_SEND,
>> +                                        request, len + sizeof(*request)=
,
>> +                                        NULL, 0);
>> +     mutex_unlock(&raw->write_lock);
>                      ^^^^^^^^^^^^^^^^
>
> I feel like we need to do a get_device() here as well otherwise the
> put_device(&raw->dev) in gb_raw_disconnect() could delete the last
> reference and free raw.  I have looked at this and I feel like what
> I'm saying is reasonable but I don't necessarily know how the reference
> couting works for cdev.  Please feel free to correct me.  :)

This is not my understanding, nor what I could see when I tested this.
With cdev_device_add(cdev, dev), dev becomes the parent of the chardev.
So as long as the cdev is opened, dev cannot go away because its child
holds a reference to it (it's done for us by device core logic, we don't
have to take care of that or manually get_device()).

If gb_raw_disconnect() is called while the device is opened, raw->dev
won't be freed until the cdev is closed. When that happens, cdev's
refcount drops to 0, which drops the reference to its parent, which can
finally be freed.

So I think the part you highlighted is fine as is. If you're fine with
it, I'll just send a new version of the patchset with the first patch
fixed (error path mishandled in probe function).

Regards,
damien
