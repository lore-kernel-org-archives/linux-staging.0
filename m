Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014AC27E074;
	Thu, 18 Dec 2025 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766077237; cv=fail; b=CY8vcVj3i1zuvg+3n+GfXU93B6F9TbV1Sz2BY29xrJ6v0LjjvP5YYYYjKQHHeM6T2mY+P/lWuu6LsN2qq/JAuVKdEmncRA74c2zwCk2Tj/4qwu5wqSKob/gDsAzHXm/yuTCO8+inRPbD5B6pZIOBsJlxOs4i273sjb7P7MRTkuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766077237; c=relaxed/simple;
	bh=d/gKEPIhQexMXUdlg9LzNB5b2yaqxwr4XVUXlDSn/zE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DK0JoHQ9p+IcESAvkPMdrJDvwHWf4ixJ1n2NDV93A6I0AeflQUhGvVxv5xcrzxO6JIWqBHu+EIgiso8EqG/X64px8ERJYbTReJb3cEBVAoxE09fqOVDHVTf8p+QC0vQg6uWPBffi7T/C+c/yq046/cfj6+S5J7V+MtXGkC8C7IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QSTT0+hU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AXTA2Eyx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QSTT0+hU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AXTA2Eyx"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDCLCR973246;
	Thu, 18 Dec 2025 17:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=23V035Ca3Sb0Nikes9krg4n6dItgtwTifs62kaCfA8k=; b=
	QSTT0+hUnIXQzwOiqoJKSpYee+QPKaM3t0JC+cAItDG+mPRHOtUlCArJYkC1TfCA
	FijaLgxAFBZmmkhrY1TmLA10s338EcIhSxwDKTI3VSOiAazkJ7zxhVVryBpVAysU
	JXqCtG1+cFttJUDMrHlOlZzm5MhyPdXYMehPpCbs0BnOFz0SlZWWGetwOddIa273
	opbXS2invL1dBRtAOAhldwjPG4L6ci73S1upTVqBfarwdy2rkOLvDyDes5Fydi0L
	pESIovlesdPH1aAWrnY7vhwvYb88zriT+1WJK+jzYe4Zjs2RBJ60C9QdMEwS/vvg
	yNcnLe89+I6tb6ca425MEA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b47ay92nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 17:00:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIFmEMb016420;
	Thu, 18 Dec 2025 17:00:31 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkpnq7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 17:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mazJ9FCRhAFFGsSdLhVa59dJ4un/bSwuaT6vf4KUC1rZR6hUl/DYW7nen51ko2thuMdL/gHmKZ86ViJKjec8Cjg05JIsR5ms8NOUM18XlbXkqt3R5/WalOAjhgDChTdOXgKy+GmyLjTmy+87CfrYmYopj4YpCWW6SCOniqPm3/7UpnsiAkXjRK0oUdcmYlSPWycyhfCGLkMvw37qFAj1pahqEJHpaXTQvdUbxyVE2QwNa34WxtSI9Rde9Z/2N6aqUAC41d2fctI/ZM2m9n6u7cLO9pE9ujyXXlOZ8i7/7LEllr+oXozcBUUlv4xhCckTQnFsLPP23j1ylx85evKdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23V035Ca3Sb0Nikes9krg4n6dItgtwTifs62kaCfA8k=;
 b=pH5cXIFBfnRbFDKDiOuoS5L4i44x4lBgy4CP97kMfMYf9z+RIX2Y4TcOzzwCVX60yaWPcWeoibV68GfH4iOLJxql3rHuIazbjrbywXdukfwGFuzzELE5cZ6z9x8oYM09yCfs6gxxJ7sWeiIqoTFNvWOhxQdFpLb6hRjXi+WcQrCfz5kFIjtTRYlvvnOFdhjsE6HxDptg+YTjg28VHEf/UEYu+LotNIVf1LXWB7FcEHgJVwTs1fONMX+g32FVT5ZZO07V4WPgv4EiwaY4vZ4u+v72A6C6Wd6So+2FrrcHWclAggTtz0emYl0JWu/huuCDn+X61m4gIc9wRSE0FNK1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23V035Ca3Sb0Nikes9krg4n6dItgtwTifs62kaCfA8k=;
 b=AXTA2EyxyaZG72CfrXN5is5lRbURyuv+JWHbWdR6gSEcQgifRU7xVPKRO8duuW3QG0d+YgnfUs/w50QixRZT2ICUQED8CNFMtpwNCrAgUkm9Bjg+t1YPxoWwdH4UPvdWkfewQ51nPbDg+jcSDP/JtdO4j3P/baa5/fGUN2DNR4U=
