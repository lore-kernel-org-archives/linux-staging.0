Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA11112
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:11:15 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2827svoo012976;
	Fri, 2 Sep 2022 09:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=E+8YIhDW1agc0buqBe+VPgsMnbbC+mExkwnW4SlGyq8=;
 b=vJOSRBFNsKHRkM8HrZ9tulXVf+ox3h1XFqsA1pJ6ShqtzwCHwq1yGeyhsQlpbOqy6x+s
 aiWQ8XMLZx6vWbOtpEyfzo9ICdbJE9X89Ku6LE3wXjz3ogOSGLvbw9PqkRhu9nUYIFNk
 HQDXVNnh0szsUSgAwP69LW6SyMScjno6IkvQQdR5LoCWUZDKZwlwfQ4sodHMaFsahJQd
 4m8m0idhC0FuIcRLexBtJ+ODaTwff7cyjRY2sSE1udyUONmOtBQslUt/BytD9S1xjSAI
 eWIJAgSrEu18VgZ2lWeqSzzbhI8H99adDv6iOJNs8/ia6mGGfA9uWQTV08mzrsMPsnQR 5A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7btteqap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 Sep 2022 09:11:02 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2826quat009167;
	Fri, 2 Sep 2022 09:11:02 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3j79q74r6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 Sep 2022 09:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1KsyQs1yMzzky5pvBnDamhsxYeJV4A7GJ16lW+3ES43jTQtcNvo+qxCjjrQgFC3/OWGKEDIPqVXKTCaOWxsOVtw3RTRfP0Oe4kEHwHBSyKPEPXUqKzEKn26QAvbr9mQtuKIFISRYyWyuazUgbLXAi51w6fey5NcxrYNy4MwZnCDyGK3XsiBtZfdjlMtomwOOPPmQ1aif2L9Z9+r1noSnhu5uyZ0/jlQ0/qY3c7vLHpPh7dGSB2pRO1xkI7qfXkAvFKWTZ4A7WjlRuFs/asYez+LsemveJccNy44dHD/160C7t7M8yxSz+5KPlyAKcGY9WZsiAeBco1rVLxYazUqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+8YIhDW1agc0buqBe+VPgsMnbbC+mExkwnW4SlGyq8=;
 b=L1nNJF3l2SbrQN5XJEyJ5khlCGNrQ+vxEoy7HRFh+Zz4rM5oGdxwKcr3oetIb0S3WWCvgJeXWTKVesru3mN+FzKvDEP8yubInOrQtZMhm+UhqrvzNceq7TXWlIB8F6IE2D32R95aLGAviG9cPWbvRHRnjS4nnJpiadFVeWbqZb+QGjthi3HuKtvOaGvQWy/nbgOOHyzmLg1C1U5pAK5mIL3/6KeUZ3LjS9/Ht++ijrGiCcbXhU35xTkgNlb4rYpbZ9r51K8huOWDD+jdJLmK4+hmXEXUtZQUDd20aChT+XtYSmhUxpiqdT2uC25T2Wv9RNVnn/axItNXVM4Ulhp8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+8YIhDW1agc0buqBe+VPgsMnbbC+mExkwnW4SlGyq8=;
 b=j0HYIwZ4I/5lVXIicxZpIrc/3aKJRo9ip/qrH/cgW4K15D3CRMJ5w+aoxSqCrjUQB+uKGP2h9KxfcWJKzAGBGoy4QZaS6k9tm+lxdyafHzxQJmzMw2DtNjbybFkJhQh7eTOK9gCw/87wS497GkMZ5iowvBjqW3FZrr33ZEHSkrY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4595.namprd10.prod.outlook.com
 (2603:10b6:303:98::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 09:11:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Fri, 2 Sep 2022
 09:11:00 +0000
Date: Fri, 2 Sep 2022 12:10:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: GUO Zihua <guozihua@huawei.com>
Cc: linux-staging@lists.linux.dev, Larry.Finger@lwfinger.net,
        phil@philpotter.co.uk, paskripkin@gmail.com
Subject: Re: [RESEND PATCH] staging: r8188eu: Fix return type for
 implementation of ndo_start_xmit
Message-ID: <20220902091040.GO2071@kadam>
References: <20220902081653.60682-1-guozihua@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902081653.60682-1-guozihua@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0022.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::34)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a31758-d437-47ce-a6ec-08da8cc30d70
X-MS-TrafficTypeDiagnostic: CO1PR10MB4595:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iktR5u/Tab/QkYzk4fvCPKtNyOgwqBe2SjfDRQGM6OnU9nuHJfkwk7ONQEGaxutLCKU9Qs2IajSDh4EJoYrmJr92UQktUSkJdMVAQGJolMXOraV7mDQjC631XQo9WvNhEza1Hekv33JVj5YsBKjzfTrKqEEtxUIAVy2+FdTMc3pfUC5o4AOdvzb1MpCDxEV5ii8nLm3ZfHnMkwFK5hIaCMnM2Q8bP9H+gI0+wMSuj3iKNVaZb++cQwE6Zm8aX6bDhfg3GlCG5tdpxJ8u0NSjoHw9yEZwXhlQzac++EIJw/3ZqSzOvgqQdq1N7+drJdOLUQAQYrqvhhWTCLWJJUq+l6+mZElyQdT97qixhE/7SKS2e974pLEKlTz6wmbGhJqttEYA7XSduaMSynmTmYFkJykyIDGAbn+Et/ed3s1A9QvQX0imcQEH/mTsH+eAIEEPT/mi6HHcIfg/+AfJmo3KKN0dTlKMgwJze4CFxngaGa0f/7BN0F+WUTErypJlVsadD160SHXfH/lc23GKM8fvEuAg/cmweMgY1SpYrWoFXvfCU0J2lBamjaBCvF8ubwx4VKGzHllsw39Y2cdq55LU1FMFo/x0vTTumYPUGxrvh5JNCVrwPDPf6pxmpvViPYRSxRmpshnJveGLXjDNW2KeEJidhMA/C955IspkvwErcSeyWZvYvqJOBB4fUbjBFKF+F+kABCaWy2iRNkFaD648SffX1hVdZjuCog/naAN8IfdFdrXt0Ok+wGWfQE/s2Xz/cG/BKuy7IFTvRBEJ5pe4KSBrXE8u2fTo56YwmfpP/lU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(39860400002)(346002)(366004)(136003)(396003)(86362001)(66556008)(8676002)(4326008)(66476007)(66946007)(38350700002)(33656002)(38100700002)(83380400001)(6512007)(52116002)(6506007)(6666004)(26005)(9686003)(41300700001)(478600001)(6486002)(966005)(316002)(33716001)(6916009)(44832011)(2906002)(1076003)(186003)(5660300002)(4744005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fU4ZIOZyn4Ix9BrRBgz1OOOXyRSG/9n2GU4nJirM1rYxEazWQ56OHTDGqLYo?=
 =?us-ascii?Q?SXelNp+HGQ16OQGZrpZXRNTnURv6rdaQ4CqVZo1zrr/1vj6ejBg1/U2H6dIj?=
 =?us-ascii?Q?sPyRMasVADDAJLvfIXnbO35BEIqqGkxikCTCZcYy2CKeFPf1Y1ynQf4Zy8cH?=
 =?us-ascii?Q?QN3iAqrUpX0Y1gjDlEK+xMAwrIOumpdcOUaBEM8Own5mPssvfd6YEFUv2iBg?=
 =?us-ascii?Q?Kh0dxaq++WoPSbVEI08++tuNJ0JLHObvkoC5d80hn+IA//p1O1qpkKZpWnFs?=
 =?us-ascii?Q?fGa8248zlYekSCOcaDP6lkrNpJEtP1Xcz6tR5aZ+uW/2HfrYM25t8mGGebg7?=
 =?us-ascii?Q?ufrq6rjyAdzbMYaUvjfd7AsRHMqoi3gHTdfHA8zpu59ZBm3gqPnRoa98yqRz?=
 =?us-ascii?Q?tgqjSyiSPanyVS8xibFgIv8tpEQeqg89qPNqsJsx0mqEdS6S+AUiOyxnvfkS?=
 =?us-ascii?Q?1dFYIvNvKck+WXgtTS5/JYQafK5hoImr/Z087Q9tkA7noijVf2udEF7FnwDb?=
 =?us-ascii?Q?KFSeINU5J1n/f7DfCP++8kBuJ35md7ZjR+2jQPTvKjawp/le2840Tk28EdWU?=
 =?us-ascii?Q?+8lDytvZkj6wJz5OUEvwnHkHWXvQSvdP5ahqiIavSiJihWpR3oUWBb4PzAjQ?=
 =?us-ascii?Q?5tHahvCOf4GcIo0QANKT6mM+3UpOkAPYzCK0FIiOhlsMhLXuij3i9AiFsML/?=
 =?us-ascii?Q?OWZFYMn8CK9XSSHq1YmVnT/gpwJ6B30t/wkzuT07k9p99X84HLAWplL3JtVH?=
 =?us-ascii?Q?xv6zcnN1Zz4jCQZnS6hOXudWyxYo+Kt+rd0uB/lc5i6B/Oh7vPTOxk4JxzhB?=
 =?us-ascii?Q?lXeFpQXDXmzPAIx/2x5Eq9rz7lfRJD8nmsrAhicB+f3HvFuiWdT8KfWKBaP0?=
 =?us-ascii?Q?N701r1LOXTxLhrgSR/PSuQbR8bmuRyatMsMBxKRpDLc/lCbaMLTi1LFb1mOJ?=
 =?us-ascii?Q?pSrXAcpLnHWrWNCzhUgeF9EclxkLeb9RKzS5BnMNPWhrx0IRYm3EBlNYMC5x?=
 =?us-ascii?Q?m/XCSZFfVITQWyjlNpGc1v0cGb/tfnPqjczGzKiMV44LcjHRr9bIw3FBoHvS?=
 =?us-ascii?Q?O0c0XSvzIkDVaapXdb5jzRDyuZ4i7EHg8R1+xGi2V8O2EYh3/KTtm/dUutlr?=
 =?us-ascii?Q?ulFtW8LBLBT6SaK9EZEOcQBayomQ/OZL4psJBPesknKiTOSkMGLxd4HUm2/n?=
 =?us-ascii?Q?d1wFwCBOxs2km27vf+myo4SBqabdtAmOgRCDBKsWZTbeNwBXK74Hh7JNqVmT?=
 =?us-ascii?Q?NCsjoUe8ETr8K0ZkQbfmgfxGVUcpwYI2+TviQgTwsp8cKmrcwcb7BrfrAWbH?=
 =?us-ascii?Q?HlX59Cug9gT3/hbkzkpdAc6ED8Jc5RPWxdh/nn4nYvP214EWneLs1nYuocMh?=
 =?us-ascii?Q?2/Ab16MHz0Hbg+0BgCVPHoHJvD2X5R/Y93tYIIKHMoUBJ/KGRLlL6rnCha1S?=
 =?us-ascii?Q?ihpZZLYAiss4KeXZT14ZZnmXeU/eVsKEgqPO/6Q7yY59JLAmbMfBuNzYo0+6?=
 =?us-ascii?Q?j3xNL5mBkL4l0IN2Us2C5kv5dqxpTWwogDti5qjKApxuwO5F7ytHZrqAtPJJ?=
 =?us-ascii?Q?n70gfMpvTgrrnsMUEJINJ3AhU0miBB5/ROZH+bcCsT3AZuU8B4YFR+QuQLrQ?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a31758-d437-47ce-a6ec-08da8cc30d70
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 09:11:00.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tsUFDvFEtz4PVUR2ROaOfyLLieAWJUNjLIL/RR7P0YxWYMR4ObbjPj896buiN+9OsWCUwzzhWQhgLIaL5GLuwSGM4HGiiGGI9SLIkIgFE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020043
X-Proofpoint-ORIG-GUID: ou0sk7rE_ReOEbTWfhUTp3u77n32vWn6
X-Proofpoint-GUID: ou0sk7rE_ReOEbTWfhUTp3u77n32vWn6

This is not a RESEND.  A RESEND means your patch was perfect and the
problem was on our end.  Of course, we're also human so sometimes we
make mistakes but a RESEND requires an investigation why we are
ignoring *perfect* patches.

This is a V2 patch.  Here is my blog entry on how to send a v2 patch:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
You need to send a v3 patch now.

On Fri, Sep 02, 2022 at 04:16:53PM +0800, GUO Zihua wrote:
> Since Linux now supports CFI, it will be a good idea to fix mismatched
> return type for implementation of hooks. Otherwise this might get
> cought out by CFI and cause a panic.
> 
> Use enums from netdev_tx_t as return value instead, then change return
> type to netdev_tx_t.

What CFI is C-something Fault Injection?  How does this cause a panic?
Do you have a stack trace?  This commit message is not clear at all.

regards,
dan carpenter

