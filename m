Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091733FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 07:56:10 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1863QvWX018156;
	Mon, 6 Sep 2021 07:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Xl4l7coFMmECV678XEbz/i50TJbA37xVD6NDaDVKolM=;
 b=KJsBgulWyxDAF0yhMMLc3C3pAOh1XfSEiNbEeWQXNq/kLYp44eQ8CMCQnH6U8KCAPQ2w
 Fn8gP+mcv5qMJXETkit2AP+xS5Q8ScXfFoDLRIGOrs3N3wui7dun6EBbOPf7sosrEZPI
 MRZltsO1E2yK6TNP0sfxXxT6k69A9IachQSPwTh9TK+s5SmupVev3ccZDemBpIZgJGm+
 bk5TgjMXiHOoYhD7QjCtx/HxG33YPJekuiyqadqesWjz1w7amPHct4lJQxyqIhl+CP4l
 UPwIRGDRc9z8GYghrQMdFbbI8YCrdXATjejzmGfr7bNJ19GQcH0E2Khfr/OQpgQ7lBxy 8Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=Xl4l7coFMmECV678XEbz/i50TJbA37xVD6NDaDVKolM=;
 b=MIGEU1YcYgV9OR2330HIUbVe66A/Jslw3MSMvzKbFs+F0Ih3mkobBs3JdB8OS2ogKkpt
 7kYevcpR9RKEfDd/ck9wBKA7dDtEKTqjs63eVP1SBxAS+0Z0APRoFyarIC6n4MVqGgIy
 MIKTcuKyJVI/W+zl5/zpAONiamWOd2ROB7gwK2AofdeJ2CddcTPVhDQNmVa5POO42336
 jbY9FBYW2iAZQwiJx3G7qahDQsDBU7QwQdMsbOWI3hlAGk0DQR9/st4yr6S0PLf9RQ0L
 1+Leuj0IxFYqPna2gUkzQjC7M8tat9E3AfKp1ogUdGN3/At35GtwpLvK0tD0pAeP4vDg ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3avwcf9kpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Sep 2021 07:56:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1867u6IL143005;
	Mon, 6 Sep 2021 07:56:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by aserp3030.oracle.com with ESMTP id 3auxubwt7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Sep 2021 07:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCsDxiL85fkwxbnIeKSfdkd5pp81NFaPiQbx76L0aEStoc6Axyar3/7EfysQ3y5PvhZEYvSm53SuxwDWXj98LPp5AqNpCpMNXeMY/1ffCYHwPj5CTelmucvOBuHqollm1uVpJbQci5+dIF8dWJdYLCNQ98WYggGKM98+HnCZdqR4WWeNKkCO/VzWgjkTQSpGw1lWZXkwPGEvgE+F8VzVnSKNhPdWjDACO3vj1FmkOf/Rcmttd+PLKfpyXl44RhvJsQes4P2x9Jjk6K8GhdtpTnsEujXyQndd9gPtmCJE7jSH2Qbab+les6TSoxiprcC9Er1LPE8NOfMBXVl4YHoJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Xl4l7coFMmECV678XEbz/i50TJbA37xVD6NDaDVKolM=;
 b=P7Ypyvzbsc8/HRk372x8kLyVfT+IjYLIXWZpoxZPCW7e9UK0GhRT7RdEJZNmFeNeNYvWCY8uMuO56nhnjhti2x0K1en7HldGHZF/Qjtt4+KDkZp1UwAgNhCXgZ6qAIyrZGwrvwJpVVgTitf3/HEEhtdIjJQ1dDL0uyIg4WSykBczpshtbiwikP5SnkU/ZwomUTvn+hXp6pKOPqMXzbcaVBoEa6yuAZT5xg/2JH/u3WxkHg7pjoDOd5GLyd1UeleXyQhb7smBjteoMkMb29jJFpr6IMxYqweLJ756Gr8Bv88IuS/nQTVpb2gZ4RBCab2xyNTT2Xj8D7gkckTaL8c+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl4l7coFMmECV678XEbz/i50TJbA37xVD6NDaDVKolM=;
 b=tkCOsfDDBc2uRWLA521oZrnK0j3BWWb93p8P75ju9JPdoZ7p1PlXzt9ck4FAD6jWcp5Y3ivnHHOzPt4X/Gvnkvly82hWW8RfYi0OwEP1B8xU6Nq3o1/gL6kI1CHHxWbi9E/ry+sC/JAWkG6MeOWJyIAvojChwO4h0yDvxdhEDPI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4642.namprd10.prod.outlook.com
 (2603:10b6:303:6f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 07:55:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 07:55:48 +0000
Date: Mon, 6 Sep 2021 10:55:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Krish Jain <krishjain02939@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] mt7621-dma: Properly format lines in "hsdma-mt7621.c"
 ending with an open parenthesis
