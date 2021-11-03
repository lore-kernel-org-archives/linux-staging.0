Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7C2C80
	for <linux-staging@lists.linux.dev>; Wed,  3 Nov 2021 11:29:40 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A3BONXD011821;
	Wed, 3 Nov 2021 11:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=UC3CpYJjCDQKNOtbmK8/SIA980sx5BouDf3mry8nH4o=;
 b=LV2l/XhWySKZq3XITdFDy98CaTECtz9mpt8hG/t/osaEGJ19LZEWTcRKiQHutCv1GEa1
 JxhJCtmBeHkIYq0gGblyk+x9qoEp7QkCo5+bOqGHB4tElCSipfg7PQu++8mwu330IFPu
 U6U9nlpz87M+wkkac5yrFuJx8IqN3NpHSNzH3PaIrZxtgEubZyBUNbmgH3P2Dj67ohf0
 +4rcLbVxuj8mVvBrlEHbIbJR5gxnHCaJsk56NU9IsL8X02eualGCRUnZ45aHzf3US6zi
 WQ6TJUyaTRxzu3vi4nZhK/6UxAql6px1u+mPRSk0DyYALwmH3j5N07gnofSX9TT1XAM8 RQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3c3mxh1bt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Nov 2021 11:29:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A3BBc52154049;
	Wed, 3 Nov 2021 11:29:29 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
	by aserp3030.oracle.com with ESMTP id 3c3pfxfy7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Nov 2021 11:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGweMTbltjtfsfcEeGHMKq1MK3dpuRHo3sN4ewZtkktUHMHqad2IeTBGY6mR453olodMUEw+SZAdMzuoYZLNUWKdB8ITiNk5Bl8IOFBOTOvLqfhklR84NXAhlJYdbF9gjOrs5trl3mtv+mkYGlEEaxyuyPxsBAaPFRLmtxSCGg3LB070e/5fKeQ+vYdoymDg+lJPJPabGCQjcGTnmSWU8dHoIaUVBkX8kF5qH3hP/KYfkr15azSTNYuZ0p9YGXLqlIDjd7sMYwq6mb2HunYx6Vi6YBz8QRAMXdE1j3GukC4urKltyOflZ6fMnxf0F0hf7IwwB5Xj9Ybzxdr+rsWh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC3CpYJjCDQKNOtbmK8/SIA980sx5BouDf3mry8nH4o=;
 b=hHBjHsy+upGJSecPK5Gw9M9j+Fopxi77zN7P7oTUdj+Nn7RtFpnWfIIWtm02TjM//llGtAos/FFiCiM/rB4CQxhB+BwRPX21PEyprtsVd/uMQOMRcYYnNc7+W39t2jlInymaOQPTQGi2ApplPYMQhhCUNLoCmFqc/7qh3JsJQlWFx0EdKyDdPYfh6RyjYkbEoq738RiVU93Y+GoRI4sd4oCL9BJx0HgzmHITvdWqYeSmVW5FYTs50Imo3TNXznvWgD1KXIMJURK7ECScGvxB0KMFbzy03YfLv0iPz/xQfT+YYNOqIYuuvKTaNqiIoXBURt8eHd14p5UuXTLZHhxpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UC3CpYJjCDQKNOtbmK8/SIA980sx5BouDf3mry8nH4o=;
 b=mPFjHudgjRclASNY/tJqRcqtQZlLntYSDAdS36DCYYcbElpZNNK/3PC0RvuNyReYBHzEgLUOu1PHHjuhx25VTNEUgJ8QSzO76TASUEw6RNmIKuqzyZ42sjXVrrGQ3G/2ZduXBkZTIE4QM0xOvotBmSEIS6FAkzaITpoyYTZlOlc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5677.namprd10.prod.outlook.com
 (2603:10b6:303:18b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Wed, 3 Nov
 2021 11:29:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 11:29:27 +0000
Date: Wed, 3 Nov 2021 14:29:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        knv418@gmail.com, jiapeng.chong@linux.alibaba.com, ojaswin98@gmail.com,
        arnd@arndb.de, lee.jones@linaro.org, clrrm@isep.ipp.pt,
        fabioaiuto83@gmail.com, hdegoede@redhat.com, ross.schm.dev@gmail.com,
        insafonov@gmail.com
Subject: Re: [PATCH 7/8] staging: rtl: use eth_hw_addr_set()
Message-ID: <20211103112906.GQ2794@kadam>
References: <20211019171243.1412240-1-kuba@kernel.org>
 <20211019171243.1412240-8-kuba@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019171243.1412240-8-kuba@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0063.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0063.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 11:29:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32215957-259e-4de9-e87c-08d99ebd3170
X-MS-TrafficTypeDiagnostic: MW4PR10MB5677:
X-Microsoft-Antispam-PRVS: 
	<MW4PR10MB5677CF7C1A91B9EB7DD884458E8C9@MW4PR10MB5677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YKRKTEAJWVI0zW6s1EOVni5NsjZ4CMhecXuKoA7nCzNkCE+9q3yuIFjpCXurIHQapvB6R+01j6yv9we1Dujee/5wjNXlvUg6IR1/k7lvd9hdE6SyUCe8L3615ax0l9G3k9dMwCz5iZZfzC5/j/FmmAe9+075mIb05YahNMUObUd0AgwODLraYobJSlXLIfBaxCV/xekbGvcwTTbBLMqxnHzn8OK94wIsocBg6HjWi+Exewpr74ybVG52PqHZzTgP3gBa/G3j/Fhg0Di5yoc8Lmta3g8OJ2tCsMQu+cPn3KkhIJO5c4QrW4h1u87tvcTE1wilbhK87Wi4NaqPsujqXBkOiL0xQe0s8va4qjmkH6V3vqjJYWKe+bOE9Zt2IaRl3Rwpv35erpIUD/5dAFbMQzei7bODqJCClFzJDY3khR1fW47ZJ8YJ5qN7fQcDBv48BSobskJhoeVG3VMXT+bzEnu2N9tGcHhbaZj+SxJt8MNtt/u5+J8lOOg4KfNFXRUYFswZxhrjAIuuTEw8YBA/kBjvV1QCzgdMCwns3U3+4kwa5X+e2NBGbOMC1J9fSlcv8aEPITE6iGNoD/IFvHnzzjh1BBvK5sH5UaV155KsqABZZeGYv5ocJ4PJnrB1OLVxx9y6bIaT831iNeiAsrPR1RA/f4b20DhinS7nV4kfGyuDjacXB+MaNZM/PSjEiRejkrXIQPhYz922eJ+ArimkSg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(33716001)(66946007)(6666004)(8676002)(2906002)(38350700002)(1076003)(38100700002)(52116002)(8936002)(83380400001)(9576002)(6496006)(956004)(33656002)(9686003)(316002)(186003)(508600001)(6916009)(55016002)(44832011)(7416002)(4326008)(5660300002)(86362001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VkXj4oan4w4hXV9NIBtGJNaY4cNa0WEcc2mJUriTRsIByqsm8uMbLHyEbTzr?=
 =?us-ascii?Q?Gmf+ic92vN5TXz8y2qHI6xrUrcGfDYWGlaY31v74uwNaMgdFaE0MvlZ683ia?=
 =?us-ascii?Q?LOpF1NWg3lVLcSMnJIdDd/GkOrosC4qhXGVhbabruBX93AKLbqcjR3niSlTu?=
 =?us-ascii?Q?plRRWCzvek+WnQLk2Bc2RCpwMRn8k+mSuASQSsSPJZn4rKck9nS/2SIvT8gR?=
 =?us-ascii?Q?wv58VEB+VyP+eJAHjtjC7ls1nEljBdz2P62dEkldGOafAE+8TL33FsvhrFkd?=
 =?us-ascii?Q?kQm3UZNWOdnaAeao1Vo7oPuxejY96E9yz2tYAwu9lFItujzCcM8+lgVhP5wb?=
 =?us-ascii?Q?i4vwotjJkINqh1RJOvT75si+HV23bNkJ8uvmFSzca9j29OKSbPUOXcgJ6/bt?=
 =?us-ascii?Q?eU7qpukg/qThu3zlayYwiNzmjR2FTOuKaDkvdw5dV9FUmIxyYLJfeEpvxrvl?=
 =?us-ascii?Q?zckRiRGW+Y4whlhbcrqcf/XvxTy9IPQVftEeBl0frUGDynuUz5KUbx6lINJI?=
 =?us-ascii?Q?5j33VyTlFLNG+ikfRm6BCK2hUxg+4Zt2azTFV31NnPPBgluGeUkEr9UU3CDp?=
 =?us-ascii?Q?IHKSkvGBu4XMuPJcllHXVr9PmTZP1GIJxfL5qu1RZ1BfTyHv+W02k7cYnuBI?=
 =?us-ascii?Q?hPNI9S7hEq4QwywWBSpnaKIGBDM8EaREc+ugILo72XWaaPKGLqYLHdFFtJGx?=
 =?us-ascii?Q?pcpv3qAafWw7ASwk3rfUM+b9OfGC40hYNvByJYwPVCupK4DpOH5XjCmWWi6N?=
 =?us-ascii?Q?nfvENUaHyDjdoMWVFmNnReYWqTm1uDbfaIjY7muwI9JPc8ECLchMOhAn4zDC?=
 =?us-ascii?Q?BKWfd2nRPnHsR7kL1T4HQ8XIpkU6aGxqtkFvwYJ4H8xd9YbyLYKZ/6b86tHn?=
 =?us-ascii?Q?tqq7Fa9g0qB7wPgj3R1BW164H2LEpOVdKxmBkik098vdbzdhNO/aRjyWk+0K?=
 =?us-ascii?Q?7Y54797/jvr6t0UQMLG9X9Tt+O+uz1a4cXhS91pJAx1oSPXhrYRg4LTpDpry?=
 =?us-ascii?Q?BaW9uazn5HuLZxBb+e1qHhC8y3Ke9E7F9D3Ld2rH9fhc5uxb0MolPfghIOGo?=
 =?us-ascii?Q?i9o12AObaDpXuqIcuQTXtWpcHOYWC1H2QG7Arlmw4zBYT2HGWOWjwDsJXysT?=
 =?us-ascii?Q?8030JE39LF8l6HX4/G2GAIfCvHd9bEJxmdNIZWOAV9o8z5jHvuRn3YNDt1AP?=
 =?us-ascii?Q?Wky/eQGE4lrxTLJgW0mPfXn3oVI98J+Zj1qu4QfxQsLdhmWw0c5D9YXt0KsK?=
 =?us-ascii?Q?R3mfz2bccCtpgUNH8lrqgBf1hAXi6OuWnb0i8PiiVjBeUnFNTtH/76aBrbeu?=
 =?us-ascii?Q?wpUPAqVXfktCaKF+5OLKuVtYxLY/29IQkAZ4IvVw5omYRy6czd0kLlMJBn2S?=
 =?us-ascii?Q?S2sJkzYoVCqjhWgpLBTvPxc1IdHbi+KR/poSzGylaT7iYycLuGSl5mA+mqLm?=
 =?us-ascii?Q?o5Y9MtsxieD9/viFB8A7OJ3C6vaYmA57fnnWrivsIzP+FupTTjJzp64ZetuA?=
 =?us-ascii?Q?mQ8vH+m0qXuXmNSsLVBg0g3zu3Qrq+4kIDMpDWf9IGcnrRRay62bZY7D1fcQ?=
 =?us-ascii?Q?Ko1lA3AGeNz7pvwZ1ybHvrHC9xvwy5u2jgqfbWfcmWmZWcBbTf3eQxyNzhOj?=
 =?us-ascii?Q?ODqMeOfvFQD4ZoSsTo+qF1nUu1vnH3N85YepIb4ml2PXSxbA4Sw3dHN5lx0n?=
 =?us-ascii?Q?L95Wkw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32215957-259e-4de9-e87c-08d99ebd3170
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 11:29:27.0183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apcBhMK52tuwx6a5wv6ZyBrnwVv/nVDYHD/58RtZewvnMkTygskVrbVIiO9sKrCEg0NppMVhZ5zebDyMnRoNDoLg5ATy5A9g2B3zSTE6uQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10156 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030064
X-Proofpoint-ORIG-GUID: vGtQ8xXH9iCTFKoUwfm6pCB5DUQQPFeq
X-Proofpoint-GUID: vGtQ8xXH9iCTFKoUwfm6pCB5DUQQPFeq

On Tue, Oct 19, 2021 at 10:12:42AM -0700, Jakub Kicinski wrote:
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index cfeaa9c1542f..7f9dee42a04d 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -360,11 +360,14 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
>  		 priv->eeprom_CustomerID);
>  
>  	if (!priv->AutoloadFailFlag) {
> +		u8 addr[ETH_ALEN];
> +
>  		for (i = 0; i < 6; i += 2) {
>  			usValue = rtl92e_eeprom_read(dev,
>  				 (EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1);
> -			*(u16 *)(&dev->dev_addr[i]) = usValue;
> +			*(u16 *)(&addr[i]) = usValue;

No this doesn't work.  It writes 2 bytes instead of one so it will
write one element beyond the end of addr[].  It doesn't work at all on
little endian systems.

I'm not sure what's going on here or how to fix it but array overflows
are always bad.

>  		}
> +		eth_hw_addr_set(dev, addr);
>  	} else {
>  		eth_hw_addr_set(dev, bMac_Tmp_Addr);
>  	}
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> index f75a12543781..d7630f02a910 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> @@ -184,7 +184,7 @@ void rtl92e_cam_restore(struct net_device *dev)
>  		if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
>  			rtl92e_set_key(dev, 4, 0,
>  				       priv->rtllib->pairwise_key_type,
> -				       (u8 *)dev->dev_addr, 0,
> +				       (const u8 *)dev->dev_addr, 0,
>  				       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
>  		} else {
>  			rtl92e_set_key(dev, 4, 0,
> @@ -197,7 +197,7 @@ void rtl92e_cam_restore(struct net_device *dev)
>  		if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
>  			rtl92e_set_key(dev, 4, 0,
>  				       priv->rtllib->pairwise_key_type,
> -				       (u8 *)dev->dev_addr, 0,
> +				       (const u8 *)dev->dev_addr, 0,
>  				       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
>  		} else {
>  			rtl92e_set_key(dev, 4, 0,
> diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
> index 4013107cd93a..14ca00a2789b 100644
> --- a/drivers/staging/rtl8192u/r8192U.h
> +++ b/drivers/staging/rtl8192u/r8192U.h
> @@ -1114,6 +1114,7 @@ void rtl8192_set_rxconf(struct net_device *dev);
>  void rtl819xusb_beacon_tx(struct net_device *dev, u16 tx_rate);
>  
>  void EnableHWSecurityConfig8192(struct net_device *dev);
> -void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType, u8 *MacAddr, u8 DefaultKey, u32 *KeyContent);
> +void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType,
> +	    const u8 *MacAddr, u8 DefaultKey, u32 *KeyContent);
>  
>  #endif
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index 3718d72e217e..cfbd9d79baa7 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -2300,12 +2300,15 @@ static int rtl8192_read_eeprom_info(struct net_device *dev)
>  	/* set channelplan from eeprom */
>  	priv->ChannelPlan = priv->eeprom_ChannelPlan;
>  	if (bLoad_From_EEPOM) {
> +		u8 addr[ETH_ALEN];
> +
>  		for (i = 0; i < 6; i += 2) {
>  			ret = eprom_read(dev, (u16)((EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1));
>  			if (ret < 0)
>  				return ret;
> -			*(u16 *)(&dev->dev_addr[i]) = (u16)ret;
> +			*(u16 *)(&addr[i]) = (u16)ret;

Same thing here.

>  		}
> +		eth_hw_addr_set(dev, addr);
>  	} else {
>  		eth_hw_addr_set(dev, bMac_Tmp_Addr);
>  		/* should I set IDR0 here? */

regards,
dan carpenter
