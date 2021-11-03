Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF9B2C96
	for <linux-staging@lists.linux.dev>; Wed,  3 Nov 2021 14:16:17 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A3DxOV2016608;
	Wed, 3 Nov 2021 14:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=J+hynqo4HY+1cRu1l6Gue0YpUCuwDx04eArK/8R+qAA=;
 b=gj9NuGBq4HYjz/ezUAcDZ4KCe8Rkl7TMVZ5PuA6OLMAivg/mr/KQ8TJyG9TfKgbBmy0Z
 N0HX+rlNBVFoIRfwvVSjQbHciBR1KsqEF5OLLOMwiDQsOdVmfNQTBygyOk5dYysqATYP
 2o4DP9Ucl73HPqXSW5ewCleUjVnxT/Nd1x+5/cNhaugjPP84X47WLHBduLz3wNq/ZAZ+
 +MigxOrNfVTAaqVGnD2e7JsF2jmcyEZ2+jxeCMSzO/4r7VMKQBSlFM7USweqVQgCyHKm
 XS+cwjp7xrABTiy8WXhuvglAsN18bztjGcbL16Ix4PVgNeZauy+A1Yley1HbUWWD1tD/ lg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3c3mxh2708-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Nov 2021 14:11:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A3E13xR037045;
	Wed, 3 Nov 2021 14:09:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by userp3030.oracle.com with ESMTP id 3c27k72y6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Nov 2021 14:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfpkNa++S3ftBOyqph9K/o3wGRCj4aWV+rKU1XEsMdoyWHFUz9d0ifjxPYIdUUZiVdKhxqBsXpS7c18wqjAvBpgeI3deCXxGYCFNDAUci82Uq1rbRnBp1nrY2AX4PeRmBZrKtUtUpnqaQwKCqxg6+/+TgILkg6m91rraIoQ3a+3w2xD8SormEy+UD+OjMPT/cSu6GMpog/WqDz7izcVQg1NPBUyRmZLQGnQxLB4V1UEP1hdsExxuq4T4qLmoJliTkLbN/EazQY1P6Xdh00jI5iCnD8Y6Bay2pRYD+YKtQmZLDuZdEx7l0BhCCJGSTFmBaUbdKm6u2nMCiFKfe6bUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+hynqo4HY+1cRu1l6Gue0YpUCuwDx04eArK/8R+qAA=;
 b=TQdxBgI2W7EO9x8mY050ACW4fYGoLFiMlKl0H0iu+bYsQCck85ZFOhYiUdtyb0NRLUYMxym6mM/9wK3QCVu6yuRUmScn/vR4DGA2qrGhu5i6aGlVACAkjn5HrzWAApPOl2PeWek7k0rigEtAW5SsrWhPF3lr2QRHoXglWBWSQgb+2USVqpbGnUlDnFF16U8fYIkpQ3MkekBUVXIfFKu+Ix/r4PHNWRomZdQndX9eGwKbfkv1kLsyWBm3p2DlNTRmUtlWHHBTkixpVtjuZZod3lK8x+bKFWzX59u1IoOjGe7Ls9s3oaT9MOfkGRNjcY5SBWiLCnZYX8gdXv7DZtGJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+hynqo4HY+1cRu1l6Gue0YpUCuwDx04eArK/8R+qAA=;
 b=c9hpo0SULEuVM5wBb0put4jgmDLWO5X0jXotueUNfLLaEsLB+HJnVVYccxaUWGJLG8VNR57cOyK0g/+ciT9ThTTA+0ighrTJ6sIjLP1S1lkwqbbJMxPMMNjTJfyrKFF+Sj1vU2IPcQvwNtZZy0SVUtNpa5L5EGLjC+4bJeoDuz0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR10MB1704.namprd10.prod.outlook.com
 (2603:10b6:910:8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 14:08:50 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e5e3:725b:4bb:7809]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e5e3:725b:4bb:7809%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:08:50 +0000
Date: Wed, 3 Nov 2021 17:08:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        knv418@gmail.com, jiapeng.chong@linux.alibaba.com, ojaswin98@gmail.com,
        arnd@arndb.de, lee.jones@linaro.org, clrrm@isep.ipp.pt,
        fabioaiuto83@gmail.com, hdegoede@redhat.com, ross.schm.dev@gmail.com,
        insafonov@gmail.com
