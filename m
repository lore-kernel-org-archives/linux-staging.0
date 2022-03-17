Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC13D79
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 10:20:07 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H8XOhR012057;
	Thu, 17 Mar 2022 10:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=3zHfS5yGdy4exEW1vk/iVhMyhlwnCWTfF4r2tm/7HL0=;
 b=LpWHg/39XC7G3ZP0mlktWYzglVAKklVKhlSLX+ty1CIbUDQOJjzravESz3CA929Zx1fj
 F7R48BVppNiC37fGd52xAZp3G2hX8/Rbqq23fVzZTLcRq1FGV8fyai81l9l08Za1yZsm
 g3+vjHpvzOA0FOamU3Z+31cEkg9hXlZhh5pY21gfRVAOfTX5VFlaY/ohcWa8jczZmhZT
 vVWv9B+ZR0OLt4gMEK26am8kn/mvRA0dSuOj/Jr3DEN9Bb+kWjG5LQEu+v8FR1qNmiDu
 LkixPRIdsSgBnRUkxIiFVXks84QxOprnaXXJdaiQuAPaNRy1JVeUfHSy7sSWTltzhcod WA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3et60rgm7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Mar 2022 10:19:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22HABFfe058768;
	Thu, 17 Mar 2022 10:19:58 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by userp3020.oracle.com with ESMTP id 3et659dryy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Mar 2022 10:19:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kj3Le5kz4UT1z2sQiP9qh8U4Djcs/qwdQi/DOfK0XQQuBplxi5P3Wi3n0KAv6YH6d7ktaWQ7HnYDjalTm8cwBzgIVhI5bT9R8WE/ogW/Rt0aVc6QACKq5G8kSF4sEiyG333bzeowV68NAsOAN8gWTeumK0teBhIA5sSihnKR7PjCCe6HmtULLAvxTa5uP6guul0E0+V9SLN9va5lw50ppIRpMw8CnMWJEryNXeScEOGhaXzn3FcaGJiCPiTj6u6Zl4FFBfPnM0ulde9NXpHl1+zEwenyUyTcYYjrjNNwqEetmrV1uRmXMeW9yOoHSUXne5l34nwzt2+/C3/SPQwJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zHfS5yGdy4exEW1vk/iVhMyhlwnCWTfF4r2tm/7HL0=;
 b=aJSVbR+Jev0Q02rcHsoyqGJ0DRYHVwkXhpVc+HSfhwliG5yCPzLgytvp78RmjZhJGl0O41uGKLerini3A4AsaJm6IFLvX/31Ij4f3e24oEjO3toaozD8Njd9ezS8jzFHQWxEk50ndB+sp2egu2th65ms7YTXRgXh0yCQ0QrX9LLaKQ3suwvDCBr4FrJ/onq1FQHvT+X/Jw0brhKcoamNp86A7tfjIQP64WRwxcU+pNPXDMAb3kNNho8yYxFLMQYS23jLjlEgh7iP/+lpWtTUEHVFJQ9k9qkr0gdSztRfqS+iFhUYWTl9nsXcTClVMOxirEyfsyQjMR3jNSgBYUkwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zHfS5yGdy4exEW1vk/iVhMyhlwnCWTfF4r2tm/7HL0=;
 b=DBZ1i/4x7QjRyjUa3sQxv5YxO1/XRoLuatyxAThuQxlYOPZTWCoUgDhsL3i6/g8eX6ADp73xpvzHkIBKL1oSNZmkndHeDeMC520d+oORrmkuv8WH34O6HF7ppTy6QGHXWbw6vkiAO1CLv2Wk+XLJ0HabEpbHUsYCdd5vUfbCSck=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1315.namprd10.prod.outlook.com
 (2603:10b6:404:44::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 10:19:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 10:19:55 +0000
Date: Thu, 17 Mar 2022 13:19:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <20220317101942.GX3293@kadam>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0079.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::32) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2e9e4ac-7afe-41dc-ffcf-08da07ffad57
X-MS-TrafficTypeDiagnostic: BN6PR10MB1315:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR10MB131588A03C9DFFACDDDE8B6F8E129@BN6PR10MB1315.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iyNyQgogUhj70BHpwlCIVobg+sKWtsOUOFcaj+og8sMA0iSz96YCIn5Zj9mfsO7VfIHtKXxgMro765OkR/7uwighk2da7YNUwjvIskpbgrNuwM5bp5w/3I/yiLnRpACFVDx5MWi8rGMlnAKaJ4Num0SaEBLS0CYAA3Hsv3TaMyi9fdkRFMSbr4rxVVaLz/yIiP6AWTRQd3HZUpGfwTA8KvpJmBJSHV4Vmn5mjhMxapNA8YLS+LKFH/EZ8ts0VNIpRchE+S67H2Krb88yUfdIEkBsA9XHfpXSFADafrgoOKBRh5UzTMRqeRYTXCNk6F1SbqgRaTATBQbTPHMytpIYB7MnUdbcJZM4EXB3Tn764zN0oeV4NkSmCg2+LjTS+GoJhYMjs5c9tMplsh7n4zVJMOBR6sLgSviELwioRZofrTRv/rbeiwSxA5dUD4SSlUSKPMMLehjmiesqTFZ9+5A3bFufLT2AaRBECQ1mQ1r2WfAvAOt45JO6HApGnrlaLzKADZs+KOBY8T9Py5qS0C3O2uPsRnQ7GexJ79n2aGknqDIRuhuAJ7aVlu3ZExTAvKerXm700Gp1fmLrNz0vnwWre/XT5LoT6FO/QJH9MdV/MxuXYrIrZOjrJzHMCalznXnSb4fXAQai8tVT/9KtYknNwmDQRLkico+0XpP2Vt/46qSPQARXkY6GYHdl1qrqSJiogLMhgwkjsz6JiZd/Fbf050vOAGlWTWC8H1CUdPN1Yu+joDW+NfeG5mE1+4kYPPpHq9oI8ScUCIbTFpvfbmlM096s8IjH2Dl4lQ4pVEM40DA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(2906002)(38100700002)(38350700002)(44832011)(30864003)(5660300002)(8936002)(33656002)(508600001)(316002)(6486002)(83380400001)(966005)(6666004)(186003)(33716001)(26005)(9686003)(66946007)(1076003)(6512007)(4326008)(86362001)(52116002)(54906003)(6916009)(6506007)(8676002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A+WSoI4OVIAmqGpsj333fX1mS5bR7dhazMY41gtWwWRl510cLZOblx7OzM7p?=
 =?us-ascii?Q?UF1npiIY7OekXiClgdZHZHV0ca0D1+ecVyI8BModOigAgArazp+UUAfIDoWf?=
 =?us-ascii?Q?1XxmXnqXUjF2xVthY+/I2XKVBzd/IM87DMrKhhi+d/3q/ZYhd2frmhO4cwwV?=
 =?us-ascii?Q?PGtYJExm9Oyp51ry9J0MfWYj1iQ/rkZSJlhAtjHwDr5WGR5O2rYYByl1m48C?=
 =?us-ascii?Q?LwbN2PkuGQ4R2NhgF23muP1TVVJCVF4s2+2+IsKecdiNU+8u3LNXJfAwGjB6?=
 =?us-ascii?Q?SWxhjfanPSsuhNiuM1PNi14Vt3MpLKEFTIXyMWG6a4g2BQ4a97zoR1jL4lu5?=
 =?us-ascii?Q?FU8XgEyogIqs4hEwMgH0dxxPjOtyWEQkOrU2olUVAEwRqJBcGXJoO70fawos?=
 =?us-ascii?Q?z3t/GekHf4Sx7VtxIfR9+ShAB/7xhcwMkogz/PcpcZonLrz9naciD9HJAB8g?=
 =?us-ascii?Q?XzgnfFUNMyOUegC2WkFW/OGyvHzLZ8nrgXL0wCoJkxAwH232nVTZqGSjzMVy?=
 =?us-ascii?Q?Fev9pIDEX+ywKuZ40VMueFwU/TkE37fOQRbVPv3te7GPzV/bG/7vhDrk/ikS?=
 =?us-ascii?Q?koEeJ8YbXbe6nLyB2ZrWom845E82VFPS0hPqk7WU1I9G7ARkzOAeBvMjIBax?=
 =?us-ascii?Q?MnESaO4UqM/Rn1Hx1pOclA3m6/tMflZCDH3qbNa/6G0lzh25Qez2Cw7qFQH3?=
 =?us-ascii?Q?QpTKp9Bg35QdQGLS5PPiPZ81byw+kFd5FWVl9ebr/D3A4Wj1wjea6YnC6bIc?=
 =?us-ascii?Q?PJ1GCTl9Wv4vSVD3qFc23okYv9Lu4MwNJhgSN3+zdHccghZi7IxifgzIsNT3?=
 =?us-ascii?Q?cLChBgIlbtYKVfIqm/Txz/9BG5qq96tENa7gaxO9MK4unqXwVxV4g1Z55X7o?=
 =?us-ascii?Q?3q+U+nW2Xop2kmKlur76b95xB8PAEpaVggHQU1iNYGyEd7DPZCnzPPYKA3Dn?=
 =?us-ascii?Q?bBAuBwWfEh1gsrPVmg2NLzILBMfcySESZaKb67a+JVWOm8BlBtpTAzL5gtun?=
 =?us-ascii?Q?mht7IFghSnp6sw4EuryBnLMq264pDuiNCWhDQ1rcK99+k5Fp3la7K5TcEQF/?=
 =?us-ascii?Q?FlVP4yjr3wffm3cqOkXjCXYXpAefUBN6gaQPgE1cX7VyjXFvbTOnBig6J+Iq?=
 =?us-ascii?Q?4XOwq1gDSa5hpzvPVzIdvp9b89DknHr7ytRHVQ3GyycEHjq49vi26qJAjmlk?=
 =?us-ascii?Q?PdrPtlxJhrE7RCxlOBDG2BS13hzlxwP4uNm19rqTlZYRjAuWg9U/K79EWNoT?=
 =?us-ascii?Q?wF13RgtsXmRLBWAT/xy99f8sLdV2mHyivnsIu+SCE/WVNWlFxqqdTd++aOwr?=
 =?us-ascii?Q?ikoz5KSyijqWn3ysVIXg6FNzo1QYbY9gTEDxOM3pdlh7Drri1dgT4Zsbym+B?=
 =?us-ascii?Q?B0akqUpn8YcBpc7aKqciwjgeCpuvmjw7yOZKNDWJx6pw3KeMlzMJjrx4M3j3?=
 =?us-ascii?Q?dL4+g/bYAa4bkltDLpVXh9cLo1tXao2/813YvdND01NzHTJu8CKZ5A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e9e4ac-7afe-41dc-ffcf-08da07ffad57
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 10:19:55.0594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+PHNnUbIZYbk1D7BHPpwHW5Ti406yiHHKsaIsFZxATLLFjAw2rPUpcw+ALKp6ZsQ584CvFhcWJkM5r7SiBac+TLKGJdEXsQwEIqAn30VyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1315
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170061
X-Proofpoint-GUID: Rl1faEm2sDYD2zgbFnPtaGgKXNxHoHMU
X-Proofpoint-ORIG-GUID: Rl1faEm2sDYD2zgbFnPtaGgKXNxHoHMU

"new driver" is too vague.  What is the driver for?

You need a README or a TODO which explains how to move the driver out of
staging and into the main kernel.

Run the patch through scripts/checkpatch.pl --strict.  You don't have
to fix everything because this is staging but a bunch of the style
issues are easy to fix so we may as well just do it.

There are a number of bugs and style issues.
1) Find and replace every -1 with a define or a proper error code
2) Never do assignments inside of a condition
3) Do success handling instead of error handling.  Try to return errors
   as directly as possible.

