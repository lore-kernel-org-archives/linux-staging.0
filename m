Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26682C80
	for <linux-staging@lists.linux.dev>; Thu,  6 Jan 2022 08:36:36 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2067Xskl020260;
	Thu, 6 Jan 2022 08:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=RZVrIkfatjqCf62GlWArKMD/FrSavotV7zBOfJWhxHI=;
 b=GDVganlczyo/uxnWg/UTNyH+MQq4EbNGFW8+MCvbCFF1pT/msfQ53M8fa8X3h7B3wKR/
 J26nOELKxxFhmfoOEezxtjWutbFFZ29bF/5TuxOKfdd9vkx2uvaVD2iyuZ81qGRyKMql
 rUshAQhWDbDU90UaxKA4eE655XYHqTSBhVmYGqPgh9gV6K+FYsydEw7bX3g7Skd/Y6Cf
 ig75HmC3kWfl7tmo3B3sWt4ujdSsxBfc3r3o7rXNWj3VKyrYLTOUqya0I4KACVpm8Sok
 5CCkyqDJr6YVMJDS5vqLn5fn/P5M1mo5bo/dE111M2uzrlgZwBt/rru4h7FyFhXPM7ZN mg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3ddmpdh419-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jan 2022 08:36:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2068ZLbB078447;
	Thu, 6 Jan 2022 08:36:27 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by userp3020.oracle.com with ESMTP id 3ddmq6c61y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jan 2022 08:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLTO9IC/rKV31pVMrYVHDT9WaHhqC3yyxEPsdg1oQpMsXEeTLIRMfJ4qEU1wXZDgo+XVC7GIH8R+i569l3g7ZsmQVfKiJNRSe3Ej+g+JW7ypIoHaYVckDlgPsKyBxmv0kF6Zb/jMyyX2xeKY06g3SwtZxSvaf8wl6vuQR6v1KX/Yy3ZHX1pMJsioyUJUiFEFJl8+h7Mb9RmgOHkd7WoO1M1BzI4qhu0WOLHddT7EIIXw6JTxb9pMSpf6I4x+BS8NtX+BzCpgH8arWzNx9/FQNOcawn6QfoD6JW9vHEibKtlFV2jvcwjPE4d+83ma2/XZ5b6NvcFVcQWjJIQpCKWuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZVrIkfatjqCf62GlWArKMD/FrSavotV7zBOfJWhxHI=;
 b=fAuiLMICrKjuW9bccUjn+Hpk+Hy9JI6fdp9a08W/0W+G4y/dLHKJev5KJT3y6GcJ8VNA9uglHP9YJo5lt1//3mw/L2tho6W/gHcqoANwUtj3chE635Ot+hIl3XXaTNPH5RXcqPHR28144V1uDrDtvajaHJKq9wzZsceImvqCHvKIwOAIWJCgY0aHEkUud48l/uYC7zMnsddUOVPLw9pb9LrrkOni1LQqRQXjovl7zCTGGqsm95ulQi/q8TibyeYQiZ2TO40Ehl9eiw4KCOly0lIhCjTrKkiwTWemUcRbYEwZtuzlaCCJOUIwjocsUkTiLGGcb4Bkc3F9wD2bKO2xyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZVrIkfatjqCf62GlWArKMD/FrSavotV7zBOfJWhxHI=;
 b=hT6WVqhmL4hsG+3zgKUGP/QIrOSDQ+UM0qY4/aXGEI0nOBpqHrHeu4y90mn5W+sZgd5rowvFP2kAphEwgNs/TMsFmkOLQfTEjm5WPzHfxBAwv8o52BTFIH0AtAh+CY1pRVceH0oDlNl8C2+Ycou2smsh2z7t85X2l0bPs5ow6HQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4578.namprd10.prod.outlook.com
 (2603:10b6:303:9e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Thu, 6 Jan
 2022 08:36:25 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 08:36:25 +0000
Date: Thu, 6 Jan 2022 11:35:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Adam Kandur <sys.arch.adam@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] qlge: refactor qlge_change_rx_buffers() in qlge_main.c
Message-ID: <20220106083557.GI7674@kadam>
References: <20211228135756.7343-1-sys.arch.adam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228135756.7343-1-sys.arch.adam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::27)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f3e186b-a18e-48c7-872b-08d9d0ef9fd9
X-MS-TrafficTypeDiagnostic: CO1PR10MB4578:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB457897EF567C6F497CA2187E8E4C9@CO1PR10MB4578.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6CBNc67sMft5Sh1n+KgsCKZLU/zMqTVxyVQtk9yd/AMs+WxNbdRmg5uAF/bm3a71HfuC1jsvcNPwzyaLSQ6s+yapROsjPgK2UqXgXJx+dn0mjjwX2EcaqQ9m8zxkMJFCA6vRFGvxWcDNqU372H72Baqt3uPKW6/Os+seX1Z2+Alf7QB0hxJNFbRuyRJxIX0ffwvAep9zGoZfoekQoZSga3kXy6R+DDtqmwQwXht+dcI8TvWKo/nw0EUigXzKjdzOLKAPxbgk0wtRYXSjFBS8vSSAwx/H4CztdVgbKIp2AbQfC0CIOEfqLgJf8+T+pvEwmPcOj/xFBPZocQ5MLvl1mukfM+RfiDLnx11pZNcWFeDJABIMUuizM8RUqkXwtpRSR52L7g1K+Uc23vxTmHnoaF8sPZZWcDd1/FajHQf64yJS6BiSG0G1KEGtBhRivFswKQSiN+ntbQfuCWy/YD6kj7XyG+rcU1s7kirrEdw6j10vDn1yx/1wwV1WTJ4rs6WHz5FnESfISrvpYZL7JIWCC8gY+/oKa9fJ+/rwXt0XI3W696wPHxeISAxx0tAGQhJ3M1VbtZh/8pdiP5ro91YdSoFUgUTuloNPxuICOj9Sp4Kd72bp5HokIQTYK8XvizI9qzR96nrOx+l9xKGWJJrEZ0Eaubdh6f1faEP7OToOBMB2TSMz/83Ksv9w0aNHBiWLAIDQ6D8gzkJQR/9pqeZNww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(52116002)(6666004)(6916009)(38350700002)(38100700002)(44832011)(8676002)(6506007)(33716001)(86362001)(66476007)(66556008)(508600001)(9686003)(66946007)(6512007)(6486002)(4326008)(2906002)(26005)(186003)(33656002)(8936002)(1076003)(316002)(4744005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q537tYwIGBKsv3RMEqzoKVL4EDpjFU8ppJJz+gAokJu/FKHrIpEsUbpyGVMX?=
 =?us-ascii?Q?wmg19LnLSdXC4Fgq2HgarJvkULA4bfiUlNkP3u4s3cf5D9yzITLodrxn9l//?=
 =?us-ascii?Q?2gD2WiD0dULcTAGqPaMZ9zZEFAbwZUtHVLrX9yjRAx/UX2X9K202rUxPv8Y6?=
 =?us-ascii?Q?3X6ndr7pXVa4jTHWVeSeN0govTS9peHRtJ9SQ2R6OZVDN7Lq4zLDfw8m8nMN?=
 =?us-ascii?Q?HuAxHiblw3pkvE3TK8SACUGcbgtIQjq7EHpUJcZU2J/6mLQsxVShEOqT9Xe4?=
 =?us-ascii?Q?n8OtYqB/kJtqcHIJtd+z+tCkMM1jpzEvE7rfF7zsNVACMXVC3S8m69gv4NgF?=
 =?us-ascii?Q?n2BEiYQHfew4kJJ4UuR0E9i2d6IklAvhupyZXis02Wg5wIo0xQ7hkhMfuSK2?=
 =?us-ascii?Q?PBj1J69FSbX5LGXbvb7dSRJD6X4izYEqSl+YNNwiCgysotHPQ3qigNjSochw?=
 =?us-ascii?Q?D2QRxkzNVF3I7Nq/jnMaRuHZ1PEZWiWpW+2Tz6TnXORLpIbkyb4ldgW6qGU7?=
 =?us-ascii?Q?NFwA2gshYllVdhXDBxaWLDzj0gG2UPetFYnhdeFfg6wz2MHop1LRDwoPpqXA?=
 =?us-ascii?Q?jMcGYsrr3OBJnz44vT9lIwsS7tYllZ7Rdou9eXL5bTeR4DBD0zAR+EBKpUf1?=
 =?us-ascii?Q?ivTqOFoFssHeb+gz8sfXMzH45vf7fo1ySTTJG5QmxoR73dk+Ob2cdUl8lMjs?=
 =?us-ascii?Q?QYxitkiW6N62VTt29i0xD6KJORgS77GWxqEqAKgC+5W3Fu2rnXibbKAvqMn1?=
 =?us-ascii?Q?dLkem7nuHgGxDRMV4yOEi3q5AetD7qMb7FhD+sWTTeuf9Q74FDL1NDLdZQFN?=
 =?us-ascii?Q?CFCPcxJMugM0Q1gXPT76FXYaNTmGifX/6PHyWwHQ0chEi1U9M+rT3dDHi9/K?=
 =?us-ascii?Q?ZXbj0oUn9wAqtfBJg9o7bpwEXORDy6AS7uBvmFahf1GJ+zHwcf0TBxHXoar8?=
 =?us-ascii?Q?oA+LsAh9l2xpBNO7qREthLWY5JK1hHkfBBNnqexhIdFpIa3IA6ljmp4LEq0a?=
 =?us-ascii?Q?gLVitlUEgZO1QUtMDklYOs3xIujWBrckpWJE5yURpPCXisU9P2Eik0kkzBh4?=
 =?us-ascii?Q?XYt48lATUq12KNmmgNuUF3nj0ENKJ4MuKEdCOQlGhJvVOeIZRs3FwgdXa/PB?=
 =?us-ascii?Q?FT6psdw1tnX5V3s/1m6OkFXe+OM4H7/T0nG4JwL/Zb40qa+T7rZ72YTuHgIo?=
 =?us-ascii?Q?cVQVegBLHG0Fyamj+eSeLrF88urZObNjs9ep8IG/yoJuE8aaHxUhDkfzvIrp?=
 =?us-ascii?Q?Ftdg5mhZzm16N5iWNnT8XRtV0mOmI4mriahDZbPvyNouOG+61X8Yq2J703+b?=
 =?us-ascii?Q?8uNafvWGhpzUmoQHeBPimDrY3nFzn/egl02JuYYYAbg5SZp4QM+tezK4saEm?=
 =?us-ascii?Q?EM4setnMD52iV0E5rOnuK/7AZ35gZ+ggds5FV6NDsAnn0WYiZnyfrIg76XTd?=
 =?us-ascii?Q?VWZxMQiHrNqS/wZaRFdmwcL43c9erOiep7Xv8W8Ba18tW2jjt8BdqaGh787/?=
 =?us-ascii?Q?4WHmgBWv5GhOYXxIus5XEiiMlkwY4Dtz1Popbc7Om+VzQg4y8q1H+aHq/tiu?=
 =?us-ascii?Q?j6qcnz+EHlOJv9Q844i1M2rzzDUirJ2nsw5u4lLwBd5DzAbxyZN/6Yye9SO9?=
 =?us-ascii?Q?w7MitD/gANwXlHghOSBohRjYhv4W4UE83xfts95braNFOgVLVlwiGZmAC622?=
 =?us-ascii?Q?ZROTPpy5Ts6GauEdH+WpdiTdHGs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3e186b-a18e-48c7-872b-08d9d0ef9fd9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 08:36:25.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmXC+w0qb/4o7SfxmczQ/tD2r+uc6ZRTJzizOlegz4u7AX+YA+YCDJHjaq0/GzJzoVRywhzJkYRX/xDSA3dwl4yDrMCw4vtbXCLjCRVSmT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4578
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10218 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=894 phishscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2112160000
 definitions=main-2201060060
X-Proofpoint-ORIG-GUID: WTRIRGvljIWNPzesEinS5JycZt8xs_dm
X-Proofpoint-GUID: WTRIRGvljIWNPzesEinS5JycZt8xs_dm

On Tue, Dec 28, 2021 at 04:57:56PM +0300, Adam Kandur wrote:
> I assume this can be written using for loop instead of while,
> wich looks nicer for me.

The original code was better than your code.

Also we have a published style guidelines.  We don't really encourage
people to start enforcing their own weird style preferences which are
not in the style guidelines.  Once you are a maintainer then no one can
stop you from having opinions but until then it's best to stick to the
style guideline.

regards,
dan carpenter

