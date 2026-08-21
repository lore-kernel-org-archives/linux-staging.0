Received: from CP4P284CU005.outbound.protection.outlook.com (mail-brazilsouthazolkn19011028.outbound.protection.outlook.com [52.103.21.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F96494A1D
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.21.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320003; cv=fail; b=WV7suuXOp7g+9vHTox96sQIYHNbHdFPsOJG58QQvyxu8WLvGV8yJhhoINoQtjLmfMSUOu82dV60DVj3OOpl35b1enor/VLUfZyNuROdi/YsPIYRiwLWx/OG96fTevtNUncdWD6W1RQw1MBeAFt45QXMHZQF4uJNY59BGM7a0EoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320003; c=relaxed/simple;
	bh=3JL/nCocTIQLiF08OUgvkiJj5S6ULtZocZo1DfJoWiE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qfy0i9eMIJkNvMZmOVHl4Ik6kHTROXT3CEu9lNK2HH7kY1bBHJrWotcu6ulkBDbWPdicrV8duqgV+QHKl8IFIx2BVjROrO+KOxY4kBEBbHzOB12w5SnsP/Vit5zmKRZFjI8sjXP3XvY9EnaRRWzXGFeSYRk0HJuQl5xN44HAMDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=D4z+1Lrn; arc=fail smtp.client-ip=52.103.21.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="D4z+1Lrn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yvdc0C7gwp63oecm8lPRystOAh81VTBRjrgxSDp3abKDscH6cLlx48ye0HXhJwrUDkaxVAObMCua8CDfAUjrciqV1R14XQsR/5huxMhkkuuwYjsPoJuIWQjkE8zOv/SZpSb3S6639BSX2F96e5QbZaKLNg6nUscJ3aA9GgKTosSO6OQydHB4eRr99cu3IZQRXvgE2WsBiSW/fAi4WGadZCXWhm491Vye1diMpxBD3FGzaOVyNA/jFtRqMD9sjIKE0pFoIvus3N25Ok2JCloFT8CkVAPxQ9eMtvL3To6tl6OclbGzp3a8wVp1X72GgYohb9V0nNOqNq6dp4g3ha/zdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JL/nCocTIQLiF08OUgvkiJj5S6ULtZocZo1DfJoWiE=;
 b=iPowjZhtDwDe0D+GsMO90PdwVUyv29w/BjL6rk0eRQ/zEo3mmdgUogx2115Pb6hDecfE6AMVtuD1WsLxZ6RKj0ZbMd2jNCKUpbDCftjbbcRyqlEvXLv7jUZFe/t/6nwDQ6T1j2LZdCP723mkNq/iehvRYAGnhjX02wVIcyjvQR37A50g8ghLtAMx8c3K0fKiHZQqVL+Qae8CLLJ1Tyi6gj+a6+CVPtOn6vz/+ZU7PedVUeJ++3/sSV/IXhe8tDzRsCXUNlkeILIvoRpJ2lLKir0P1SUwA9uERg2O0CpiLCijJZH7Ymsn6Xq/oNcDBmjuYvEcn98qFoncSiGQmDtW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JL/nCocTIQLiF08OUgvkiJj5S6ULtZocZo1DfJoWiE=;
 b=D4z+1LrnopFuC3dxljVyoHEOeTQQBonXDL3v4MQO7QpFaaiMwUhE0ULJmq9fGAofTah0wG08giJq3pgaQCLCi6DVxUrxUPe6ZoUG9EMUGWe7HpgYCHUCE610Mfy7pAXeEUnX9WTUyLFiYufztJsbB2QYsP8Cd4JrHlwQtsTAYuTp/DpTsHIw2p7aSafC+dF/tx+qX80HArTEnicVsnywPSFqgG39Op/6BK4HlrF8L17wuLI7jRSUzK262+w9y+wHup1A1MAVupKDSAQ4J4Y7aH1ya/UjpvlLUsPbtgama5GCga1B8AJu3sMQp9UjKFgsh/inX2ZB62DiXzDS0s37/A==
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:9c::8) by
 CP8P284MB2639.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2e0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 21 Aug 2026 13:46:34 +0000
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f]) by CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 13:46:34 +0000
Message-ID:
 <CPYP284MB085448EB944B5D02C2BD4991FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 1/3] staging: octeon: fix style issues in ethernet.c
From: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 10:46:32 -0300
In-Reply-To: <aof3Cs95spFEo3Vr@stanley.mountain>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
	 <CPYP284MB085499A0F516D64E9596B9B6FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
	 <aof3Cs95spFEo3Vr@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
