Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAB2DAFA1;
	Fri,  9 Jan 2026 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767940603; cv=fail; b=TTdJoTIN4bB/gy+ehUHLUh148heekxjTSXdNBcVqhLtGltEcZyUC0KRLb8GQzFXBnbGPcdmdyjB/yy79mFSkFOHAS+z06tlZsicipXjClVWHLpxVTvC6VtqLPPYSa/HsFi8CtLarPCjNCIpg900bfLd6fuOYl5npHcVCySGlgA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767940603; c=relaxed/simple;
	bh=kFqypZQrNvxeE5uamwZ/rVF8e36FghPAMs0C6BqK2DY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PHkx/FpHB23ebifnBj7LQii2SPuqZC6S8rh5MFll6nJ0En4708xXbhTv1sjnJlE4j9oE/KIsFCcwfolGztgFY1QfkfvldqOafj+T3BBdsM9V/8SgoAqKbTaRypMs1cT9gi51eehUEBSUz9iZpQYW3A9Q3B9Bj2rVgQrA/Rvdj5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PwJzanSx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YVgNeBcP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PwJzanSx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YVgNeBcP"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096BXT02930688;
	Fri, 9 Jan 2026 06:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=uDU7JkKeZwSRYit8lZQoXDTZh+M00CMP6t2jUGpjJdg=; b=
	PwJzanSxTxs22gMfYTyNrMj107gKYK5QXATRcLOUZuuWzmBEgsuL2JoyJCMOc/JC
	pQ0bvKueVZUFwsoBewUilmwijyoTeC7Y02uPrm5w0BvDdUy/3L1GvKrzo/UdjKPX
	5mPC1qX70LffPvBaT9XVuarNdRQpBZ45Jlb9/bJ955L6Pbl1xfVeLNvyOZo1+EZm
	4lvqI8cahG5AyJTH5lpHCpiaNKv2UesgiVTSiwQjMnRMxlvOsiBN6FoB4QztxYjK
	M2DmNxh/J14Z+uLmF6GTTAj2XnHXt3VflVrpCWjq0IF0vMw1/K1tImD7emKaxRzh
	u3hSN61Wst4CHqjqixtYSA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjv6hr0kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 06:36:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6095NbIu020426;
	Fri, 9 Jan 2026 06:36:38 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjp219a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 06:36:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgQxa7Z7AOAFQt59yz/uk7ExazPSGDWybS1D+rkHnklbwWNGtMcYSjlO4A7pVxy0EpHwvI/Soy592WtzvjEltKaxGZKnzc4gI9y755d7KfNaSbr1/rk3sHG6aYnbYfReZWPfnWGS3jgrqUM/H5N5IrsSxbvHtw7VmO/i/SVjQZNBrdSQcrLiFj1hwPu1zFwyPwcu09ShUxmIROg1NWw+Fb92ekEfdYLt1SL2JJwUC6fiuKnThy6KPqcuDaSi1XT+rbYxGuOR9MwtZYxjXTUwYr0Y7AIHi4iaas79nAjKgxjvBgiXyvZ5PCR4Q7GIqUjT0b17yZSTV9GO7VMFlrOkaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDU7JkKeZwSRYit8lZQoXDTZh+M00CMP6t2jUGpjJdg=;
 b=iRH0U47DPrWKN1DP5yOO/9HFMNcOfxMFAIjW/njytpMgGwnVpnHgcKn/2Mo1JenZuM0gj1MkIHYziJAuDlvmP9gl23hyrgEPMKE2dX6i0pz7TOd/MnE7LUa+2hPWNTUm8EaL1qzhjOjh7o7212rjEnWjXUo0YEaWWpZVbrdL5u4+ANAaaEb2d+U2GKjh7tWvIZQIgAeW+5yqxQ+x78vvtuudhgdy9BM1rrY6fKo6CpqDAO/d4bMt/G+VZLHOJZwL79mEwnm5OAkhhDXF0bpGA4XFdP044LYtGJoWar0+n8jSui65QF/ExQJRFnKUoxSTOHfsBIjRgAiKnPrNpSxB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDU7JkKeZwSRYit8lZQoXDTZh+M00CMP6t2jUGpjJdg=;
 b=YVgNeBcPkWfJCQSnF2FVf7Kyl1PCsodYzOF84WRc+E7iEpaywFU3DdXjLyIb8j5cUwlj1KWJPHncuhEUCmd3mvYIUpbo5JcAfzrCTzVMi2BE4pWGAU9Asher1j6DEL8XpNfB+7Q3YiNNrU/yXGn0A2HMGZdIzMhqrsX1/qLSVqY=
