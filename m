Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FFF2C9D
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 14:47:46 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205D4BjU014276;
	Wed, 5 Jan 2022 14:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Yn3/H8+2wcEPVHudbMTLbumZortcPRktmvs+xG0X+YI=;
 b=v1ZC3/CsHNzd6H0DqSMJbjldMpvI/+WJBqpvTwkyjkKS/Skn3rAzpLJk7kd2Tb13RrjN
 QwdadJIlZEOLnYg6oQdSBeSifmjbJ72eIiJ5IZQe2CCEwYcQGgEm8bcXvKksphJtibnD
 nDwaqNfKddzWl2KeUrFBXpMV1qX4/SeLB24QhpbT8tXIkov4Wzl9uS8aGVVh5ajtBeLK
 LauHItHekKMcgk0v833+iDyYeQbg8D99sC/g1HuM6Q3Dzx6PFCG0fO6xXVXfOsV7BuGh
 1piEFAMXRUYODL+L1TVftFeht/VC7Z6YDo0VbflpWLE9/ysZff2jIx8GO56QLTyvVuom YA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3dc40fmw0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jan 2022 14:47:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 205EfnJ6094349;
	Wed, 5 Jan 2022 14:47:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
	by userp3030.oracle.com with ESMTP id 3dac2yfq1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jan 2022 14:47:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmbp88HqZl56wS89Ag3EUihTfQ1yCYvicMRQWJvp/OnNnzJDyatpTjiX0EnO5arrBcZ517MrpcbZ4TiUztuhmkz/+nKwwIXAVabLdciguE/hBcpoyT1mQjcCVTbuQvuLXPGgS1wAjLp01XCjVrn+8LcFeKA27XvDw9EJeOHtm9NC16TYCXFJT7EcfQDwBKU9EtpLASQQum+q6MuzK120sfjU9X1vdWndDbaR6Z3/izJ7E0CuNDedYM8+v1XBkNVSl7F9pkbmms0bdesBikakQ9S0EY5vpf50qNTyPwm/kDF7kNPW3JPC9wPxa8+W8lmocnvbvA9mbxbOED4Y1l54wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn3/H8+2wcEPVHudbMTLbumZortcPRktmvs+xG0X+YI=;
 b=I0w4i6//zgx+yeqW6QzS97lomSUpyOKdgr6SJ3flO5zo3s21BrC/8hOrbZmia3e3wuugKrjt2Y/LjoDcu+qduBklz4KgQg6s41s3VZLopOrobPy96eWMXLjrwIcTyE0hoUn/q+kwVci65JWjWgo1QwxY6bgshCANVDIENojNiuAQXgxG/YhRCyfkNCJUPAxiHM/f8Mc3VXtwug9rEyZOXG175sJMPBORUajMQ1Iku8hKYzPTndRTPW0D8Q+dc6imj3FStZx58DaeetkUjcMQBqT92HkrQAICVc2wFm2FMi2krV1Y4eEkxPzV/GLGm6ziq3um0La25mAr3oiynl5YIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn3/H8+2wcEPVHudbMTLbumZortcPRktmvs+xG0X+YI=;
 b=Eqf6nc/Z4SfYxeO88WW6xx5coDTp6TmPhOMEBHcMa/G5sD4EX6ZcPyoGauGebxILrfYY++cNpU0EgM5KAqGx190odMdFtkEQmVJ1cF73aQyjWiOY7eqWwvw0NjdVj46gIv/dTGAb0NfVo4ARb8ayRBLqhMDRGUX39uOSiLWqGnM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5667.namprd10.prod.outlook.com
 (2603:10b6:303:19c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13; Wed, 5 Jan
 2022 14:47:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 14:47:36 +0000
Date: Wed, 5 Jan 2022 17:47:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ismayil Mirzali <ismayilmirzeli@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
        fabioaiuto83@gmail.com, linux@roeck-us.net, paskripkin@gmail.com
Subject: Re: [PATCH v3 1/2] staging: rtl8723bs: address style guide warnings
Message-ID: <20220105144709.GF7674@kadam>
References: <cover.1640197297.git.ismayilmirzeli@gmail.com>
 <3bddd2a8c02540c56a48d6844b3fcd897441803b.1640197297.git.ismayilmirzeli@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bddd2a8c02540c56a48d6844b3fcd897441803b.1640197297.git.ismayilmirzeli@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dddeb319-80ec-45ea-f50a-08d9d05a4fa6
X-MS-TrafficTypeDiagnostic: MW5PR10MB5667:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR10MB5667C2D6D8F3C07BCE0DF3948E4B9@MW5PR10MB5667.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CNWmeb+FqUxsQGg9i8eTzGz2kTjEOKAVkgn6q2QmDoqjaBTlNCkwQp8bFDALhuonblgBo0s7mE+xiZWZDtqC6Q01HdmiifkWstqK/JVeGarmp5v5wrmS4ex/swgiHPf3ZGCZqV0Vum2NKZdSqkhPOYOjc0WhKW9Z3F8qvl2FpVLuGEJmKv+QgCPPMAkwonoBi2dK4dfCy3L1Pn9PE6HtpoH7wQ6x7HzJhmCD0fPmrNXllsYR7pIQP0dwaDs3NSUEY3iAP/gSn8OxYuEAICQVDuie/epehncWhf6yerYfjheg/mf6V7LF56/wzS1Hp3jjEUYbiiOaitJPksz4WvG57Y5tMkoLV4wMHIl+AnORPwiwg9iVAfEnbTk9e0iTa2QwUTYMo9fC8m/2yktbnDmw6U9G+doK5cQ57zJlcgVpZVpzaMuNUeTgFJxygbeUxUR4cijqJWQ8wiXWRuOYLyLx6fRV+Id4HEhLkGUoaQHEEaSkttGVvBxPj0MyRmvscR4HjUHdAktIlwxs21fKVFJOvnyfkZ4lsS1hWqgdYYBm1d+PyxxuCBLmx0cEnP0GA2rpuMy0AMF0lP9nsnZPRYn02DLTCN+Q6+4xxx5btVhJT11i16/teHgTbyfVR5bAv34fWhbAbEJz9PoNfkGJIqWPibJHK+Gny2BNjdVrUXx0EGH0Jn9d2tC/EJTWM8RlJ/rRq7pZHAQDdTLbp24n1j7/Rw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(38350700002)(6486002)(6512007)(44832011)(6916009)(33716001)(5660300002)(33656002)(66476007)(508600001)(38100700002)(66556008)(4326008)(8936002)(52116002)(66946007)(2906002)(26005)(316002)(6506007)(6666004)(86362001)(186003)(4744005)(8676002)(9686003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/5v3PsZ/iG0103mxdho5jGBgi8wyfHuxH1YeWdsiSFg00n1CGmDgmxr2WRFP?=
 =?us-ascii?Q?NOmpyTYbsVFjzpxs9jWBLyxje3Z5gZWbS3a43YThq7+LD7yn4QOnNQaQNLvm?=
 =?us-ascii?Q?3pxM8rq2GUYimCE8acyHxLj1ISVB/fqBVZDUqy0lNYTT4SQ50m6454GfLEr6?=
 =?us-ascii?Q?YvcOP04lX7kRwDoKqdyGbHaL2QJQXvdAKGYewwxac1IaHengXY1fCWaCdj85?=
 =?us-ascii?Q?VIZOVdYLQCOBZ/PlXqL2dwe3k8Q87ECjSWoUx/epMEo/9AVPxbRa9gT2NuLX?=
 =?us-ascii?Q?jWwdOvkWf3t5gEFP0UJiDFj7YFKAsRP1zkXnDkGqmbcomFh0cDdrRrmkCkpx?=
 =?us-ascii?Q?OEEg7MXKjPWk1C+iNSDZy4OFTul1bcE06MAB+o11Edo2oMo2s10vY7my+ugc?=
 =?us-ascii?Q?PQzUGAdLODpmzP6NzOD4ToHLzMBwIfqZuAfwBspuZwSTNgJHWiSkCDwODc2R?=
 =?us-ascii?Q?aP+3UpZR37cfhiKKCVR4ngBWfTRmeIN7QK7FX0d6DKawF0CMZb70NehSjJCZ?=
 =?us-ascii?Q?eUiG+cCS/DBwznRajLSsA8EQiK08KzuaPbOGF94YTuTcVVYueEWRAHeVkRR7?=
 =?us-ascii?Q?kzabkiUiclHNjOWJ/9e9BDp2KZ2lpHp9g7u+gQohlha7tF1JXyY3E5NqneXq?=
 =?us-ascii?Q?tHbZFQAqtyIVF1WqcylowR3yqeRR2Le4L8/GdVVjbvlm+tRbnK1OAkkwPcoF?=
 =?us-ascii?Q?5PwyxLFjQq2+O25ITvStsmLhF+M3lvSeg66FimXKXshMvNEzy/kXr36mdAnv?=
 =?us-ascii?Q?CMRwM06ng2BNPOHh2DRKipkfRYTa3y/ddG4kivqUBvmXJ8SKU32r/mCqUmHu?=
 =?us-ascii?Q?nXViDMv7M5UiNZAvSN5RQEGzQ9BUGAzSETzmFTljYJgD/FH60927x0c3+RLz?=
 =?us-ascii?Q?YiaDW/8cePehNzcdFhRxZSpWrozKaGZQUHXx0rsSkFV7tJ2420fgFvEPyhs8?=
 =?us-ascii?Q?mRgRUFoJJaxyt+ktiFQZiSZHa+LaUMKgx6HnfncywiUzhwQtmUFYZEVn2v04?=
 =?us-ascii?Q?Wwjw1AuQzR/+8oVXTRyHJgKGlsnyhk252EtI+WehtJ0ZfIMxblkDJSIVgl/Z?=
 =?us-ascii?Q?UcBszLH066SL2F86dG2oXB9PhQhm3wtNQofLUiJ2nLXT/50qHCHGHOjHnnKc?=
 =?us-ascii?Q?soJTX4s1Nmwm7gGrEOag71aVXiU6DN9ncoINT4aZw1v0M3RJpyY/TAKQoxlU?=
 =?us-ascii?Q?PpAN95tZp8rUFtq8DTsHojOqDf+t7BDjz7TwbDM8XvH4MKftT6qDS5RvlLxa?=
 =?us-ascii?Q?cDh/rbfjpVhEUcgZxVRn9zIWu+DxlUOjDQcBJPLb+nMSWrZhw6C6JkYy9hVS?=
 =?us-ascii?Q?EJYoMXbIGUnsKQNUuBbuYvW5x6ZlOkUoTQBq52cHSsU5AR9yeEODTR9NJ96M?=
 =?us-ascii?Q?D6hn1QeQ+ixppgIGC6KX7ic2GOG46PJaDXOLIcY+QjBdk5xZAY7spTSVKre+?=
 =?us-ascii?Q?BNRf9KHN3hEwYkC8BHm6+06sKXEWwp3LhJrMe/23c8g3jH2exqGJ+zix99t1?=
 =?us-ascii?Q?1+kFr7QW19VPeF0bL4vgBHNo8siNrN02e3kKsqXTixdgfbhAFcdcizYtVg10?=
 =?us-ascii?Q?dg3ArBNzig5gRm+8C5REvn5TdsBeqPoZ7I66jthWbAZqpI3GLcB/m1/G3e2k?=
 =?us-ascii?Q?P+GOq9U8JYuYBa6fte2JrIBZH4y97S0cQGhAXjBwhPDzz+NjZrQ2Ic1Deqxg?=
 =?us-ascii?Q?Xv0bOBQkJk/tsiizCySGjm5zNbM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dddeb319-80ec-45ea-f50a-08d9d05a4fa6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 14:47:35.7861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1j6iX3gcUzpLtHZcBTjYpnz/WqMZMKYMw+zhL3N2BJNDJRteNbTTNGdcWYxqgmb5ANpcz57kgnqhTDNfiW8C46S+YSCUJaZI1KPPyBVn5/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5667
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10217 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=874 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201050098
X-Proofpoint-ORIG-GUID: PBB5hsdsITESeD1W5FIqLrYzFyLwAfeo
X-Proofpoint-GUID: PBB5hsdsITESeD1W5FIqLrYzFyLwAfeo

On Wed, Dec 22, 2021 at 08:51:14PM +0200, Ismayil Mirzali wrote:
> @@ -247,6 +246,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  						if (pxmitbuf->len > 0 &&
>  						    pxmitbuf->priv_data) {
>  							struct xmit_frame *pframe;
> +
>  							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
>  							pframe->agg_num = k;
>  							pxmitbuf->agg_num = k;
> @@ -333,6 +333,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  		if (pxmitbuf) {
>  			if (pxmitbuf->len > 0) {
>  				struct xmit_frame *pframe;
> +
>  				pframe = (struct xmit_frame *)pxmitbuf->priv_data;

Separate patches.

> @@ -428,10 +427,9 @@ int rtl8723bs_xmit_thread(void *context)
>  
>  	do {
>  		ret = rtl8723bs_xmit_handler(padapter);
> -		if (signal_pending(current)) {
> +		if (signal_pending(current))
>  			flush_signals(current);
> -		}
> -	} while (_SUCCESS == ret);
> +	} while (ret == _SUCCESS);

Separate patch.

>  
>  	complete(&pxmitpriv->SdioXmitTerminate);

regards,
dan carpenter
