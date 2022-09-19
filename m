Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5D52103
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 09:25:27 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J9E9N9026301;
	Mon, 19 Sep 2022 09:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=OXcvNgWjVpHPPrM9y4ePUk62Q1PNyj53s2Rlv844bZ8=;
 b=b4xFs/0Hk4yuCOgQAWLpyea5ZAUHd/RS+J44RIf3J8U+AtW7TlxOrvxnnSjwaPNY26TF
 HBz9LMRe7mXPQ9pFZEYnrOf/saaJK3L5mPai3CDNle7WTBNUz9G1/7OKYPlogWO9OT+B
 M+Iqs/PWKEV6ZRR0hVEjAp2vW84k3JpY7aeQ1RBZ1CfWVltG8B1uzelTU+cxsXwQalPH
 bu8UwsXpm3cU1XxTZvC6/wolGD6c+NL+rMmGdHoqvLYgtrazPBHrDBmBmv2rKLA0jySe
 uAWxv8KaFnMpdikAHy8Ia0sFOSBqlWwnNDm1sN8DafvhYZdEWkk1R7TmBUBictd+/11K iw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn69kk83k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 09:25:20 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28J7v9dJ010034;
	Mon, 19 Sep 2022 09:25:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jp39nunrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 09:25:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaqnAHrAxWlkt4eA14g9HoU1G4EfhiMwfg9d/gA+gxwTKjJbX6hODx4judyTeIfTqZcj+DEqltV+DXv7/GLS2q5ujR4OQkZiCIY7AGv690Jo4Yp+7h26BfSlxAK5C3C4Tii4FtWgRXqSzfNYU4jBxrSOJIzMReH4NIpAVAuFBfudrByISEuumv4JV71Z6FrQvRJGGoFivmBKFLbp24tHKAf4Su6eNycIWF9r0gTl6rv6wlxYLnZUFz98yqwYtMazRH+3ygdsxN+eBpUUE9FW+UEWNgwHkgFq43eDRGsz1i+zv85zPpMESv9S6D9udAdy3XkVOPNX+eqoUWmuOdaOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXcvNgWjVpHPPrM9y4ePUk62Q1PNyj53s2Rlv844bZ8=;
 b=hHSRosQSQjf8c7VW80K3YComZ1VCqMJvXiOCx+c1b+n3n+BZpkanle99ef2T7Nv3EpcZGclA6b/g80zCwbLA+WC12BwVSgrHRvW8QPy1T9mLLTCvaXN+ZaivWBdA3W3ClOqlktaiXkpCrJ4NRmR41JcvtrffN4t+fw5sW267kSDSnk53pKzHSm5bm7kDvCHsG19VVnsMUkh3Ng6LtjxMD/m7adOjA58nvhYEy7yXjllrjRq9xc2vlFF45QfRYdJH4J8QoaF5G3XkWPDtNkYhqfM1wglwMRSAenNNO8rpOxanZhtNQRC0UzGffaF3eEbZj+x6gd/8MNqh2lRfbOWZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXcvNgWjVpHPPrM9y4ePUk62Q1PNyj53s2Rlv844bZ8=;
 b=TMlBmzJRU2I4d55UzIyr9vBtGuyQuopO6/H57Du5jrrOJ6PsO1bAWFqne3z4CtR/x1erHc5WoaOfBULw5ySLdbYhnY4mwq0j5nYbPNmi2Mn+iaulfXKRsGXmVepojSc3lXp2SppqNZxuw/SUszTQZTIT89JV2Dj88GTMT9wVkDE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH2PR10MB4197.namprd10.prod.outlook.com
 (2603:10b6:610:7d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 09:25:17 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 09:25:17 +0000
Date: Mon, 19 Sep 2022 12:24:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Shang XiaoJing <shangxiaojing@huawei.com>
Cc: gregkh@linuxfoundation.org, andy.shevchenko@gmail.com,
        ilpo.jarvinen@linux.intel.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH -next v4] staging: fwserial: Switch to kfree_rcu() API
