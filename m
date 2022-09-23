Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113583D90
	for <linux-staging@lists.linux.dev>; Fri, 23 Sep 2022 15:29:38 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NCxhHo022470;
	Fri, 23 Sep 2022 15:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=9q3CHvEYfEiFz6eikYpOHcqI9osHzoMJDffZJK3E40A=;
 b=C8/VEXuY76+pin2Ic0zsu11lHJpMgDof/fA5YEheLDtYVksN2Bz2106ANmORibSjbbin
 N9GpFGEQt6YhLnG1b0ujzA1vKkf2Ira8XeQb0AZa4sr/GChvOHK4ub4FZOLcJti/By0A
 gCWVfDidGXgtY3+0l5WdnqGcwJpEWRmGUmeD0WDa3JL64QqPz+0TtzKtaWsnQ0LbQklK
 I07UN4mIU7Qnnc9KWj6B5E75LJ0F05u14x1xQpRAafUxRaErIG6U/81nLMJyyY/ubPOt
 mYkMkLYhIA6LWLxdA4VNQoNMZ4qfgoTEJJj++OGCnxieSOrMpjfAvxBkNCJCbCoHmLUR rQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn68rrtv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Sep 2022 15:29:36 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28NDegYN005622;
	Fri, 23 Sep 2022 15:29:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jp3crusr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Sep 2022 15:29:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnXVGgPJ22M1CwrUWno8bFxjK6MbmPWLO11jrLPAO94gsMcDGW0bLYytqEbAMchUuEEkpbjGamGjscywxM4/jUtDQWeK2taTVUR48w7xjIGep2Axkv6jpHCmcyaQ45Yp15CIzDnfQhZRkljTn5nYuwXQFSAniEZ3geA/OhULQbuCwyP/oIebuOdjMa4Pq2bfFHUnUvVqMaEPngAkBceb4HshaWzZ4yO7ASI0qzNr3760wvEvytIUv59JEp12If0AbEKuz1KZQ8rYsZmPirhZPnHWO48pqXvutJAnvhAcKmfZ/+gjlLmPKQxo+mOHGe5LUzM7SOXJwik+AYj7Yc/QOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q3CHvEYfEiFz6eikYpOHcqI9osHzoMJDffZJK3E40A=;
 b=aIfAoi4dE0e1i4o+O//f9K5AEBtDVztIMS6g1ypzVFXHVXGjyUMVeHLgqGnNnAr0oajQ5K30goz1zBhYG28+EL+IGHlyBajNHGElTzJgB+3A5TQ1xDbq23HB5Jm/PtTDkzkj5CbUxE7nAHzzyzneyo9BrOQRveJusnm1pCvw59g85pEfsnJpJWE6HcqCjFLp6TbNIiBDjemNoNuN6gtVd4CIcXgKB1KcmVt32S4fD0TbUH4X8up0IbyggaRylw28Yvi6PDHt9ElOI7sl0rw9D0fvnTw9RLWKrxDtcSOzL0QH7mHIQw69CDxzIo0SMZ3QolQGUEv+SclcHjuyo8PMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q3CHvEYfEiFz6eikYpOHcqI9osHzoMJDffZJK3E40A=;
 b=rx467Mo0ADGUnKeiD5t/SI6Le8JUkNPZpvEJI+K/hDtAH94Tm70eerR04Ac8mlo0ccwF+0kROV4lUZJov/KU4HGuQh5/OydjBuRT7VYzeKnSw4ZKX3j7AXgaYKfiwMJn8CL1olMjNV75PdQ591EQL8qVsIRTlaa3eApzvcY5pnM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4774.namprd10.prod.outlook.com
 (2603:10b6:510:3b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 15:29:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 15:29:23 +0000
Date: Fri, 23 Sep 2022 18:29:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Hao Peng <flyingpenghao@gmail.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] clocking-wizard: fix a schedule during spin lock
 acquisition
