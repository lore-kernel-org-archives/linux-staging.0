Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794973552;
	b=5rM/Rx2Dbo5s/timu24aH48oMtRxE2OqA1jYE2U0fcvEYRuwnfX5JRElQNTvox7PrrR0
	 iEUe/WvcSOu2aYbkhtSdOwgl48tNJzwpixva5t7B8eijNAN0dBtRmqe63yplk7JHJuwbc
	 wxzAefVHSxy7O3p9ZXJQms/6uLVvwCgbZVkdVpOAK/VpLBRRlvwRuuZoz4v7VMYzf3rXP
	 AgHfNFQrLWaMvpXNMEJo/wZCNB9gD6RIWAsCbo8jks8r9xU6yL3JwF1eI5errOzC9T3Vy
	 5082X47PxkD625Tth5Fe5MZXuY1OIoh/R33IyQP9pI6LjmWk9WpbKTMs4J2xwspSl1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973552;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZcMl7Mc2qlGZvwlF88HsKx3TZDb6+hrgfmma3HnD+VM=;
	b=VxIYR5A6+mKLIu7FqUoMJ8zHEKTFOf7tNZjCFy0coerWeoVyP7rdrLK3fdDmDaK1a2Q6
	 8F8RWhyHQc7ic3ei9RGOfCtCfU76RxOST+vG20soY/yQEv1O3ngFRs12xyjzvhAtXatKh
	 1PFZFFiAbfF38hpwqyRn9QC/R9B1q2m/ev+KZhO55zTey33Qng6eXIlV2vpMoJ6wUPZ5S
	 nALmVFg9BuVfAjlPOZHK3Tq3F6B+ZRK2X+M7HWQY6Xai6qpV2cHUSNN1yFk+sajYqhheP
	 xNnFukaHLzPfkLFdMTq2hqo9NiGyYA1PmpVmHrRMGNJ/NFWOnq2q3rfDKL01Nz3PP9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=laayywMv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.13
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012013.outbound.protection.outlook.com [52.103.23.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F764606A331
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 03:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F764606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=laayywMv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WihyJokoWoevwAg4eOAaXo4yhH7s/VlNTuKmp0LfyaoOiFZfpBmObU5j/oKCrtRX22xujd+v3d9wMKvBjzlmt930vdasat3DEC1B1dkmmLtIX+gO6ic7EIo6PZFKO8SYUVaI2PGO4CQH7y4+8Ve7LfWvAKk1XE+oPoT2wTNuJ8dkR4E0/GIoUzPU7nqX3wzSPMmqvj7rkUco1gGDrQBFQtgJYkF5dEpkS8r74R38DlrKECDQ10MV7mVIG900xiwmOlx8SysH4eRNkJ0E2xLavKBwYnNglsmxfM0aj636Wp919XsjUbdyFNJiwfcJkMaGxMXiSM/uFHPed2cltpS0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcMl7Mc2qlGZvwlF88HsKx3TZDb6+hrgfmma3HnD+VM=;
 b=m/MV6haFFV98NQdeMKAy8tSZKO7gbvYyVFI5KvPDK0+dvBkJG81yCnk87CW56YlRXOnDjYRhJ3egqlZQEaiojn6jGfO3Bvlyi7sbX6yB6Uj9IMwJsfTthOs0ao8s99qSkYUsbEPuKvQqzG4/OkpoFGfdNXQ1UV2XimqqSZ1TQMhylHQcYQtFm69sXSPFJ2plAOUH/ENDIFUedrmETNVsIu7CUg8Bcxrld8GWu//YWUQFkz6BYtBjxXx/QHqBRkiapyhjVuMmw9PdnTjDqbEf7cIeuF2JEQXwt9+x5WaxlWEekSI/N2FneuK2DY/CPfCMpYYbz+derSUwUP7ifzePFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcMl7Mc2qlGZvwlF88HsKx3TZDb6+hrgfmma3HnD+VM=;
 b=laayywMvRBGP2m0md61QFpsEiSrP/wZ+EOLkVDyRlZcAn0kRvrMgYV7b0mC+Tldy52YnsxSFlPXNQOugImf9WGMGcHDQx8WX8KLb+/pUiF20F3zLtrK8Rk12znwhOfv2MVhrY8G47OtG3asgHd2/aX2OhN9sVv2nsSlq61tm/gZ+A95q+2DlL6cGuTbiKdiOsMUTsoAHL+/6S4b0EMlbbYGckkyXqlGAqJfEJRjglSSZWPpCsfy5UnBikKLM1NlcypSUrjyhNZ6Up+xiN3mspj2DoWW61ItUc8SEhsv1BNQ96w0vp4HsK19Eb+ZiLkKz6GcSg7ysME4A9R4Xe7fxOA==
Received: from DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM (2603:10b6:f:fc00::a5)
 by BL3P223MB0228.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:34f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 03:45:49 +0000
Received: from DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM
 ([fe80::88e9:51d2:ac21:82ce]) by DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM
 ([fe80::88e9:51d2:ac21:82ce%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:45:49 +0000
From: Garrett Floyd <garrettfloyd345@hotmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Garrett Floyd <garrettfloyd345@hotmail.com>
Subject: [PATCH] staging: greybus: audio: add size enforcement to name prefix in topology
Date: Tue, 17 Nov 2026 20:44:33 -0700
Message-ID:
 <DS4PPF67BA2A7859950C09372FE7397AAAFE67A2@DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::14) To DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:f:fc00::a5)
X-Microsoft-Original-Message-ID:
 <20261118034433.260003-1-garrettfloyd345@hotmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF67BA2A785:EE_|BL3P223MB0228:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7869bd-d3ec-423f-3ccb-08df45266f13
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnrlC5lHdFGci+YUsdS3F/CIHZC7dYGC4KwVWAyMJLmjgg9mb10npqehDPZBqTViGz1eGbU76u0T9KVjO783t6GyEhh1KEqx6wfkI0ruT7Mvgi2j2ezRVKQ/WHohSbGC2qpztHEAZiawEXu/mQLIV2kMcrPgRxO5sD6P5QOeYwxngYU3QQgzL3RGrQcN/d/0CQnbRWxQVe8YWKXGfW2LW5Cnp/spCGFkO7UaQyjyg00nCBZK80FSpNJn3cTeWtPKLG+WoSgqnUPlxX0pkTJqP6UMQ5R/5eJ4BE/3CfshxPpliR+48GzZMaMXOHJnIxJVJ/AOxXv5+G63hDjL/ZE2PJL5j6XDw7n5zc9mrMtniHoM/6k4CIvSgfW6Iv6hne+JH+lCaV/k8lS0lQ2Plb1bQ/I5RfZwoKICUd3rFV6pO0e+1eEd9OqeoL/RlsyFRTYa+iBGGeUY8U1pW9yuR44ylVjx6Eady980znmsAi1QLqrReSkrc+F1fw3/M60z/ozk+uZqhvgTwP+g1EvLEacHejZlwFyjuPK5NdtBNhqiCyGq70vr7HY2QxFCq3n6ZTDgFJmvq2k0bu90vkrtDs5lAnq0mKjFoMZy00tu4VJB1bu+eCW7KvriyffFHbXug3Q1B+JkKgX/Pg7EoGuwQN6pmvlDfeNVp80X3WPYb8sQmQ3MY399+EcWuxdJahlyZABbpVFAwBNLTJ096tQmjTSqeI8xZ55SVem7NIWllNpeVJXrn5zeUU0x9+Sj33r9JK0VNN0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|5062599005|19110799012|39105399006|8060799015|23021999003|5072599009|25010399006|4140399003|19101099003|260925184616899003|6090799003|440099028|3412199025|40105399003|18071099003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE4wYXowZml1bllJeVVuLy9CQmF3S3dGa2R5eTFqNmppb1pHS0NUMFlCMXNv?=
 =?utf-8?B?QUFKL2c0TlE3ODdRYThwZitmajg1azVJeW54ZHRKUmxQdFM4c0QvUjcxWmIv?=
 =?utf-8?B?ckxZVi9HNXhnTnF2VXpoRVczallyWEVGUjczMEEyOWhsa1JzVzg0MWJSRExV?=
 =?utf-8?B?ejAzV2JaZUtaYjFlRy9IaEJ0dEwvVmxucVhpWFhtaUtJSEpSak90dHN1c3Ru?=
 =?utf-8?B?ZTBsUHN2LzFYQ216VGNMOG51dWpCUkJmUDErRE5VcVNxVXdaYXZqdUQ3Q2NN?=
 =?utf-8?B?MW9RcktwOXVWeFU4dEpCSkNXZkdoUHBvWFZuc3MvWFBqb3RVK3doWVlVWkl0?=
 =?utf-8?B?U3N5NUIzYW9KUzNMNGlsMTN4bUo0aTJXOTdnMXRRaXYrcGdtZCszSVVsN1ZN?=
 =?utf-8?B?ZlQ3OFkrQnFMT25jR3BMUEdKQWwzZFViWnluak14dWQ2YXdJdjlZZjhqeG1D?=
 =?utf-8?B?Mi9lTjNTNFNsMUI1akN5NDVBMURJRGFCVElvK0JiTG1icEQweW1Ca3gyZ3hq?=
 =?utf-8?B?NlVJZlhxV2Iwc0pEd0w5cG1heEJPTWllWnBwd1RkZnRaVFo3ZDFwNVNOMXFm?=
 =?utf-8?B?Uk9QSi8xZnVqVzRlVEFtMFI2M0Z4R2t2cjczUXVacFBVWlNMblY1Y2FiMUtH?=
 =?utf-8?B?WHJiek1EcnE5N1BsbGtXUi9RQVNlYURSdUZ1enNPcUtWV2NtOXJjZ2E1aHNM?=
 =?utf-8?B?Ry9KbmhIRXFIZ21vbExvR29wNW00TjlLZGpkZzBkSk8xU1ZpQ2hSSFBQbThr?=
 =?utf-8?B?M0VnakdaNDNLb0ltSDZaMWNIS09LT0JKUG1aREFaSURGbk5OeFJBWGU1WUlt?=
 =?utf-8?B?SFV3V0l1Qjl1anpKL2U3elFwZCtacE9oWDRXUC9jU2tUcFZlTjcvbXg1RlJr?=
 =?utf-8?B?SHdHYXNvMFFzM0c4Nm0rWmZ2VzYwMUlBS0NydGlteWRrOHlEU3RZd3ArKzhk?=
 =?utf-8?B?eVhhN3c3QzlRSmx4WTRxZndBNDJMMTVBaDVpbEx2alNFOWZrYlR4aGhjTnpw?=
 =?utf-8?B?M3YySEE5QlV6MHNia25NN0djSTdxN2ZUdzFXKys2NzlObWoyRVBkYkhhOXdr?=
 =?utf-8?B?VHR2VzA3Y0FOV3VYamtnd00reDhsaFZUaW90dnZRdUdOUnVBamZadDIzZHlX?=
 =?utf-8?B?SFJOemhOZjRHdXFXRjhCTUpOQVpuaEFQZmxvNjhzVDZqQkQ2bitCOW10ei92?=
 =?utf-8?B?MlU4L2xtN1hoVnNyRzN6SWxIREx5SU4wdG9HbU5uRXBsWDZPbUNhRjZlVmJo?=
 =?utf-8?B?eTNBMEtDeE84YnNsZFJkMHkxR1VPRnptdjMwN0FPMGpreWd6VThob3ZUbXFy?=
 =?utf-8?B?MXBjdUR2YzdCUW5MTFVaOXUzbU1nKzFEdXU0SWM1WXA4UjdKekh1OUx3Szgy?=
 =?utf-8?B?blhrVHRxNUdFZFo2eE9rdWtvSExTbGJyZnFrN2xkTzZxU0U2dHBSYzVyMCtN?=
 =?utf-8?Q?XkHCpTWW?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE1OSkU5ZUFpT1RhK2JQK1pRZXcxSEpiSmlRK1VWZldRWXpodVlNV1ZNaEJy?=
 =?utf-8?B?aytOR0dqQmZjNnl3TGZlL0tDeUkyYUxaL1RHUnRndjQ3UWt0S3pFS0N3Qk9E?=
 =?utf-8?B?aWZLVFpyaHlPN25ha2FINDhZTlJ6RjRYd1VUQnlZQnhyeGd0SXlBbVI5c0ZW?=
 =?utf-8?B?SlBxUW43TVBzOGZtalk2T2FUdDFlZWUrUkZ5ZDZSTm1mYWhmLy9mQ3ZVblFN?=
 =?utf-8?B?RHovbkVqVjhXUnNsQm5wZlZXdHM2S0daSXhTZUVSN3ZtcGxrNVF1bzdUSjRO?=
 =?utf-8?B?OWhQUFRjYlNUcUFpNkIwN0djY3U3YndreklSUGw4SWkrMS9leUxGdGZ0Sm44?=
 =?utf-8?B?QlNBMEJRNlRCb1BKUDNTK1l2akVNcGlYTytYczBtUkYxcDJwK1RNZE04b2Uz?=
 =?utf-8?B?N3RYTENHRGxSUElTTHpWY3JvSDhIbzFwRy9WMDdhZ0wxQU9ia3BubHJ2c1Vo?=
 =?utf-8?B?bHhPM1crS05hWnJESDJFNDd1ZHI0YzBwKzV5TERVVHJ1N251RXE4YkdkaDJK?=
 =?utf-8?B?L1dUbzZJL3d1NG1SUVdwVWRkblFNU3FwamVDMVJ3TkxyYVFGTXdMYitBR2VN?=
 =?utf-8?B?L2NXN25uZ3EyQUNmNjZjOWVvMlJQV3k4ZStHT0JuSk1jVWhqdDRsRHFKajZF?=
 =?utf-8?B?VHVDcDM1Y0RJYkhEUkRGYkxwWDlhNXpDMDVwcjd0YmdmNSsxTHpiVGFLN21B?=
 =?utf-8?B?eDdjODN4Y2VUU1FqUU9rakVDNmtESU8vR21acXplcEZpWkp0c0lDMWVBME10?=
 =?utf-8?B?TUErRk4ycVN5ZHdrVWRHZ2w3N253SWtWNmY2dEg3OGswaTlITytzMEJJQkdM?=
 =?utf-8?B?ei9DQlBtOG4wVlpiOHdrNllmWVBRQ0p6U3FhRnBlTytaVkZNVXJ0dmNQRVdU?=
 =?utf-8?B?Y3l1ZktEem5PdWR4cWdsYzY3dzQ5TExVRDJTWlRwSEgzc2hIRGgyeTFkN3Ay?=
 =?utf-8?B?RitjZ2xKN2kxTktRS2pGRzlPZWZXbktQR0svNW1SWk1UYjA1eEMxY3BJZUpn?=
 =?utf-8?B?S2xhMFhGaGJPSlVxaU5SaEppN1pYTnFIQlNOYXA4d3UxNGdOa3VKTU0ycmlp?=
 =?utf-8?B?L0tUQ2hEdHQ2RTBWbmZRbnozbE1EcjA5Rys4Y2ovM2JnMU9NNkZWbWRNL1BD?=
 =?utf-8?B?STQwTGRxNzF6VHcrVENaajlYbGE1SlgyVWZNWUU4WXhDSDFVV0tWWU9GNUJi?=
 =?utf-8?B?bC9heWViUzJvdVdKajFDZzZXUjBXUFp1cHFDUThmZ1IzaXJoR29YbXhPdjF4?=
 =?utf-8?B?R2MzUk1XZlJCYk5TWlQ2U3dBa28rUEFDa1gxZllScE5FeGNDb2p0NGZpemda?=
 =?utf-8?B?RktmSUtZM3F2T205M2M5bGFnKytZM3hMSlRlNzVRRGlRYStQSnpKQUpPZDg0?=
 =?utf-8?B?eDNtSjRMZmRCb1dqa0xlQ25MTmo2ajl0SVZjQ0xGTTVoWCsrSE4xb3F3MWEw?=
 =?utf-8?B?dVo3UEQ1ZSt5YWliekhHMVN5Ync1SEFybGxHbWo1VUwrNWJDTmJTa2pNZlkr?=
 =?utf-8?B?R0JHMnl6Smg5elZEYUJJMVVhRDVNWDRsdmdNM1ZnMUcrdXlMZTdsYnRkcFEw?=
 =?utf-8?B?WTcvd1JOUDJkL25ERUVKcm1mTWtFMzc2NTdmS1RkZnhaZzhXazNiYlBoWHdL?=
 =?utf-8?B?QU9jMmZLdGx4K3g5c2hhSE42UFloYi80YThQSzFpWE4wUlhSVmpEaVFSa04z?=
 =?utf-8?B?V2lpN3N6KytPZ3h3TVJiMTJXWDRtZlpiLzV6RlU1OUhQclZubEtjZGU3U2sw?=
 =?utf-8?B?UWhLVnhLNkp5RnJTSEY5dXdQNUdPbDV1QVp6bWI0RWlucE5TNVkvOFlzTGZZ?=
 =?utf-8?B?aFRNN0cvczd3SHhweWU1QXBaODV1ODN1MHFsM21MWkZaNXBWbzZNVVNiYVlK?=
 =?utf-8?B?SGlUOVBOZnFKdlJrZlB6N3hBZFVYa25obnJCWm5BSEltbzZaanU3bk56T01E?=
 =?utf-8?B?ekRYMmNmZTI5aTIwbU9aQk5SbkNwMFpLZVpjdXEya3JyK1JBTW1rUEt2Ukx1?=
 =?utf-8?B?a1psYzhoL0N3PT0=?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-583ad.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7869bd-d3ec-423f-3ccb-08df45266f13
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 03:45:48.8957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3P223MB0228

Copied name for certain functions can be 32 bytes, but destination is
also only 32 bytes. After adding prefix, name may be truncated, causing
compiler warning from -Wformat-truncation.

drivers/staging/greybus/audio_topology.c: In function ‘gbaudio_tplg_process_kcontrols’:
drivers/staging/greybus/audio_topology.c:1172:65: warning: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]
drivers/staging/greybus/audio_topology.c: In function ‘gbaudio_tplg_create_widget’:
drivers/staging/greybus/audio_topology.c:1090:51: warning: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]

