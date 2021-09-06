Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADE3FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 07:57:44 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1864Baor032734;
	Mon, 6 Sep 2021 07:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=z/bfgXx0rsxrdOwz7Lwkqvu2uc7iMcgTZE71lOTQ+Jc=;
 b=ol42s4dO8OvYWr3y+JVick45cpnD3PCPn2+tGIkXWncAZ4+KSZ4/xH59P6quRUfh7Xpr
 eO+170q0Ytkrd8TsXf76HL58qYfJfMnVQ4UKStK6ks9T2G9fv36rqfj/z/M0xyQCtecz
 Kezvsc9sZ4xYUJvtGWSe4ZYU+tD95OpanIYgMidrDS7UEdvgTQro+G6GRsMGMHVQ1pum
 aN6wfHgwrvmwb8cU9tNfVDgIiQsDF45nCSByU1olzRH87Mea+4+UuNL9Hf/qy671s8kb
 t9D9vu+Re6rFCJFg9bmQX2ZcEAKWdCVjBgq+3VLaKGYI4a5AZfDdD+ijFWfjP8zCt1Om ZA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=z/bfgXx0rsxrdOwz7Lwkqvu2uc7iMcgTZE71lOTQ+Jc=;
 b=ci7T6Ry8ruKothEC1qSgzBYObFgaehhQ796T8jm5l/boof7B9Dc5ltjlsMBsGQPKs5fc
 +uZFd9E3JYqxqnKXySWstqp/umU0ck1nP2Q3VFgiUoL0SWCE3M6UIneLsgvcnILJibUx
 ktQGsgnXcRWp+N3RL/+jjK3hfIfrWjnd5TiaJtPQZYsvz79NIHODZJ8z8zI68f1Sb3qv
 eAMVN9IvboGNR7u5cqsW6ZRkasAw6COjbNx79k4bmYBEDlOl2dpKkg/7s9o3XMPlHQnB
 BPbPhC4/3UyBbuc4ic1W2NFlWRuRcTa5vGDYFHTs0+IpsTiakYMxi5yhIbk84nzUQaSE KQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3avxtq9jg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Sep 2021 07:57:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1867uAsu175210;
	Mon, 6 Sep 2021 07:57:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by userp3020.oracle.com with ESMTP id 3avqtc040f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Sep 2021 07:57:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORTUKDlNsny5yBZrmkgiWyxqv1BbRZwvhwrL25bsjvVyoaVJb2V0wyG5aA3+mTneCjo/J5VGHREGFpi+W5TgQWWqHH/OrGnuU8YJMrFQdFvTTWKv7qd5z6bvrl4By6F3bgzEJ1FNi7Bf7bRaRSzYozQ3JEPxOo7FA2/EHsg5So/moYkRGa/tznHZBflVZpU9COpSD3RkkVqFmb/tcjfDtCQU3XWysju2oswunpj0bqqHO/AmYOEKDPQkt+RKYHbnrHZu+xE3V0pC0ji2Xdmu2FWaXjs2NxThjrQUwOqfcC9SomZTQbNQkdQ3BD0zmUEqjp3SB7IFRu5Ji3sSVxRC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=z/bfgXx0rsxrdOwz7Lwkqvu2uc7iMcgTZE71lOTQ+Jc=;
 b=EkmZIoz54za8nNNg3BNZbepLAoL0nXg9HI5AeXKaM90HPwYqFoXwX/iFcLZDffjWaemrhTZ4ZU8ciGOO2Ntaz/VwyWL33kA75tmIQLZpmsJ0rS+qFzFkfXI1wkW6JYi9//PJQUgFxiE4kxFkZw59ToozJjscqJZiaEP/BykNez5DCymJMsdDP9ufkJe0kCbgAQtedWAYczQ9RFrr9enyQdIhpDylFSam/L8D/kU50+ke03RRBVZqaMZQ/u7/Ja/ZqtMID74n/LCA1IFxxu7QNMhbHwUcUjVhbXYOK6t05bq6ypLgkGJJz7qON2DRAJjnPiW/ejS/vULqCe28hh69nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/bfgXx0rsxrdOwz7Lwkqvu2uc7iMcgTZE71lOTQ+Jc=;
 b=KYtbU4CcHNABXGTPcFCzCbt/gVa50UB51pUw7yxGqWY9q/NNHy+9LG7pD/PoipSMS2gk5dGK4qe65c+qe2GfMIjZmNbzPU3xdDWnilk9JNzwxZo8Kg5NjH9UqBkXXa/n2h3Tsq02fi2dv0V0eD5UVWE03c1Njd8vBP8a1+GxT8g=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4642.namprd10.prod.outlook.com
 (2603:10b6:303:6f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 07:57:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 07:57:35 +0000
Date: Mon, 6 Sep 2021 10:57:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Krish Jain <krishjain02939@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] mt7621-dma: Properly format lines in "hsdma-mt7621.c"
 ending with an open parenthesis
