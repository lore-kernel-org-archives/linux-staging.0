Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DC6256A
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 10:27:51 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J9EIGY001796;
	Mon, 19 Sep 2022 10:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=+BRf15ZTlcLzR7U385K9zmOITZnU36bgJgvPEXXsJjQ=;
 b=yS4c1z1XfTb2ltj3YvF0feHRbD67La2abBUiUO+R9mWQFv3LsKFAYK+W6krWwtnbaPIR
 HnmtNiVc2DVKusKvCZCeaUqLVKZxj4mk1K2ZhsvEyzmUIdxQtmLEjQboXbMLyr/5AI5D
 QBVOR2XOOnnLGKo80Y06U1KZA49bGbIgO63hwpnV/KW618IXeFnWbGAmwdyLVaxzscVG
 yw9oWj+TOBnwAgUKphNh9m90PN1BSebz9FNjVCV9uk0TWPeLgbPM3ns4id//6TX6oWH8
 Y1OmO3KVURdr6BEpsz7cIvRT9vrmDKwoY1iHExDZrtcyASFN/knPsaaTQWexsB59go28 Sg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn68m3d0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 10:27:44 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28J7jpLF036149;
	Mon, 19 Sep 2022 10:27:44 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jp39hp52a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 10:27:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAfev8Qm3WVi8vWk5vIxp0x0vPoFL4ZYTPz62+hW+7KqPVE+N4PdRn9y0hPPO2M8EbK9wu1hb5jDlNa9GZE8hlgl4oqN2QFQFrFL6jnhqjqQTtjt7tT5YUbHd+uflwufh+tdNEo6TxuQtv8xOO8oJLTdu31lPEA61rJG8eSAUOG0tbAnErpkUQsNd7IAO8FmBPcC6T2Z/2mRFy94UWoregtao27UkCVi4WibXXTxA9x68yZFTWkxri8sB/umFw6XSGDd9NGAumKQ6qBE4ftXWcRcf4B7G0Rt3e0G/kYeEDXjb8QBZ8MpC3L1u5p/5c0o50FTlH8VeiWEoKGkj5QEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BRf15ZTlcLzR7U385K9zmOITZnU36bgJgvPEXXsJjQ=;
 b=c2KgCfFpOwdRjiKIFJfAkYFHEDFsFnFPFWJsvQ1t8TRy5FjsmTlJzB6kgFUW2mll4/HEeTwZUDpI14K/Ct8tzczVj0LXhGzzuXAan8tBkePsmc9rbWYs8YNz3X5UCDYJ31a4QAZmNGCMUciK87IMwiAuCnx6FYfbLbxZ1OXHgO4lEVerpiAGZuL2iHn9qyQQhqpMARa7qmNqnJlzayHRoukEQ3LqER8sXEhzv1iLmuNjYiQ8AEokosuG1lIayMw0oQbQ9b7ecHdDA6f08mj5W+nedUsnY2xDbQ0jw2+TEZD5AoNM88eIIYpKZo4JVX4nRTOg2GR4aTSsqo22gvsXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BRf15ZTlcLzR7U385K9zmOITZnU36bgJgvPEXXsJjQ=;
 b=V4TEej/J2nz5kzowwC1folqg6c4XGnsEvH1AtFBSs3uUrBxMDlzqESSVnvLJXfpBh0kZFiRNg464koLvGuO430pVVj2sQfb5l+9j4Uj+Rv32vK9OIPyfNAvTVAAcB3K2SQc2lKsEBMJhfBzyZ1ctGvsdYkVtJ6XLf/g6ODw/E4w=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5030.namprd10.prod.outlook.com
 (2603:10b6:408:12a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 10:27:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 10:27:41 +0000
Date: Mon, 19 Sep 2022 13:27:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: shangxiaojing <shangxiaojing@huawei.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, andy.shevchenko@gmail.com,
        ilpo.jarvinen@linux.intel.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH -next v4] staging: fwserial: Switch to kfree_rcu() API
Message-ID: <YyhEBYGPSaB3XfNV@kadam>
References: <20220919091056.29527-1-shangxiaojing@huawei.com>
 <YygySR0Zh1gw5M6d@kroah.com>
 <0f98fa2d-0bba-479c-914d-e6d1a8605733@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f98fa2d-0bba-479c-914d-e6d1a8605733@huawei.com>