Modify the temporary name buffer size in
gbaudio_tplg_process_kcontrols() and gbaudio_tplg_create_widget() to
match the maximum size that can be copied back to the name field. Add
a bitmask to the ID put in the prefix to assure values 0-63 as stated
in "include/linux/greybus/greybus_protocols.h" for struct
gb_audio_control. The compiler expects 2 digits max when bitmask is
presnet, allowing one more character in controls compared to widgets.

For the widgets, name may only be 24 bytes max for IDs 0-255. For the
controls, name may only be 25 bytes max for IDs 0-63. IDs with less
digits get truncated regardless.

Compile tested only.

Signed-off-by: Garrett Floyd <garrettfloyd345@hotmail.com>
---
 drivers/staging/greybus/audio_topology.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..1a6ef1bdf170 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1018,7 +1018,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
 	size_t size;
-	char temp_name[NAME_SIZE];
+	/* Subtracting 3 for "GB ", 3 for ID 0-255, 1 for final space */
+	char temp_name[NAME_SIZE - 7];
 
 	ret = gbaudio_validate_kcontrol_count(w);
 	if (ret) {
@@ -1087,7 +1088,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	snprintf(w->name, sizeof(w->name), "GB %u %s", module->dev_id,
+		 temp_name);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1143,7 +1145,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
 	size_t size;
-	char temp_name[NAME_SIZE];
+	/* Subtracting 3 for "GB ", 2 for ID 0-63, 1 for final space */
+	char temp_name[NAME_SIZE - 6];
 
 	size = sizeof(struct snd_kcontrol_new) * module->num_controls;
 	dapm_kctls = devm_kzalloc(module->dev, size, GFP_KERNEL);
@@ -1169,7 +1172,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
+		/* bitmask enforces values between 0-63 */
+		snprintf(curr->name, sizeof(curr->name), "GB %u %s", module->dev_id & 0x3f,
 			 temp_name);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
-- 
2.55.0

