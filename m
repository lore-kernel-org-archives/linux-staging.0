Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9044A1F
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 12:09:24 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JBxDkE032757;
	Mon, 19 Sep 2022 12:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=jzEPoq0AGachp6k2O5BHGUw/YAA+dLC/1UaPtUgjguo=;
 b=AOpUGeUWl6CEb4QKKX1Nw/KQr30vRla8PSzWUIAgv5spSg8PcXhUZiZnwJpUbIq0zrlE
 uk7yj6TmqHxIrg2E5mRRtXwJzYL4qk46rxWEl1thCyacNnHnPag+vqeWgTSMAClSg0jj
 vaAVetFX87d+PHmrCBf5+6K9x8Z1ugV+t6OH1pGc0an+CW2c9XdJfeXsoKLBqot8xdHj
 hC6+wfXP0sN8GTvfza5oNT4LeVeeWFHwaBej/Ha2wHS9tpKOHHRhqnrjrar/wPROkwYi
 /6VqBjxAT18R051C2efPCSxghiCTCcHchvNhMiFskpAEA4xkuqFFxqAhtJkj2VWBv1lC cg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn6f0bjbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 12:09:22 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28JB9acu009921;
	Mon, 19 Sep 2022 12:09:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jp39p2hv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 12:09:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS0R0y8OECmhNBo8d/dJiVp9nVx4/GZ6Zu1UDRdnMSDyZCloVXJ1yzzxcUNGsgSyTDmCjPPiucZ33OeKFcfIa8oGTsybpMEgx7AKQowufiWjh7ZKmV1Djcqll4oJLdOWsERcLbhT4ioZOi6UdjmTeQFTLzUnsR+UImcn0hDOukMr60j87wbMHzvEJRV2htKCfz37E5RFOW1Ak8gHdGiZF0oM87vPzodv5QxYGY2fM7fdxsrpbnpft6sncghn+QIkDD/mu/7r5zj63Uf5VsuD3VXu7zVRsccXgN7RJjAFFeLFWuzT+lgdFdgvKAslFa5x9gUqTYTWvZCOHZx7/clglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzEPoq0AGachp6k2O5BHGUw/YAA+dLC/1UaPtUgjguo=;
 b=BsFwJPXGVs/Bx+b0xHtl8ezT2G97MHIRkj+oR1yFDflwQDYQv1Cb8P/lSdDGFNVdtwduubqpVGkOeKGUhVc2lwERe/AwXtXGqqmvcARsUPonQ2KK3ICwyApbLHujBQNnsmqQioWe0fMXiyvWxaA896wAfSoYVlQp8ipLvWe25DaIKE/6B5+sgIM9ZVQCUTYrBGdBqYT1fXRe9reu3lXwfW0yT03vIi+VWgdil/Jh3AsicJtlckYhIYWfmuJNcgzX4gXWRTk/4ADYunfi/6Jw5z1zb0SHztPmVU2YHW6NOsaIBRlOUtXJlRNYdhCua9AuNG8lmxn+0Hjk2NrIQ66ifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzEPoq0AGachp6k2O5BHGUw/YAA+dLC/1UaPtUgjguo=;
 b=EBGgBpEsscE1CbbuEt1NNsvoQt9JvlxhaLMfX+7AsMBR3GEzLs7aDZW1vHbcpkk5XBGIq1z71u5tbZFBEfhM71Epeq6p99bhfMERMlm8SbmuRCxJyZhPHqwrTaPLkJomWOBf2vFTf+AR4pGHiKxy2wrdXMcWOUbzViWu6Um1TYQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB4876.namprd10.prod.outlook.com
 (2603:10b6:610:c9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 12:09:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 12:09:18 +0000
Date: Mon, 19 Sep 2022 15:08:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joash Naidoo <joash.n09@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
        gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: r8188eu: fix too many leading tabs
Message-ID: <Yyhb0MO5/bcBSvnu@kadam>
References: <20220919115111.2421-1-joash.n09@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919115111.2421-1-joash.n09@gmail.com>
X-ClientProxiedBy: JN2P275CA0041.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::29)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CH0PR10MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 40fd1638-193c-4b0b-aaee-08da9a37c725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9UZ82Oy16uFnGK20tFoViH+jCqri08NkYQ53EXgryrETsEZuN/3qd4pC7HXAyEdTyxO5ksi2Ycs0z8hFFepuN7tiU9B3ALR20MgtJG/TDq83Mm/uuRZfmMhbESOvvclLkBYvzEKlFLQysSYbVGvqFCnlRQWmtxGHplHWKZLvcTO9LkmxvnVSuqqp/eT9YD3d7s83x+Bjq8eJsTiASCIcRhCCp+4aVUjkwtEf9j9YRUHDbyWfn8MoDNdbGs87Md5Z8ttgDI4qXbWA3zjF0oHh5rhgk2HPLkjovZ81Ecvtz8y6JDozA5NSpXJNkiox76i8lkc925aKC1FJeM7Kfnz6ww8hw+pH0xJZi2jdhF03kbPAdsHlJpk5Fv1A9074fog/lNDSN8ak/CbsR1nYCJnFSRX8eNcMtmGAEYh8X/Rmd0Z0D8bqbe5Ch/ZzXKvogOywKs2sLpA5DUG6ZwPeHf4sQEbA8uzuy1K25ETh9MWLTUftsQAFDS92AVi9CWxlz7r/tA9RytUnewz9Zbjon9VmKm2SybWMfMf9o0IB0Ex+xWs+F68OjruKWMD/ei3xIpqoMuKIzq7/SBguN/++b+xV3jv7146ZbHtYKiNT9IBpLaKQY6gIzmsEKPq1d4hjxRa7W4uCdjou2iG7ToHOnWdyh/OIEa8Sfb5R16MpGVikoo34tVcUOa4426O7p3RbySYtM4ALhJaRCRbO+y+0DnLtyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(6506007)(9686003)(33716001)(186003)(2906002)(6512007)(26005)(86362001)(6486002)(316002)(6916009)(4326008)(41300700001)(8676002)(66946007)(66556008)(66476007)(478600001)(6666004)(8936002)(5660300002)(83380400001)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HNIePjuwQUmhRs62cSxLLkWrU8xwi6oz1ROGUlCirW7svMDuZpZzZ+mBQ3cG?=
 =?us-ascii?Q?AZCJd6Zm46eILc/hawZFdIPS9XHTHkA+QYCqr9VLSBfx7ibG6rwBaoQism67?=
 =?us-ascii?Q?5e6fjhw+hLzfhkkfRqrzCelGuYR/KtptiV8XukOd8LzIKqSp98OLuv7yVmwe?=
 =?us-ascii?Q?+iYNF4SCqryDDIVGhyFGL03/eEr1Onh1Z5oa8kcAoxbFIjpPgoaryTHfCsmv?=
 =?us-ascii?Q?ioKiyOB0HyzTyqqG539oSnUhHX3JWxYqQoWuecZykjMYjA0ac+i4fkuU+rYl?=
 =?us-ascii?Q?gbRcVuhS/WLQyHnhAknOMiek3P/9Uy7QkaXQBDExx9YmQY4QxU44Fyzv9sCK?=
 =?us-ascii?Q?717EKFTn1F9ELrE68tHahOBULhz/J2vwbH3F7Emu6W/0BIcTjTH+BZpI2/c8?=
 =?us-ascii?Q?t60Fs8F3o5pVsxQsSmkGmkPUQSUWGIWddKWonL7gcA/4a7lzA0zu3DsDnACt?=
 =?us-ascii?Q?CGeRgVUBqjbZYyi3ZZpOiigZlZu5adG4s0HuHX0v1vGCWHBtmBmig9QS+uua?=
 =?us-ascii?Q?SpeBW64UQDwh9VCldyJ723G5DkTiEN3NORg1S/DTSm476lQ/yTOCrz+6nx7H?=
 =?us-ascii?Q?udIFMIUUq3+khvzwT/fvk0BTfpM+l6TpMEHlRTw6wyvVSY3CcxqgEZshZS07?=
 =?us-ascii?Q?sf18B9trGA7JhV7seO5WPv93w/8Thw76NFdLoLz55BqUmi+la45Y1amjvFgF?=
 =?us-ascii?Q?7pvTs3oK3I2/B8K3HXmDo5yGDgK6yU0gY+yBuMDxhSdKbfhSOCmL1LBbTHvo?=
 =?us-ascii?Q?hmIRB56tX6iVWDgS61gZ8CVVxkuClSpb6a7HOdggPUlaQfAy1dsYda5oywjh?=
 =?us-ascii?Q?mXwSenSUmCEaoBVJsSQzh+P9G1dhzPeGYTq1vGI5EhdU/8guia9TJvVWCKHK?=
 =?us-ascii?Q?uK8aD7Q0spIU6ezIr3JkbzKwspJpJRZPsFaztU1nqMjOlCCuqjsXSM+Dw6ey?=
 =?us-ascii?Q?HuqJ47m8dNI8gEfgt26YSM7VnTQwvIlCIvY0Wu4kcfKHK8+pKlmm0mosWqFN?=
 =?us-ascii?Q?wKvl0/Y3lW4KKZZnc/buJNcE14TqdciHmuk/fDTYM1ZGyJYnVlrpmYbZeL1X?=
 =?us-ascii?Q?qkdIaXyX4QuWGJ/XWy49S1GJXE0SyMlDhSqy1Uclz7x4IFW2cB6xrniIGAdK?=
 =?us-ascii?Q?XNjTmCYnB0+nymjQoO+oDirrBUOpKud5vZYz+/Z2YM6A4dZO/cqzbZKWUfKF?=
 =?us-ascii?Q?Px2YP1q8J4dbf8qqZXArki7U4tU6WqfoK2Yk0t7fH2cfvFNPPLJCLWLe3/ep?=
 =?us-ascii?Q?ERZyrt8E3jxaHs/DuIn7ZhZ3KweHzoeNSA30y1f9yHxeSeggikmA+0Qi5nmS?=
 =?us-ascii?Q?2+ZPcKPesba+QFBxoNjic3zOheWYlZOcjzRnKTIcBapJS2Zsje8T29yFyAju?=
 =?us-ascii?Q?HXw1Izxjz7MMnC2iCGGmHvIP6Ae4LdBaBWflLNg6w1tyeiUJpm1wuKscth7X?=
 =?us-ascii?Q?2XO+3XfTIabCbT+ARD+cxubWm8wUNjcyC71fCWoQuyoCGWT+c+zPwbtk5ILD?=
 =?us-ascii?Q?9JrGK523qb9BhySgGX/TErEZEZoF+nq3EhhsUMOSeWC32I4HU0eXpxNKh50T?=
 =?us-ascii?Q?wGd0xh4T/b8JHMsDQ1Qf5IztfFJ5wolM/kmJI73Cn2LKa0PjcF3h1+QBzSTw?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fd1638-193c-4b0b-aaee-08da9a37c725
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 12:09:18.5578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6tLOt/IJPAJgWSq7YHE12w5+w2ryM8zjfXa5MrBtKEhA5jKLcGjgcRM3mj1dbO9ZT3Jpzq/9oQnH4DmruFUkjjsYbQftgyWEASVYWhoGkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4876
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190082
X-Proofpoint-GUID: YIGx5jiQshae5JAvGtrFTeR-Z2huI3nW
X-Proofpoint-ORIG-GUID: YIGx5jiQshae5JAvGtrFTeR-Z2huI3nW