Bad:
	ret = frob();
	if (!ret)
		printk("success!");
	return ret;

Good:
	ret = frob();
	if (ret)
		return ret;
	printk("success!");
	return 0;

Keep scrolling down for the details.

On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:
> Introducing the vSMP guest driver which allows interaction with the vSMP control device when
> running a Linux OS atop of the vSMP hypervisor.
> vSMP is a resource aggregation hypervisor from SAP.
> 
> the driver comprises of 3 modules, vsmp which includes all the api needed to interact with the
> control driver, vsmp_logs which allows reading logs from the hypervisor and vsmp_common_info which
> allows reading generic information the hypervisor exposes, currently only the version is exposed.
> 
> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>
> ---
>  MAINTAINERS                             |   6 +
>  drivers/staging/Kconfig                 |   2 +
>  drivers/staging/Makefile                |   1 +
>  drivers/staging/vsmp/Kconfig            |  14 +
>  drivers/staging/vsmp/Makefile           |   7 +
>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++
>  drivers/staging/vsmp/api.h              |  61 ++++
>  drivers/staging/vsmp/common/Kconfig     |  11 +
>  drivers/staging/vsmp/common/Makefile    |   7 +
>  drivers/staging/vsmp/common/common.c    |  64 ++++
>  drivers/staging/vsmp/common/common.h    |  27 ++
>  drivers/staging/vsmp/common/version.c   |  85 +++++
>  drivers/staging/vsmp/logs/Kconfig       |  10 +
>  drivers/staging/vsmp/logs/Makefile      |   7 +
>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++
>  drivers/staging/vsmp/registers.h        |  16 +
>  16 files changed, 832 insertions(+)
>  create mode 100644 drivers/staging/vsmp/Kconfig
>  create mode 100644 drivers/staging/vsmp/Makefile
>  create mode 100644 drivers/staging/vsmp/api.c
>  create mode 100644 drivers/staging/vsmp/api.h
>  create mode 100644 drivers/staging/vsmp/common/Kconfig
>  create mode 100644 drivers/staging/vsmp/common/Makefile
>  create mode 100644 drivers/staging/vsmp/common/common.c
>  create mode 100644 drivers/staging/vsmp/common/common.h
>  create mode 100644 drivers/staging/vsmp/common/version.c
>  create mode 100644 drivers/staging/vsmp/logs/Kconfig
>  create mode 100644 drivers/staging/vsmp/logs/Makefile
>  create mode 100644 drivers/staging/vsmp/logs/active_logs.c
>  create mode 100644 drivers/staging/vsmp/registers.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68f21d46614c..2fc61b4d13e5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18381,6 +18381,12 @@ F:	Documentation/core-api/printk-formats.rst
>  F:	lib/test_printf.c
>  F:	lib/vsprintf.c
>  
> +VSMP GUEST DRIVER
> +M:     Eial Czerwacki <eial.czerwacki@sap.com>
> +M:     linux-vsmp@sap.com
> +S:     Maintained
> +F:     drivers/staging/vsmp-guest 
> +
>  VT1211 HARDWARE MONITOR DRIVER
>  M:	Juerg Haefliger <juergh@gmail.com>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
> index 4ec5528f89fa..f61778bccb0b 100644
> --- a/drivers/staging/Kconfig
> +++ b/drivers/staging/Kconfig
> @@ -114,6 +114,8 @@ source "drivers/staging/axis-fifo/Kconfig"
>  
>  source "drivers/staging/fieldbus/Kconfig"
>  
> +source "drivers/staging/vsmp/Kconfig"
> +
>  source "drivers/staging/kpc2000/Kconfig"
>  
>  source "drivers/staging/qlge/Kconfig"
> diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
> index 4d34198151b3..726e704ba8bc 100644
> --- a/drivers/staging/Makefile
> +++ b/drivers/staging/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_SOC_MT7621)	+= mt7621-dts/
>  obj-$(CONFIG_STAGING_GASKET_FRAMEWORK)	+= gasket/
>  obj-$(CONFIG_XIL_AXIS_FIFO)	+= axis-fifo/
>  obj-$(CONFIG_FIELDBUS_DEV)     += fieldbus/
> +obj-$(CONFIG_VSMP)       += vsmp/
>  obj-$(CONFIG_KPC2000)		+= kpc2000/
>  obj-$(CONFIG_QLGE)		+= qlge/
>  obj-$(CONFIG_WFX)		+= wfx/
> diff --git a/drivers/staging/vsmp/Kconfig b/drivers/staging/vsmp/Kconfig
> new file mode 100644
> index 000000000000..c57cfcb55033
> --- /dev/null
> +++ b/drivers/staging/vsmp/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig VSMP
> +	tristate "vSMP Guest Support"
> +	depends on SYS_HYPERVISOR && X86_64 && PCI
> +	help
> +	  Support for vSMP Guest Driver.
> +
> +	  this drivers allows information gathering of data from the vSMP hypervisor when
> +	  running ontop of a vSMP based VM.
> +
> +	  If unsure, say no.
> +
> +source "drivers/staging/vsmp/common/Kconfig"
> +source "drivers/staging/vsmp/logs/Kconfig"
> diff --git a/drivers/staging/vsmp/Makefile b/drivers/staging/vsmp/Makefile
> new file mode 100644
> index 000000000000..88625cd3707d
> --- /dev/null
> +++ b/drivers/staging/vsmp/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for vSMP Guest drivers.
> +#
> +
> +obj-$(CONFIG_VSMP)	+= vsmp.o common/ logs/
> +vsmp-y			:= api.o
> diff --git a/drivers/staging/vsmp/api.c b/drivers/staging/vsmp/api.c
> new file mode 100644
> index 000000000000..b0d4b5a990d4
> --- /dev/null
> +++ b/drivers/staging/vsmp/api.c
> @@ -0,0 +1,402 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP api
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/pci_regs.h>
> +#include <linux/pci.h>
> +#include <linux/kobject.h>
> +#include <linux/kernel.h>
> +
> +#include <asm/io.h>
> +
> +#include "api.h"
> +
> +#define DRIVER_LICENSE "GPL"
> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"
> +#define DRIVER_DESC "vSMP api driver"
> +#define DRIVER_VERSION "0.1"
> +
> +#define PCI_DEVICE_ID_SAP_FLX_VSMP_CTL 0x1011
> +#define VSMP_CTL_MAX_PCI_BARS 2
> +
> +/* modules info */
> +MODULE_LICENSE(DRIVER_LICENSE);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_VERSION(DRIVER_VERSION);
> +
> +static unsigned int vsmp_bus = 0;
> +static unsigned short vsmp_dev = 0x1f;
> +static unsigned char vsmp_func = 0;
> +static bool vsmp_bdf_static = false;
> +static char *vsmp_ctrl_pci_addr = "";
> +module_param(vsmp_ctrl_pci_addr, charp, 0660);
> +
> +/* defines */
> +// copied from arch/x86/pci/direct.c
> +#define PCI_CONF1_ADDRESS(bus, devfn, reg) \
> +	   (0x80000000 | ((reg & 0xF00) << 16) | (bus << 16) \
> +	   | (devfn << 8) | (reg & 0xFC))