Received: from CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22)
 by IA3PR10MB8162.namprd10.prod.outlook.com (2603:10b6:208:513::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 17:00:29 +0000
Received: from CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::401a:e126:b1a8:9b0e]) by CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::401a:e126:b1a8:9b0e%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 17:00:29 +0000
Message-ID: <cf4400d9-2ea1-4bee-997e-94e27abe4166@oracle.com>
Date: Thu, 18 Dec 2025 09:00:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: [PATCH 1/4] staging: rtl8723bs: fix firmware
 memory leak on error path
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
 <20251218011414.1781294-2-samasth.norway.ananda@oracle.com>
 <aUOp5rEWwjOp6-nU@stanley.mountain>
Content-Language: en-US
From: samasth.norway.ananda@oracle.com
In-Reply-To: <aUOp5rEWwjOp6-nU@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::6) To CY8PR10MB6707.namprd10.prod.outlook.com
 (2603:10b6:930:93::22)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB6707:EE_|IA3PR10MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 305cb823-49b3-48d2-51fc-08de3e56f27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a09CbWJjQkdpSDJwVXQ1eUt0ZkI1ZElpUlRua09ySTVlQW41SzhBRnRIQXRE?=
 =?utf-8?B?Skg5Sk1BRk1QNU4rZXZDWVpmdzNMZ0FoWG8xbXpha0lJaEQ4cDBDeEcyTU5o?=
 =?utf-8?B?bGdQc2VrSWtXVVo2S1Fsa0FTQloxbzNtWmRHZXBLUm53WmhMUitheDFBbkhY?=
 =?utf-8?B?NmpyWHFQZ3UrbTlXV01uR2o1cjc1bUdMVFhzKzBMS0lrUDZHbFh2WTJnMXhK?=
 =?utf-8?B?NlFpRDN3c2duTitQUVY1VFE1TzA5Qk9lUWhZK2tyTFlwei9aaEY4b21UV3U1?=
 =?utf-8?B?aXlrUnlyUHpNMkNjMzhYcis4RFFEbUlHTTdDYTBibDdvY1hid3lmNUpPUlFT?=
 =?utf-8?B?VDRSVWo3N0ZyYUMxTjVhZ3RqQWE2WjZ0Tk5xUE9Va1l0SFp1dHBSVGpNUThv?=
 =?utf-8?B?dnhuSjBHU0NEZS9aS1JicWJhT3R3dlJnaSt1dzF1cjhaU3JjK1p2RTdGMHJj?=
 =?utf-8?B?WmE2MXQwSHoyT00zeUhVc3MzSzRlVEpFWGhpM3VIUVRick9jNVdsVmlCN1hL?=
 =?utf-8?B?eWs5WTVXQUg3WWx3dnZMTENaL09SbXhKQytVdG5Yc0F3bExYMkc3dGNDSjVG?=
 =?utf-8?B?V2k3OWE2Ry9TR0ZjcEFGcUJBUVNDTkM0S0xCVUtUS0RYYllOSFRFcG1WVVJO?=
 =?utf-8?B?bFJxV3hlUGJDOTVuM1RUNUZHNjdaZ1NoQUh1dlk0U2g1aFJIZWxZNjBKOUwv?=
 =?utf-8?B?WWRJamUydGg4Q2x3VVFOdll1dnU0clFqT01aeFpxcjE3MVNVNWx2TCs3MnQ3?=
 =?utf-8?B?ZW5TZ0VBdU5pa0ZMK1BHanpjUXRSSmFFaHU1WHRGZHYxSlpGMmRiUWZzZ1Rz?=
 =?utf-8?B?VDFhMHRxeFlnZWJvY1o4UXJaYmpFajdveUlCWEVLWXI2WXMxN1FmY05PSk9J?=
 =?utf-8?B?Z0VSK1hRTllVZHdjTDd6MlBlMGozaVBGQSsxZzIxbjJXd1kwcFVUbDFZcita?=
 =?utf-8?B?SWdNdHUrNEhSTFBPRFdLa3BBaUVCQUFGMTFFMEFya21Zc1JJTHJHbG5oK0RV?=
 =?utf-8?B?elk0VE1jcXI5SWpCWitscHI0VkpuVnFOWmhwUTR3bUxXams0cEc0YXZFZFFO?=
 =?utf-8?B?TVc2ai8vTUtLQVRHenB0c3lYd0hHVmJXUDBoMG5ma1lITkh2citTbk56OWpE?=
 =?utf-8?B?cXd6OEY0ZzErcFN6V2RxNU9UN2NJSnRlanFJUFE5a0cyV2dEbkI5ekNUVkhG?=
 =?utf-8?B?OHhiNHB5QU4zRmYrS21Vb3VSSy8vT1R1TnovZW5tMnFORkh6WnpMWjRJN2V0?=
 =?utf-8?B?dDVzbEZybkxEY3drQTRwRDJJam9XRDlSRTNRcTJDby9iRjRIQnRSRVV2dVZX?=
 =?utf-8?B?UmQvaTF4T2xveGZNejlTSkJqWWZUVlBmMERvSVFyMXl5bU40TURVT3VvMjIw?=
 =?utf-8?B?T2NTWG83bm1zaVpwM1VvM09Za0p4amZENFhsTDZneE9CbnJSaVU4RmI5Qzgv?=
 =?utf-8?B?WnFCSDl6cHh2VVNZSnBJK0tWbmdBVDNnVUswOERtTjBXenAwMGVIMkJDYW8w?=
 =?utf-8?B?UmNtOEsyTUROS1V1UW5idzNGanFuUDRRZVFUZUZzRmtXdDIrVGZFaXg2Slp6?=
 =?utf-8?B?d09lWW9iVGVGZHcrS2h0cEVLZDhqVW9yeWhVT0NKcnp6cGJsRHAvai9pMWVM?=
 =?utf-8?B?UWcrZmwzSFdNMUczaTZ1MVU3eGt0alFka3ZsekQ2UEVzUzlGRnZ4cGxoUE54?=
 =?utf-8?B?SDBRRkZyeUZ2OHhleE1mRVpOWVFOR2tJakc5ZHEvWXkzOStzZkNCQ2ZUUEc2?=
 =?utf-8?B?WDlaMGJvQzJydStyaDlwd2dOdExtdU1qamRlZVNGV3RZVTMxaVlnYWpwZ20x?=
 =?utf-8?B?Qlo4bXZXU3djbGNON01xd251SVdjY0JqS01aNXZvTHRSdVRSTkw0c1hSTEh3?=
 =?utf-8?B?UDEyN0FZQ3g3cUFoTjRzMnloQi9lUjlGQUxnUGlCNmVHdjRHRkwwcnVsSE83?=
 =?utf-8?Q?dYiZD+jOI8ghpe6IsfoxrREi/75o3DID?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6707.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzJMQmwxNjMyc3dQVzhCSGx3a3pRb2w0T1BoTTdNQWYwbXZ0QVA2TWwxZ1hE?=
 =?utf-8?B?cENPTE9FVlJ4cml3VnYyaHlJck0vdnV1ZXFKSFZNYnYwQWFiYWxOY25FYkJj?=
 =?utf-8?B?eTBDc3BHN2NrUmpHdjZLNGs3N0JKVDJpQ1NHVit5WVQvU0JEQzlXRTJEbktr?=
 =?utf-8?B?U2lZcWl2b0xrQ3c4QlJocG94TCtJS05yajhtU2ZhcDNReUF1UlJGZm1jR08z?=
 =?utf-8?B?TkpZVDNyYTRJZUp5UnBtVmpQNjl5MVZCWURjR1gwVWhxMlBFWFZVdFc2dUxz?=
 =?utf-8?B?SUFydFZKYmZiTnpwbVpmRm5Gd0ZYTHBTQk84NnFldjBsSjJNbVBkYkNKbUVZ?=
 =?utf-8?B?Q0ZpZVQwakZlREFvMnNGQUQ0Zll2Z1Y2UytjMDIyTGgvbVBTelRYYjhBMll2?=
 =?utf-8?B?NG5VYlhmbk44UkF5dzBGNzVRcEVjZnJ5bFNwaVVzcEg5QkRtYmxrdkRGMXR2?=
 =?utf-8?B?bTJkRGRLN2JZU01SSVVTbG9GZ3dsWXY2Z2I3NkZkQndBeFZVM3B0ZUJMZm0x?=
 =?utf-8?B?bWNueVhpMWt0Y25hSHJNd3NyY2pnMEI5U3N5b1pyZ0Nnc0oyRVFHNGt1NGZj?=
 =?utf-8?B?Vk9rR0NxQUlQTWNmczZjOGJDZlhubzU4K0hZUVUyNTk1Y2xaZ2hBU1VJak56?=
 =?utf-8?B?VHdOZVlvWDl6SkZwZFRJSHl5T1l3SjlLOExIMkZ6QVE4aGY0UXRJVEtUN3Ni?=
 =?utf-8?B?Y1VzT3lWZG1oalZOL2xoYnNtR3c3OUt5T2s5YnRqRCtUS1cxemFna0lrbm5I?=
 =?utf-8?B?MFR1THRRYlZDa0dqQlJnNWpUZ0FnYmxRYnpaaFpyemFnSEcvUEVXcWFpUHNy?=
 =?utf-8?B?NDZEaHVVVXk0Wml3ZTdhN1gxTmVLanFDcm9aUnBuYVp3Y1hpR0pWck5yNWJW?=
 =?utf-8?B?V3VYQ3pSMUpkY0p2UXhnbFQzU3d3M2RhRmdSK3BKZmZuajBkc0JCYUZJcTVa?=
 =?utf-8?B?dHpPSkI0c0djTlFtMXBsWDlPaTZLcU83Z3FneDJLV21YSWovaGJTMnRKVGpM?=
 =?utf-8?B?RUNXc0hvNFRMZ3dxYkZBRFlWS0p5Z1h3U3E3bEVaVjZKRVNickFuNnN5ZXZV?=
 =?utf-8?B?Mjk3OGVMcTZpaHRXNE9hT2pIdkJEKzRFUURJSXEzbkxJZ2M5ZEJQQ1JhcU14?=
 =?utf-8?B?Z1ROUXkzNFR3UTNIVFRmSXVkWEtuRVR5TkdoNDVuTVNXeUhsa0dEeE00WFdN?=
 =?utf-8?B?UGVDYjJSckFMdlFwd2ROOGRKVWJobHFiN3ZXV05KUElramsvKzljMUVOSS9k?=
 =?utf-8?B?Y05ubXV5WDJ6a0s4QkhTZFRBaFlXTzc2U1NFV3A0SHV2TU1TaEZsbVpNeTJO?=
 =?utf-8?B?K0Z3VGt0NWZUUHJENGQyV0VRbkdjTHloYkZ1RXpwQmxiNzBZTFg2RmRla2Nr?=
 =?utf-8?B?R2VsTnRzdUw5OW0xRG45by93NDBDOTEwNHVBL2k1Y2VuQ1dDRVlLSWF0cXNa?=
 =?utf-8?B?YTFFS3p4VjdjeHdRS04xcUhXZzM5QUhBVS96VXZmOGxmT1V4THgwb3dSTUNJ?=
 =?utf-8?B?dklNOXlrWXZ0Y21yQWI4N1NkM0xGVnlDTlNVZ1NmaHZkSmFEVjBtSHVka0xi?=
 =?utf-8?B?MHp4WUxET2kwbkMyOXoybFpPdnNXK2Frc1Brd2Exalo0bm9KTjJtQTVRdk1r?=
 =?utf-8?B?K2ZyQVliL3ZWOGJqZ3FXMzVIeFYrUURwZXhTTURxNXQvRUlkMDdyaDdkdUFM?=
 =?utf-8?B?UkM2Zk5hMktpdFhtVGdNNXRtR1lKL3RDVUdldm9yRXI3MzkvWjFscWFUVkVF?=
 =?utf-8?B?WjBzSjRxN0piblpNNGQ1UEQ0Z251OGx6YnA4NEM1RDdJMFRPNmpwMUt1K0J2?=
 =?utf-8?B?V2ZpK2FKbDVZdFJySitpdUhwODJzdlpVZ09QRTI0NTFzenoveGxJRlNBdXMv?=
 =?utf-8?B?WTZmOWZuNjk3WGFNdkpvclNqSUd4MXVCUlJUeEo0a2dIaG52T1h1UGJyc1RP?=
 =?utf-8?B?S2xBZm9USno5dkgvOHVYVUNVSHJjNWV2SkFsM241TW5PR3JKV1duTzJubWJt?=
 =?utf-8?B?OUR1aGZ2YllpWENuRHExMVdzQmhYc1hienlSZ1RWa0hZS1RXMTRkaU4vTUND?=
 =?utf-8?B?UmZkbnFET3d6Y21kMXd5a1pRa1p3M3ErbzNlanZjZ215VzRSWGN4T3JUd3Ex?=
 =?utf-8?B?VGt5ejdqTkFJeGlKWjRLcTE4dkRZekd1R20yM3FWUUxKVkM1aXNsdW9yYkJ2?=
 =?utf-8?Q?fEHDfZaFWni5BnM16loilKg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DamopOJqmVddAlVOIPG3iMEzo9qJ+Zfuk5E3rh6zISdu5FhYkiAqiDBqzKCrsjoiKfhWq2qkt6ESNSmdSTRpnIfgfuOd8rkL7hkXR2ikwqhS4jYPqqJS48oewMigDmmCfpi31rlU2Aekuna3bnnh4gO1eYz6+4RMFFjTdij1vM59DYHjtA0+vRxYAQB9pWzPWp1ldlA+mB8NIj60HGgvcXgMMLd3Y6HafVK/fIXZJkA0KQjpN8ZZGyHOqeqK0+IruSjPuAGDl84gqutjU8Y5qCrRjeYSyB9kn6Y3tfM04exfhRX7ukOtMLPS4T4iO19hNzMm8xagY61W6u2b19UMPelj/2chwnet6IU8bT6ERV8orETBKuBYi33YqXk2tbRV2BCNPzaRi1tSpo5J7gAI8aW2LE3qrBJykQTYnnqENIrEwGyNkNhmNq73qizPmxuy+hy5ifzuKyY7nE1F4Cne6L5okSZ1hs1WYK3ZcAkjE7tyY3MZeuDxOsbXt/ZFKaRcUHixw+sFjHxbCbZIxVCAXcTbd3AzM8/Y6J2k/K5HysVEpwIyz6XYxbiSTFgm9FyFyk6lHHgw4yiXeXe7WBzpFPfloYUYrKnWdssjtDfD91A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305cb823-49b3-48d2-51fc-08de3e56f27c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6707.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 17:00:29.2438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KzdbE+u29EZZnyd24+FD5syAW06EabQV7EFY339SUP2Jh4uVA8XBwAsePSeBAaNeGswhNd2D5WExLhJTpzEkXg4rNrc4AW7Acpol9+/32FdxB0s0AmbWov8tXgx1IEy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8162
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180141
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=69443330 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=chhHQ6rIZJe84wszLZcA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12110
X-Proofpoint-GUID: vxnlxCSR5pOSqhWDG05CSu4LL_gT7DpD
X-Proofpoint-ORIG-GUID: vxnlxCSR5pOSqhWDG05CSu4LL_gT7DpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE0MiBTYWx0ZWRfX4P8otFgoSl2a
 tJ1as6cSc2+4B8mGhhECK7WjXUPOS7h8o7DY34teZE47g/pUWrWFc4ytiUJHF3rn7dAJc952pOJ
 cancI9rrWRuYVor2ZwkqEgT/++g4Gn7OB5KYnShvydViH7SKAlrCmvHTxuHazdPECua421+bWF7
 DbT5wPGD4af0sSWMIM6xSulVHDxukQvS+Ds+mcJ9ZvdKbLnXE1CaVpjYRB7ke62fBhJo5I+NQgW
 WAF7ss/q+agSMAanugNap95b6q5kBF1p4NEDbLcJRvV47Bp5aqvfKrqEWG2qzJh/bOsEQRe9a+9
 Ysv8AGCpryvw7zbZ0PflDsb6U+iC0TpSDIZRVJ/Vwt5+is4RFCBJN/izBkgOsrplL1MWWX+S+tX
 kbqX+6DG5N/VQzwSoFXHRVWMhYk3lG7VFxHY6k5MQMilJuhszP4=



