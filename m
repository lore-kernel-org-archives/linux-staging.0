Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1834DB52
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639414; cv=fail; b=maMhkWmwM79CJ2UQbsjmQVkOomi4lqHgVqZriIz2VPdIqKc9JswTz+eUMCN/u5oNx9p5W9Tsp58B8aEeuZykYI13jZjfXqaizHAzEZLUH6p9qOxw8yZ7HqmQoPDDFcFxtahJaNYuWKZEBK4o4Ltch2zevB4AmnQc5pXSe1kjaos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639414; c=relaxed/simple;
	bh=GGEuZxbWsE3mAiAFO5iFqOHXOxYZ1V0kEqdexHjf+fY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TTNCRybEFIEae+ePigKQ4OL3Ae/Yl8wwxG+IDpWUfvlYBmJ1FBBeNzHdRfrhm9xeB2aCpHBIvLBdcw/MseGLWO0FrqGP3kNOGD7khC9pcO5WHB0Gy3c5XiLp2Bc3BdKXmS8cID2bMi1k6/6GK2zv9kBe6t3FSuvUoYkmxVXRF2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UxrR95m/; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UxrR95m/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGXCxZgCHQdbndvSMibPSBRluj6j3HRwNNrRrgSd83PfpA0U4OnMIfa21Y1dlmFBPM1QUWRWETyR/g3qdxHQ0BpuqfEA2rcQHezEfGJ86VgHZW3ttOzAXqXYnrH34cEMHkHvUccvZH0kKXJyd4QasDCNGjYcCWZafo5MWbTSEQ6CN9Cw0JIMdw7gH4IxE7KRub/hpnP1Ha4p6VJSTSfivSmSYag5uDYwnF6+eiWhvAVwtD3bmbf1uoYqEp1nhAFsifD5MMCzbenr7FEKIkONMEcFrPXiUEK93Q42wac2vWIxcu5ZF1Ci4cosAG9Nul6oSLG3aMY7/fwVHuZGres9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGEuZxbWsE3mAiAFO5iFqOHXOxYZ1V0kEqdexHjf+fY=;
 b=SkQMGyW3oTywEXLQZ/43S97CP01HHnzi+Wne9x0z7fI0BXTfdX+9b2SS463lash8RfS3GMi9225wONP1+g0VBCBLCI5IGnOvlaKS2kf+dt16urNsMJWPq7BBQOOEMMP7YCdi08KQX4c4D+r/4GhFoNXg/KWWo58ovWtfEsPOJZJrQmw0cRkoS1Z/DqQoMJIIPlsFUHkJlk9iahzDPm/V77qZnBJodVhIR6Td05tOAWwQwlSUCNO1S9pOPTm/KsH4VfsC2HFTSyq9SzLKN2yQMxwp1AE/kNGwX1dD0S8Nd151NPOtAMblpxLmOgS+vetNvIKqdl5QiTw3vbct2Qqy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGEuZxbWsE3mAiAFO5iFqOHXOxYZ1V0kEqdexHjf+fY=;
 b=UxrR95m/gx4vTianYO/Wbf+2E0DFkguW+MrKAhsjC8jVV9v8IWGdjmTYCDivNry6VNiE6KkkdAx2MKmbO28axb8OC0a8osD7eEQsT0CIBu8Q3M3bB4ny6rQrzb63XkC43lAmnodr/+rT32qvwbMnjfTQQih8gR0gyS4xDbzDKqmMbWFiYM3decDTH2JC4ILl/+zE6063p5gW0Du3NQD+lEjwBp0s+IssYvYC28DZCcr1a5GkTP7BF2ASdXEJFj7yYRsMEutFVZVulhy9PDGwWccV4jx5FV3I7ZThNS/ZLh+S3bLbFaVXU9WUck+jx373umUEAGCvF+K9FafVYPclzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB10550.eurprd04.prod.outlook.com (2603:10a6:10:586::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:50:09 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:50:08 +0000
Message-ID: <3f897a93-3aab-4274-bc9b-abe23f2a70cb@nxp.com>
Date: Wed, 4 Mar 2026 17:53:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: Clean up unnecessary parentheses
 and braces
To: Eduard Bostina <egbostina@gmail.com>, gregkh@linuxfoundation.org
Cc: broonie@kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, simona.toaca@nxp.com
References: <20260304153426.2217417-1-egbostina@gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20260304153426.2217417-1-egbostina@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::19) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB10550:EE_
X-MS-Office365-Filtering-Correlation-Id: 92180f6f-28ef-4916-5b45-08de7a05b5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	0OLv5EIid/PO4SgxciLKDJ1Ufzb8OYKFM2RYGwQJQB/uGoJ6ouZ7yQQIbpdQTHC2ibuVFK+hRDlPNQ7zYilrvMYulC/woU6bXQS8jjGCDBUCLXI7jp0eDXbsqRSjp/O6o+H0E73of75LI0S2TL9tSLifNTpfRORP2lUn4f3uKp2OCZGHG4ilWHcqGOEpHVebuoQ04cJJ+16ERNqtRDLm69SsthzgtKOim1UjkbW6Mk8TyDeZbArF0CPe9qg836Gfrg1y8VXCFDViYVY+SaeZfKRmR3OwjOzq7c7I4BQlFb41Ecx4S45Gic1nH2RiLoTyRHp2dqA+vFeZBa3yoSK5DKGxSAVDa31VZBL5Zn1nQugqPZ0xZb6XNwyRkzh3ekMA8CP50CUh7I0YvbtbQSWk1g9vW52Kons+wnanADbF99YNYT5rcq2jyGD+8dL49TSOnpLHGhrvEk+lUk8hwY6I9/2qLrkBLOfbBQ9DJ3R11CR8GtpMy2Ik/UIiOefRlLHo1OJ/ecxuWz4/LGtOxXxyPLyfYmyrEY5DdgHOXsrJUh7Req1dB9jasr0CSLbHc5SKQ5hNvzP3jCKqO3/MDvolTA2vmL5BOV2AeURuv0T+0tIW9h7WvlEyJ3HSAf8i5zuMn1IzrzpedBTM+6CGt7izzbHK4/a0n6cuQil8/kBR+2Qmku0oQozg6/MWjXZBMg5QM0C5FhYufW5ggU/d1UfP8aIo9yT/s8k6zI1zL7KDvg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blZNT3hBa2haeU1meVRYSUhzWjNldGhwalRPN1dnTktLaUZsMG1BNGNkVmVK?=
 =?utf-8?B?aUZnSW9Lc1JWdnl0YjkvWnVVaUdwcTh4RmJndW1lNm02MmdTOTZ5emkyRGVH?=
 =?utf-8?B?aFdRa3c0am02cU9VTXpaYmx6YVFoM3VmbzF3NFpiRDc2NVZHUjRPSDNNbWVn?=
 =?utf-8?B?OUFpbFNVVzMrR1pOTUtLSHpOSUN2YTl4MkVPWC85eVlTUTBsT3o5ZG1Mc1hV?=
 =?utf-8?B?dHk0c1VVdnhKQk5rdEpOa1hYNHFPOFJhUXJMV0pZSGtqQzVoVGdXSmI1TWtv?=
 =?utf-8?B?RHVnc1RXb1ArY1kxNU5iRzkwWk9aQVZQb2RjUVVLQituc0luOEpUV25RZHZa?=
 =?utf-8?B?c2VHdzVWcVRGYXVhTThoSHorajRUc0Q4YkVmWFFTdUlRaTFYMFdnT2pFc29m?=
 =?utf-8?B?SU5haUhFUE9NOWI3RmFxdkE5QitGUExoZ2V5VEZFMkxHQnB0VE4raHRERnFK?=
 =?utf-8?B?eGdzUmtMc2xDb2ZubWNLWFhQZ1AvejNDMXRYd0NBbm9JQ0huQzJmTzhrR3FN?=
 =?utf-8?B?azNEcUN3eGV5Tyt3ZVNkenF3WTFTdmdhY0xqQ1lNSDZyM0Y2aGVCSmJoVzNk?=
 =?utf-8?B?Ujk5RHlQaXpZb3F6YmV0VHRIVmNPSGlINkF1d0o4aHhsZlNCSS9ic0N2Rmd2?=
 =?utf-8?B?a3ZaZ3N5eVdEaXF2WWtRdXRIV2xMZlFnOWVPUVp3UXFZY1lHaFl6NXlnaitn?=
 =?utf-8?B?UkgxVytlVVBjUGp5bEo1b1B0UCsrcVhzUU5aQUM1QU5PVlV6RkkzWElDbkdq?=
 =?utf-8?B?NTF2djVuRTZ3N3lPYlNQeGY4YjFSdmllNWh0SExzUk53amducGdDV3RNQXF2?=
 =?utf-8?B?NFk1dGZyZjYrUUdTdWJVM2VIZUNJWnljekhTZXJEODBzbkZZYVZxeWxlUXk3?=
 =?utf-8?B?aVIvMlNJRHRIN1RIbGVGR2hPN2JOWHhZdXBBUGYyWnBRTzNaOTdKU0pFQ094?=
 =?utf-8?B?SU9EUkpMSmc1b0tHUm9rKzAyeG1KM0dIaDVRZWEzcGk5WWszcFFyK3N0K3Fw?=
 =?utf-8?B?K0lmNEVRczZCTE5UdWhhVk1YNmVJeE9KeWZXazlxMkUza0l6MzM3bEluS1BF?=
 =?utf-8?B?aTNRN0VWRTF3QmpZSmc0T2poRThiWmIrNC9zejdrbFF1L0kwd1RqTUdRcDlS?=
 =?utf-8?B?MVRvUTE3YWkwSTczd2dLMlBtN2xERExHRmRWQzZkUk9ydDI2V0gvZSthNjVX?=
 =?utf-8?B?WEpOME1tZnNpNVZpYXZmRzFySmhBZmJZM3dxUWpuZEROTDc0YUIzN0NoTlY2?=
 =?utf-8?B?WGlOSTNZRU9QMWpRdTAzcHBPRE1iYXdvZWxLbjdGR3pIYmVaaXM2N1JIa3J3?=
 =?utf-8?B?M1VodE1kL2NjUS9RWFlJeDZXN1lBRmhCc3BRLzBtZDVrTlorVXlPQ1FrM08v?=
 =?utf-8?B?VnJEWlQ2N0wwUVZwS2xSVE84S1FWcnhBR3V5WHU5OWxKZFlRTTMwMVJJekdU?=
 =?utf-8?B?ZzBBd0trVUlwMTg0eThSOWJ6R2lidm9Xdit1QkJpdXJabk4wQ1ZaRmpNNXVv?=
 =?utf-8?B?TFdLZ3VzbDhZR0QxdFE5cDAycDdCQURwQkRocU8wQkZLdk12dERnaXI5aVhF?=
 =?utf-8?B?UHB2d0I1OFViZ3drR1VIczl1cjA5dGxHWVE5YVB6L3dweG4ybitYcTc3cGFX?=
 =?utf-8?B?ZWRlLzVnb0FZQ1llaDFkS2ZmZVRNSlMwOXZqV1ZZYStjNVVTWUtEamVpbGVQ?=
 =?utf-8?B?UlF5b3dZeUhheS9Oc0g2VncwdDIxei9mRHV4eTBkY2lTR2QwdkQ2RDRNdlpG?=
 =?utf-8?B?alJ4ZGc5UXRQQ2daVk1WQnRSOVZKSmhOTW9ka3hoM0s0MFIydDd1SnJiUzBQ?=
 =?utf-8?B?anhBQXpzZ3gxY21KVDVmTy9ZNDVGYkUxNzl2S2NlRCtCdk9XSndOVGRmR1RO?=
 =?utf-8?B?T1F1OWhVT0dUa0JoYWVpd25TZXVmTk9GZlZZaVE3UXRtS3lYNU92N3U1a3h1?=
 =?utf-8?B?ZGVOR3dVV1lVTnE3djE4VmQ3Ykxqc3VVeWtXZEVCYWw0WkNsZThEdHgvZmt4?=
 =?utf-8?B?Uyt5cmpJOVZYMHVpY2VkNlB4ZEtxTG5Gb0FXemcrdldlbnViUkR5Q0N0QVZH?=
 =?utf-8?B?M0x4YjdEbEhpRFhqYXFTeFBSM1hJUDZ1ZS9BOXZXOUIyS1VqSE9ORjRqUWtB?=
 =?utf-8?B?Sk9iWW9nUGI2SzJlcVpCT3VqN1NKWkhvWEZYc1RRWDVSN3BtQVdNWlh2azd6?=
 =?utf-8?B?UmQvQk9MbUQ4NTJhY2xINVBENWI1ZmtSRE5CS09QQTljK2pGM3A1RmtjMlcr?=
 =?utf-8?B?K0YwTVRyNTlrNmpYMlFmT2xWSThPRGNmVENNRENGWGhPaGZSdVpTeU44ZkVy?=
 =?utf-8?B?cDI4Qlhha2pITFhpczlWYlUvdDRYOUwzYkZrcDJNbWRjeGhJZ00wUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92180f6f-28ef-4916-5b45-08de7a05b5eb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:50:08.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYnrgCvJu8gTzWzSxufb4O0EQ3Kk6Ma4OxBGRAy3cQPSTTimfbv+ufnIP85l8pLSl0qpt/+ql8k0pkG05hxZVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10550

On 3/4/26 17:34, Eduard Bostina wrote:
> Increase code readability and follow Linux kernel coding style by
> removing unnecessary parentheses and braces.
>
> This also fixes the following checkpatch.pl issues:
> WARNING: Unnecessary parentheses - maybe == should be = ?
> WARNING: braces {} are not necessary for any arm of this statement
>
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
>
Hi Eduard, This looks good to me!

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

As for the v2 in the subject, you should always start fresh

when sending a patch to the community no matter on how many reviews we did in private.

Community is not aware of that and having [PATCH v2] is confusing.

Greg,

Should Eduard send the patch again and remove v2? Or is this patch still fine.