X-ClientProxiedBy: MR1P264CA0173.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|BN0PR10MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c446e59-1fc1-45df-b1eb-08da9a299524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A1LJYZdHtLBFBtXzEW3kz8SDbIFdfnhyDImIyWKhY98u6ait+6eTr++J7WgXpspkhCmLNVLd2ks/5kl24yAAXd9sNcrZ6Q72lD0li9VTS6otpC4ksZZi5jzEW6raqmDvr880BDRq+YjUBrZ+UE6NZvrWY2o2PkyBTMVpnmzBJzhuwrOCmjGGqfu7Q5vfEJCHZkPCeqf3d6+04/mLV+SKJcbZdanck6N3sWvL5fgpB5ADIaPMl9whuoFSYsrn240EhR0LkQKx43MH2mO/7ApPl2Is4QdBbAPZaSq/yMuMHW+M/g67fmp6LEk+UDET30lIAKtQwuH8tzUFr0fN8aZor8g+kApYPDFNTurnk3dZ3BvUZzBELUBbUZlE6s1W8fkuEOIJK+bMK2Vppvgz+SignIkjWzk0D1mkwZzsPocCraNK50vdVYKqVE0wq5R/j6gphnjYV1LvSj9v986dHAJ3gLmsmJvlX7bUhJh8tCEcvueohKN6Zzh/Ik38GXnuMObE4zehUGTdEmXTqazuQSFJduFWF9aH2TBj2h29IKFXlBpEQzcLV6VnNz/F5QpFXh0SFUwrwjbapjokqtO+EjWe9EONm+1XL2MN6chJw8IDDZOstzlf15ts9PsyUYVVHDIOj9gKOar5p3TUa3ARgGf7bPpbpsyk5LwVYZiKBr1ZL6b+rGhom+b9X8q+D+isWLsQmGHbUUjEKxfrQQOGs2u4ew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199015)(5660300002)(44832011)(83380400001)(26005)(6512007)(33716001)(2906002)(316002)(6916009)(478600001)(6486002)(38100700002)(41300700001)(9686003)(186003)(8936002)(86362001)(6666004)(66556008)(66946007)(66476007)(8676002)(4326008)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IQY3RRSx7682VgJEENx6q1OV1ro3Ua4QBInIux300IaNrxkuDPATjxtka22L?=
 =?us-ascii?Q?3nCn5WrqvkGliRDxqVjtEfKxnlynzIybkgrzv8Uez0BwBfadZ23PcjsSLQhB?=
 =?us-ascii?Q?vNvbkRWuaO7HKVRDeOt78CyPHUPBYQQaZtydElAASKwvqe74LtDbBW6vaCT4?=
 =?us-ascii?Q?b882WqwIImmI/HXFuglaOTPUYsljB3IHjdusIj8If35ARChMT4+51J/RtARz?=
 =?us-ascii?Q?93ZW1iWigM2ekj/h++TNz7/HrK+MQqCkdkVFV/h82m6R6PXuWNOL3jooOZgG?=
 =?us-ascii?Q?i5VRsuAqJZyrlyN4wEGw9XRO/XvVuKanLU1r5WtUOuR8zjnFQsdWCsTX+vBH?=
 =?us-ascii?Q?i/dh2loQZk538B6zqo3yJR9d7g0+4E1y8Ac4Nt8rf0XgtjAte451iq1tPWKS?=
 =?us-ascii?Q?67Y4v3jW8D+93ICkS3pf9VJdGFG/dRVxOyioAU/guUayWfaHrxqOI2s4h3ab?=
 =?us-ascii?Q?UuA06tqEiKsYuYU9N3ajcQljbdFQDt8QByLM0353rocKoBep8qeih4NqnMHZ?=
 =?us-ascii?Q?JIhX9sS+eZDwnVDS5Taeo+4jV2qJ6drUltqKo5UfPblCbviGur840mB9EDpE?=
 =?us-ascii?Q?TBJm54OdEjBRgfpCaOJcY9rGj7dtXO89jAEe23SBemnHoZlWAstS8BUh4pEW?=
 =?us-ascii?Q?AM4lRAAkEd450AktFKR33o4rFukFitu51r3M2/Fbq/QoxK1uK3ydZ8zaMPOk?=
 =?us-ascii?Q?BYXs0lZ3CLZjnpwTUpK1DA3Y0lEg84k5Pq+k5kwQ3yZ0Vt+aspcznK8PC3Cu?=
 =?us-ascii?Q?d2i/tOIe01wn7CImMlG6NkhVCkZtGuAJTt7RfFpf3kCuIp/WliFfIZUJ3Cl2?=
 =?us-ascii?Q?aGthpiQVPiWCdUQkXElIW3ukIgOpOnKKkNC+ylby2naUwpi6943fl9LP9BIr?=
 =?us-ascii?Q?F9QEPgwP25U8cgLf0iyNgaU2lPflWnM1EcubjfTrY3Un5GAXweKFdmkIJKF3?=
 =?us-ascii?Q?B9Vf2lnUVe3OPJD0yov8DoTPcqIe9zJ7a9r9C80y0Q1YrYBQdYD2JToHGSUJ?=
 =?us-ascii?Q?JVUijAdNSdY06RYhuZhyCzl6jUpnjTdcdZC8yJVvZ469seTig2Kg36CNBOxr?=
 =?us-ascii?Q?urOyqE3xp9B9FP0YE7f1vUO4IgSb34jfExpBM8elaLNS7YjDVteDS60eCn7c?=
 =?us-ascii?Q?ulRWtK69vohusYCBtkYQ6TniXnAwffOa/kyj/KX3XtyGIha66rjYJsvrwKDx?=
 =?us-ascii?Q?6BWKY3CwQb/v3E0sXTCbopaOGjfk5BHQd/czUG251XKZXp3WsRF+u5nuNAQe?=
 =?us-ascii?Q?9gXOEbkjgSRRAnVoNLLkLgIb/OgF8Cmiyvoo2pWL+ZlIhaVBuCCda0JVqvr0?=
 =?us-ascii?Q?PHTS7TVoZWgkLFjZyqQUlf/Ui4XWOKzwUsLKhVjDyMhAeiCsmocvS7MRWqBa?=
 =?us-ascii?Q?Xb2o2NWVa+vEl2l58up+LEp8WFDF74JmUTo6Dv2bbDpa1SBJSdVUnvZNHiAK?=
 =?us-ascii?Q?Whn3VBzoCNh6AgI7bM4ZKmgQBVmajeNlzAQxj3Jx4qRVJX5s2IigKxGswao3?=
 =?us-ascii?Q?70jziKrPvQJXlKox9Jx2oU/wUNlMPuQ1SfhapFjx/02023Ti1qY7SrcyOQIj?=
 =?us-ascii?Q?m/+IWEuLvtHwGcViXG+6Xce/xNjVnFAtfpmCmgr7zqbSuAeHg9Z4hLz9LRbX?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c446e59-1fc1-45df-b1eb-08da9a299524
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 10:27:41.4921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avkq91Ir5fjSdhTKVcj7o36V3KbbQEnKG/1ckgn5OYEqxSWYIkjXpVfHqIaIbprOKjx1cwr5PqRvmady8zCQdDL/zq0WH6JOuhrUv5T9VVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5030
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209190069
X-Proofpoint-ORIG-GUID: DCFLMFEGA6GcT6-9JUQO9f5NSeMy7YAw
X-Proofpoint-GUID: DCFLMFEGA6GcT6-9JUQO9f5NSeMy7YAw