Put the operator on the first line.

> +
> +/* global vars */
> +void __iomem *cfg_addr = NULL;
> +static struct kobject *vsmp_sysfs_kobj;
> +static struct pci_dev *vsmp_dev_obj = NULL;
> +
> +static const struct pci_device_id pci_tbl[] = {
> +	{ PCI_VDEVICE(SCALEMP, PCI_DEVICE_ID_SAP_FLX_VSMP_CTL), 0, },
> +	{ 0, },			/* terminate list */
> +};
> +
> +static struct {
> +	uint64_t start;
> +	uint64_t len;
> +} mapped_bars[VSMP_CTL_MAX_PCI_BARS] = { 0 };
> +
> +/* internal functions */
> +
> +/**
> + * parses the pci address of a given address where the vSMP
> + * pci device is found
> + */
> +static void parse_vsmp_ctrl_pci_addr(void)
> +{
> +	if (strlen(vsmp_ctrl_pci_addr)) {

Reverse this condition.

	if (strlen(vsmp_ctrl_pci_addr) != 0)
		return;

> +		unsigned int bus;
> +		unsigned short dev;
> +		unsigned char func;
> +
> +		if (sscanf(vsmp_ctrl_pci_addr, "%04x:%02hx.%1hhx", &bus, &dev,
> +			   &func) == 3) {

Same:

	if (sscanf(vsmp_ctrl_pci_addr, "%04x:%02hx.%1hhx", &bus, &dev,
		   &func) != 3)
		return;


> +			vsmp_bus = bus;
> +			vsmp_dev = dev;
> +			vsmp_func = func;
> +			vsmp_bdf_static = true;
> +		}
> +	}
> +}
> +
> +/**
> + * queries as specfic device in order to determine if it is a vSMP pci device
> + */
> +static void query_pci_bus_for_vsmp_directly(unsigned int default_bus,
> +					    unsigned int devfn)
> +{
> +	printk(KERN_INFO
> +	       "vSMP pci controller not found in devices tree, trying directly at %x:%x.%x...\n",
> +	       vsmp_bus, vsmp_dev, vsmp_func);
> +
> +	outl(PCI_CONF1_ADDRESS(vsmp_bus, devfn, PCI_BASE_ADDRESS_0), 0xcf8);
> +	mapped_bars[0].start = inl(0xcfc);

Doesn't this need to set mapped_bars[0].len as well?

> +}
> +
> +/**
> + * scan all the devices on the system in order to locate the
> + * vSMP pic device for a given dev end func is provided
> + */
> +static void scan_pci_devs_list_for_vsmp(unsigned int devfn)