Message-ID: <Yyg1XmNeRUaVg9nQ@kadam>
References: <20220919091056.29527-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919091056.29527-1-shangxiaojing@huawei.com>
X-ClientProxiedBy: JN2P275CA0014.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::26)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CH2PR10MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d6e88f-340b-414c-afa6-08da9a20dd24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FPJH8xplhCFuIW3eW6l1QCEIPe89usGZPXSFWhMz73C0v3QhmH44wq9tNg7k9DuRfVvJZ8Ek0qrP/pHv6kh6EeUyciz6Wkytb+wlV2R0ONifmkbFntpQcVgU96cdvxiKYScMooG5RRnS7n+MIXNGdZnLeCKmFpjsb01qoRrlhqmGeqt46redV9cGCZZofRhI7D4zFAKMiZzEsI1YNYwZWYY119iwDiorW/IumttwnvExM8U+JW2wN75RvyolzPFfAf9SD5QHDar3Xs+POsThH486EqmqlBBX00t5caY4hSHq1jm0DgY1dIzP+Nh0/vgQxzNEKZhie1uBV9b/LRASH0uvnqWZRjc4hUeVpYzUpbbVLKtSVBJiEkc+n/hSUNNfabjmJkv/9H0dLlh4wh/2Zl2iE1SuNqRlr6lKM32f9jqZchyyrTPxXPq6+bODoUgeZJs990n4qxdlAIXBbdI2EF9x/8buMMYjhs7jb94DGDaUsQEXNcOyayHfzhcNIitLEjJxwKSXG4FCkPyS3D9b/EGwMwMo8A0nugo8Wo0nYTweLazRpjnPpE9mOAbbGCIErL8p0NsrDROxgZwUBanStXCMuQ7Tx6bP4xFdBkQw52iTE/52i6+wA5bIQUQ93GVwttz0hRq37A+sHcjtx6EyCmEZmbI3pmbSRnwZuOaROf2q0D35ATChkldzphVIOTm4zSdx6G4QJY9iFDAxXBt2Rg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(346002)(376002)(366004)(39850400004)(396003)(451199015)(5660300002)(186003)(316002)(44832011)(4744005)(33716001)(6916009)(66556008)(8936002)(38100700002)(86362001)(26005)(9686003)(6512007)(6486002)(6506007)(4326008)(2906002)(478600001)(66476007)(8676002)(66946007)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jevD5nIDsJ5CK0fMLtw78NdQAmLvrv3T8UXhEcQo8VMasjpBK2W4QpVM4+pC?=
 =?us-ascii?Q?TE9rf/lXrF9s6z89xG28J0o/OeTd2V3oPw1ndqoul35yozlOB1uA0ugUUiNd?=
 =?us-ascii?Q?NhahGYnwqPacUf2br3UY92rQN9J5ccSA0Wu7sneGzTqSbIH9K5CL+VuP8ZKV?=
 =?us-ascii?Q?a3DrnaRomdFKAgRI6Nut/tf6QOg6SwFn5V/x8CygqfVeFnJfGWmAHkqBMIW1?=
 =?us-ascii?Q?48ObidFC4zroBRLyCSIAloe7bRa8zrahfKB2lMQ7f5KEkqAlj3zR4r5vZfGX?=
 =?us-ascii?Q?iuzrHtyfImApOLokonXClvFhsjhumEN9huGrOr7n+8j9qM0l2sMcafEcTyFB?=
 =?us-ascii?Q?8Ue1U7pZF5T53NfWukVN5V3sG+XLV7uGOyj2V+JD0Hc1DJ1cKTk+pg/kbqd6?=
 =?us-ascii?Q?MC7YjZu1t2znGWEF8fb07lt6UElTd0E0iajshBSwGHqAqyk8NtaJSP+MfBFy?=
 =?us-ascii?Q?wKhdD5PIjdkb3/4o05sywq3p/5B2xdXVbatIS4m3rZWzOogpKEcC53kYO9Ns?=
 =?us-ascii?Q?zmvWwalGNbvKrKRS5KZmY7rWdctxzyJJD1JW6bKhHD2/nuewaM5FAEYiEXlV?=
 =?us-ascii?Q?PGueVRBA5XkhnR+H97AMltQEya+fC8qcO2vdQzl1hhlb95oIuC6PLsBC7Zje?=
 =?us-ascii?Q?Eu0xqOeEtsWnuKJ7vpj1DPZIJDl9Ls7vBptMyoccaDZxnda72qHu6x9S24dp?=
 =?us-ascii?Q?jVQLKxhbymjEXFw5pCuJ2CMCT/CU3fkDIzcZgmyfBZOqsYixV5UDUms0/YCK?=
 =?us-ascii?Q?A4BqAuSUaD2V/cjwEIVPb2zZD1wiIVkIAAnnf2gYoLau6RDAx9ltG0iI5Puk?=
 =?us-ascii?Q?fde9drdnbWzTJ9q1wpLeeiOZByrgZuQvIobw2dUT3hHJk9pB+ZBJNBjM5gxj?=
 =?us-ascii?Q?x56Swle7ILtTqiU+P4s4l6FXiL7bhGJUBVOqjeCHqSVktc/An2wf5gVHpF5j?=
 =?us-ascii?Q?UjVaqWyI8rMOdlu2vghnqCHe65bkMlmxUi6tKBOIcUqL+BY1Wen+FcR5Blio?=
 =?us-ascii?Q?JXJcIn9rJ8dthcGCAw2pIkwMA4tYM3q53KtRrGee5rH2PV1J8ZOONtU47SqM?=
 =?us-ascii?Q?PdLSbS4za7ra7h/UTPo1vPLwOt64x0+nFjV+MU7Tnl4VzoXjEkMwZqdp1BGF?=
 =?us-ascii?Q?1aC+dgf2nj5SFQtHrtl03rype3oN8Dc8nY3OdXLFvLfp9aapzf6OvovkjsOq?=
 =?us-ascii?Q?EoP9EhPcY/my9vIlTKuCvHNdHk2cAkqzBvP4dc3ILJyvXXt/xaS4bIYeKO7d?=
 =?us-ascii?Q?I43Y9UxXpgOl4Hnnfgi7d4fYhrkkbOFOSUZ9ZjLb08E0yr7ULJYnHlb/5tNF?=
 =?us-ascii?Q?McQ5xmuX0Gbgw0eOjlW/L3fmWbS+xcsSQWebXxw/AagBgO6wJ6IVvSh6jMJV?=
 =?us-ascii?Q?j31B/j3r3/adQISfzgNcrj9gV7fb0jR1BpMARw9yPbymibxCWS1OXFQCszvb?=
 =?us-ascii?Q?Zsygmi/b0x0Av3KnJdYPst1Rl1FSei6JzYTn8olvMttN4MqPpYdRkjFwEkqR?=
 =?us-ascii?Q?V1jRD2/WopUCE87IouDixLBWBuBmQEWzw1P7kQH/rClI5JRVek5YVBrysGZp?=
 =?us-ascii?Q?8yTL+GAYu+Vqa1/3Lt4LVUNpn05RQAAkvTN3LBQbZ13g/hBttpGhDFXqwoGE?=
 =?us-ascii?Q?RA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d6e88f-340b-414c-afa6-08da9a20dd24
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 09:25:17.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXdlTWudfLW/hhDL6CYzdMn/RqBF36tOnVXcgvkIgVOEmO0MRxTu71bMMIT2+SuX7jHGWwqzlH3PqjAwDsvXeP2dO+KxwcPCNNzv3csLmH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190062
X-Proofpoint-ORIG-GUID: TWjLrDfEZOiQpNC_4JwLa7bYn5lYkxUr
X-Proofpoint-GUID: TWjLrDfEZOiQpNC_4JwLa7bYn5lYkxUr

On Mon, Sep 19, 2022 at 05:10:56PM +0800, Shang XiaoJing wrote:
> Instead of invoking a synchronize_rcu() to free a pointer after a grace
> period, we can directly make use of a new API that does the same but in
> a more efficient way.
> 
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
> Changelog:
> v3: the first version of the PATCH
> v1: v3 resent as v1
> v2: use kfree_rcu() instead of kvfree_rcu() for clarity
> v4: resend v2 as v4 to avoid versioning confusion

LOL...  I was still very confused about the versioning but I think the
patch is correct now.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

