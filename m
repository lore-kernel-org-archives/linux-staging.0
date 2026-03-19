Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071E62E541F;
	Thu, 19 Mar 2026 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.153.153
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773937286; cv=fail; b=hHUvV9WKYSOPFGL4Qj8V/CQ1aLodta0KO1z7nqHKto/hFiROZIFEzIRlIEcUN7bAt8PEmxr2OhW0pKFfWGu/ync7W01hh2FfjPTGfB1Bf7ZR/uoULnwZhs645Hy7j7OCIq/cpc4yDzj0pFLRgcfRP3v50+JWnN9GeN8mQlCD2o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773937286; c=relaxed/simple;
	bh=lHNOl98kU/Atf2l6DeQIEomqnmH+SZm+e0i2jI3tHhY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jKKTMKo0wWjNjS8wb3vb54XhApg1+oXSeAq2AaId26jAmAyAAiKsoQyRTECHNQKY4Ioz05pMaZ+ahcvsgkHpzl0s4MPT9Pji1G9dQFr+Qf4ln9ZrUbLLMd6zFGAMLSuB7clTfGvhlFt7kCz/GrcCKUef/w7o6SnvLVHzNivq8Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=jr6K1Ml3; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=bi53Q5jz; arc=fail smtp.client-ip=148.163.153.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="jr6K1Ml3";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="bi53Q5jz"
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFeSZp1622438;
	Thu, 19 Mar 2026 11:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=8MBcwT3U8ER38eXyZfhX
	9LEqdT7hOHio+1jPLaos/gQ=; b=jr6K1Ml3jV3RK2fYD6WXQbBBUfiIIxoTByJ/
	7ONpiuvyHNUK1ck6Ox06RJP3EOx3fuYB820GpewB6jDARhjy0hV5cnmWj0sSQhrv
	q+PWszNFyeTZD7JidzjcTh9mgm9gxBv6V7pSxOWGs+fn/iBOfR3OG0zRTlGlOngO
	V68Ja3XL+ou83uAtQgogf9UjzLLQBMNCUI4d3/H9mut8aAMhNe0wtt2XuIvb+NrP
	3OkElrp4iTKkxT/yPAKgO3KoCS4JcCDPqSUsnaq74Yyx/sWSQ63gvBCuEiY8hmAl
	AJbiujUKsWHz6F1DW1KoJgDLduTGcM2Im6+ArDfTRcfEiJ7/gw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021132.outbound.protection.outlook.com [40.107.208.132])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4cw166uhpj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 11:21:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esTDOF48AG1qwxmmWUdwJ4GpHQJ2xgUKstXxnK1YLZ4woqM3u2h4hnay1tvUBURGSfQzmk2Vi32l3y8hX8MvtAvpoPLv0RXCSyoAAhg0CP9iExMLSc3X1zoxO4gHHqZDT1VGCCduU81mrjYrlc3AFfTdGlN6t0x+vnq4Nzs3TxD+zfSKGGagEG7gfm9szDtDLTMIZ8X/qK358zu8ihMhDibRuHJjnww9pW3SusSPfElIfaTb2evKlyT8+8bmui2S1yM2JiPSryH/sr4qX7lRIm9NcLCo/E1XrcYAsA+9Nxvg80lDMlC9MCI6TrrOjV8+HCNY/9O1DHLr+/bO1VaUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MBcwT3U8ER38eXyZfhX9LEqdT7hOHio+1jPLaos/gQ=;
 b=SoM7hTFGMO5ze7HTRTVAMxTzR+hFK2L/PSpWMetp9PcLWW8Ek+oqrOxjJ/VN2KuwLl5IpKHWoCqftf+2RN2djIoC4VTdcya5rtJQDwrR5XYKsBRWq1TGKacbE8YweyiieiFdzFJXrDNkww9NVwFl6i10hXr5r1Gt+pOD7s1NqWOCrEELXFCPWT1mqztd+JZRsaQpoBd5I2jiNNmc0txIGwmRF9jlof/f2oZUTOIpCtnJ5m68CeGH1TNox6V40SixJlddOs523WaR1kc8wtS+DRyxVexpW1VJizio0UaC+sN4M0QF9t9v8/QlzHzadkEJKj51FNTGTarfsfcH5FdqMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MBcwT3U8ER38eXyZfhX9LEqdT7hOHio+1jPLaos/gQ=;
 b=bi53Q5jzt/6Oma1ktJpswvHJdjENC+wqlJTRWbzPrliVXVlbi2WGMKlreuv9qFfZ8vM2sJmFPUUN56vMYwtuzLr6MeWI69N0UCS5PiKxcKTC9UJVjonFK+EvhD1IZZTx3vz/AvcEGEQTAwgOYr3qY0uwI0suEdpg113gvWgon4o=
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
Subject: [PATCH v2 1/2] greybus: raw: fix use-after-free on cdev close
Date: Thu, 19 Mar 2026 12:20:48 -0400
Message-ID: <20260319162049.42269-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
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
X-MS-Office365-Filtering-Correlation-Id: 824a9ab5-dbc2-49a7-0e17-08de85d384f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	tM6L6/oF2BV+UPJ1fALijAU0POmJss4yS1s2ucOc4dm6Pi8KAvLQfJlGphBBoith+XtTRB69ng05+otbgY/bNAQMDG6FCPleLPHnKDqBxEsTe5eM0bwvPWJIRlRWleDytIJTuPwGsEEDvQqs9B/N6V8B+qqw40r4cJV8e4A8AIRoZu81Ocanus0PEzXzFXB9dzisESOdGTlKIJO+bbD77H41S2pdNG9OoSJEC3rrXq5WcADxxzavI8SRsjYDBCMWbDdh92GXANRgeHb8WJSQyoNRZ7pWPvDt/kgqY7LImoWpU8sCorj+sCIQzJFFXyK/T+ifon+hcHQskDvoNo4a/7l0GEnSfHXYUJArB9j3thQ3khkVJ5JrJFA+OkBqy01Z9w9XspG/rkcW3JxXFUb7wNpTH+Pe9q62fGsAegzFIHSO1xmSw2jvAWM7jevgGpxc2I+zXfM1xro81h1P2UOQLBu9C2JzvsCcxidqBRw65IwUTaRGZSh4oOnNZvvIi1QT8UiSeTrQ3MfA5NXRgjiwKL4g0LQbwRSG4v+mr67sVN3hjPaEhnogwRZAxfCazsHJOd1riHyFE/6f65/ka1hvOLzqJrcgdp+P/LldnBQb86tM1imxBZwDanpv1/p8Xaq4tvo0aIr4b2LVHw/hBPFaYOpxq98/jrnuVM2YQSSGPJsdgtdDsBY3e7LrcCGykR/T1M4VfckjQwM+YAYFRQFi/KlH5ExAAcDNbSmEpC7oXxdUG6OtxXOzhH6i232LHHtd+wmEaSxdjdxq5gLDzWb6U+lvwaE0P8E7LWkqPjUlr8A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1ZvOWhzVUMrUFBsbnBVR2FzZ1FGR2lCaTZLS2h3dzl3am40cXdjT3hBcS9I?=
 =?utf-8?B?clVXS0t6VFRocDVaUmhiM0Z4dGdWRGdEQlZiRG5rRk9VZVhrbjAvMGlvWE5R?=
 =?utf-8?B?RkJMOGpCQTNjNDhCaTk0T0dRQzR3TVQvRFhGT3MrWUc0TS9PNnE5VkRxS3Zj?=
 =?utf-8?B?UEtYR1FwZlcwQmM3cnMwYXh3S2g4OWtwZVdIcWdtWnFRMDRqU0FTY2pZU1c3?=
 =?utf-8?B?T3RCOTUvb2JkNzZxVXNYVFc4NzdoV1hNb0VVMG45ZEwzMU84bmRpTExFSG5F?=
 =?utf-8?B?V0FMR0VDZlF0VnBubFJIcmh3QWVjY1V6allRbWZuMHVSK01ac3pTM0FkSkNL?=
 =?utf-8?B?VnQ1QkRvVUNmMmVrdnBBRzlrR05hM3FNcEtGUXg2bmVIU21WZTlCSG1UUnFW?=
 =?utf-8?B?Q3pPL1FScDB6QmRIVU5pRWZsekMzL2lLakRvZG9PTkdoc0Q3dlZMZkNxM0pL?=
 =?utf-8?B?eTZXaktVeXlEWXNTcWFlYmJweXBMcEo0NGYvcWU0RWJKNVUvMTZ6Q0JqUWYx?=
 =?utf-8?B?OWFmTUdlMkYvVnZwOWZ6Vm9nYlJQM29WQWpHZzNTMXpodFNubDRTRGo0VW9q?=
 =?utf-8?B?RDhnVmYrbksveGtIYjkwdnVCckFSNXpsNzArUm5GbnpMTTdyK2ZBZHVUSUoz?=
 =?utf-8?B?eGMwRmhGNncxekQwZkNhcXJaQWtoeFFxQVVWblIyR1VLYTBGUG5pdGpYUTQx?=
 =?utf-8?B?QXo4VGszODNYb2xldUliUFRTbDV0MXo2cnNSQ21jMWJIMzFiRDU1Y0RiZmVi?=
 =?utf-8?B?ZVU1YmJod09MdDVzNXhZOFE3ZVJnT3RjVVlQbkxLVUJEOWRnOTdUM1h2bU04?=
 =?utf-8?B?SFZKSXdoTkhyTkV1Z0F6Wjk3bHFlTmwxUTVjcmpnQXprUk9MOVZodFJNTUFK?=
 =?utf-8?B?cHVUeVlUdlJhMzl1dEZ4Z0VnRW9KL1ZjRFlHQVgrRDFKa1U3RUxOQzFzRFlk?=
 =?utf-8?B?SjluTjd0UDk4M3J3b0MyOVI1WGxlVU02NWd3c0xIOGlaVWRKU3hpS0hMSUxn?=
 =?utf-8?B?TmY0TEJzVEZudXBNSHFrTmNEdTRvUENkcy9nRmRVVG1OYkt0VmZ1RmczMW5H?=
 =?utf-8?B?b2NuU2lBSVhIckVKYlNWbzhTZmkwQnRtOU9sQy9tZWtJd0RZYmNFNmZJaW91?=
 =?utf-8?B?RStIRVM3QzhoQzRrZ0pEQlNNMndmMWJTMkxGRWFTanoxZVhMcDl6ZTQ2MUUx?=
 =?utf-8?B?d1REZ1NreC9nRlA2RitiUHpUS1MvcjdMU3JaYjlST1dqOENzdFc4NWpoenlv?=
 =?utf-8?B?Nm84cmJQZWthcFQralZzY0VpTEhLdHFYc2lCREErQ1F2NXcwZzYwSzliUVJk?=
 =?utf-8?B?MUJPREZRMktEVTQ2aXhJWnFBSFpYM0xxVFRSeTRReUNVRnZqUDBNN3ArN3ls?=
 =?utf-8?B?MC9Ta3R3ZmNNWERwQkprdm43MCt3RUg2b2paVG5DMG9CSHpDcGcwcjFDSFJt?=
 =?utf-8?B?RDV4TDhPNnIxc1R1NDlwQW9leGdWTlpvcUtNNTh6UkVPakFJZUJGb2pGOERG?=
 =?utf-8?B?MVRoVU40SDBmSWFpbThCRGhURHFxT1gxdDdXbHJwUzV4Y244b0I5MEtZYW1m?=
 =?utf-8?B?czRCRi83ZHZ5Zmg3OWsvV3AyVkRseEUvcW82OFVsRWpjeVI4VFh6S1ZlTVNM?=
 =?utf-8?B?Y2RyYm9nK1FRTnYyR3lZYlRiaW5XUlRyWCtWS1BkQWx6OEdzOHpmcWp4Sm5t?=
 =?utf-8?B?TnJDVlpBbnNUM1BvU0tHL0x4RUdpc1RaNVlqWVhIVFRKYlZVR05TQ3lZTC9a?=
 =?utf-8?B?dElLM2ZLQ2tQNHE5YmRTQjY5eHJYcERjNnNzVDN4R1diMmdEQndSSzZPbGZG?=
 =?utf-8?B?Y3A5NnlPcTlycFYvaWNiUXFyYmhaS3JkYStOU1VFZWFyaTIxSk1zeEdlYndv?=
 =?utf-8?B?dDdYWGN2MndMVXFMZzN4RXhiSGNWMTkwbXJOdU9BRlN6SWRTWDUrSW1RaHIr?=
 =?utf-8?B?akVmK2JET3VUZ2toSXFhVVJjdVdkZVdSWU53QWRZdFNhUU1LT25ZcDVWT2JG?=
 =?utf-8?B?Rm45OFVsNjl4dnB4djlOQlRaYXdWTUFiakIwdmtuaU5TVXEzMks4VXpvRmZQ?=
 =?utf-8?B?RjFLQWJCalZ1TU9DYXpjVlhoZkhSbmV4SitFZEE3NGdScWtMUHVYSVNyRkJs?=
 =?utf-8?B?MmlCd2xlcm5hZWhWNjlqdmdhM2t4WXlIOCtSME5OVVVCWTdmSE9HQjZ3L0Fo?=
 =?utf-8?B?UTJPY2lIbnlDMFNQMG0zWHd2TlNjb1ZzVkZ6eFU5SHJJcFhQU2Y2YVFrY3p5?=
 =?utf-8?B?N3E5anBOL1duWU9jaDlIL0Y5QW5wT1BubS9CNmVvMCtiVFlQUHY2WFNIZjBD?=
 =?utf-8?B?TkhpTDlHVkg4Z0REWFM2dXJkVk9qQko4M2R2RWZYZTJqUllXUVNEdz09?=