On 12/17/25 11:14 PM, Dan Carpenter wrote:
> On Wed, Dec 17, 2025 at 05:14:11PM -0800, Samasth Norway Ananda wrote:
>> Fix memory leak where firmware is not released on error paths in
>> rtl8723b_FirmwareDownload().
>>
>> After successfully calling request_firmware(), if the firmware size
>> check fails or if kmemdup() fails, the code jumps to the exit label
>> without calling release_firmware(), causing a memory leak.
>>
>> Add a release_fw label to properly free the firmware in these er:qror
>> cases. Also add an error message when firmware size exceeds the limit to
>> help with debugging.
>>
>> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
>> ---
>>   drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> index 57c83f332e74..0eae624a36f0 100644
>> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> @@ -345,14 +345,16 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
>>   	}
>>   
>>   	if (fw->size > FW_8723B_SIZE) {
>> +		pr_err("Firmware size exceed, max: %d, actual: %zu\n",
>> +		       FW_8723B_SIZE, fw->size);
>>   		rtStatus = _FAIL;
>> -		goto exit;
>> +		goto release_fw;
>>   	}
>>   
>>   	pFirmware->fw_buffer_sz = kmemdup(fw->data, fw->size, GFP_KERNEL);
>>   	if (!pFirmware->fw_buffer_sz) {
>>   		rtStatus = _FAIL;
>> -		goto exit;
>> +		goto release_fw;
>>   	}
>>   
>>   	pFirmware->fw_length = fw->size;
>> @@ -415,6 +417,10 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
>>   		goto fwdl_stat;
>>   
>>   fwdl_stat:
>> +	goto exit;
> 
> What's the point of this nonsense label the just does another goto?

Thanks for the review Dan.
The intermediate label that just does "goto exit" is unnecessary. I will 
rework patch 1 to call release_firmware() directly in each error path 
instead of using an extra label.

regards,
Samasth.

> 
> regards,
> dan carpenter
> 
>> +
>> +release_fw:
>> +	release_firmware(fw);
>>   
>>   exit:
>>   	kfree(pFirmware->fw_buffer_sz);
>> -- 
>> 2.50.1
>>