Message-ID: <Yy3Qvdvf7f2SL5Em@kadam>
References: <CAPm50a+XqKGBEQC-8iS_3amnphL4LVcOYhBeHqaC_P+Ld_ddhg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPm50a+XqKGBEQC-8iS_3amnphL4LVcOYhBeHqaC_P+Ld_ddhg@mail.gmail.com>
X-ClientProxiedBy: JN2P275CA0042.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::30)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH0PR10MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: c086abd9-6d17-4ca4-bb7c-08da9d7863f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Igu+2f5Fb8gfAKr/npQ7Uh5sK0I8NjLGPyv4jHY9KQ4KvbpKrmW0mm0o4QJCKpmN+hMv9448Bs1Wc9DU2JtCoS22IE55Xdicc9Pe8jCTaJHUVY8y5wwFTL/wmf9bZyhe2n7ZG8IqyeFcqc4OiiEXOhh37lbhVtr8Xm6S+9G/EatjBR9FdKQ3Q6rNYIFdSAPFmN2vEAJGehrWzyN6rP1ESqZMTf/kBD64Ic3fFX6/+3p5sB1cmj5WqjDPW7Btd0E8HA7oLwwDsg8t6IOlRjqfStB74sk3xwNZWGdG3rTAskOHRsHo6q4/GjKgNRaRkaTrn+SmFzn3DOmC3WDi8Vu9j2TsLRwL79mcuw3KjBju20yC6zcwH/n1Zak+8O1chdStWnD0Tj7kI8s6JoeZ5tpj44yj9ukvo/+mPe8+S9qCqpcOqoW7C0ipumHHzp+8oS4fko7iYlAlG4h48Wo+aweuHxSuEV4B2WjJowSVGz7m2TUxLi/XGCuHmPkE3AAxyxJ8arh1Qu+1hTYcHnO++BMCAxCXf+oGpOdlrxOWYeysuxFchHMDKSH/RTtpYQFxgYyVc3O27jR5ycCLtsNyqF/ryLuYQTRIp/tLz9FY9GMFkkvSEVOPzkirR6k27vwoMI3eYPzY0ahr+gs94I3T0iRLKv+bllK9uuZjVKYM7DiEFGwRULiVf4LtQoC2Si3ZdfHLwy5rYw+UM2TSPtfvPn9Dg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199015)(2906002)(44832011)(5660300002)(54906003)(8936002)(8676002)(316002)(6916009)(41300700001)(33716001)(6486002)(66476007)(4326008)(66556008)(66946007)(6666004)(478600001)(26005)(6512007)(9686003)(83380400001)(6506007)(186003)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ng3IdOkAFkFjw2yZssf6MaBGL0VNTCEOiRqkBDqpGYINN/iWYoZwijBfIQl6?=
 =?us-ascii?Q?qHoLV49W7Rdo0ZFysCbzQOBjBwuNnazf57jyPchejkLkC43xggXV4FqKvRSH?=
 =?us-ascii?Q?NkWf4nOjzkm+LLfppZtsn7wS8hx0xbA+2O6krJREuniX9813G0t43Q4JfptH?=
 =?us-ascii?Q?uCPkc5uHhOXa+iMZvHAcGqvsJbmBK9ZVxXhdwTHQgw85gmbo1xwTk/fGMaN7?=
 =?us-ascii?Q?kM+ctHO9F7smwVsYvlgmGh3X8CxLxz+wvB7ts7vZ2NMajytxA6X0xfNEhg/q?=
 =?us-ascii?Q?jV2gkdd0VHr91eeb/d80HqLsWmYAqTkLEi9jcaDLPJq8g1c3u5vbCMW/wgZH?=
 =?us-ascii?Q?fLcWXrqGHQgfRsv6DKEup7+dc2sWdUTv+xdUQpMyigpwUURZyCJYKWpdmodL?=
 =?us-ascii?Q?50jaYavB3i4Y2EAEIeInmTK/9QSsZDuRAT76ScZx4JKnVy02w+Cfxsw5tpHj?=
 =?us-ascii?Q?HZCETE0ZoJI4ocRGuoulXDmdtpOA6hsgYcViO5DIbgij+eQnUDqg5812j4Q3?=
 =?us-ascii?Q?J4NfZdIltnlUMzIAYgUdlmhnzjigRkwqT/LojfGvrAockX2m1XvKlrLQdEtx?=
 =?us-ascii?Q?JWzFBfTak/1uBeMCgdzX1xCYWaVQEY8jBz2GWg4MAU0qVbWLTH5ieigm41/q?=
 =?us-ascii?Q?v/0Uos3wtFuj222Y1QM9H5P+e9nZdLGaCB7DHAqfOCfN1eSOR9vHw13NdEh7?=
 =?us-ascii?Q?+Y+zSfnK2G7Pm3go0gQNgd3oOfgPwq/J/4ci98sRl6RUvTTEQjIQBJuvqKkm?=
 =?us-ascii?Q?vs1ZEeyj4db9m1TCm1QYjiAH77xB6aLsqBl5B8n9vfcKKLxPQiRZ22uYeuRh?=
 =?us-ascii?Q?esnjBDx/gaYstpgFOeRa6GW/DrRzelYsV3/MlbvZcOOaEy8N97ZuJrxf4U6j?=
 =?us-ascii?Q?2GYuiikLqPD1o+qkqBUFzI0J1CiJ3GVKxrLeA3BiFI1hOKxaDbCFwRKGY2qm?=
 =?us-ascii?Q?RwVWQGpsJGTkbITQto6nBiE1yVZjVonv/t5t0XKrwWC1oCOu/277lv/TkHgI?=
 =?us-ascii?Q?2Zn0nLGud7MWw4nCVeg/T6aR50ZwFVAyHXSjI5hconuca3vzfwcyL+mUxYop?=
 =?us-ascii?Q?ey/cxNc3xQXJTxdoQfwSWAXd2hbrAcj1scNgOVtg95SUmm9Lo1KInha1REAX?=
 =?us-ascii?Q?4Ze79CrWnW8Wn1Fpq2WvrnrlGHpskyWRBLfAnADlIA4DF9x7ENasYgDncbU8?=
 =?us-ascii?Q?sHcnzZRUzl2s3+cY7LeIj78XYqmHG6p1CKx6VobIuUsRpGnYcx6c3Kk18jeh?=
 =?us-ascii?Q?Y2H775rTIvK3NAph+VRCSTwAr+Q5wDjcZUlLF5p8VMFidUC/swuxEPffTKYU?=
 =?us-ascii?Q?qwjegEjyoaXsmNF0RjuSjnEVvr1wUf5MeKp7MoYuwEhrKmCwhgJS9q79o2lU?=
 =?us-ascii?Q?TRGIwJH9VSD8Y9SoWgE/Y66+1yda1g1c7KSRmIZ+5noNQjAk1PcOTPRFzPQH?=
 =?us-ascii?Q?vDhItaHRP9sDoxou1qPQg6a6SM5HpnCCsVt/iSQvvUOv83xNC2eVv2fttfGj?=
 =?us-ascii?Q?HdM09qRVSLlfg8LJ/ZbNc9fz9iM9+X8COcI7c2PfWLSFyzNX8Vh5ipgG6NW5?=
 =?us-ascii?Q?DgUV0zRGOaLfROaUcTuSw+8/VwGo2pG/fcnq2jDwjxE368ve1CWqd5iRz7Wy?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c086abd9-6d17-4ca4-bb7c-08da9d7863f3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 15:29:23.2399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAA7u3XBALV2ozSS8hgJahFRfQtXysptW4BWQM+mDQxxoeF6JYGeA4hY/to/iVZ6Q+fjE4GyXPxU50tphOnwRSAmTWsFcKa7LST4cK0Zkr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4774
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230100
X-Proofpoint-GUID: BLwkSK8LbaIxCfca5iSxJEaS6r7cF7Jq
X-Proofpoint-ORIG-GUID: BLwkSK8LbaIxCfca5iSxJEaS6r7cF7Jq

On Fri, Sep 23, 2022 at 10:53:27PM +0800, Hao Peng wrote:
> From: Peng Hao <flyingpeng@tencent.com>
> 
> when the interrupt is disabled and the spin lock is acquired,
> calling read_poll_timeout will trigger the schedule, which should
> be replaced by read_poll_timeout_atomic.
> 
> Signed-off-by: Peng Hao <flyingpeng@tencent.com>
> ---
>  drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> index 39367712ef54..986af03b31c9 100644
> --- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> +++ b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> @@ -157,7 +157,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw
> *hw, unsigned long rate,
>         writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
> 

Your patch is corrupted and cannot be applied.  Read the couple
paragraphs of Documentation/process/email-clients.rst for hints.

regards,
dan carpenter

