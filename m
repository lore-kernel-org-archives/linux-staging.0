Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C2B23A994;
	Thu, 18 Dec 2025 16:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766075510; cv=fail; b=LkqlzMI7Bi/X8pFYnI0Kxs5JW+ym9dsuDNXBZF7w5tdR2H98DUUbONzwaLcKTExnby5sSnsh6xS0SfCfXaKrTKisAT6IkmkJotoAB8ilEVOGGIh5tHW0ZFIxIo5I/RR3aF7Y6iTTcp+12OmiMDmIlwRTovm6MebVMwAArO7GuOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766075510; c=relaxed/simple;
	bh=08PfNio6H615goAGb0a5Jk5wgIXtCKmDraq/0lfq/bs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BIvs8e1Kf2LEB+b76QCBniT/cHvzQO+5c9h2Wu2astDgXo29EH5ffG0Td0eZgNM4gKjHLC7k8XMf6eIZ1/vCxu+29jh1ggB9QPoUb3iYZCevMavSxFrf4o/hu6dCZ6/eWxH3f00fyeP8qs9+awA5A4UwLN1t8L70NYi9J/eclp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SX1746dk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VGde9bz5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SX1746dk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VGde9bz5"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDCGqO1527485;
	Thu, 18 Dec 2025 16:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=j1V4XCEVUIqKwkPn7ldnqjB3pYIdOxBmDhNSbskuo4Q=; b=
	SX1746dkxE21Q9HOWtP2LkS4y4nQOhmqTeOLZW9ThSMtG1muypcA0ldYacxjDQZY
	p40pC0DV8jQm5yYgGPOIpxdfSgsRJdBR/PPj690tNR+IxzukgZPRyru+ajvYj0Qw
	2rkxPYuxg1Rx+vdQLIlMYKBQLz2cGR59H6LsfpHkFuH8K+8pEo1S0Wnnu+z7wo20
	cRKx7xV6sLORoEzExs8zh3IdWrpMEjU7Jg/NE34BwOMC6/DI0Ra1/bMo5UZvfVCX
	kuy1bDO9NS4Oqhsi78Sq/BU7Rmoar2fcOKNABgxbE9EU6PIgVG5ur19gnCKBrGzZ
	2Q7TZmOlqu1GbGMZFVCKTQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b101601dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 16:31:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIFxrND005886;
	Thu, 18 Dec 2025 16:31:44 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011070.outbound.protection.outlook.com [52.101.62.70])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkg3nfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 16:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tv/Zzr6jpiWqpDMSxv9ScBIGFvitRyKJLo7M10rjifEgqxdb+lOdNpZqNu3ry6z/ApeURGQHywA42jo9SYVb3IXLkd0kUig1FOhUscJeBY7J3pPPqfqdRzTz0SZD8C5MadZY0TjbUN0NwN7ZrkSLRGZDrfzfKQBVyrzzGhMFVuHfUBboXMAveKj0veb3EJ6a6wwYHY5g7MzFwtVadoXmHmjLdJMCZlAjUHTb3koSndeMtxe3SWKVvIdm17Co1gI5Heti4KItu7if8gok8YkPHoz5Yxyt8cOtxGpSHRBsgJO1JHpyqHiAGlRhz6m3tF+hvF018RTFXfkp8sQ/mmKF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1V4XCEVUIqKwkPn7ldnqjB3pYIdOxBmDhNSbskuo4Q=;
 b=xB/yJe2NEOJWyJgOElqk8B+4bGIEHlr29vtX1MIT4eCxocZ/bf6tCrokeB7lxVD7KZX5KXnPpNJ4nWmw4lADm8NFJ9GJrsOhsDKri2gHmP3thVlIFs184uKJW+ovvhFK1pFVdLciWtZOCkpWF39EovcOqk9EesNXS2MPGS1CN032Ah1oOLhTOcUCXWvpDIkPdg8sw9gv/+yOtOmnlNPf3x65LnOKukm56PP9jtynxkmDMnNM5tuwNdgMJG15ceIR7JYFYXZULMFWpobsVmgyQQJ/rTBFmEUDoT2wAg6YO0K+5WuGEs2mTjYPrQlZQHYkvJI+w8Zqwaefmelobw8Gqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1V4XCEVUIqKwkPn7ldnqjB3pYIdOxBmDhNSbskuo4Q=;
 b=VGde9bz5J8uky83vWSHBA2SguEo5c7bEACWl1XGc+bd8nGdz0mKO/wCz9QjZUuzOw5bRLSrE7ChE2KTZ+kAIKRgI1JD6D3DSieqWjdxFFbsZwqs8JExEpUigkA5WiK5ow7Q24OQcqFynMgcLCngqlrG/OnKgxpMYp5qnpmJoO5k=