X-Exchange-RoutingPolicyChecked:
	rlYRfX6RS5Za/6YCrPp1d7LpP+Xrzdgu827Eb3Eea3jpOpgJAzR0PB/0ESMATfL7sDhB+Q3ffTQfghn9bTuMBgelHaC3JL/2Lsdw7xnvBp2AmPk1KJdOQeDeUT2ym7PhoDE0e0Kgrp54Y7MYsvmwqtFz4J1ovJiODPclM0Pl8ApjxcDJccnuYivBvNuerW0YO02rp4mTeopqMcO1aZDZo4S+2mUMeC6opjOdXuQeXLwQu8oazIEm7s8EBKLDM4lXa8zaYKgKt1wWsIK+pvOtlQdwwBNcIB1Vcl9LpS9JqTNFV4lIEJtSOlQl0ckO6pxtomWEn/C7X30I91SwVN4uwA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824a9ab5-dbc2-49a7-0e17-08de85d384f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:21:05.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckOJSRlRvx2hzNvlkfUqdCVDSoKJJ3vpzYT3cMf69mk6ZrEvZVpnFPuTgmfmaynHifKSf2SDLaT9GmemQZbuLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
X-Authority-Analysis: v=2.4 cv=apK/yCZV c=1 sm=1 tr=0 ts=69bc2273 cx=c_pps
 a=Gq0v4fqhBDE/9EfA5tRQ9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=buQUfWhnF1OtDDk5FV7I:22 a=2AEO0YjSAAAA:8 a=XeHHJQA7KXFy9l5GLh0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEzMCBTYWx0ZWRfX1mf8eqJESvR9
 JZnJM8AACAFhjJwWKr7BLfKqIJHFyfSMcNK4mbpZQWXWs0UbKi0PfP3lE5wjQxBNigdUICyWHY8
 UIuHy5p1oqe9DfmJAwckbQdwreHGd4H1VT9mo5O/VKNQ7OGtSisKysRMa6PIJgTu8/v0fdDni4g
 i02O7L3Mjbx4V+iXqvdHORqJcq71VGR0nWmD80Nlj6n7m3NJ2a1HkH7n3ZURmXaAAiqCW+WATvj
 oJHCAVYisIc3xeViyjmkP3E4dLOcPcGjcITQDmPDlgcjsBUCWBU+NRt8lolkH/b1cLrl1pi+xWJ
 FS8RYUyhOqpTajD/aSEWYRRmMx9d96wH+xpL1xWKF8FEnPnlktv1TOoSBC+BgQ7P5ahjqfuWN6G
 S/mWvafRcnws5ODgh5+NXiXNFLbFfEyjyYC2ObViB0WverLiKdEXdos1Uyox0ZbUxctSpbm1Uu5
 PTiJaFlfPCX5yvceu7Q==
X-Proofpoint-GUID: v-QyH8FmwHPISvlmPiwl0r9phb9c2AW1
X-Proofpoint-ORIG-GUID: v-QyH8FmwHPISvlmPiwl0r9phb9c2AW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190130

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
Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
Changes in v2:
  - trim down trace in commit message to keep only the essential part
  - rework error paths in probe function to ensure device is always
    freed (set device release callback before any call to put_device)
  - move ida_free to release callback

 drivers/staging/greybus/raw.c | 67 +++++++++++++++++------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739..6da878e4339 100644
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
@@ -164,63 +172,58 @@ static int gb_raw_probe(struct gb_bundle *bundle,
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
 	mutex_init(&raw->list_lock);
 
 	raw->connection = connection;
+	raw->dev.parent = &connection->bundle->dev;
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

