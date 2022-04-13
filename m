Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F623DB;
	Wed, 13 Apr 2022 07:52:04 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23D4VTrB022836;
	Wed, 13 Apr 2022 07:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=W9PoIXKUpJTvt5mFucaa38b8JAsq1KMwpr20yLzla/0=;
 b=SXou1YHJqiGMCSZmvIP6ofYOKDif/7TtqA1q+ddh9rxQs9Hkd2/efs17iwIt8NgTMmgV
 H5lv0+P85kreqVmbIGDeq6pyoUB7vMfdjQKdXSfIkKop6jNGVtJA4KvwVnO7XjocTNNN
 HIu1r3xaTGSJIXZ7mjLPfi/Qo25f9jAWfYVLC4l5Jv1bmp3XGjSWLEmbR42DkYIbVO6M
 cHSpE4g7IFUD70Z/L+/01h7UNk6PjHTgpfosORES+j0G6zPdvs57udsY1veHXOZ2frEE
 agqbs+DIL2YDO0s6/1Czvg2qlBnael+9Zn4gZ5tQDkEZm6TOEJ2a37awV0Wy3L8qBVtL wg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com with ESMTP id 3fb0jd8v9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Apr 2022 07:52:03 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23D7pl1v003067;
	Wed, 13 Apr 2022 07:52:01 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fb0k3w347-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Apr 2022 07:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9uqoE9pBdAemF4WL1ngCWGkbVICrmMJu+8bW5FUtu8s97MMlTSNsKR6AAZTIndy7wcyT/O1Mnc+Upd0hQbmfoq8BmzqY9RzoQWiYLSZ01uBXjItLrXaFYnWjtHQHmBlfi+gObZbnW7xEdFxumNpjXPbfk6e0cPOPCJY+h5dkafQfWl9xZuKNdbSUfRaBSawMK7/CYuonDsQXXshgHLVJkmVXW9B9Xj6mYM3ylyJtXxQv+0NdPVlex3FQElj7Uc2Qgtw0seJYmHeiyL2GSey0frU8JU9fS0hPGPrw5MvHAk++5PSzaD7fyyWAea7ER/ihnOqQJNSKYEASJqyxZqJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9PoIXKUpJTvt5mFucaa38b8JAsq1KMwpr20yLzla/0=;
 b=JM4M+ZX7JA+vHC46ZIu3T332ugUuVpk8ZweOfWY3tep8itMTj6mvDlfWGI6HmF7yOlv1K1/mzkZrgek+ywdVHDHwcExCP2BtcGlykxFMN/KcCGS3q8kwObfGb6oN/lNL6S6x7zYJ/dSFrsC3QqlHWfVmfBt7RsOsyIoZy08lCnMwBUYhNf6IKOd4oqnJGpKR2hp/WmBtoeDj11PiGkmvCYUymAZQqrIOZExk8kQPOIFZbaadJR/noRqRkx7xnf6Gun697GlPtmQ64yvpRnpRqU+aKI+K2frjO/VwJcbBYrTmo+wFx3A4MLF6R8MrE3HlCvqWE9XDQ3CK+e4330LxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9PoIXKUpJTvt5mFucaa38b8JAsq1KMwpr20yLzla/0=;
 b=kgLOhDMz7ozracrcw86eKP9GaGvYUWqIrsQdkMGrL3xT0DMej9BVauKwhEMZfaL952x0MuHRnvhslGUMpSUKqHu5aAmYWNxcU8Ba32yA/os4Otf9tkuAVIhRDNUoG+EZgr3pfcVrV3tmaT5YGcIp5GSiKvjVZzaFYoYK18dCheA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5170.namprd10.prod.outlook.com
 (2603:10b6:208:321::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 07:51:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Wed, 13 Apr 2022
 07:51:59 +0000
Date: Wed, 13 Apr 2022 10:51:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: aliya-rahmani <aliyarahmani786@gmail.com>
Cc: tomm.merciai@gmail.com, gregkh@linuxfoundation.org,
        linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vt6655f: rxtx: code style - Fix Lines should
 not end with a '('
Message-ID: <20220413075131.GH3293@kadam>
References: <20220413073545.14666-1-aliyarahmani786@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413073545.14666-1-aliyarahmani786@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0024.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::36)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e98fcb76-613d-4894-a0aa-08da1d227cfa
X-MS-TrafficTypeDiagnostic: BLAPR10MB5170:EE_
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB51703BB3AF579452673B9BC28EEC9@BLAPR10MB5170.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/IbGIX5coc9gB3vuUslKfzw/ztvFLIDiasbodGy/RkDQnlDWgZgnycvQ2eZqI/DtoAqlFh1Cw3hlSnWcs61PbJSA8SrXmr8aDhmXdVy55MssZtWVXhUVRCTzg4BDaBdWbWjLcLf654AwmeU16AHwS1Ff+KMkLY/5U1F2Rx9nLiDFGXVkUpRuQ71MOJjvtPO1dkPNKtHyqtGOhvIeNIx6+Z6WuQbv3PsRmGBpucmIxyA2Z7PzllL1jYNppy+C+z4L61vIa2hyOgov7zNt11FFCoqlXVcZI/B0ccgaM0Syq7KZBsjwTxXgwRDIZReLPmaxAlJKLIVNkxWhVHPWRpxSklOGmgGQuHQ223+g0m6uAzPf3ijPQbKiQ7ioO0PZEsjpStuGrx2iNeCEwgKQfEFOyA3cZ2mIHZYoE/iOTELEkaEZr3FubK2796MathfqcwoztKH84J2inX6UcK5Xqo4n1Id6MKno48q3ZcW2VIc/AAYC0eyCqdhnEovxEE9sIABEeYIlq7Quz7D/A6JICvYoVf0fgLRciGWOKSVgqlXYqRQMpq8fKBTOV0m3SXEG0fXDdKmcMU+mtsNcHevuJ4iRopXR7tQEKw+PixXnClfLoPnl0ChNL8OBhpRQMzzRzIBhOBFEGNgdjmD3Jq21KKLmTCjW3cLi+AlIWgus7uQK3/A7WkkF9ayeIMivymw4PYONTpng6kPmPAnhiF42oAcGDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(38100700002)(33656002)(5660300002)(508600001)(38350700002)(6486002)(4326008)(44832011)(66946007)(66556008)(4744005)(6666004)(8676002)(66476007)(316002)(6916009)(8936002)(9686003)(86362001)(186003)(6512007)(2906002)(52116002)(1076003)(6506007)(26005)(33716001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WxBz9k+FtsO8Rl4XvRLPF61iBxxTYmh+U1eW0qwEw71Ql+SHSrS6Dwek19SU?=
 =?us-ascii?Q?V7nQadl8aMchJ+bP0bgV26p3fC59fSJHFzbxTis1QS7HnoqMTUsTQAEq6y3B?=
 =?us-ascii?Q?gKibT7l1/8gNrSOW9WPJdFAmXSmN3pvKscPXNkAcO26SRRtCsYBVLXxIiajI?=
 =?us-ascii?Q?qybKyUoSdkHV9nsIv1p8I9Qq5zYqEq8XNs4fKfgE/qwu+sEWTLnnPPV0M/Gh?=
 =?us-ascii?Q?ZB7BOmMHqEW+chL27OV6QHFtWJhVHFYiMgNDU9oAZNvE4rSTdCWKocUe7R8r?=
 =?us-ascii?Q?F0mlTmwwMc5lKCR/vkaVOJbfvgAf/WfIvbqTZRqtjP97HAoVM9oL59GGA2a+?=
 =?us-ascii?Q?6up/qkgR8PWGyPncqYYNdOidu4mwO4b7x3uBvJfxoeTcb9F2T+iwWFVkFQ0E?=
 =?us-ascii?Q?7qQF430Ua1Qey4hSIQvvMMo3xZIjIhdpHvA5dL8IR8IBD1W/ktpvbkJ+5Vws?=
 =?us-ascii?Q?woHv6Rb/XBCF8467HTmxcBF82e9RHmMewroAs2s1udRLTrrfPBn5i9+yoe1B?=
 =?us-ascii?Q?8b+ULMLSc2OKQOPMagqT1YB6FI33GEW0XK7sWcwQc0j3koMU8TgM55FDXo8i?=
 =?us-ascii?Q?U3KLfRigdYQcp+4UnAlhZwJFdTW8O9FkkRr0lqcQ/MKcbPH4uqiNhvuT6n0+?=
 =?us-ascii?Q?E5RM1pmrtXW0HREa7IvPtgkYZQbi3lAt2h/z0RnO/f+xVdKxLEOQNOjtUsIV?=
 =?us-ascii?Q?GmcqPOnHVm+ewZtZeyLT4wuhpRP5q6oXnCpZelhIWtuEVcEVNp0+pH7fcX0K?=
 =?us-ascii?Q?hhEO6GFu7B4A0Rsl57fFQbl92DsZLFE6unzlEk7p3uVdxeRlkFtnu893uU99?=
 =?us-ascii?Q?MUUbC97SNYaqp7KTbmQEBlc0KVcY5YPvdNfqDaKVFie6kbjmc6d/HMcOj1J5?=
 =?us-ascii?Q?6ogev8g+ywZS+sKn6+tukrgMq12s/f1Xu2Q68i2x99fhE06k3LVviLntuQBL?=
 =?us-ascii?Q?s+So9c2WykJtLlEYEv2qsgz1MBIX9eQzRLndaPQe+ocEIr5i39oWvKyId+Ba?=
 =?us-ascii?Q?x7pYn+ChTCAv8ZVdvvvTAf5OKY31Mp3sd+yHAwWACXQ1ox801X+l0kjeFJ/i?=
 =?us-ascii?Q?DwDFroYM8O+EQkI7kM9v/wskfZFWpD1G1UEK7e7rzrCSpyuA+k4hhSi5CQI8?=
 =?us-ascii?Q?Np7q7Eik5EbIX4lxznLH0tpbLdJgmOSGJ81U1CXK4Ntu5uyF0dSeHpRl4v+G?=
 =?us-ascii?Q?zTSCMOvXmWt+QSlsuC/EwxhGbc4t87zqCWzueGKg0jyyyUWvdH11XmRnuDcN?=
 =?us-ascii?Q?ZoaEUipC+z5jQyU+zV+ULg0UnHKGTunRLVt4nAc6TrGlfjclIapoUS+EnwsM?=
 =?us-ascii?Q?vELfuhgVvgf0E4eAuGMiXTlOy4o1FkoiKoF99MCC26TiccWL0I9qq1Ch8mHR?=
 =?us-ascii?Q?BM4tBr3GXqxFoSmBwgiGWirKn1BPrXcUFYjuv/985Gfm2EEDkDoyu6pFZoVO?=
 =?us-ascii?Q?W6LDtchWqKdqbBnHviZLkWtZtLChR65XAJ4aMc5eT7qtn/moY+kV94EcJgGO?=
 =?us-ascii?Q?06aiFFAcw6wBIIFu5sf5EhMt0eh8W2cYNH3RcMRQHe3otuW/O9tnA7Ru2aWO?=
 =?us-ascii?Q?5cNPLgJsA4HGzGBSMWD8ktCvCICOIRrCRLp7Nx1L86II0+4mlOyOSF+dCOqi?=
 =?us-ascii?Q?IHrYKzcW8z9J2sVFjuPxjkoKE8nqi3QpuYR0vkCVOkcp00xnu3ITLaAkO13w?=
 =?us-ascii?Q?9Ca2lJMu7VFG0qEH0x4ERANgTZeacUsc1puyFGGfRRujvbbipMRYCi7DH1CP?=
 =?us-ascii?Q?3MLhqUMZiikTgaIXwNTh8dz0I3fPre8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98fcb76-613d-4894-a0aa-08da1d227cfa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 07:51:59.7208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1wN5fw82TxA1DbXSj9dOocQf7pD1Za2UVHH/9j/wN/Neb9ZbPXWL4moMnVRkrjUQHgMmIEAyAHysc/0szy3rwjWo8luR6GrkpCcyEdhvko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5170
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-12_08:2022-04-11,2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130044
X-Proofpoint-ORIG-GUID: iuEPGjh4SznWwUFzw1SaIqVnuMaAmKSo
X-Proofpoint-GUID: iuEPGjh4SznWwUFzw1SaIqVnuMaAmKSo

On Wed, Apr 13, 2022 at 01:05:45PM +0530, aliya-rahmani wrote:
> From: Aliya Rahmani <aliyarahmani786@gmail.com>
> 
> Removed indentation to fix the checkpatch error that lines should not
> end with a '('.
> 
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> 
> ---
>  drivers/staging/vt6655/rxtx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 53506e242a96..dce9d87d2363 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -569,8 +569,7 @@ s_uFillDataHead(
>  
>  static
>  void
> -s_vFillRTSHead(
> -	struct vnt_private *pDevice,
> +s_vFillRTSHead(struct vnt_private *pDevice,
>  	unsigned char byPktType,

Indent these lines as well and move the ) forward.

s_vFillRTSHead(struct vnt_private *pDevice,
	       unsigned char byPktType,
	       ...
	       unsigned char byFBOption)
{

regards,
dan carpenter