Received: from CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22)
 by DS0PR10MB6030.namprd10.prod.outlook.com (2603:10b6:8:ce::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.8; Thu, 18 Dec 2025 16:31:38 +0000
Received: from CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::401a:e126:b1a8:9b0e]) by CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::401a:e126:b1a8:9b0e%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 16:31:38 +0000
Message-ID: <4d3634c3-3eaa-4fa9-a5c1-2156a298e95a@oracle.com>
Date: Thu, 18 Dec 2025 08:31:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: [PATCH 4/4] staging: rtl8723bs: check return
 value of rtw_wdev_alloc()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
 <20251218011414.1781294-5-samasth.norway.ananda@oracle.com>
 <aUOpadPIsbYr-yI0@stanley.mountain>
Content-Language: en-US
From: samasth.norway.ananda@oracle.com
In-Reply-To: <aUOpadPIsbYr-yI0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To CY8PR10MB6707.namprd10.prod.outlook.com
 (2603:10b6:930:93::22)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB6707:EE_|DS0PR10MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbaa5c0-3f18-4d79-eb02-08de3e52eab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjdONGZ5YWVSK3VLRlA4cVpnaWJBNEM4RUoyaFlEdU5kaGlDU1NZQkxDU3oy?=
 =?utf-8?B?SnpTVTkwY3dodkdXNlpkajl6RkN0RHJmdWZPZUgwRGxyVTNkM0lpeDUyakxB?=
 =?utf-8?B?QkJQekVMMlpvc2JZU0ZCRXZ6UFM1Z2I2bGpkTzZZSmNNd05SNXZlU1o0SGFq?=
 =?utf-8?B?TmlERmt1dDJPc01kSkM0ODd2d3pwL3VhbFFZZSswcDhzbnJRMW1XSnJYRDB0?=
 =?utf-8?B?RGh6TTJ3L09TNXhtN3NTQTFGZWpMaEpsai8wMEkxQmFhOGRDUHRpZW9VbHk1?=
 =?utf-8?B?RWNFV05JYXBuNXJwdk1MdUlKbjBqdkhMODF0ckpxT0hPajhzaTJra0x3NWNt?=
 =?utf-8?B?d2RtbXdwZUc0SzcyZ2UybG1VYjhvVVlQd1hvbWtSVU0xQVFRL0wvSXJOWE9C?=
 =?utf-8?B?WGpkT1pQWmpkY2ZhUmRyYUgyQkt3YU40aUU3RHA0QmVETnNHbUpJbVhCdldH?=
 =?utf-8?B?NEtGMHhNak9YcWFrQ3lWeExKRmtWblhmMDhLbGpLdHhGNXpucVFhWkFDK2t1?=
 =?utf-8?B?Tzk0NnU2NHpwOFJZMzM3djNtVlozTVEyaWNLeU95S0RaNTV4WUhtcmR1SHho?=
 =?utf-8?B?NUZENnpTTFlHMEwxNzgzZUwrQitQeHlEQzA5Yy96VDlLUis4T2FjOXJuQjlj?=
 =?utf-8?B?M0JadlhBcG9wY1FZbjJnb29tVEtyTGV0dXZVWG44bml4eWlnSXFmV0x5TC9h?=
 =?utf-8?B?TEthK25QMUFwYjBheUhEWHRPQ2tXUGpXMDc5MnFXc3hUR1B6TU1jUUxDb25j?=
 =?utf-8?B?SlhQaGkvOERKYVhtWmhndnYvVzFjRUhidi9pNnJxd1hoeGQvd0JmaXltWEh6?=
 =?utf-8?B?aWNpcXh6T3dEbU9EeVMwcDQyYkQ1Q0E2Q1A1NHhhMS91V2oxTXdlNXZRU3Z5?=
 =?utf-8?B?ek9DdlNmQjVKcHlibWo3YTZ2Q0k4YmVBNlBrUXBoMXMwamVlZXl6ZnFXSmRp?=
 =?utf-8?B?UU1WZlczTW13MVluUUhLdjFvZDhzR3RjbGNPUXFuNXZtTnVKaTV2dHFwUDVq?=
 =?utf-8?B?SnJLZmF0M0QzZXRYelAya3IzRy9ISmhZYzMvZGM3Qkg4QStaME5mK3dSVnhy?=
 =?utf-8?B?Y1NzRnpUUG5ibS9aVjRaQ2twVHE2VDZRTE9NRnBUVmt2L2JpS2JpZGtXREFO?=
 =?utf-8?B?VGE3N0tqNERuTU9rMzNnM0xsSDB4ajgydVFzVTl1VU90eHFyOXFWRUppTUI1?=
 =?utf-8?B?RWNXRC9sKzVqclE2S2M0TXg2VEdYQ2owZHhpcXRjTUZnY1ZsdXMzdk5WUFlJ?=
 =?utf-8?B?Q0dnako1bkVEUWhvWnNEUWZpUzVmd2Mxdi84ZjVhbGpmZmc2Q0NJMWNxWTVU?=
 =?utf-8?B?cTBJWjBHTXloTE1GTzdXNDg5R3lGWFY0eUJvbTBSeExQQkxFakpxNjBwSXFl?=
 =?utf-8?B?UnlMOE1UQk5KZ3lueXJRcGhja3ROUXF0Vjl0L0NXd1RSRVpzSXJjRzRTZUpU?=
 =?utf-8?B?NmVVSEVRTWFhc3FOeWNDSjBYa3lKR09PbmdtMGpTcmg1aFllOENrbUU1TVp2?=
 =?utf-8?B?aW9qWDk4dWtwMkNISUpuSzBVVnZ2ZEtIR29XbUJMVFE3L0tVVzBjSFYxeHRZ?=
 =?utf-8?B?elduSDBZK0ZQbGNEendZMU1mdU8zK3RKcWhpd01RYU9RU2JLNHZkdUpSLzZJ?=
 =?utf-8?B?MUFUWTVhcmc2SHVYeFFkaDEvZHJ4c2JpS2YxdnRZZjFVa0d5eldoNWJTaVhY?=
 =?utf-8?B?VjN1UThBeEd0WHdmK3QvVnh3d0tDckhvK1FhaGhZTlhGanh0dE5UT2tsK3J1?=
 =?utf-8?B?RTNSUlBhSkNGSktvdmdrZmVjZWxHZU1LSmVvU05RRmtFbU50MkZuQ0swa0lh?=
 =?utf-8?B?eFArbmVMT3pJeXFJTFFGeHBhV2c5TXIrbDZVcHdzazRsT1B6S1I0bXdUR2Jt?=
 =?utf-8?B?WmpQZU9BTnBhYlovbHlpdkhoQWlid3VPMzg1THdlZTd3ZFNMNkdUU0hDQkZC?=
 =?utf-8?B?RUVJL3RTYlFuWDh0OEs0RlI5eGFvZGk3VENmOVY0dWV2dVVqYnpHZ0F1WUY4?=
 =?utf-8?B?T3RDdUk1UlR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6707.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmwrYXk4WkdEU3VaSm9VL2Z2MWtYMW9Wb08zTDJpMXV5N1ozTVZNeDViRldU?=
 =?utf-8?B?a1pDdGlXamRTYkg2cjBwV1pPbzBYS2hQdVd2YmpET1FPTUVPYVRjOFpMakF6?=
 =?utf-8?B?Q0tNM2JROEMwQVhxVXA4VFd4RWpEU09lR2JBZ1hCaTJ1SFMySENOekR4cWlQ?=
 =?utf-8?B?U0w1Rksrd1cwUjVBNzhkUEtDZFIxMEpXN0xFWmg3NWQ1bXhYQjVBMHJBb0Y2?=
 =?utf-8?B?aTNwZm1HUlRXaFpodHIwblhyNGZaNWNVM3VDK3FCbFR4OXloQi9qZjFUL1NL?=
 =?utf-8?B?RENYM3Z0RXJQeFlxeFYzdmRFQ0plS1A3RkhkMERTbUMvdEs3NjNXWVNqK3dS?=
 =?utf-8?B?dUYrSFRWSE1xQU1EcEh1SDI3RzdNOHQ0SXVBejNDTDFsZlN5MW1iYm5vK1lN?=
 =?utf-8?B?MEJ4Nm5HY2tjMnVUUGhvQ1dtLysvZUpHN0xzR1pHcjc3Rk8rN3lNd3EzOGhv?=
 =?utf-8?B?ODF4V1ZzVzFsbGNQb1d3VnZXcW03dlB3b0p2UFNZekNjLzE1T09na050SUM4?=
 =?utf-8?B?NUMyNzhrWE1vN1dETFlDem81Um8vc1NHOTRYNjh0VStWNnltZjg4V2dvMmNK?=
 =?utf-8?B?N0RJRm5oTEVKaWxMRkg4dGIzc0FoT29hcGhkcGNsNDNIaXlhMW52ZzgxZytE?=
 =?utf-8?B?eDNhMEl2WFRGdGdNZzd2aHlkTFVJNVRadjVUeWdyYjJSYzlSVEtTZlBnWWVi?=
 =?utf-8?B?MHZ6N2EwMHBvTGg2VGZ4eG8zcEVZRnd4bDBsc3dBTFNQemdURWdPc2pEWEM5?=
 =?utf-8?B?Q2xjUkxmc0orNEF3T25wd3ZNK1FPRlcxQkJsVkRnZzdvcjVWVmFIS1k4YkFQ?=
 =?utf-8?B?ZUxmWmdwT0N4K0E5NkZIVmZaL2tjYmFSdnVnT1pETEJBUlY1aFNLNW9xcVFx?=
 =?utf-8?B?bDZwd3NpSUI3cEZpNW41ZGVFSHVOVithOENjMC93NjJmM2xWUkpTMXZzRFQ4?=
 =?utf-8?B?cWI4Qm9ZOEQxYWNML3lTbkpmOWt4RlNjT0pFbHQyTk95d2NHWGZRSnBPaXRZ?=
 =?utf-8?B?NUg2ZDVibkRocTgxTWtTWUd3K0tSaGdHRWpjeVd6c3NSZDlnY3BOWGl6Z0hH?=
 =?utf-8?B?c3FxNXdvK1g0STBjSHdpNytzYXBINlgyQTRkSXZZZUZCcGltSHdOaXpENnhj?=
 =?utf-8?B?ODFvNDNXZzBqaTVpcWlLZjVoV3pWVlBzZWR5d2g5SWRmUWx2cVBWMlFPNXlB?=
 =?utf-8?B?bTNMTXhIMklmek9nRTduSzhEdENQT0ZyMC9xRXpIQzk4VHY5Rkl2UDZyZ1Rm?=
 =?utf-8?B?Q3FGNDNwUkh6VFhTUGpqUVBEUUlSNmpGd2tVN09GcFVQRlJlMWtZNDVjZHpK?=
 =?utf-8?B?REZyNEFWQjNBMFFSSytPaHBYVmlta3IxOFg5YTVZSTJ1WTdTSUZyRU45WTBX?=
 =?utf-8?B?dlNtSURmUEEzVDFCbDRXSEh6am41RHdCOHVqZmw4Z29RcEdWVXVmejN6UXEw?=
 =?utf-8?B?ZXBjZ1U5OXZkdVpsaVF2TWt5NzBaVHJoU2JVNkZzNnpYT3BOdzIwVDZ2a29R?=
 =?utf-8?B?blJUREVSL2t2ckJueDl1ZHNqSlNHNElPSDg1VkdYZXV1VTZMSnBhRFNJdEs3?=
 =?utf-8?B?YXdkVlFyb2tXTlZvZ2NjTFBOZjI5dVlLNS9aMDE0REVXa0NNQURnNlFlMys5?=
 =?utf-8?B?UUN2UldCV3MyYVBlb3ZsNUxqRkNxMHQ1Q2FMeE5ZODlaVWhack5YM2hHOVd2?=
 =?utf-8?B?aUlBZHJQQThKTDVGN0x3ellGVjVJMUR6UHZqZldxUndmd0pFTzRXYnpSOTRy?=
 =?utf-8?B?QlA1YnpmT2Q2N0JFUnBUODRCc3llOUtwTGowTUR5WTZJRGdHTU9PZldpOWVp?=
 =?utf-8?B?aUdEV2FzNnUyNXlqVmx4YTlxUVJ0UWdXTUNtZDNaT2g3STBRcTBqNTVQSk5x?=
 =?utf-8?B?eURyREVYN29lUFJ2bGFlMlRhU3hlSGdiMzBVSWlVT0JSaUtCTzBwdUJDbDRU?=
 =?utf-8?B?N2tKZlpOZWp1N2c4WWMxaHhJaEowTmxvYzV5ckphUzhZeVN1R2pmNm8ralFN?=
 =?utf-8?B?WUU5VjBuR3AzM2ZRdDdNaHVkZjhGd1pTWXRNNGtOVjFjOXIrM1dyVmk4ZFdz?=
 =?utf-8?B?RktaVGF5VXRwRk12eW9WNmhKa29VYVI4MnhTVS9GVUNCSnpCTURPUTlVZDdT?=
 =?utf-8?B?bWw3Q0FFMUhHSGtJOWtuaHJZM28vNWtIUCtYRkdtQzBUYmN5bUJYU0RJWUh4?=
 =?utf-8?Q?r2ex8TEjqHEcb6X8iUBrGec=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1mdWbjqp7Sua/M1y3FuUlJM0sGW6SmO1G0jfMduivgkiYI8PdAQTx49TFUVmthem+WcXK1pYq60JXLAlyUYKd2NvMq/y7yM771Aps9zAuXoiZho3FTA5z/x8rgYzbxz22ootHbw93su/wrSczReox86vE0638SFPJlgDMS+AW2C9nH6jYMJnXgBtyA9aBlZkziPm/cib99cQxbqkMpXEt/fKx32lMGkSAEIEjTdglx2bixrquXYCJ3swBKpPGCuOltuVNcdKptb5DjsvWzxHNRHnSNSdsi7hBfKJJ1scq7vzvztx0ITEH4pgKP3Vl0G9PLJscYjtfGCC3Iy+mbfCJMjHNpg9iBwks18RA2aKjcEBWpB7juS4AoXBpZk27wcR6knEVNFegkbk5mZBmjdLGSPK8LSOQFaw3fxLs5zCQGgZ/o2lIlX5YJXbJDF6zbmr9pORvLLgLlxYX9h0G1RS+osrF5wWrX9IEvoqMNnPRJq/a09w9tz/fNGN0bjmfekJMGfhSXwBs+8hbV1dA5we5dFf45Fsom22iBkROZTe6SaawKkgHSt4c71J88iM6Wb9XBQgRN7RiMicjGtSHN1QHCdJ5B2nMtwAMyPkYnFcZQo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbaa5c0-3f18-4d79-eb02-08de3e52eab2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6707.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 16:31:38.0996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QQs6UqMsRDlBC6Nr9bawx/Y3PJTWY4t6x16hWTWesxDSVFAzK7CffEdDdXt23FjDJ3G6zX/OnrTRVIawBkVZjLtgRXJsJqT/6NOCs0ctgQ3T4tksM7+2IVw5Wl08DZP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6030
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180137
X-Proofpoint-GUID: 0z0FAtA6rV5WS8wh5c-i07VGXE6jAm-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEzNyBTYWx0ZWRfX4BHJbn0BPNyd
 Ot0fPYIKNb3GsnU2wFFmdGcTQsmfxqXdUyq6EY0MGaUe9aSkN/a8BR08PTG6l8XFqKCYzpU+IRr
 Wcpwn6ETPDJKzT9YbMwJeIpzEus3Qvhg3d9iU2FAp1dYKTD4BerKFKXjGjwCtYA3D8WiCfPPjlg
 mN9HYxh9zjkqNK9h+3m160LeBEUK4NwCHSVYGcFBQVJgsOwHkL1raI+OtRm2zcoAOseNgkRDJkq
 p3IPEefwgmMytayJRXLqraLPIbp9zr6uEpchaRpi49aSwkifxJ7uSAaKn9d9DCQacz6AwvyCF4v
 wBWH9fe2EVbpcNQTzZjSahmm39JbvXWEVvenjEchOLfAFtwnx4bfSmL51bOKs/EHTko6rz9L7sG
 lLiZBVbLMM36TyniNktwIwfaO+/Qc64XrWG+kvCGd0NPfRGZIj8=