This function should return negatives if we do not find a device.
The current error hanlding is convoluted and relies on globals.

> +{
> +	int found, i;

"found" is never set to false.  Make it a bool.

> +	struct pci_dev *pdev = NULL;

Do not initialize "pdev" to a bogus value.

> +	const struct pci_device_id *ent;
> +
> +	for_each_pci_dev(pdev) {
> +		if (devfn != -1) {

Make this -1 a define instead of a magic number.

> +			if ((pdev->bus->number == vsmp_bus) &&
> +			    (devfn == pdev->devfn)) {
> +				found = 1;
> +				break;
> +			}
> +		} else {
> +			ent = pci_match_id(pci_tbl, pdev);
> +			if (ent) {
> +				found = 1;
> +				vsmp_bus = pdev->bus->number;
> +				vsmp_dev = PCI_SLOT(pdev->devfn);
> +				vsmp_func = PCI_FUNC(pdev->devfn);
> +				break;
> +			}
> +		}
> +	}

	if (!found)
		return -ENODEV;

> +
> +	for (i = 0; (i < ARRAY_SIZE(mapped_bars)) && found; i++) {
> +		mapped_bars[i].start = pci_resource_start(pdev, i);
> +		mapped_bars[i].len = pci_resource_len(pdev, i);
> +	}
> +	vsmp_dev_obj = pdev;
> +}
> +
> +/**
> + * open the cfg address space of the vSDP device
> + */
> +static int open_cfg_addr(void)
> +{
> +	unsigned int devfn = (vsmp_bdf_static) ? PCI_DEVFN(vsmp_dev, vsmp_func)
> +						: -1;
> +
> +	scan_pci_devs_list_for_vsmp(devfn);
> +	if (!mapped_bars[0].start)
> +		query_pci_bus_for_vsmp_directly(0, devfn);
> +
> +	if (!mapped_bars[0].len) {
> +		printk(KERN_INFO "vSMP pci controller not found, exiting.\n");
> +		return -1;

Return proper kernel error codes.  "return -EINVAL;"

> +	}
> +
> +	printk(KERN_INFO "mapping bar 0: [0x%llx,0x%llx]\n",
> +	       mapped_bars[0].start, mapped_bars[0].start + mapped_bars[0].len);
> +	cfg_addr = ioremap(mapped_bars[0].start, mapped_bars[0].len);
> +
> +	if (!cfg_addr) {

Delete the blank link between the call and the error checking.  They are
part of the same thing.

> +		printk(KERN_ERR
> +		       "failed to map vSMP pci controller at %x:%x.%x, exiting.\n",
> +		       vsmp_bus, vsmp_dev, vsmp_func);
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +/* exported functions */
> +
> +/**
> + * read a value from a specfic register in the vSMP's device config space
> + */
> +unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size_type type)


Use u64 when 64 bit types are intended.

> +{
> +	unsigned long ret_val;


u64 ret_val;

> +
> +	switch (type) {
> +	case VSMP_CTL_REG_SIZE_8BIT:
> +		ret_val = readb(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_16BIT:
> +		ret_val = readw(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_32BIT:
> +		ret_val = readl(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_64BIT:
> +		ret_val = readq(cfg_addr + reg);
> +		break;
> +
> +	default:
> +		printk(KERN_ERR "unsupported reg size type %d.\n", type);
> +		ret_val = (unsigned long)(-1);


64 bit types.  "ret_val = -1ULL;"


> +	}
> +
> +	dev_dbg(&vsmp_dev_obj->dev, "%s: read 0x%lx from reg 0x%x of %d bits\n",
> +		__func__, ret_val, reg, (type + 1) * 8);
> +	return ret_val;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_read_reg_from_cfg);
> +
> +/**
> + * write a value to a specfic register in the vSMP's device config space
> + */
> +void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,
> +			   enum reg_size_type type)
> +{
> +	switch (type) {
> +	case VSMP_CTL_REG_SIZE_8BIT:
> +		writeb((unsigned char)value, cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_16BIT:
> +		writew((unsigned short)value, cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_32BIT:
> +		writel((unsigned int)value, cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_64BIT:
> +		writeq(value, cfg_addr + reg);
> +		break;
> +
> +	default:
> +		printk(KERN_ERR "unsupported reg size type %d.\n", type);
> +	}
> +
> +	dev_dbg(&vsmp_dev_obj->dev, "%s: wrote 0x%x to reg 0x%x of %u bits\n",
> +		__func__, reg, reg, (type + 1) * 8);
> +}
> +EXPORT_SYMBOL_GPL(vsmp_write_reg_to_cfg);
> +
> +/**
> + * reag a buffer from a specific offset in a specific bar, maxed to a predefined len size-wise from the vSMP device
> + */
> +unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int offset,

This is unsigned int but it returns zero or negative error codes.

Create a separate function for "halt_on_null".  It will be cleaner that
way.

> +				     char *out, unsigned int len,
> +				     bool halt_on_null)
> +{
> +	unsigned char __iomem *buff;
> +
> +	BUG_ON(!mapped_bars[bar].start);
> +	BUG_ON(ARRAY_SIZE(mapped_bars) <= bar);
> +	BUG_ON((offset + len) > mapped_bars[bar].len);
> +
> +	buff = ioremap(mapped_bars[bar].start + offset, len);
> +	if (!buff)
> +		return -ENOMEM;
> +
> +	if (halt_on_null) {
> +		int i;
> +		unsigned char c;
> +
> +		for (i = 0; i < len; i++) {
> +			c = ioread8(&buff[i]);
> +			if (!c)
> +				break;
> +			out[i] = c;

Copy the NUL terminator to out[i] before the break.

> +		}
> +	} else
> +		memcpy_fromio(out, buff, len);
> +
> +	iounmap(buff);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_read_buff_from_bar);
> +
> +/**
> + * register the vSMP sysfs object for user space interaction
> + */
> +int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr)
> +{
> +	int error = -1;
> +
> +	if (vsmp_sysfs_kobj && bin_attr) {
> +		if ((error = sysfs_create_bin_file(vsmp_sysfs_kobj, bin_attr)))
> +			printk(KERN_CRIT "%s returned error %d\n", __func__,
> +			       error);
> +	}
> +
> +	return error;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_register_sysfs_group);
> +
> +/**
> + * deergister the vSMP sysfs object for user space interaction
> + */
> +void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr)
> +{
> +	if (vsmp_sysfs_kobj && bin_attr)
> +		sysfs_remove_bin_file(vsmp_sysfs_kobj, bin_attr);
> +}
> +EXPORT_SYMBOL_GPL(vsmp_deregister_sysfs_group);
> +
> +/**
> + * generic function to read from the bar
> + */
> +ssize_t vsmp_generic_buff_read(struct fw_ops *op, unsigned bar, unsigned reg,
> +			       char *buf, loff_t off, size_t count)
> +{
> +	ssize_t ret_val = 0;
> +
> +	if (op->buff_offset >= op->hwi_block_size) {	// preform H/W op
> +		vsmp_reset_op(op);
> +
> +		if ((ret_val = vsmp_read_buff_from_bar(bar, reg, op->buff,
> +						       op->hwi_block_size, false))) {
> +			printk(KERN_ERR "%s operation failed\n",
> +			       (op->action == FW_READ) ? "read" : "write");
> +		}
> +		op->buff_offset = 0;
> +	}
> +
> +	if (!ret_val) {

Flip this around.  Do error handling.  Don't do success handling.

> +		ret_val = memory_read_from_buffer(buf, count, &op->buff_offset,
> +						  op->buff, op->hwi_block_size);
> +	}
> +
> +	return ret_val;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_generic_buff_read);
> +
> +void vsmp_reset_op(struct fw_ops *op)
> +{
> +	memset(op->buff, 0, op->hwi_block_size);
> +	op->buff_offset = op->hwi_block_size;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_reset_op);
> +
> +int vsmp_init_op(struct fw_ops *op, ssize_t max_size,
> +		  enum vsmp_fw_action action)
> +{
> +	op->hwi_block_size = max_size;
> +	op->action = action;
> +	op->buff_offset = op->hwi_block_size;
> +
> +	if (!(op->buff = kzalloc(op->hwi_block_size, GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	vsmp_reset_op(op);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_init_op);
> +
> +void vsmp_release_op(struct fw_ops *op)
> +{
> +	BUG_ON(!op->buff);
> +	kfree(op->buff);
> +	memset(op, 0, sizeof(*op));
> +}
> +EXPORT_SYMBOL_GPL(vsmp_release_op);
> +
> +bool vsmp_op_buffer_depleted(struct fw_ops *op)
> +{
> +	return op->buff_offset >= op->hwi_block_size;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_op_buffer_depleted);
> +
> +/* module functions */
> +
> +/**
> + * init the module
> + */
> +static int __init vsmp_api_init(void)
> +{
> +	int ret_val;
> +
> +	parse_vsmp_ctrl_pci_addr();
> +
> +	if (!(ret_val = open_cfg_addr())) {

Error handling not success handling.

> +		printk(KERN_INFO "%s [%02x:%02x.%x] up and running\n",
> +		       DRIVER_DESC, vsmp_bus, vsmp_dev, vsmp_func);
> +
> +		if (!(vsmp_sysfs_kobj = kobject_create_and_add("vsmp",
> +								hypervisor_kobj))) {

Reverse.

> +			printk(KERN_ERR
> +			       "failed to create sysfs entry for vSMP pci controller at %x:%x.%x, exiting.\n",
> +			       vsmp_bus, vsmp_dev, vsmp_func);
> +			ret_val = -1;
> +		}
> +	}
> +
> +	return ret_val;
> +}
> +
> +/**
> + * cleanup after the module upon exit
> + */
> +static void __exit vsmp_api_exit(void)
> +{
> +	if (cfg_addr)
> +		iounmap(cfg_addr);
> +
> +	if (vsmp_sysfs_kobj)
> +		kobject_put(vsmp_sysfs_kobj);
> +}
> +
> +module_init(vsmp_api_init);
> +module_exit(vsmp_api_exit);
> diff --git a/drivers/staging/vsmp/api.h b/drivers/staging/vsmp/api.h
> new file mode 100644
> index 000000000000..88d81b80bd81
> --- /dev/null
> +++ b/drivers/staging/vsmp/api.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP api header
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#ifndef VSMP_API_H
> +#define VSMP_API_H
> +
> +#include <linux/sysfs.h>
> +
> +enum reg_size_type {
> +	VSMP_CTL_REG_SIZE_8BIT = 0,
> +	VSMP_CTL_REG_SIZE_16BIT,
> +	VSMP_CTL_REG_SIZE_32BIT,
> +	VSMP_CTL_REG_SIZE_64BIT
> +};
> +
> +enum vsmp_fw_action {
> +	FW_READ = 0,
> +	FW_WRITE = 1
> +};
> +
> +struct fw_ops {
> +	enum vsmp_fw_action action;
> +	ssize_t hwi_block_size;
> +	unsigned char *buff;
> +	loff_t buff_offset;
> +	bool in_progress;
> +};
> +
> +#define FILE_PREM (S_IRUSR | S_IRGRP | S_IROTH)
> +
> +#define VSMP_ATTR_RO(_name) static struct kobj_attribute _name##_attr = __ATTR_RO(_name)
> +#define vsmp_read_reg8_from_cfg(_reg_) ((unsigned char) vsmp_read_reg_from_cfg((_reg_), VSMP_CTL_REG_SIZE_8BIT))
> +#define vsmp_read_reg16_from_cfg(_reg_) ((unsigned short) vsmp_read_reg_from_cfg((_reg_), VSMP_CTL_REG_SIZE_16BIT))
> +#define vsmp_read_reg32_from_cfg(_reg_) ((unsigned int) vsmp_read_reg_from_cfg((_reg_), VSMP_CTL_REG_SIZE_32BIT))
> +#define vsmp_read_reg64_from_cfg(_reg_) ((unsigned long) vsmp_read_reg_from_cfg((_reg_), VSMP_CTL_REG_SIZE_64BIT))
> +#define vsmp_write_reg8_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_),(_val_), VSMP_CTL_REG_SIZE_8BIT)
> +#define vsmp_write_reg16_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_), (_val_), VSMP_CTL_REG_SIZE_16BIT)
> +#define vsmp_write_reg32_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_), (_val_), VSMP_CTL_REG_SIZE_32BIT)
> +#define vsmp_write_reg64_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_), (_val_), VSMP_CTL_REG_SIZE_64BIT)
> +
> +unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size_type type);
> +void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,
> +			   enum reg_size_type type);
> +unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int offset,
> +				     char *out, unsigned int len,
> +				     bool halt_on_null);
> +int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr);
> +void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr);
> +
> +ssize_t vsmp_generic_buff_read(struct fw_ops *op, unsigned bar, unsigned reg,
> +			       char *buf, loff_t off, size_t count);
> +void vsmp_reset_op(struct fw_ops *op);
> +int vsmp_init_op(struct fw_ops *op, ssize_t max_size,
> +		 enum vsmp_fw_action action);
> +void vsmp_release_op(struct fw_ops *op);
> +bool vsmp_op_buffer_depleted(struct fw_ops *op);
> +
> +#endif // VSMP_API_H
> diff --git a/drivers/staging/vsmp/common/Kconfig b/drivers/staging/vsmp/common/Kconfig
> new file mode 100644
> index 000000000000..fe0cfeaca1bb
> --- /dev/null
> +++ b/drivers/staging/vsmp/common/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VSMP_COMMON
> +	tristate "vSMP Guest driver common Support"
> +	depends on VSMP
> +	help
> +	  select this feature in order to be able to retrive generic data from the vSMP
> +	  VM.
> +	  currently old version is supported.
> +	  the data can be found under /sys/hypervisor/vsmp
> +
> +	  If unsure, say N.
> diff --git a/drivers/staging/vsmp/common/Makefile b/drivers/staging/vsmp/common/Makefile
> new file mode 100644
> index 000000000000..e6f6aa1d73df
> --- /dev/null
> +++ b/drivers/staging/vsmp/common/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for vSMP Guest common feature.
> +#
> +
> +obj-$(CONFIG_VSMP_COMMON)	+= common_info.o 
> +common_info-y		+= common.o version.o
> diff --git a/drivers/staging/vsmp/common/common.c b/drivers/staging/vsmp/common/common.c
> new file mode 100644
> index 000000000000..31e6551f2b7f
> --- /dev/null
> +++ b/drivers/staging/vsmp/common/common.c
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP common
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/pci_regs.h>
> +#include <linux/pci.h>
> +#include <linux/kobject.h>
> +#include <linux/kernel.h>
> +
> +#include <asm/io.h>
> +
> +#include "../api.h"
> +#include "common.h"
> +
> +#define DRIVER_LICENSE "GPL"
> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"
> +#define DRIVER_DESC "vSMP common info driver"
> +#define DRIVER_VERSION "0.1"
> +
> +/* modules info */
> +MODULE_LICENSE(DRIVER_LICENSE);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_VERSION(DRIVER_VERSION);
> +
> +static struct sysfs_entry_cbs cbs_arr[] = {
> +	create_entry(version),
> +};
> +
> +/* module functions */
> +
> +/**
> + * init the common module
> + */
> +static int __init vsmp_common_info_init(void)
> +{
> +	int ret_val = 0, i;
> +
> +	for (i = 0; (i < ARRAY_SIZE(cbs_arr) && !ret_val); i++) {
> +		if ((ret_val = cbs_arr[i].reg_cb()))
> +			printk(KERN_ERR "failed to init sysfs (%d), exiting.\n",
> +			       ret_val);
> +	}
> +
> +	return -1 * ret_val;

sysfs_register_version_cb() already returns negatives.  Why the "-1 *"?

> +}
> +
> +/**
> + * cleanup after the module
> + */
> +static void __exit vsmp_common_info_exit(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(cbs_arr); i++)
> +		cbs_arr[i].dereg_cb();
> +}
> +
> +module_init(vsmp_common_info_init);
> +module_exit(vsmp_common_info_exit);
> diff --git a/drivers/staging/vsmp/common/common.h b/drivers/staging/vsmp/common/common.h
> new file mode 100644
> index 000000000000..08a096628c95
> --- /dev/null
> +++ b/drivers/staging/vsmp/common/common.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP common header
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#ifndef VSM_COMMON_H
> +#define VSM_COMMON_H
> +
> +#define create_entry(_label_) \
> +	{ \
> +		.reg_cb = sysfs_register_ ## _label_ ## _cb, \
> +		.dereg_cb = sysfs_deregister_ ## _label_ ## _cb, \
> +	}
> +
> +typedef int (*sysfs_register_cb)(void);
> +typedef void (*sysfs_deregister_cb)(void);
> +
> +struct sysfs_entry_cbs {
> +	sysfs_register_cb reg_cb;
> +	sysfs_deregister_cb dereg_cb;
> +};
> +
> +int sysfs_register_version_cb(void);
> +void sysfs_deregister_version_cb(void);
> +
> +#endif // !VSM_COMMON_H
> diff --git a/drivers/staging/vsmp/common/version.c b/drivers/staging/vsmp/common/version.c
> new file mode 100644
> index 000000000000..35b5a7785e9a
> --- /dev/null
> +++ b/drivers/staging/vsmp/common/version.c
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP version
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/kobject.h>
> +
> +#include "../api.h"
> +#include "../registers.h"
> +
> +#define VERSION_MAX_LEN (1 << 19)
> +
> +static struct fw_ops op;
> +
> +static ssize_t version_read(struct file *filp, struct kobject *kobj,
> +			    struct bin_attribute *bin_attr,
> +			    char *buf, loff_t off, size_t count)
> +{
> +	ssize_t ret_val = vsmp_generic_buff_read(&op, 0,
> +						 vsmp_read_reg32_from_cfg(VSMP_VERSION_REG),
> +						 buf, off, count);

Don't put functions which can fail in the declaration block.

	ret_val = vsmp_generic_buff_read(&op, 0,
					 vsmp_read_reg32_from_cfg(VSMP_VERSION_REG),
					 buf, off, count);

> +
> +	if ((ret_val != -ENOMEM) && ((ret_val != -EINVAL)))

Don't test for specific error codes.

	if (ret_val < 0)
		return ret_val;


> +	    buf[ret_val++] = '\n';
> +
> +	return ret_val;
> +}
> +
> +struct bin_attribute version_raw_attr = __BIN_ATTR(version, FILE_PREM, version_read, NULL, VERSION_MAX_LEN);
> +
> +/**
> + * retrive str in order to determine the proper length.
> + * this is the best way to maintain backwards compatibility with all
> + * vSMP versions.
> + */
> +static int get_version_len(void)
> +{
> +	unsigned reg;
> +	char *version_str = kzalloc(VERSION_MAX_LEN, GFP_ATOMIC | __GFP_NOWARN);

VERSION_MAX_LEN is 524288 bytes.  That's too long.  Create a small
buffer and loop over it until you find the NUL terminator.  Why does
this need to be ATOMIC, are we holding a lock?  Hopefully if we can fix
the length the __GFP_NOWARN will be unnecessary.

> +
> +	if (!version_str)
> +		return -1;
> +
> +	reg = vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);
> +	memset(version_str, 0, VERSION_MAX_LEN);
> +
> +	if (vsmp_read_buff_from_bar(0, reg, version_str, VERSION_MAX_LEN, true)) {
> +		printk(KERN_ERR "failed to read buffer from bar\n");
> +		return -1;
> +	}
> +
> +	version_raw_attr.size = strlen(version_str);

