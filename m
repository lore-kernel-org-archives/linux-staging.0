Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5FBA45
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 08:56:43 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J6kYBw014744;
	Mon, 19 Sep 2022 08:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=42kya1YOxYg6LZmIFBc/lXrkFrki38S118e94bKteyo=;
 b=lCagcXqkk7bF8+OWXGwwIL4bCCaAFUN/US06aO49Gi2iI9m2HwQVrvxxoJnkrBvBE4Ox
 wIafS3jcYPqivRz9V68Mj3uvOO5LcFADxboltPaKMZCVvIDWWitSthCKOtuoLj74Gwb6
 8+M3H8gJmx2MqhrdRjsXB4LF4cpqtdhzUDMGGp/fgVjJLE+pcp0q1Pzz6PK9/VZkEYfa
 sxEM+VvkFA5InHB6+3yPMPFfiBMvDxHKfGAb5vqF6uMiaR/9D+e1vAt7fkKIBbAB+vf9
 ptLabtrpUH63oEXWpAAay1YCcWwmcn239DWo2Bzx8c0lTJsFju0Pcv3OF46MS5ToIbHD JA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn68m35p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 08:56:42 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28J8BrjC010011;
	Mon, 19 Sep 2022 08:56:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jp39ntpxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 08:56:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKh7oNOyyElYfYykmeNFs6udPlpWR+/qRaeIEvbyfOmXlGkn4S8d7dXQkJurpJ55UqZyxkqtlxIVdFtbcLusRoFR1IQSdEmRSBbIYA4luu2xRMep2Zfz9jG7o1kahD2dRlnjJAmDfPkPO6d2Ejf2/XS6Xn3ygKww1fMwIDep675T4H9MSHG4UZfWqXzowJwCdf9LYu/QGtLUEH4uuIitTYziPxa3w99BBUVODj4rd1s7MHIdA0CCR20ey46i6f9ShdFKUlXJxbbYR9VUq6hn8XM3mK4kqRbonMFO4BUfgyBNq1LcVVlHMz3tBg6qEaL1nFCS1SBgJrcy9sY3zpK01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42kya1YOxYg6LZmIFBc/lXrkFrki38S118e94bKteyo=;
 b=Si6ybpTZB0kmlZJl9EiTORMRJzkFwiJrQlcUOknIwK0j0/+sD6BXwK2iaH1H4zaHqzAeFpLTFESX/CYGN5WHBlS3/TFS2uoqmBn0ullmsRRYJHQf00TrzljbshGXWMe15Li4FEWW5aTTNGVu7jAliTDNpSzzwBfTt/OdIQ8uTK4zVBA8itApkQCIztzaHrNdlPcI7m55wMfJ6MTG3beiiOFN2vGYX0JzRkKl3KLidq/i/WY3x7S4MhCezqDPM4UHqzq/wsn6/KHJnfFjvRDpWhtcURbZY4H3KtpiZ3JICV9Mw1nq+I9Eh75zC2/iH/NOEnMd+988K5AO6WmyjRY0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42kya1YOxYg6LZmIFBc/lXrkFrki38S118e94bKteyo=;
 b=Il6JqyBxGJmQFs7Y71DhFXmbRPWU/wpMPWIFdw2+vq2HQlqygozdZgtLep65n/WnDCkn19OyWwqEIlM0FPZHGpmyeLNgvU1ar2/tTFc3lThhaZVOzeykRefrSps6ZbO3WXyU4GiFDm2cglVtqcLA+6gHEQoURERk0JyV7HIcJ3Y=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB4989.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 08:56:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 08:56:39 +0000
Date: Mon, 19 Sep 2022 11:56:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joash Naidoo <joash.n09@gmail.com>
Cc: larry.finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
        gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: fix too many leading tabs