X-ClientProxiedBy: CP5P284CA0241.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:22e::7) To CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:9c::8)
X-Microsoft-Original-Message-ID:
 <44b8cb2d179d5b0e632b0593a99b131e4f5f37f7.camel@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPYP284MB0854:EE_|CP8P284MB2639:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb445d2-60bd-4824-ca95-08deff8a9d21
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|6090799003|5072599009|25010399006|51005399006|24021099003|15080799012|19110799012|8060799015|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0NKRFk2ZXZJRk1CTGYwSjVoU3RtS2Q3dS9ILzJ3RWJCaE5rdGh2Y0RnaXZy?=
 =?utf-8?B?WVhWRHJmSWVQNkEwSVFmQTJzUFJHcVZJT3lVMDh5NWRLVUNhMUdSdXEyMzA4?=
 =?utf-8?B?Ulkrdk5ydU12YTNqN1FiVXI0R2hFdDlnVnpYNHM0MGhiaEpKVU9nWFV5cys5?=
 =?utf-8?B?MSs5a1R0eUFkS2pOYVN4OFE3d3hkT3dJaWNVd0FJUWJrOWoxUHFtRENWdzN3?=
 =?utf-8?B?Q3d4Q2FmZmdtZUE4RHBrTEV0RGhicVljVlNNbERZSFhuNzNHZUwvZFNUTFZW?=
 =?utf-8?B?eFgyYldWSWxoZWlrT2o2NVNUMHhxVDk0aGlZTllEdE84cUlXVU9OMDRncEdv?=
 =?utf-8?B?bHhIZlFyY3JuQVdzNHFBMmViektiRS9sakdxQTZ0N1M3UFBQc1JEWWtHS3ps?=
 =?utf-8?B?czZ4ejBVb3dkUEFqZy8wNkJIRW1WUVlJNkxtdnE0a3BDUXRwTDZYenIyeEhD?=
 =?utf-8?B?emhoOUYxVGh3ZkM3RkZ0aExxWTIwV1lPRmh0QWZhNktzeWZlTndxeE11Vklz?=
 =?utf-8?B?QnhzTlYxbld0V1FvaW11ZmFRMnNDdnJ2d3JYYVRMcVlUTVJIdVJIVDhpRE1k?=
 =?utf-8?B?QjErTERncGp0SDNxQzZYckN4Z3NaM0t4UncrR05FdEZIVldEd2lpY2hwdVFz?=
 =?utf-8?B?eDJuTkpxYS9Kb0x0Qk5wejk1VkhaRHpMSEN4ekthZDQ1d3NPbkpiQi9CR0gy?=
 =?utf-8?B?YVdOK1ZxQkE1Wi83bnNxNzFqQXlTVkRTeVI3YzhCSUJNbEN5Q25QMS9MYkVi?=
 =?utf-8?B?TERXNUV1aEEzSlhIblAyRjJxYllHa2hvZytOYzFxQzRFL3Rlb2RoallUb2hJ?=
 =?utf-8?B?N1M5dUNvUnkyM1Jrd1BOMS9mL2l1RkNFRFZrQ0RWVjRCMzA4TWVmQWk5U1Rk?=
 =?utf-8?B?QlVhdVNVR1JxTnFXZUFRaXo4Vm9SOTdCNTNLVCtBY055SjZKM1BsSUtyZFNK?=
 =?utf-8?B?VEtqTnlxMjFaR1B5Z3hrNi96bmhqSlplSTZqckRXSitjUSs3UUtzL0Rab1Zl?=
 =?utf-8?B?SzFCY3lsUjZMME8wTWZvT2VnMEswMFBScFJQWkhnQ3ZzSjFkUU5ZcFBOQ014?=
 =?utf-8?B?WXJrbkppN1RpY2lEY3hXKzlQZVR5SWNzL3N2OUNnQVQ0SGUxbnFJZHNEUkpB?=
 =?utf-8?B?YkxEL1dxNk45Y1h0dVM1K2dxbmx1SElMNXd0V1pFbGkraUVRQk9yTlNCTk9Y?=
 =?utf-8?B?VGdlS1dXN1RFRHozV3lLSTROYTUxV1psY1N6ZXpLb3hsVFhWOGo4TTd1Z2FO?=
 =?utf-8?B?Y0lZbmZ3RXdWa2JXMXlNSkFVSCtTNzdUclB3N2x5V0xybmZudz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWdrV1lUeWJ5ZlFUbm90eEZRMkVlUUU4Zi9iOWFCMmxaVEFXeVpZTUQ3eTd5?=
 =?utf-8?B?Yzk3Mk9OQlV1Z3I4NVhNNnpTNUZWREVFV0hrSCt2ZXA2clFuYTVOOXdzTjBJ?=
 =?utf-8?B?ekcyaWVVdC82WUFVUWFrZEpnS093VTF0MkxCV2RvSllHWitGLy94eUwzenFt?=
 =?utf-8?B?bFkrWElNdG5URGNva01ZS1dKUzdvUFVpVlVmU0NySFJuQi9Yd0FUQUdiMTZs?=
 =?utf-8?B?R3FMUXBlYmxBamVKMlJyVVVKNWVNUFRrcmlJczVxM3hSTDcyTzBuYTRWK0dJ?=
 =?utf-8?B?MFBiNzBmSkFoN1JINzZuWHdIaHJ5WWgvTzZLMWVNcmMrdUhmZDJrUGR0bERh?=
 =?utf-8?B?UEVoYVpXRUxXbytYL25HOG5ET3JHZ0lHYmVPNEw1SFhzTHQ5dWMwbnZHTGZr?=
 =?utf-8?B?d2JBNUYwUU5md3lReEJ4YUlzSkEwSGtXZnVEOGZoNitZVnlDemRCb2ExNlIv?=
 =?utf-8?B?bk85eEJub0JhWUViMGoyUkZTZFM2dWpKNGEreUNxeW9xaDdmMHlzak54NFZj?=
 =?utf-8?B?eUxQbjl4V0lZbk9aWFV4clJaOEpHQnJTbjhhMmFxdjNrV3J4YjBiT2lIeHlT?=
 =?utf-8?B?VUpMMHQ4TEJyRDFLOGVmUWdRNmNNMnR5MytaWE1lRDcyZi9XbS9sQmo2aUZr?=
 =?utf-8?B?OGxvR1BNalE4TEZCd3ZCTGo0MGlBOVpsMFB4R2I4QzZuWkRIcjEwM0s4TTFP?=
 =?utf-8?B?M0tUMDRlMjJHSjNBdnBZNmhsUEd0N3Rta1FjRWxtMDJlQkpqRU1hTWVETDNj?=
 =?utf-8?B?RGxzRHJCRlNvaWZEY2pOeGdGRk42UWRhNjY1Z0RBQjVjZUkwSzRVUzdJS2tJ?=
 =?utf-8?B?U0JleHlFc1NxU1VDVlFBdG9ua25wUXMyeE52VUxyODRmM0ZXN0xZM2RmVGxM?=
 =?utf-8?B?UjhPQWNjekgxcXY1NEQ5bmNCenV4T0t2eGZrN245NWlJVGYwWDEyZHNHM1Uz?=
 =?utf-8?B?MTFVWUtuc3JkWUtVbFZlQkZnNXZjYWxJNlY1SWFLbG1qY2cyRFJwRE1LL21q?=
 =?utf-8?B?ODgvaG5vSVBDSnY3MHFsMDBaVlN4eXMxMnU5MzFncUJMeFRUclp1cmMrNEFo?=
 =?utf-8?B?QWZjZStsVWZTenpRc3J6cm53UUR3K3NRRFplTmxXWmNlOWdzbnpaNzlwdWlp?=
 =?utf-8?B?OGNNT0ZIOGNZbGtvNTQzZE5icTJXejUyVzFheG4yYUJuRHB6WFZXaTlKVnRv?=
 =?utf-8?B?OVVyWEtRbXQ5V1FRc3NXTlZsRmtqa1hWdmdUck83bm5mUUREeUF2SGZBdVUx?=
 =?utf-8?B?Ym1QQ2RkMy9wNFl2am5LenowbUhZNEtJeVlyL3JieEtweFZyUnl5bEQvdlF0?=
 =?utf-8?B?OFJER1VDeWZZcThrb0N4d21lS1l2RmhBRFE3eTNmSU1pK1JOL1dLdlpBWXhn?=
 =?utf-8?B?MVh5OXFaYm05K0dZYmg0L3h1RGVwUmZmZFZsc0pxV0wxSzhkcXVIM0xvNGNB?=
 =?utf-8?B?Snd4c0YydG1MR1ExWjFjdGJBdllVUkJUQ0tKU0hndnllTldXVURDMXd1dTh2?=
 =?utf-8?B?WHYxZUZQUjVlN0grSnA5djczZFhoVlQ1RzhSRlhVU0JyRzVWWFhIb2w3a202?=
 =?utf-8?B?Sk9aMUhrd3RMVWdFNGd6SU8vV2h2RVMxaFBxRDJ5SGhVT1dMaUIvd25WK3hm?=
 =?utf-8?B?OXY3RWhUbVRIQ3FRMDJ2WjVCNVRoL2JnbThUQ1dXR2wrQ1cybHBScGs5Ympm?=
 =?utf-8?B?MTBtWGtKekhFOTdXSFErVHFRL2hWSDVvdVdWK0Z5ank0UDkzN2EzZlRnekJk?=
 =?utf-8?B?bTRiT0tVbGgrN2dYekRPWjVYK3FEYlB0UVhvTjdSaE8zNWVBeitsMUR3cElo?=
 =?utf-8?B?amdqYi9pdU9XVFRpekpiMkR3QmpwYkVBRGhlYnNWWTFuSlRUZVN6MlB4Sk9p?=
 =?utf-8?B?MVRxa1ZUOHU4YTFqb2RVY2JuV1hoWTB0c3pWU2FLbktKbjUvL1NpZEEwVFhW?=
 =?utf-8?B?SklmSE1sSk1ON3pQZnBPcUdSY0hxV3VOVWRzY3hsZVVjSDZ6dEtnaGZ4WDRu?=
 =?utf-8?B?T2t1aWN3VEJ3PT0=?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-da224.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb445d2-60bd-4824-ca95-08deff8a9d21
X-MS-Exchange-CrossTenant-AuthSource: CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:46:34.4055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP8P284MB2639

Hi Dan,

Thanks for the review. I will split this into smaller patches and send
a v2.

Regards,
Tiago