get_version_len() should return the length instead of setting a global.

> +	kfree(version_str);
> +
> +	return 0;
> +}
> +
> +/**
> + * register the version sysfs entry
> + */
> +int sysfs_register_version_cb(void)
> +{
> +	if (get_version_len()) {
> +		printk(KERN_ERR "failed to init vSMP version module\n");
> +		return -1;
> +	}
> +
> +	if (!vsmp_init_op(&op, version_raw_attr.size, FW_READ)) {

This if statement is reversed so this code can never work.

> +		printk(KERN_ERR "failed to init vSMP version op\n");
> +		return -1;
> +	}
> +
> +	return vsmp_register_sysfs_group(&version_raw_attr);
> +}
> +
> +/**
> + * deregister the version sysfs entry
> + */
> +void sysfs_deregister_version_cb(void)
> +{
> +	vsmp_deregister_sysfs_group(&version_raw_attr);
> +	vsmp_release_op(&op);
> +}
> diff --git a/drivers/staging/vsmp/logs/Kconfig b/drivers/staging/vsmp/logs/Kconfig
> new file mode 100644
> index 000000000000..d41491472bab
> --- /dev/null
> +++ b/drivers/staging/vsmp/logs/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VSMP_LOGS
> +	tristate "vSMP Guest driver logs Support"
> +	depends on VSMP
> +	help
> +	  select this feature in order to be able to retrive logs from the vSMP
> +	  VM.
> +	  the data can be found under /sys/hypervisor/logs
> +
> +	  If unsure, say N.
> diff --git a/drivers/staging/vsmp/logs/Makefile b/drivers/staging/vsmp/logs/Makefile
> new file mode 100644
> index 000000000000..edc679803fe6
> --- /dev/null
> +++ b/drivers/staging/vsmp/logs/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for vSMP Guest common feature.
> +#
> +
> +obj-$(CONFIG_VSMP_LOGS)	+= logs.o 
> +logs-y		+= active_logs.o
> diff --git a/drivers/staging/vsmp/logs/active_logs.c b/drivers/staging/vsmp/logs/active_logs.c
> new file mode 100644
> index 000000000000..91492c72cc6f
> --- /dev/null
> +++ b/drivers/staging/vsmp/logs/active_logs.c
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP logs
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/pci_regs.h>
> +#include <linux/pci.h>
> +#include <linux/kobject.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +
> +#include <asm/io.h>
> +
> +#include "../api.h"
> +#include "../registers.h"
> +
> +#define DRIVER_LICENSE "GPL"
> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"
> +#define DRIVER_DESC "vSMP logs driver"
> +#define DRIVER_VERSION "0.1"
> +
> +#define LOGS_MASK (1 << 0)
> +
> +/* modules info */
> +MODULE_LICENSE(DRIVER_LICENSE);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_VERSION(DRIVER_VERSION);