On Mon, Sep 19, 2022 at 05:43:33PM +0800, shangxiaojing wrote:
> 
> On 2022/9/19 17:11, Greg KH wrote:
> > On Mon, Sep 19, 2022 at 05:10:56PM +0800, Shang XiaoJing wrote:
> > > Instead of invoking a synchronize_rcu() to free a pointer after a grace
> > > period, we can directly make use of a new API that does the same but in
> > > a more efficient way.
> > > 
> > > Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> > > ---
> > > Changelog:
> > > v3: the first version of the PATCH
> > > v1: v3 resent as v1
> > > v2: use kfree_rcu() instead of kvfree_rcu() for clarity
> > > v4: resend v2 as v4 to avoid versioning confusion
> > > ---
> > >   drivers/staging/fwserial/fwserial.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
> > > index 81b06d88ed0d..8d2b4ed1f39e 100644
> > > --- a/drivers/staging/fwserial/fwserial.c
> > > +++ b/drivers/staging/fwserial/fwserial.c
> > > @@ -2117,8 +2117,7 @@ static void fwserial_remove_peer(struct fwtty_peer *peer)
> > >   	if (port)
> > >   		fwserial_release_port(port, true);
> > > -	synchronize_rcu();
> > > -	kfree(peer);
> > > +	kfree_rcu(peer);
> 
> The kfree_rcu(peer) should be kfree_rcu(peer, rcu), due to the rcu_head
> member named rcu in fwtty_peer.

Oh, huh.  What happens if you don't pas the "rcu" parameter?  I see
there is a similar instance in ext4_apply_quota_options().

		kfree_rcu(qname);

regards,
dan carpenter