Received: from CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22)
 by BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 06:36:36 +0000
Received: from CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::401a:e126:b1a8:9b0e]) by CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::401a:e126:b1a8:9b0e%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 06:36:36 +0000
Message-ID: <089f7856-558f-4cb9-b56b-3aac40f751cf@oracle.com>
Date: Thu, 8 Jan 2026 22:36:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: [PATCH v2 3/3] staging: rtl8723bs: add IS_ERR()
 check for kthread_run()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
 <20260108181612.2340796-4-samasth.norway.ananda@oracle.com>
 <2026010936-koala-recharger-ca16@gregkh>
Content-Language: en-US
From: samasth.norway.ananda@oracle.com
In-Reply-To: <2026010936-koala-recharger-ca16@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To CY8PR10MB6707.namprd10.prod.outlook.com
 (2603:10b6:930:93::22)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB6707:EE_|BL4PR10MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2d54bb-edb1-4d65-990c-08de4f49701b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnNBUW5iNHhlSCtQQWlNYTlRbWpFMGhNTzhoWXJwQ0NCemUzZ25qQWlSeml4?=
 =?utf-8?B?aDhObVdxekNQYWk2d3gzeDFzMFBpaGhNbEFIcFZ3Y1dwdTlocm9aanZyK01P?=
 =?utf-8?B?Ty9SWGRUVmJJUUtVYXN2Ylk1cWgwWlBhbGtYTHdieEFkTlhYVi9GcHp1Z1Jw?=
 =?utf-8?B?ZlRqNHlqdWU4anByalQ3V2puVzF3Nmw5VXBXOTFvYXJxR3FxRkk5aVB5WFNw?=
 =?utf-8?B?ckVDNmVGSDVHRkRGcmk5cFp5c25lQUNieW1jNUJ3MWdvZU1LRG1yOGdTN1VN?=
 =?utf-8?B?d1g1SDRCN05GMkUrajlubHFSTXdSTW9OVFlDUGNlUkFKbmdjL0FvS0s1eXh0?=
 =?utf-8?B?dkl2S2FnYnpROUlBVEJEejZmVjFBZTNhNXFnajJEWlZ5akttV0FwRm12SHBU?=
 =?utf-8?B?dkhOQ3hDVmVPUkxTTjRWSUZUdERaZnBRTmxPWUNDU2wvanRIdHM4cGM3eTVW?=
 =?utf-8?B?c3BId1pobkgxZHNOcDRzaENlRktYZkFFUjBFemFVMUlTYmlkR2pDTXhmeDh4?=
 =?utf-8?B?WkprL1RNUUlsOVZVWXA2cDZvMEdMaWFZQUdhM09SSG4rQkpiOTNGamR6UDAz?=
 =?utf-8?B?VHpNQ1pGYUdtdHF4SXVZNmVwa0YwTnNNRjVVQkFQdEFhMm42a3g4bnF6ZU1H?=
 =?utf-8?B?SHp1TWZpelh5cUhxWThraXpnUnlNRzNhSEtCc1lIZVE1S0kwV3FZaCtkZzBw?=
 =?utf-8?B?NlMrR1Jyd0tGOE1qV21GdE5HRmZTUjVSLy9TWjFkZVA3UHdyd1JvMWRiRGRO?=
 =?utf-8?B?L1hwbVdja2hoYUVOdEtoa3lkV3c2YStPK25kU2w2STJIOEl5Zmg5SE1FU0dp?=
 =?utf-8?B?aENCMXFmUTZOUDVEMzlNbzlNQmEzTHRLQXg0ZTc4d3dncllGVTBLeWVHSFZJ?=
 =?utf-8?B?WS9iNUNBN3FJY2FhekJUb3dQcm5ZMERsM0crTE5SUGVnTlg2dmluODZ5b1Jq?=
 =?utf-8?B?clBPVjY1a3g1VUt4VEV2YzlRRmdjR3Q2TUg2clZjRm51VlFZWjgxME5uWEsz?=
 =?utf-8?B?OHVWVzJkMEpwZ0cvUDJTbnRRd2dqdGlBa0VTOG9tSUlLeFl2MTJMMTRDbTNq?=
 =?utf-8?B?MmtEbnlsZUhPQWQzcEpJck91bElsSUdTY0NKMXZGRGMvdUVMSTFPU2JsSVAx?=
 =?utf-8?B?L3ZjWE9DWXBWeWp2QkN1QmVPSERaaTl0d1F6Z3FBSDdHaUVSWUFwdkxuMDY1?=
 =?utf-8?B?N1I2TGtWT21tQ2pzWnNCTnA0ZksrSU16V1VBTWcwNzY0MkdYQW9HQWJiT2M5?=
 =?utf-8?B?ZXVwSXZLcTN4ZnFOQ0tJK2RIN2dVQ3l2ai9FcStWNzVFYnNmK2w3WFc1VGp0?=
 =?utf-8?B?REFHbHFBTk1VajFoMlNaNWw3bXJ5dnhWd0xydFpWem1Hd3kvZG9mcXVONjc3?=
 =?utf-8?B?SnBxTzFFdHYxWVkzN1VCbGlkZGpFeGxIdEptZDQrb2hUR0wycitUOEk1MURI?=
 =?utf-8?B?QmtMOVVYWURlbWtMQUdnVlVOQkVpSzlaeUpkK05SOW1jNTZZSVBaRXdMbXhl?=
 =?utf-8?B?clppczk1YjVFSmZHQmZBSnhTVUtHOVp5UzMyenB6OUJtejRsNmVieGdQRE1j?=
 =?utf-8?B?Nlg5K1ZsUitCcEdoZEdudTNZQnRYa3l4Z2kvMFdwelJwMy9Rc09qa3YvbDZK?=
 =?utf-8?B?TFBBWnNNeCtCdnoydUxQL3NkbkN3R3pmU0EwZU1LNklpdXVoMGIwZ091NUYw?=
 =?utf-8?B?dmhwZTFXcStaS3R1VkxEeDNNRHNEdEpyamY4dCtRQUUzT1N3S2czejFjc2Fa?=
 =?utf-8?B?K2liT29BZ3hRYkNjak5IeGw2dkQ0bHB5UjhTSnN5WmVLR1Q1MzMxamorVVFF?=
 =?utf-8?B?L2U2aXF5THU4Qi9lNlR1ZWhyYkU3bFE5WWVOajRxMVhaZldIazVSazNVeWNY?=
 =?utf-8?B?TDJJT2RpK0w0Z01mYzdYOERXdlEvK3RyYkdYV3JoaDhLc3FrL3pkbjFtU2lB?=
 =?utf-8?Q?uYwjSUKSGyjC2nGJzCLfVwNHdWt1Ittk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6707.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWNnMHo5UDBzK3BWSk1WTEZQSGl1K21DYTl2QzMrRm1zUTNmWHM2QWJ6bUND?=
 =?utf-8?B?T0tmYWpOaVQxYyt5aGlObVhlQm5DWTRrVC9PWG5heHYwV0ZLZmNid2hTOHlR?=
 =?utf-8?B?ejlnTXBNdko3TmM2ZHpQL2ZleFhOQ3RSOHM2SnFReFBFME5zSnE3enJkdVB0?=
 =?utf-8?B?SEVOeUE5aGNqMnRjVVpVNGlUeGpKSGZ3REpZS1U0NHhXRlVuNlZ4dTJiMGhW?=
 =?utf-8?B?bU9WODdueXE5RnlUWWREdENFWHVndGl0WmhYMk83UmtsZEwvUU9CTmcycks2?=
 =?utf-8?B?TFNoREx3MDBWUHRRakVOUW14dnQrYWsySlFTZ1FRUlJ6RWZGUzI4d2Vtd1lj?=
 =?utf-8?B?aHgyNlRHaXJxcGlvdE0zYjlSKytRbnZOeUI4c2NDZUdER1FoNG9VN3prZk4y?=
 =?utf-8?B?WXAvS1cvL2hXaWpSVStwZnhCWElidTkwOTdMajRmTVFmM1k3UzV2WEdSMVRt?=
 =?utf-8?B?djdqZ1ZwdmF3Z080VkpEOHNhcVpNQUkrVFJEaWxxcDB4Qmp3ZGhDaWY0aUZT?=
 =?utf-8?B?QXFQbU1xZUxmNHdsUkQ3MnFOaHZLRnJtdjlqbytLaXh1WlhuS3p2U1JmY0lQ?=
 =?utf-8?B?TUJUK1c5RXdqUjJiN0FtSTYrSzhXTFpCSmpweHRaM0tGZFkrN2kzQXVWQytS?=
 =?utf-8?B?SXpLZUMrSzFod3JCa1pnQkI2MXVrR1BnSEJCUnRoS0NFTTJUeXY5NjJyTzV2?=
 =?utf-8?B?bW1kcmRxSGgwbi9mc0FRcXJKVC9NVjd3cHhrdUN5ckFYUTd2N1J2aU1RWSs1?=
 =?utf-8?B?anFvaTVtb2xha3hKbFZ2WDMwZTlIZmdnUldLcEo0aUpHN0laYnprQVRlMVBu?=
 =?utf-8?B?R0NiVTk1YjhTN3RtQnZVcGtFU0xKQytHNnB0anI2ckR1MWY1TndIb0FuZnJk?=
 =?utf-8?B?dzhpeFJqUVZsaFpMYjBsZTQ0ZkVnUk5pUkFXZmU3czZrSGQ2b0prNFFZQWN1?=
 =?utf-8?B?V3ZLUzhldkU5K1VKVE51UzdRWHlHUDlJclh3QnMxdG1rcnZ0NE85SlNHOWRs?=
 =?utf-8?B?YUpqNGFKVzl6WFRsNjhHcnRoeXRZdm4zbFBGOU1LZVpiUmJDbUNLUHlQRUl2?=
 =?utf-8?B?eEJFbjhuWVY1YXAwaDNTenV3ZE1wdUVrZGZyVjRaRURzSWp4OUEzcjlpZDdB?=
 =?utf-8?B?cFlBa0M4U0ZRaFJJYnowNDdZcVFzcTdCZkRjVndsVXcra3M4bmJGNVUzK1VS?=
 =?utf-8?B?SXMwNmJHQWk5WXRMOTY2WC9JQVVsNW02Y2VpLzRpRExuV29NWW5SVDNuWnYw?=
 =?utf-8?B?eXYzSW8waStuT1FhNmpWdUZyV3BScGlPQlJkODcvRmxhYW9YSnR6ckpiNzRB?=
 =?utf-8?B?MkNGemZjWUxVdjJPdTFDbytCUUxFL2ZNNDNzTjloeEVHYVpFYUp5cGViL0Vz?=
 =?utf-8?B?M3ZTMHBzN1NGOW5XQ0ZvbmN1QzVidW13VnlyUHVvQTZrdWVxakVNTy92ZkhD?=
 =?utf-8?B?eXlxZ2NXb3YyN3UweElJYVNrRW5tZUdpUnVTN05VWlBpU09GS012NXpSbjlL?=
 =?utf-8?B?ZVdodGEycXBOS29WTm9vY1dWNHgwMHBQdVNORGNzRnBpc0RkbXZLOW9PVllW?=
 =?utf-8?B?d05Dbm1rT2JNemlkT2NOTm0vamtidkJKS1dLTUM3ZSsweXk0MzdXZ3cyelBR?=
 =?utf-8?B?aU9zVEl6WCtMUFlEK1dGbGFUTStqZ0QrdjdKRGN4UmdwT3hpSkJkZVNiUUV6?=
 =?utf-8?B?UUJlTTJtaEdLdFhEK1NpVEJGT203My8rUEF0b1doSkFrOEN1Q0JRbHgzM2Fy?=
 =?utf-8?B?V004YkNJcVhyWmJNOWlSajZyQkMyTkthaG1IMVFYbFQzMEdidklNOG9IS1F2?=
 =?utf-8?B?UmlvTGdWNEx0MWZJbUJkMDBTSTkxSkhLTTRrWE9URlZaQkV6bHdCR00vTk44?=
 =?utf-8?B?WlNRdDdlS2hSaVlGalZSaFBBSlNHMFhxdHpQUjN1YUx0cGJpZEhnZ3VyQW05?=
 =?utf-8?B?VkpZQ1ovUVRVT3BZdTRCU0lyakVwUzAwMGVvdlh1L3pxSHpTeE9mOWVHWGc4?=
 =?utf-8?B?aDFJaTJlZDdoQy9BVGRka2QxUFI2ZFhCYWVMdW92ZjNhZzEyZUQ0c1REZ21G?=
 =?utf-8?B?WXBHVnRNMmhBT1pRZWNSV2g0TElTM1ZhaWk1ZHRLek9vYXk1MEdRS3h4cHAv?=
 =?utf-8?B?b3FTV3RLTnVrUmdlWlVTaDQ3QXdZdHl0ejJTUWtlMmNUNGpvblh4VXNQUTVT?=
 =?utf-8?B?bWJlVWk4UWpRK1d6NE5Zd09MZlY0NDVVWWo5V2hObGhZVk11dlJuUzdvcVU5?=
 =?utf-8?B?U1BlZXlRdXdCcXZhRFJwc2ZkcUlSYWhnK2JoY0tCbGpLYWpHbGN4NEJ0RHdw?=
 =?utf-8?B?TkNBYTV2YUhwaWQ1K3Z6ODNNb0k3YmJKRFliV3Y5U08yV3NvL3V1Q3BEb1Np?=
 =?utf-8?Q?uMWIqo2r4sw28q0RRFpLVgu3eZ+Urea/2WzDL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GoYkBfWynPmhikpVzvRLKJWn3iqc1fTcoFM158K50HP/LbuZPwdUVuIzjtgweQVUHYzD7zJmUBEJLHlcqJe5Qoxns+CYL/E6gxECXto9zszxYH8+iepr99Y6Pk4V9WnTYcjndL/VAGwD9F56Jtc7InWK+EmbeT9l3QBr3kgOH8/nr8OHL19DTuQ8fMVvcUYepp4Z9Up2PP/cU0m6mTDK2iahsDWVBUDWAC2+r/MmPUHJagLwdW/ovqd0rXt36FDUaFtmnfr6c3pc0HDY8vBbZMC56g77uV3uKmezfJo8Kp+oPVU2RlVcWxJrlmG9ICCb2P5PMzj3TspertqzTlP8HJCa+5nz7d6JV9DC8iMnYGIgmRSZf6XhnJ/ipXk1ghK7Q5Z4TRC5gDz+XmQk3Zq2v6uYLdrZRmEYFhLQTXHGzLgzcrjfS1bcMB0WgFhy6N+KBCLXdutJFLN45cj9wUwTLxY0X63kg0U16n9eZi5PZHi+r/SMeD9BStKK6kLikwJ2JL8cLZ+vFfHHY4t0DvG5PZF6Cl5bQeyoEn3M3vRVOiGTWCmZrSJTVX2a/kfY1w5rAZtnvfrGgdpnVoE433y3VBEoFg9IWeTIifxlz5hvZnw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2d54bb-edb1-4d65-990c-08de4f49701b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6707.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:36:36.6696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7N+304AqMz8LnEcMNnOvNpuuH/EGXVQmNewVYjGM/mb9weRRhonaNIBTEg/CZ9ZoM6NhjmTfOJlTXja3+u4/IQVSJdALCSzKhj10eajrFvw4G7P57ZD8iEXCdpqggh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR10MB8229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601090044
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA0NCBTYWx0ZWRfX2rbI7UaCRlAN
 bDB6IEo6WszHZNEA/iC5zUoVTir6GYUNy2L5fnaidLIsPHzrcN3nIy426PaGmTATQZzS9KkWka5
 gBdnVVF1AH8EonaPPOGWi7Hn6sJYuvpAMfpZXX3o39BD+AYJ9SgAW+g/xmX6gXNx3wrQJCfqPZA
 Lq1VSFJe0/P6UzoxnebKhgPipnlPcGvBANLZTTO7SN7M5d9zJQcaIMjdM9e6zAkMbNwYQRTm+Ax
 X7LNFTfPO24htyDicQOyfhrSyDbsxBWuHcKVTsmEz23rYBfSQSB1h4NBnsYekZ+WKyfKKWxNXmg
 yFD822jQ1ffRfvI8d+dsr2/J8zMsPfhCnASLJhhJdB5odBml4y46oZadY4oRuH53qqAN0RpeU0k
 u06iBN/8O3fAGfn6uXXhSGL+2rFYsINUTx3cvO5ImXa9KUgJ6aiXZ57iYK3emxWSs+4L0UU4RJe
 37mDOU4CAeDssOCe1aZ7srbC8XFp7aou+ymF0Tpg=