Message-ID: <20210906075530.GH1957@kadam>
References: <20210905090201.GA283023@panther>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210905090201.GA283023@panther>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: CT2P275CA0026.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:a::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kadam (41.210.143.41) by CT2P275CA0026.ZAFP275.PROD.OUTLOOK.COM (2603:1086:100:a::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 07:55:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0881d9a0-0945-4751-cd08-08d9710bbd3a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4642:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB4642A11346A453C3D5E16C818ED29@CO1PR10MB4642.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EMdRnTSczvBGNg0c7+f33nPj995funZfFZMn4luiymbVv8kAe1ECzOPGArX2or5SM3Gv51uF6VG+zlCPgZFcyGxn9wqTVqIVDQaWP+vYhclqajrsK4DvRmq5oRbUHEppR/aQNkIV4bg7bwWTUgJZ03bUGII1bks4lwgFYtNfhi2ZoFNfT3uJVoSD20p1J6MV9ZyjdF+G8Zqwjtn4fz8TO0z9WrZCuTTLA2tsUO6vzLcuIuwKPZvURb8dcs5WHlKeY0CJj40FTGSGrrOZp2cIGoDWTP4rWSRoK7sv3pgAA/5ygGC0YBXG2jUANaK2wIaEi+PPc70edZaQgVCcD2tWqBTfpi1JIOSH/DAB2CaY/+deKLlM0qOk0TKRxcqjBxYeKGGutRKBiSD6oyatDpf1loEtQX55STgb10+THVbZVeTroGeJk2WiFv3OnLjsqtYUeSavGtUDfOWp3AP5Fyel2Gp59gmuIjFZgfzEtWwdsUe8DFtnO22fis3FeUC9i1g6XQ3ZhpkJJQ/UJOgYkgASVDPQvA031wxxEv4jCusccDm0ZmDZJrsRFBMgEjf/r+0xKKyHyNeN7IqhLZ1H0Yl25uHTOdNwPsPkt32Z/jzHQmGsmuYNCHuzruGQOWi933uqg/fQ7ma9rAKvbv9ceFYvFVaLheJDAK+alYjUQyBlmycYkh4VUUi8tBzo8syfokC8+P477L13tyYhEjQ1IcNgoD8ZkB15YNCQcFUwOtZnKbE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(376002)(396003)(366004)(316002)(2906002)(66946007)(9576002)(86362001)(6916009)(956004)(9686003)(66476007)(4326008)(38100700002)(55016002)(83380400001)(186003)(478600001)(8676002)(66556008)(44832011)(52116002)(6666004)(5660300002)(4744005)(33716001)(8936002)(33656002)(26005)(5001810100001)(6496006)(1076003)(38350700002)(5716013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EE7ZYcoMgoRUnknmr5tbsBbCz2lgK5pbK+RTqG4R8L4npvqplBZ0dsfbZ/ht?=
 =?us-ascii?Q?C+eacSiFAdzEFLYsGKaKaPqsCM9fwCam2/ZhZGqQ6luSpOEcB1p2zuoKTWMf?=
 =?us-ascii?Q?QlcIfK5X9QXOa1Ixi8W/AItd/NONbRjlqWPh6xdzBIF+bvNtLBOEj0Qq5Ls+?=
 =?us-ascii?Q?MmJC3KzHdkhVVr2aX3JhwtCwv9qDCHwk8kBh27auQ4WI67Shj6UYbb6NS+yg?=
 =?us-ascii?Q?heACWyqbyRZX9g/tMfOsq0GhKXKcXAkx3A6O/SdjKKRWL9g46JESzlq4GhRb?=
 =?us-ascii?Q?W8dR/adLXZQRdkNzVrqlaQFCri58bSs0fUmr0MUcd8i0u3EwQjW8cNZEGSoN?=
 =?us-ascii?Q?hTFot9K9sdmBpnEM1Sq8Mw2ZBEpvXwbpVGUnrR3+X761D9t32Kzwg6gsvYHy?=
 =?us-ascii?Q?znnXAFeNWfdmJiFqM39ljnrIl9+ddt3BX9IpKcWvfjQP7vE5DQgqx/76ZGI5?=
 =?us-ascii?Q?Wvaz4KeFt4nzSye3uMuwKtKYS9XDo7mA2aEuUVE45OXkmaIFDgIqPbIymE92?=
 =?us-ascii?Q?RCG9HEGHIwPjQoBvFAddR/1HNO2p9ZTkyjbd0F5tDr8CwbSoEAl/HR5MrLZ4?=
 =?us-ascii?Q?/69t3m9zGD8cZ0ru40TehDgL0Ygp2FKqJ8WEJtyD5sAjE29dVRC6PbZGZY1K?=
 =?us-ascii?Q?flWbARaaHdjvTsljV89bcJ7pFqKY3Iqk+NLW7Tlt8stQzPvAgPhIbuI1Yi8S?=
 =?us-ascii?Q?EdDk/oT1kEGsIT0t05pgdFmKEyDO9TaM8IQFoU4JcwDQ/NJ4H4O1E6l9UtgX?=
 =?us-ascii?Q?qXMExnOQPh9CfI+8LyNMWwh/yuNkvYS5bEnXFrI/c0Yqe6H1oVa0W+N4i+th?=
 =?us-ascii?Q?XMudG3aEXji2JsZDJHCQa4mDDbT86ppV05dkZ5oJ0vSCY5CD3rh/ACsxAdqq?=
 =?us-ascii?Q?+JnIpaXzn9DwV/Lh1Vqfm6IwZv4ipmLs9c5NZDzfv6aHe3SWqaVglMAZv5LL?=
 =?us-ascii?Q?6sOTub5Oa74FAbrhu12nkZ5lZRK8FvA7NbjN3yW1z/fCEHeM4vrSnxUPIyws?=
 =?us-ascii?Q?+Rk6Fv2sz9twV1G/aOvFgDHMfBtIybXCYpqS0Xv2CX3QHLFJWTW8aN95CVOh?=
 =?us-ascii?Q?hNQGPaW7rL3AxNF5lvBUXDfuAsUsRYmZ6xhDcirFzx9B9fa+iOif+3gM4n1D?=
 =?us-ascii?Q?uM/isLsfxeIRg8yT0qya/5Cy6MTU9RzCal/nelFH2710iww97hfjQmrHtmrQ?=
 =?us-ascii?Q?9hcEaOJjxs4PvxMr3TFvth4YFtYIxpM12FEXrWlNcZCnHSFqE3yZ2saXVyWT?=
 =?us-ascii?Q?wTIMG5ZsyjkKPU+HayvRAoTpeyj/m9iAUdBsZ+/OADGiWxfEyfcmZd9QOM22?=
 =?us-ascii?Q?loiOgSU4uG0L2r3IMca4nipX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0881d9a0-0945-4751-cd08-08d9710bbd3a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 07:55:48.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWT7XkwhKN9Np2fqcbd5ns/EoyVDudMkKTnv/SmC1vhLn37CpTap7DrYDjSLSJHK6Nm2vIuGAnC9E7v9WGIm1xYnWOIWgIlsiYNA9rLcPf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4642
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10098 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109060050
X-Proofpoint-GUID: 4h-O9pOYFzjm6iyruutdRgie0gUYKB0Z
X-Proofpoint-ORIG-GUID: 4h-O9pOYFzjm6iyruutdRgie0gUYKB0Z

On Sun, Sep 05, 2021 at 11:02:01AM +0200, Krish Jain wrote:
> @@ -457,9 +455,7 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
>  	spin_unlock_bh(&chan->vchan.lock);
>  }
>  
> -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> -		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> -		size_t len, unsigned long flags)
> +static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src, size_t len, unsigned long flags)

This line is too long now.

regards,
dan carpenter
 