Subject: Re: [PATCH 7/8] staging: rtl: use eth_hw_addr_set()
Message-ID: <20211103140831.GV2794@kadam>
References: <20211019171243.1412240-1-kuba@kernel.org>
 <20211019171243.1412240-8-kuba@kernel.org>
 <20211103112906.GQ2794@kadam>
 <20211103063624.075c75e0@kicinski-fedora-PC1C0HJN>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103063624.075c75e0@kicinski-fedora-PC1C0HJN>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0001.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::13)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JN2P275CA0001.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19 via Frontend Transport; Wed, 3 Nov 2021 14:08:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5960a2da-9fe4-4bf6-8a0b-08d99ed37597
X-MS-TrafficTypeDiagnostic: CY4PR10MB1704:
X-Microsoft-Antispam-PRVS: 
	<CY4PR10MB1704EEE3353C3C33C1E817B68E8C9@CY4PR10MB1704.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Vs6r7HU66JINWDxp2oyBhgF5FpOAbw9wrT7owrw0bOzg6YmQf9fOHmk3FssuusQFcG4GOBhg+ysa/JlWoag6d9vP6aTAfjG72G4bv3RHtqjXr6xnd2SNpKxNRiHvkN/q8/XP1np7bD5UDXdXhg99GIOJbWvtlkru2z+Zbnk2WBbWt4jNQBwQZqx8+08dJlVTok6tFYtwdAV6VMTaQCuN9rXlYN8Fin3h8q6yAVXNhvP90OquH2W7dTPhQU6gSy6kutdw6is8t5/X4ySOd97o3ZRk2buGV2mbQwtuInm6I+edoTrJ1SJpAkTZsgGAzjProQiYJ8LTM2fcaBBaG/EPLDTPjsRAWoYk+kYXIYWO7jde5ghl1O60YPNDJLCcbG6T7ckFDtWCuBAqFfJEoBZXXB7oolwgn7PjIyqc4F7iyfl5rx5E8dbqZz06jfkax3qDtJXUc7OyWkFspbAbijeiVoST0Q0TO77UqIygCahnNLSukcq4+GuEoUJ8X4Am1LjZmBvNcllkmpktR5qxUhNtSMz/JSeo4W3+qDGG4si5YwrUZBtoWk3dolI4wSGkKRSkszltRVp5bJYf7dt3YRgkQdkhwmA7zKfLTeR+Di0Gr+5dSeNh/hYAa0r3ScTTahTiDlq2Z5ggqK48ADOpmjpFoCVvIBXkpUU7KCmZW+sOwm34A/hq2tKTan8v2u/3JKpQCtI0aS7UZTvBJBCMCBL3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(4326008)(26005)(5660300002)(86362001)(9686003)(55016002)(956004)(186003)(6666004)(7416002)(508600001)(9576002)(8936002)(44832011)(6916009)(316002)(1076003)(38350700002)(66476007)(66556008)(8676002)(33656002)(38100700002)(66946007)(52116002)(6496006)(4744005)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cvFZ+PtOnAND0c5xWmyAbAVMDt1MSuYiZ7cg1YoZSVVKTaYUjd11cJt2RP7W?=
 =?us-ascii?Q?8DkJadBD4+MBuhD/258T9A23f+3bJDN1HpudcHStdepl/Ud6PU1R/t2YYFc2?=
 =?us-ascii?Q?v0PVLzp6+exNYKxe7h+kERO3B3FEWKlzAWFWWkVhbkBrDmrtKGGVFkgqLVgf?=
 =?us-ascii?Q?wo5/doyjd3310nG09btAAtikwhhlfwuoI4phCiuQ+r4+GkpgEGA4Rva+DayP?=
 =?us-ascii?Q?Ybbo9gJVgEi7nmS/RC/H68dbYa64V0Jsz1xk2q/Rf2+68ABG3+yVjZktFDym?=
 =?us-ascii?Q?1T+2+EQPAn4lX9sIO/p01iIhjMWVUy8GjlyfMezr3Yw49vcPDMZczg0cmq2k?=
 =?us-ascii?Q?ryunIfhhz7a+q4KcSSmBmprR4saW9oC9Rpz7DJTV0+s388cUD3rjwapcCOgE?=
 =?us-ascii?Q?iAEiGXcjI5QE+7ldnR9c6IVkxhg6Hwa+sNVdfZJAY93Ya1eEHuGrtc1Um6NI?=
 =?us-ascii?Q?17PBDL+z78aePWYi4hFhFGZOq8k20M/vvc7HDE57CczhMtRY6W2LL61+TLIn?=
 =?us-ascii?Q?GqyN1db1n8BeX/Vfy3lG/sRCzo8MjMQFDdAYm1XoHtuUS+k7lSqGmNIqSXlZ?=
 =?us-ascii?Q?sd1ygf/9NQRtgaF8ZU2dZfJUKwuISf2iAMxj6g4FZ3JlXX5uOa2pA0hRymQx?=
 =?us-ascii?Q?+wyIvdcSldBX2FXOeae4wUQOXxnCblSrDUjR2JF+jJJKA/DoqgLaddNO6CDY?=
 =?us-ascii?Q?WZrxxNfIAnKfHEsuOH3cTIaRbhblNJ98F5KMcil1+FPdo2tgx4ocJyXA0duQ?=
 =?us-ascii?Q?4OkE5oGAahKk5xnLno4rPv4MYrYn0ucp0h5nAr3QxKqF0UqnqYUXyyOOp8M7?=
 =?us-ascii?Q?gurR7HakMe/hICzgNVuH1PVtR/0AtD3gtKSCYdiK/XiC4iWoB6ExobmAHi7C?=
 =?us-ascii?Q?nZBIxvhMBHtNsJhbBtS1Tt/SOrn3Crm5h6o022ALfOvLri4Uw/Vy0iOV7ZVI?=
 =?us-ascii?Q?/RkpGOVVsabRSzffmNaNQWsJQC6dSrY90OzQ7bCY2AOnO/V0wXgeWJkur1li?=
 =?us-ascii?Q?wjdWLvk/jEF39FJVOG+qmMg3OUxNdyzmsI5fd1rRs6pumefdxB0EZ+Ki9Jmc?=
 =?us-ascii?Q?fvUrUdIOFkbhqBwKZdEFzzjQ5EguspmYVECjZtftwV4yk94B3YWuIqJ/RiCY?=
 =?us-ascii?Q?E8rnrHL/ll8MtYikCi5T2qu1tHpOSSa+L8cEI88nGdQD72YGFGzHpHEIQloh?=
 =?us-ascii?Q?LivfjURpEl+G4ETb4cQ3C3is/kFHUfGAdFcYFI2sSp9jRRlIkkKKCvMazmVB?=
 =?us-ascii?Q?HQej6FXLhDgFEyxCo+l/qGlW4/Uh7nLCouYPZEKhX7bF2PFJ3S4mf2F7uuWV?=
 =?us-ascii?Q?ZYHk8lmMmC/LhKz5+MD9R7mA1qpCukXH9ty3J08QuhsBLRYxudD4/JYuzMix?=
 =?us-ascii?Q?xeXvHzRV56dT//xy0274YIoT/l4giknompRVj9ggTkpBQ0c7JLJQxmcvC1Vx?=
 =?us-ascii?Q?S0tHLddUcETu5vGiUqvsrqyLPW41wroLV2nc1UDAk3nyrVCHTh68ZSq4xc0v?=
 =?us-ascii?Q?fdX3d2dojN0MUs63LQTUcFobERTmh/B8Pl29f5JRdWEdXbzWYOj9w1lTZ0Vu?=
 =?us-ascii?Q?HkBLPd5Y/6Bis2I4oxlsmAHFzkY7yz38gHn0nguav2j/yif6PyekF25Li6VT?=
 =?us-ascii?Q?dJLzVJ4eo+lFTjEAUYMD1rRY2BvwOllfjyfA8+OJ4hT/24g1+Uaxj2/Tjvef?=
 =?us-ascii?Q?SMtl7A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5960a2da-9fe4-4bf6-8a0b-08d99ed37597
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:08:50.2626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrP6ThndjlNjMkhZdy9GBZBZ70Q+43pC/f9owOlxnyP+x70uI4ihMO2eA75l2NGgjh2cNGwRP45i9v9HQ2tLj+7vyj/AU1rgcJpJ/ecN3SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1704
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10156 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111030080
X-Proofpoint-ORIG-GUID: 4i8seXoUEaPPclsc-ZeyJ5mfJdY_bysS
X-Proofpoint-GUID: 4i8seXoUEaPPclsc-ZeyJ5mfJdY_bysS

On Wed, Nov 03, 2021 at 06:36:24AM -0700, Jakub Kicinski wrote:
> On Wed, 3 Nov 2021 14:29:06 +0300 Dan Carpenter wrote:
> > >  	if (!priv->AutoloadFailFlag) {
> > > +		u8 addr[ETH_ALEN];
> > > +
> > >  		for (i = 0; i < 6; i += 2) {
> > >  			usValue = rtl92e_eeprom_read(dev,
> > >  				 (EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1);
> > > -			*(u16 *)(&dev->dev_addr[i]) = usValue;
> > > +			*(u16 *)(&addr[i]) = usValue;  
> > 
> > No this doesn't work.  It writes 2 bytes instead of one so it will
> > write one element beyond the end of addr[]. 
> 
> But the index moves by 2, IOW loop is only executed for i = 0, 2, 4.

Ah, right.  I missed that.

regards,
dan carpenter