On Mon, Sep 19, 2022 at 01:51:11PM +0200, Joash Naidoo wrote:
> Coding style fix. Fix too many leading tabs and line length.
> 
> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
> ---
> Changes in v2:
>     - Flip additional nested if conditions and don't reverse the last if statement
>     - Move declarations to start of function
>     - Separate converting __constant_htons to htons to another patch
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 69 ++++++++++++-----------
>  1 file changed, 36 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index bca20fe5c..2fec3bf39 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -601,42 +601,45 @@ struct dhcpMessage {
>  
>  void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
>  {
> +	__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
                                       ^^^^^^^^^
Dereferencing skb before it has been NULL checked.  Also do we really
know how large the skb is?  We seem to making a lot of assumptions...


> +	struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> +	struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> +	/*  DHCP request */
> +	struct dhcpMessage *dhcph =
> +		(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> +	u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> +
>  	if (!skb)
            ^^^^
Checked too late.

>  		return;
>  

[ snip ]

> +	if (iph->protocol != IPPROTO_UDP) /*  UDP */
> +		return;
> +
> +	if ((udph->source != __constant_htons(CLIENT_PORT)) &&
> +	    (udph->dest != __constant_htons(SERVER_PORT)))

The && needs to be changed to ||.

> +		return;
> +

regards,
dan carpenter
