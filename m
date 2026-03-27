Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AECC1EA7F4;
	Fri, 27 Mar 2026 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622989; cv=fail; b=dyPGQ98xGIFBPjpk0jhb312V1hMH4u1kgUSvtxFNf51S6jZjfF/GTdmHwM7IjKv12Cyhc+n+o4N6XNKumFYTr5IWKIdDCGyGVnJIt2y/PHnaxcKW92zlgGE3uNZxd3XnX7yeqcR2JlLewNo92l6wwgFwXC2E3qd5GQjlqFnJmb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622989; c=relaxed/simple;
	bh=POsz75mL+6Hky+6cqQXtGHCdVBufGojNAEy/vifPkgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DyhDP5GMWehml2Xnn5yN01sFjhjHWD8k2LYf3rVSFOgIpkCUGUf8ZayoKa9pbKPBcE/6U0Hjh3NO3GTWOuV3RFdnAgHsio9JmYftz0w/MCnwxMHynTXIHi2YbpBg0Vn6JGVhxeP5QZ+y7Xxu7M1m+MT5onBFuazYeHQqpEeWQSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LyMPoTey; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LyMPoTey"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yL3i/Iu+5JA0ipJvcTtwcwTEKcJWnfCgSf/y703Naa2IJv/N8V00e/AlaO2FAk7Wp1k9vTLYcWAfz1i4lzhjXu3Ajd09QvgjvQSIQ6lkX2w6YKc2aez0ITc0cAzK9gQq4G928/cR71gXyIIgWXzXzPfAGyQE/zZsuYpXwJQqmMtMbaD5qrxMQSErVZQauyNvdL198ueN0VAXp+eX1LU8M8ox2AOjqwceb/e7JS28P6SiFmU/268YxKlpU4nRWomQlCxlxqJK1PB3uGIdXom7eeXcsvcL0n9+K6QJy40Cp/qsZw72N1wEJh3lRFIjKXveOql7FeXtM93Zy/ZTgrHTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoEHR8ZQiGwrTcLB6ucuv+1YoHCYi0NIdE10zeg9Bv8=;
 b=JfTE+gagOwFpvV3g5RUaErrzjEfKjFxVnGQfy/0sMkw+qG88MtESA8MsIIKLHnLvFK2tq8V1lVRLmpB+Efhp3khZLn9SPSzTeigt8mpIuACFDLaQOZZK8rqGl+xgVueg9Z2CH2uG74lmYDGsBTcAD1vvL+Io8IAZZpKfCvIC7wb766iYLxzjFT1diAawzBDQP7oCCVpsG4EwX4I4oaoxjWEWMY5jkQws72/7iEGhVSqhdL7K8hAIUxLjMn0fCU1sxj90J8Nw5UFtoU/k/5um3F7rKUTsL/SZXxlZx335OvhdYR9XCisJGQ62R6u9cM8uYm8e0vrKgsfq+Hd8AEbY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoEHR8ZQiGwrTcLB6ucuv+1YoHCYi0NIdE10zeg9Bv8=;
 b=LyMPoTeyMFX9ua1JYsP18ANFHcPxfEifJT2Jj0mMVPPJDZs6h/jRpqN7aGD67OpWaup+n4jsIFBHoHPn9AmrCCvs2LYfmIws57iUqHYqeTXGR7Yt8RESizOXSiC2wfLhlkJX6+pByg4WCc9mXO028Trs1er/sTq8efZfQV/JpA8yc1rUhiUwPcOSEdwRfGikNJJSeFHtKszDkIDeZvwxrnGZAL/p488sz4n335i+Sw01Ux0RF1dgBHYnzvxan6HkR6hWPDmwJcUD6UjSg0hDK3acM4zi4h76AsjD5qoH/tppf1Xp9JppE8Z90bSv7hF0Lt0eo0meEM4u0Z0ZStA/LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8705.eurprd04.prod.outlook.com (2603:10a6:20b:428::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 14:49:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 14:49:43 +0000
Date: Fri, 27 Mar 2026 10:49:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ayush Kumar <ayushkr0s@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-newbies@vger.kernel.org
Subject: Re: [PATCH] staging: media: Remove unnecessary braces from if
 statement
Message-ID: <acaZAWaMAORn-nVh@lizhi-Precision-Tower-5810>
References: <20251125202331.36505-1-ayushkr0s@gmail.com>
 <aSYcZYDUsJ3jy8cR@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSYcZYDUsJ3jy8cR@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SA0PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:806:6f::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6775ec-d78f-4bb4-b935-08de8c101509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	LcJWwBz6Rx1+quZUhyRdPDM8vuu1RXurILupvXZYv7Kv6YtYwz6VMwe+TAUVuIYkayEw9HFKVLjgj/+YEyBKbUquZn7nuv2wvq43T+ujgVT6D+7MVPwSY0t3UddwC1J+BcWHB6Ig2mGMgVJpqSV8k9bRJV8unU3aLbDQYFYHmICpp7jV1IdheCeRP3cGYxc76QCCnSmnckIWa/GOgUJMjmCgzpk68AGaJiigiosxTOjZUmgINO/q3cHTTatIg2ugQaa0oMDrajAJo2kl2ePwnp2rPKF+mYxbYQXs5Lf6zXexYJmhUCh9n+vji0QhUH+sdQhSORjcHewwYY01FQzE2F1R58wcYB89h4txHsoMLkyB7SbL+Hr0JIdCScvuSgHsOaQNwmq0hwzFkUCQ+KGE5tioDz0vf4KVBs4ZoNgd0j1N82SKlnYuOVbHpMzt5tIEh/GFBmkOvzxTxhFcStvf6Oaq/ZmTVEpcCkHPwen5tNDXfwFQzF4HcMIxeacL8vDV/FOmAYrn2DmyNI/Q0CYzARyepIQX86x53c1b/kOovf6ngbvOv9wkwYkBE0rtN5YM6o65wb3eXPxquLtLq/oV4YgQ2Ackl7XcGLyF7pP5k4GmBiX/h5/m/yU1odBzxp1CpfwUINJLhJwniGnXiQmvNiGSgO5/Pyx2t0bptejco8VbW0X0jMw5h8PD0l3EsPKZgB9R9U1RKj2AG1jmlH7A8a3+Tpq8OhQmZUzbfXG5taYhp+YxWbyGus4HvDLGhkUvp+XOuUZ7alh7CXQ0+s9lf/ieFB2hew1/xiQ6MNe8TnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c602XmPMe771ZJHmvNQPFhxCS2Xuk1Rx+e8LLfNgvqloIT5c+Dtb4d+rsgLI?=
 =?us-ascii?Q?YYFv4x3JR19uovP2Rzq06tUJxH/QMfSE9wJm6UgK6EPM39t7LdD4u3LBzzhZ?=
 =?us-ascii?Q?ABChCoYHaD+3BxQ2CDdE0/phUjmw6osGzjkTG1LqhuHlv1J35A/SOOdG7Syy?=
 =?us-ascii?Q?miTif8587nuTVL9PvqE5O4ajZYLU87yFDLublIXPms3t28leYWQwIOLvV3rY?=
 =?us-ascii?Q?Wa+ZuyLtgiL5/g/c+MxgBrFWhT1mnFe1IXpT70fvQ9URwBa6a0qspnDwhmAp?=
 =?us-ascii?Q?fGNnQA/ocPsmKHYVw8Dd1ClrYG0Cy1YcIas9SBa51iyM13XPx7SfCB25klwe?=
 =?us-ascii?Q?B2eKBv5cdXLiUFAyD3XYf2ShXDxTqPUTd8eI9KoeARE0p42RZgRVm5qVijIz?=
 =?us-ascii?Q?2L58iJXJIuCrSsVjwHFkJLSyXr8ux56q1psMMDXZBLNKnPaY4qfq/zauxTNv?=
 =?us-ascii?Q?z0m2mIEBzlbC4oHG/d1qw9iZ+/Fwi5+nU7hR94hZpvDvmr/BsOVmkGvpfY1r?=
 =?us-ascii?Q?MoSMmxgCOnq4drxPjGHr/BEvpsGMYjM6HGRrrmDe2wSLX0Mrt7uRDmpCAikT?=
 =?us-ascii?Q?dELRe5bxFUyXIZURAXHGtiEXDt9khUNwljKHtfpXadS4+hWSNEqutsXItzxe?=
 =?us-ascii?Q?sjcTJ6GResIrMnTey3VTHvii0I+5U9jrs7gMGcB5kbkEOdfUL2TbMhJMKmnJ?=
 =?us-ascii?Q?Adco+6f3uw716OInR2ScdOIu1e49oxQ56dTKSh8qwNHHnK1WmFdBzlYNIkUF?=
 =?us-ascii?Q?evTHSx5eI6K+GkgVzrpi9AGGeLGWfzKmqj0fLXJ9gPsojwXkyhPseMeumSBG?=
 =?us-ascii?Q?aZwVZTos3C4VWQfLCpBX8fMVciVABTL41mNd1v4cNV6JNCDJkxRwb4fDSiSW?=
 =?us-ascii?Q?AeOsPdi2n+cCD9fLLySUc40jHiLxYS60+CncVO0y62s97agn5weg5nBSoAgt?=
 =?us-ascii?Q?YxZ4OwF8X/qzL881shBjvjqNFwG72q3PubCRimzJaaaQH2wt4So48ijRsOFb?=
 =?us-ascii?Q?Zl+iVteK0vF3+pg3+4ZATRG7XcVl3E4UN+Fv7YPHdxHtkMwAwNitSwT2aNjr?=
 =?us-ascii?Q?K92C+a5ETbFKdaIoJk1SW06cAhODhUpvqu6itq1LRoOC+BRTrj/G8rfo0om9?=
 =?us-ascii?Q?FS2eAayjNSKVS7EDEXe5AG4G3jSOqBK9FKA/fXPOLdtbpgeEtrO3T2vbYsjq?=
 =?us-ascii?Q?tDKDRujhzUbheJNxGNQ4yM/eBEEbymCQX+Vxs26/XbhpStIuKwkpERv3oA/G?=
 =?us-ascii?Q?94mOBrZMBn+QPNaq1iJqbT8Uqj6CLH7xwwuSLPaApPYotjlBgwSQA8IfmS6w?=
 =?us-ascii?Q?oZ6PXuNAOwKbZI40Dh+7o/bQU5eVzaMpilhK/NNPDZBSCLS2tC8WebddlZE9?=
 =?us-ascii?Q?qO74bvpstPjAhi2cAdnc6P66CS+qihAiOyyWi5CrFzpbVFDTIGkWQqW4Enrm?=
 =?us-ascii?Q?BJsAJmOk9SANiJmUS2Z7LXT/WlaTIWGHoPZlRzRwphY+OVL7gmwrw2foxvmp?=
 =?us-ascii?Q?mrPAJlq/f97lTzVL5lzKkc9LayE7m8P69soTCjfVBWUtkcS6CKxd5XLPbHQz?=
 =?us-ascii?Q?WlbC78sdpJDj1H4EzVPcSfMHbypZUcWaVm9vb4vMohYUblvlN6RSrHjrh9/P?=
 =?us-ascii?Q?QCPTPYYxh+ZIv1L33FdxqAotrSmAOBfA/L4vpRGCp9TOk04wTRvshqdEfpPw?=
 =?us-ascii?Q?7q93mRD9g1W5N8EU2hDXmM6zuMX+jXXrOFCjt2MdHQBGVp2K53Qb6a4s1J3m?=
 =?us-ascii?Q?5ry6lANiAQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6775ec-d78f-4bb4-b935-08de8c101509
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 14:49:43.6117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aGDBOJoR0XuJMANlPCZPApR9XCvnTv39mPr5bfv7R/K4/aunPAS8Tx4zgALK/4V3AGbft08XN2k5Em0vZtTrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8705

On Tue, Nov 25, 2025 at 04:15:17PM -0500, Frank Li wrote:
> On Tue, Nov 25, 2025 at 08:23:31PM +0000, Ayush Kumar wrote:
> > Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).
> >
> > Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
> > ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thank! It should be in media-committers/next branch

Frank

>
> >  drivers/staging/media/imx/imx-media-of.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
> > index bb28daa4d713..7413551052ae 100644
> > --- a/drivers/staging/media/imx/imx-media-of.c
> > +++ b/drivers/staging/media/imx/imx-media-of.c
> > @@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
> >  		of_node_put(csi_np);
> >  		if (ret) {
> >  			/* unavailable or already added is not an error */
> > -			if (ret == -ENODEV || ret == -EEXIST) {
> > +			if (ret == -ENODEV || ret == -EEXIST)
> >  				continue;
> > -			}
> >
> >  			/* other error, can't continue */
> >  			return ret;
> > --
> > 2.43.0
> >