Message-ID: <YygurgpNWf5zqDAQ@kadam>
References: <20220918050728.3746-1-joash.n09@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220918050728.3746-1-joash.n09@gmail.com>
X-ClientProxiedBy: MR2P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::30) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|DS7PR10MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f217cf-9aab-405c-ec32-08da9a1cdd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zR/PBibLio6sKjEcSPPQgqeczmJ6KFskgdbWjOmenUXEY36FPr9KI5PHyHgDJYsdyRZNagKtpbpnOsnoWH8GD4l/H0i4Q6W1N23rdKcGJSP+LaE+/xrQEKU8vQ+53qXZO1nbHgktpCSptC0H6QbvQkgiKHA23Zp2Q4dNPLwrxJ+UT3VsF4GBMw3HOdalgXtGDTNFye95XdLIEFlUQT2XxTKdjUpAQW+3AG6ALEzUWsYxo0BMH5ueWrvP+6YoEulLcyl+LI6+4vvYrFYxUMhV1/iKJBDGSU/iSnvKmi22VYVFqISOk1htxfBOOp53UpYX1xsEhvY/Wd7MN2KSe0DWYh0xrhBfgX6U9T5BO61eWuUsOFQrrpr2J5Dlh0SuDLfd2qsxN8Eduvx98iHI4hH7LDp7iSBX49xkGDA/6q5aBgJ2cc9oXl/Dmf4ZTbUHKA8eAKgX2Wxrlw6v0Pe/YY/T+2DJvEVC2308wr1wuprfCCtO+ijiB51cOPzpGAmypICKiHBt0Kiyhef4LfaSydh4Rjo/tOJzxkxjZaHhc9dh8COpmHhhsLiV3vJlE1aj/Hfm7iDC5LjTwtVmXxpuEiTI0uGGk6Eq2uKCfy32UYtxSVwhoOnfansI7ku4tD7qdT3I/YV3BWTNlnwb5J1NcrHv999KIZiZCGYaZZB/a6vbPwTuNxZk/0uZLCNmDcc7qU1b7U17IzL6RD8bHgMxQVYztw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(5660300002)(44832011)(83380400001)(26005)(6512007)(33716001)(2906002)(316002)(6916009)(478600001)(6486002)(38100700002)(41300700001)(9686003)(186003)(8936002)(86362001)(66556008)(6666004)(66946007)(66476007)(8676002)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wCcA6hae3zASgpdDNZFq9XhuW7vxPlStxE7gm+Z4yDZnReGi3b+4vRT9psn6?=
 =?us-ascii?Q?hExlSlGDnemhf8ijKg9Nwcnz/bF6d7wPMOowouY0GFbCmRMc1e0eXhba8LXK?=
 =?us-ascii?Q?wFJ6ZP5omYkd81yXSWVyEr+v2Rei15agHDctk1SL4ps4K4v9mCY2GiuIFoSw?=
 =?us-ascii?Q?sLkOvRkmSDpKxwcfePBCgYHecaViQ4TnL5EfubdzWoL1+fp6Gqx6DYTrc9Ea?=
 =?us-ascii?Q?7IoED7bju9W5mswkqy3YHOGvrZqky07XrAwWqy6h4TqJ2AOicFcwwq0AXz2C?=
 =?us-ascii?Q?vIlpIKifbDCYaL7yw0Vjjf6+Nk5eThPz49Rp1Kow/k2GOvrF072Bjc5gO7HA?=
 =?us-ascii?Q?OVtOuXmoRbt89CwEspSxxZJtSvFYv9bt78MNV5A/SCUe6CPy4jhAmzdH4ess?=
 =?us-ascii?Q?qxxxuOGZE7r8b7pfNHvAAUyccjCKNiJxEeFpV/8Ynek/newdbTcZPQhXrMvT?=
 =?us-ascii?Q?Tml3BjGUINhn4c5X/juSaUzR4LBXx5/jIyi1xB+ly3uvlrOirP9pfuPTnxyw?=
 =?us-ascii?Q?Qjs5LTnksN2KjmDKI02a3Htx7Zqz1Oct3A9CLclchyvVZ+DPbmU7oAtlFuNx?=
 =?us-ascii?Q?kGbPgY4LV3v/E9ietBk2txCcUtX0U6rG3P3lgWv57GQlKJiP0sf2cKJQPEXv?=
 =?us-ascii?Q?zB4Vxlr4P0R47mo4Y2ACPG93fzNr9MQ8Yt28rnpInQMH/KYRJnq6KF649u09?=
 =?us-ascii?Q?nbjCeaI3MQc7vfPjwMgw7RNKFNWrTHoK2ULXe+75vYyxBd9gjszP5MT0Vr+Y?=
 =?us-ascii?Q?vODhGZMNHXg/sFHvpyszHtzf6zRLNUxH1uosrFRykdadN9vhfYgSJeBE2ASU?=
 =?us-ascii?Q?fg2O1xJEVNsI3eMqVWa0tO8+LZdk5RJpHxs3TySVvJK/HwCPysL/6v7GtEC2?=
 =?us-ascii?Q?RXuL+dLIkC9TDfUNbiDr28PKj71LCr07DCkIMrW2Mgt9slJS0jmoD6b9Bk9L?=
 =?us-ascii?Q?bwtO/UatWKrZaYm1OfR5rgV6psbeN8x8XgBwM3/+vLq3xFlLCUCKucu5G9bI?=
 =?us-ascii?Q?/1m4HaoDchxgWjI8hMoQHP7p7r6XsToYX9X384usUwZ/Uds2YbZo4VHzfMqm?=
 =?us-ascii?Q?ZFpoYgOFt7m2M4/BULnqz0v+kD2KFGIwdaAGTaHAUhHFTTvE3zexMA54FTSK?=
 =?us-ascii?Q?EHrT/R401oJZFm9Y9urBxUd7q167Sx7JRYgTztPaGuBNIAOOak9lDpHX90/O?=
 =?us-ascii?Q?WCzOY+RpSOFkjMfiKLmZRVxLkf0CgXbHsEfneQ7s8AiU9xF30+RbPTQO+9Po?=
 =?us-ascii?Q?SiUfyOWuhPqDUUhgCbw7m/LWH7OTbUT6J6tuzjIUSYNPzEiavKSlghoxzMtR?=
 =?us-ascii?Q?nvrkxv5AL1sN2PmSbPRKpDSn2B4fGg/EFvv5dS/QtPM3mQu949IgNYjpkEMc?=
 =?us-ascii?Q?uLACO2ytFSWNxjQKBVOy/C8cliKVs0LrzuTixAZ0xlrz9Q/TziGLPpCfAXL9?=
 =?us-ascii?Q?vTETJnw3ckylavzOH6yONDRtTPOfbXl1b79DcVxWBryZEtktohfSQzFk5mnw?=
 =?us-ascii?Q?N0xzjlxS03q7nmBX1RnYSa6KI2Tnq/NphGBdXya2NonVF+g0OQs4MCvtM9Bt?=
 =?us-ascii?Q?m9X9EPyRqQP2XZQDvlnakx7suApvHdzpFUGVBdegct3vZa8wgN8GFdXOXbXz?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f217cf-9aab-405c-ec32-08da9a1cdd5f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 08:56:39.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZiOd6sPqpbe1TVqv37NHO/OcDRIx9q2IMNNjoOPu2rP0VCsiQLoLc9nwgFmbr77TLJ6TkBvzoAloIqA8yYe2Y0fQK8NYup4vEwgm9h7Sqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_04,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190059