X-Proofpoint-ORIG-GUID: SU9jHeAwHSk6-ELeUXDP4tG673YCfaxL
X-Proofpoint-GUID: SU9jHeAwHSk6-ELeUXDP4tG673YCfaxL
X-Authority-Analysis: v=2.4 cv=T5+BjvKQ c=1 sm=1 tr=0 ts=6960a1f7 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=P9UiLos1RID9YayvY_MA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12109



On 1/8/26 8:50 PM, Greg KH wrote:
> On Thu, Jan 08, 2026 at 10:16:11AM -0800, Samasth Norway Ananda wrote:
>> kthread_run() returns an ERR_PTR on failure, not NULL. Without this
>> check, rtl8723b_stop_thread() would later check "if
>> (xmitpriv->SdioXmitThread)" which evaluates to true for error pointers,
>> potentially causing issues when trying to complete or wait on an invalid
>> thread. Set the pointer to NULL on failure to prevent later code from
>> attempting to use an invalid thread pointer.
>>
>> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
>> ---
>>   drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> index 56ceedd5a26a..27d490204fcc 100644
>> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> @@ -2922,6 +2922,8 @@ void rtl8723b_start_thread(struct adapter *padapter)
>>   	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
>>   
>>   	xmitpriv->SdioXmitThread = kthread_run(rtl8723bs_xmit_thread, padapter, "RTWHALXT");
>> +	if (IS_ERR(xmitpriv->SdioXmitThread))
>> +		xmitpriv->SdioXmitThread = NULL
> 
> Shouldn't the function be returning an errror if this fails instead of
> relying on the pointer to be NULL?
> 
> And this is a "wrapper function" and only called in one place, why not
> just get rid of it entirely?  Same for rtl8723b_stop_thread()?

Hi Greg,

Thanks for the feedback. You're right, just setting the pointer to NULL 
just hides the error. The wrapper functions are unnecessary as well.

I will send a v3 that removes rtl8723b_start_thread(), 
rtl8723b_stop_thread(), rtw_hal_start_thread() and rtw_hal_stop_thread() 
entirely, inlining the kthread handling directly to 
rtw_start_drv_threads() and rtw_stop_drv_threads() with proper IS_ERR() 
checking.

Thanks,
Samasth.

> 
> thanks,
> 
> greg k-h