Message-ID: <20210906075718.GI1957@kadam>
References: <20210905090201.GA283023@panther>
 <CAPGkw+yYqNtUQdVPmWVTd+WYHcfguMWJ+Dat2B=DvAeAaWetug@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGkw+yYqNtUQdVPmWVTd+WYHcfguMWJ+Dat2B=DvAeAaWetug@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: CT2P275CA0038.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:a::26) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kadam (41.210.143.41) by CT2P275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:100:a::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 07:57:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be55ede5-5d59-4120-7357-08d9710bfcdc
X-MS-TrafficTypeDiagnostic: CO1PR10MB4642:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB464237BD3F100553B4C5E5E08ED29@CO1PR10MB4642.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aHVCxvI2fffNA3+iZI+7/sCntKJvmQcvSE7NuASqjzjR8ROVdwXzDVLYHDiUH7nHYMUQvdgB0/GKsC3ecHHSf3j4ZckvToQEVZdF+UqkclcFr4yLuwBYzhqnYqJ7aJUaMaICh5LMTHFcKX0K7mTqRunW2vuDiOxzra2nwwktXecEvnYZJULpoj8YOObrxW++BceHNZE3MFx0qUNmPh5CyIaJlaoF+uY4Rhw6TANdukGo5WusvDLkYr4CjS/bGiIZeRk9e/Do/TkpOHh85vPNy+S+Phbg7EaxyvVElV5w+0NLxySHflSwLmRckZyuRITz6P19Z7fMQ1BZHpyJWHIOC+1IFwaZW5tEz1lp6p/q5HoqUG3nC5q1Mc9YKmCLYq4KJgB/KnV/xlQfdJdiV2pmzdB5po4B0c7kemnOPvale5//wL/MIebNDYyqWBBkLqdztaXeuBDIvEaES+x7l/gS1g85Txi16FaBnL3nyR3yttsoLdKMVegOZMmpUY83neZDXvMLNunndKdTaBVf12jXGt9e/OFfpVi/V5lexA6J+1Sg/KavRcq65cE5lM0+6hZNOLQoGVZsK0rhFKlndYT8CFjUGGaq+yfj61VtL5w2tBs2x1+aEyQs9t+3zpKOCHfKvtGjt/TaJiTb81E2poCZFUjmGj726kdBXPLlcf68YQjMnnVdhycwxs0WmrZO9FBeIXukDObkWscL3/N0751+EgWk4g8wqL8G6Thovn3lgFA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(39860400002)(346002)(136003)(5660300002)(8936002)(33656002)(4744005)(33716001)(5001810100001)(26005)(52116002)(44832011)(6666004)(1076003)(38350700002)(6496006)(6916009)(956004)(9686003)(2906002)(66946007)(316002)(86362001)(9576002)(66556008)(8676002)(4326008)(38100700002)(478600001)(66476007)(55016002)(186003)(5716013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U4X9+DTNexbm9Q8loRHYMJ+fplcvEZ0vaIqZ1QQB3A9h2SPyNAN9OiRi8Yp2?=
 =?us-ascii?Q?3ZYV5MtlBXr12t49OPmrqXJK05oaAc9JeCa4DZsVVvF3wakL0XhSNpyTLq2i?=
 =?us-ascii?Q?iLdEBt4fbLT/gONN616gQCTl/WJ3PMh3eU1FCrHPg/38feUsdZfsicxDRou2?=
 =?us-ascii?Q?F67a5OhB2F/WErOTs4Q61AHpPJGSbyZVimaeiaEx1dpEHYQGtACAYriF941W?=
 =?us-ascii?Q?FS4Kpmpl5ibxs8Y9Q7TTjksGOV8y9PVfpqRpkxBT5ToM0T6oHbatbQmCWOkI?=
 =?us-ascii?Q?dXUItGahJ63lc4p1s8TmDrjX9yUaKgfwV4S5Z6vzbX9bCaFdGN09PPwFkxDH?=
 =?us-ascii?Q?X44Rnr3eYyiyLzE256KmmYHcS1J1/iDJOZ9KukjJD8wdDtY0CNwYn5zvnyhB?=
 =?us-ascii?Q?iQEiCUGZNj/Tzd5KESLdVwKBmvDLC50F6fAb8dgtm2suaB3IJSrgGv92jd4u?=
 =?us-ascii?Q?bsO3N+gM10cdFZTHipiTxv2cVuo942TjO5VFRrmw7fmfAmXRv7yea+b2afHT?=
 =?us-ascii?Q?s92co+GpU5fEiLcUo1gDinU9k8dWvG/aR8ImiIXiTXxAauUEhgFZs0UO9tfx?=
 =?us-ascii?Q?QW8WaHK6sYQxtQz7TxrB4JBLc999O8EqqpgOBgylD91rCMQmF5sIkSF5BohB?=
 =?us-ascii?Q?7Dsq23lahnfMxfhKHJEWpDUa4ehVO+1qAzykDRNV2rdjt6o9VLLB0Iynl+6x?=
 =?us-ascii?Q?Lveh2Bcfz0k5uWZytY2ZFQPBwAV9pAcl5/6fV0CVX+am8J1WMrebfBhaGqlC?=
 =?us-ascii?Q?tJlx9YMEURBXw8tdh6P4L1iJlCu6KI/nKKT+Vf1OQXzgLgMz8wKQ3njhz5J7?=
 =?us-ascii?Q?W2VY3GdiSgl652QJnbrMg155aD60/27mGho15yHj//vDA00y06H/tKEDL/jW?=
 =?us-ascii?Q?pviD7ytWEwyA3a+xz1SXFLtKgz2us2IDmlLcBSTUbc9OFO4YEHv/JH8Zaqmi?=
 =?us-ascii?Q?2ChXmybeZ3e3LYmfjQ8mCqjBf+dCyAQF0S0sBcaNyRLcT6tEK7+wedeOoWjX?=
 =?us-ascii?Q?WkmkzyS60b3c2pkGIKA1UxcyvnnEjadprXD8nfKsIkq3CBEfq+oAINNn0GRz?=
 =?us-ascii?Q?yC7LzXJ+Busy3b5qGnt7uHEBFuu5lpKmwBgFUnSvg0Jyl7To2lhnOK2LhQVt?=
 =?us-ascii?Q?v6bhHCx0pwU/+G7bzHGgm6YErAw8fchgDGvwq8sS1GhEF8pDxuJLOPffCpUH?=
 =?us-ascii?Q?39pNvqJk4paFF/GFikM9npR0z+aeqmEdaoewrU8EhOrAX2kgtOHfKAm1XHa/?=
 =?us-ascii?Q?oo2c6GMWboKSniKPnnbD1+u7bKfaheL6Q8LsCv+9oKnYPEeBFYyhK0s32fGi?=
 =?us-ascii?Q?UqoMbAzjBLfksLgx+aOSBJ/l?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be55ede5-5d59-4120-7357-08d9710bfcdc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 07:57:35.2189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PF/Eh3Vn7qMoHLiF0kVbRb5GbxCbMHC60J3qDJYudSCvTNXcGRHrcuwtUgFAeG8InERPYxbLsItwJ5AOt18ep1o6MBsuNawt/fD7yjHBNXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4642
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10098 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060050
X-Proofpoint-GUID: pl-0o9wA3dgTnIg8VVuHMgHijcThO4W6
X-Proofpoint-ORIG-GUID: pl-0o9wA3dgTnIg8VVuHMgHijcThO4W6

On Mon, Sep 06, 2021 at 12:39:07AM +0200, Krish Jain wrote:
> > -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> > -               struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> > -               size_t len, unsigned long flags)
> > +static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src, size_t len, unsigned long flags)
> >  {
> >         struct mtk_hsdma_chan *chan = to_mtk_hsdma_chan(c);
> >         struct mtk_hsdma_desc *desc;
> > --
> > 2.25.1
> >
> 
> Hi, Greg, just to follow up on this, is this submission OK?

Please, give us a minumum of two weeks to respond before asking for
feedback.  We will get to it.  There is no rush.

regards,
dan carpenter