X-Proofpoint-ORIG-GUID: q5jf7uTqwT4qXf_DbLs2_61Zv0FUzkAV
X-Proofpoint-GUID: q5jf7uTqwT4qXf_DbLs2_61Zv0FUzkAV

On Sun, Sep 18, 2022 at 07:07:28AM +0200, Joash Naidoo wrote:
> Coding style fix. Fix too many leading tabs and line length. Convert
> __constant_htons to htons
> 

Convert the __constant_htons to htons in a separate patch from reversing
the if statements.

> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 66 ++++++++++++-----------
>  1 file changed, 35 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index bca20fe5c..8e951fc0e 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -604,37 +604,41 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
>  	if (!skb)
>  		return;
>  
> -	if (!priv->ethBrExtInfo.dhcp_bcst_disable) {
> -		__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
> -
> -		if (protocol == __constant_htons(ETH_P_IP)) { /*  IP */
> -			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> -
> -			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
> -				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> -
> -				if ((udph->source == __constant_htons(CLIENT_PORT)) &&
> -				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
> -					struct dhcpMessage *dhcph =
> -						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> -
> -					if (cookie == DHCP_MAGIC) { /*  match magic word */
> -						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> -							/*  if not broadcast */
> -							register int sum = 0;
> -
> -							/*  or BROADCAST flag */
> -							dhcph->flags |= htons(BROADCAST_FLAG);
> -							/*  recalculate checksum */
> -							sum = ~(udph->check) & 0xffff;
> -							sum += be16_to_cpu(dhcph->flags);
> -							while (sum >> 16)
> -								sum = (sum & 0xffff) + (sum >> 16);
> -							udph->check = ~sum;
> -						}
> -					}
> -				}
> +	if (priv->ethBrExtInfo.dhcp_bcst_disable)
> +		return;
> +
> +	__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
> +
> +	if (protocol != htons(ETH_P_IP)) /*  IP */
> +		return;
> +
> +	struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> +
> +	if (iph->protocol != IPPROTO_UDP) /*  UDP */
> +		return;
> +
> +	struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> +
> +	if ((udph->source == htons(CLIENT_PORT)) &&
> +	    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */

Flip this condition around as well.  The anti-pattern here is "Don't
reverse the last if statement."

	/* DHCP request */
	if ((udph->source != __constant_htons(CLIENT_PORT)) ||
	    (udph->dest != __constant_htons(SERVER_PORT)))
		return;

> +		struct dhcpMessage *dhcph =
> +			(struct dhcpMessage *)((size_t)udph +
> +						   sizeof(struct udphdr));
> +		u32 cookie = be32_to_cpu((__be32)dhcph->cookie);

You'll have to move these declarations up the to start of the function
which is fine.

> +
> +		if (cookie == DHCP_MAGIC) { /*  match magic word */

Flip this as well.

	if (cookie != DHCP_MAGIC)
		return;

regards,
dan carpenter