X-Authority-Analysis: v=2.4 cv=GbUaXAXL c=1 sm=1 tr=0 ts=69442c71 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=5dRrolKJAAAA:8 a=yPCof4ZbAAAA:8 a=6LAs8ERUatOZYQy1fQsA:9 a=QEXdDO2ut3YA:10
 a=y3-2bcJ53AEkEa81XYCb:22 cc=ntf awl=host:12109
X-Proofpoint-ORIG-GUID: 0z0FAtA6rV5WS8wh5c-i07VGXE6jAm-s



On 12/17/25 11:12 PM, Dan Carpenter wrote:
> On Wed, Dec 17, 2025 at 05:14:14PM -0800, Samasth Norway Ananda wrote:
>> Add missing error check for rtw_wdev_alloc() in rtw_sdio_if1_init().
>>
>> rtw_wdev_alloc() can fail with -ENOMEM when wiphy_new() or rtw_zmalloc()
>> fails, or with other negative error codes when wiphy_register() fails.
>> Without checking the return value, initialization continues even when
>> wireless device allocation fails, potentially leaving the adapter in an
>> inconsistent state.
>>
>> Jump to the error cleanup path when rtw_wdev_alloc() fails to ensure
>> proper resource cleanup and prevent use of an incompletely initialized
>> adapter.
>>
>> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
>> ---
>>   drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>> index 1d0239eef114..432bc6aa1d90 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>> @@ -296,7 +296,8 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>>   	if (rtw_init_drv_sw(padapter) == _FAIL)
> 
> This call to rtw_init_drv_sw() does a number of allocations.
> 
>>   		goto free_hal_data;
>>   
>> -	rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj));
>> +	if (rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj)))
>> +		goto free_hal_data;
> 
> So this goto should free them as well.  I have a blog about how to
> write cleanup code in a systematic way.
> 
> https://urldefense.com/v3/__https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/__;!!ACWV5N9M2RV99hQ!KLPxUw-pZDgh7c5bRyLHFbR9D8QxefnIaHlNgp3DJsspN6yXrwFMCjE6xJIAZhqLWNIzorGl1tTzvpkYINf88wiRyerJrpTr$

Oh okay. Thanks Dan i'll go through it.

regards,
Samasth.

> 
> regards,
> dan carpenter
> 