Just put:

MODULE_LICENSE("GPL v2");

Adding unnecessary indirection is against kernel style.  It says v2 at
the top.

> +
> +static struct fw_ops op;
> +static unsigned log_start;
> +DEFINE_MUTEX(log_mutex);
> +
> +/* module functions */
> +static ssize_t log_read(struct file *filp, struct kobject *kobj,
> +			struct bin_attribute *bin_attr,
> +			char *buf, loff_t off, size_t count)
> +{
> +	ssize_t ret_val = 0;
> +
> +	if (!op.in_progress) {
> +		if ((ret_val = mutex_lock_interruptible(&log_mutex))) {

Don't do assignments inside of an if condition.

> +			printk(KERN_ERR
> +			       "error in atemmpt to lock mutex (%lx)\n",
> +			       ret_val);
> +			return ret_val;
> +		}
> +
> +		vsmp_write_reg16_to_cfg(VSMP_LOGS_CTRL_REG,
> +					vsmp_read_reg16_from_cfg
> +					(VSMP_LOGS_CTRL_REG) | LOGS_MASK);
> +		op.in_progress = true;
> +		vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG, 0);
> +	}
> +
> +	if (vsmp_op_buffer_depleted(&op)) {
> +		if (!(vsmp_read_reg16_from_cfg(VSMP_LOGS_CTRL_REG) & LOGS_MASK)) {
> +			vsmp_reset_op(&op);
> +			op.in_progress = 0;
> +			mutex_unlock(&log_mutex);
> +			return ret_val;

Return a literal when possible. "return 0;" is more clear than
"return ret_val;".

> +		}
> +	}
> +
> +	ret_val = vsmp_generic_buff_read(&op, 1, log_start, buf, off, count);
> +	if (!ret_val || (ret_val == -ENOMEM) || (ret_val == -EINVAL)) {
> +		printk(KERN_ERR "error reading from buffer\n");
> +		mutex_unlock(&log_mutex);
> +		return 0;
> +	}
> +
> +	if (vsmp_op_buffer_depleted(&op)) {
> +		vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG,
> +					~0LL & ~(1LL << 0));
> +	}
> +
> +	return count;
> +}
> +
> +static struct bin_attribute log_raw_attr = __BIN_ATTR(log, FILE_PREM, log_read, NULL, 0);
> +
> +/**
> + * init the log module
> + */
> +static int __init vsmp_logs_init(void)
> +{
> +	if (!vsmp_init_op(&op, vsmp_read_reg32_from_cfg(VSMP_LOGS_LEN_REG),
> +							 FW_READ)) {
> +		printk(KERN_ERR "failed to init vSMP log op\n");
> +		return -1;
> +	}
> +
> +	log_start = vsmp_read_reg32_from_cfg(VSMP_LOGS_START_REG);
> +	mutex_init(&log_mutex);
> +
> +	return vsmp_register_sysfs_group(&log_raw_attr);

If vsmp_register_sysfs_group() fails then it needs to vsmp_release_op().

I have written a lot about how to write error handling code:
https://lore.kernel.org/all/20210831084735.GL12231@kadam/

regards,
dan carpenter

