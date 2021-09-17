Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558673FC0
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 13:15:41 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18HAuknG012125;
	Fri, 17 Sep 2021 13:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=tyMN7Hi2C0ZPzk3cbs1CKCoiAdD3TXKCD1InqTmGsog=;
 b=aZjoAJMbWIHqglQEG2y4sNNqSM9rVcWc7JJndb0qGSO9q1vP1WRMcji5IX3Hm03sjr8X
 x6rvZFLbZno64HKnUCqSYOJw99JpSiTEBZB91J2JvTrxOK5pazgTw9l22pw6Alk41BdY
 0+knl7GTOOw4MJqhFQNKrqU8pxnH/IbSAGQfbjMy7U0McLxBa0g9l9NDTsIp/eFFbmpj
 Hl+stc3RwRjXf6OEQZe1uEm8EWEoNNZEx2g3BWiofj/9KgWPTzewPuZGXD4FwF6zW876
 kRgGQj1Re882nFw3sJvNQIRlwK4yrbrylSto/ZxBFptX7mDrKw/IM4Ds1sf3im584mNH jg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=tyMN7Hi2C0ZPzk3cbs1CKCoiAdD3TXKCD1InqTmGsog=;
 b=VfAV2vB877TCa09qBgphq4DFPefThFkse8V3SfEz7dhTQCt2Wly0UdIYHxg2Ul0pZ0as
 hrGX4gV1Kj7pD0zrIV4FFdbW6vEFiIXQS0zPOiawtf0qB475JWFODFASIfihQhOSNjVL
 LnJzMEdJfEGRedaqOJBpLgtRkY1qa1Bf785+U5kWwShk0WmGBfrMM/RSmJgAWXxB1umm
 VvEqNwdvjUTowvt4XVVS3/fnAMjNW3qDwhEQ9OaWWw0YY5TGLbB8XHJnS/tQvXcTaYFF
 I5i0AJ+hF4yOb71O65dXtGgVSfa7v5CJJoMl/6QK6ia/NcBKbBu+5aJlI/msWJhAab8c 9Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3b3vj15vu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Sep 2021 13:15:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18HDAi1U159997;
	Fri, 17 Sep 2021 13:15:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by aserp3030.oracle.com with ESMTP id 3b0jghmqbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Sep 2021 13:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtaBFwRoiaDSxh1m5ucMNH/X7l3lhX0yNf7Afh4OMcDTqBRjARm5XavKOLrhZKSK2ZlvcPs5Cr7tHSc9pFnCbS6yvkG7X1RNayNAq6rQqSdHT4D2JoO9+fGTrUlAG9p0KvvwTRicoRl35hkAVusqE3c9fwh97zrzZDye5tnxAAaS0Eo9LXRUuDhUwhVXtThQyZJCqH9ShFg09K2AEpFG27bWIxXwCwGJuiqABGdZt3XuIzTByBhCWiL4ZCmhA4KUD4vbfWwvY+J1O5tnCb9pJFGDjTWHy8UaleO/CHsepOKXtUOhA6txrkNdtVfRXW7NsM0DyckflLMGriKqBPlxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tyMN7Hi2C0ZPzk3cbs1CKCoiAdD3TXKCD1InqTmGsog=;
 b=I4cWKzesOUittJA4K5PNU9dwIVb+6KUvt01VxxCNXUHkYm1d2hRztIIxAVZkmxumrSBgpAgK9z/Uxh4k13AD3MwCHxu11pLQGxvpzdKKXCuTwWIw5XlhXHXqatkQXlywq3gWS36Vv2R8AkRE4iGCO7/bXL06yngR9cg9o/tlA5Y3l3EDbrJy+MQwJKI05b/Kblg+8JFvI+1SKgDLoT2FKXgjv9WLOiP2WvpgkTqjYBu27kclDUEZ6fymimEKPxvjAKIsYn+UWQ8RRZq0C2QAFdPPj2ACFitKUnvWGzdWyn07CBe8C+/Tvt1iXQShCvabCcJ13VHx1o2JoJkhhTkDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyMN7Hi2C0ZPzk3cbs1CKCoiAdD3TXKCD1InqTmGsog=;
 b=NpGxjUu7jsH89+TK5BRB3A8xxTiyfRwiyquzElkWGL0dmvgI1UZuj9XHpSXfpe7kNkqjeylu9LiEewh1af4MIXzDBiNlgMt60nxvPXe0jo4iChYh2pJwox9NnE3/h1Y2F0qV2qfmjPdTf5f8CZe1Ws7RgthIXDe0kAlcFyZZIzE=
Authentication-Results: lwfinger.net; dkim=none (message not signed)
 header.d=none;lwfinger.net; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1247.namprd10.prod.outlook.com
 (2603:10b6:301:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 13:15:28 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 13:15:28 +0000
Date: Fri, 17 Sep 2021 16:15:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Larry.Finger@lwfinger.net, Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: r8188eu: Fix smatch warnings in os_dep/*.c
Message-ID: <20210917131515.GA31208@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0025.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0025.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 13:15:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75b177ae-5036-4808-39e0-08d979dd37bb
X-MS-TrafficTypeDiagnostic: MWHPR10MB1247:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB124751A6C5B6B15CDA70598B8EDD9@MWHPR10MB1247.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vk7ub4IqMiSx6Xo+nKm3CYm27qdA2NDyvQ5+2ZPA9sR4cAafhV7GOCcc5JLPAh3V1yjGblIhulOoo+i70WTiTwC1TmLh9eMacyF++hl7kEdS/QWD/62K35HmLR9yvE1t8n0GmGnCUGJa9xk1ZsjP3t5D+wg+FammREUAWy//W31OjaqojnVi+eIihMQb5ZedvM4l0z11vYs1F5k2wWfj55UZm2Rz3OYQqUH8K6EiuzPKVuidQ5LTsFOlEnIS0g/V703+fBTwZZ/Yz25TaJnKPjzB4/pLi9gjlhmpHBmqn/Oy1CyWJhdkVoT3MY529ancFA1pj6ceWWGFycUDvvRNFM7H5ycmzYI+EJfgqU7RJxZD+PbtGj7hnug9+ogEu6A6r0A50UPaaX8NkdE/AXJfszMRQzRLcLY7LsQOfkJxOgwu2nDAvqjPRxGsAvs3xoTwg2eQY/CGSVk7Y+HX4sX6yeVNiEsBbGal3g1mL/quLNoY6p5tN3IJniozZuCfjiq5IagWrK8DibCbgSA1mvEth4YRjGNA2Un7ZP1LtwILqUZWq1kwuvdFJJ58FRU9JODwRjOJyUuzXdRyhIIi4p8EI3XoL150NaBrxH6myuG1YMssT3B9IAfZVFSHaQx0++QpsXz4k/oBrAch71xdFu2gP3knRjjRIVi0xJ0XbkHiKxZAV7/APt7nOE7V+Jkm818PB9nBcvFODVTIouv4cM9kMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(55016002)(9686003)(4326008)(9576002)(5660300002)(6666004)(66946007)(86362001)(33716001)(26005)(186003)(83380400001)(6916009)(6496006)(1076003)(8676002)(38350700002)(38100700002)(44832011)(316002)(33656002)(52116002)(8936002)(508600001)(2906002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OvYprpCrQeQtlrundd2DxO/+ON0dhPNeFyp7JaDvQR3i1AOWcLnFftrYfqqZ?=
 =?us-ascii?Q?QwoaTebXFESSWzoXCPu2zFQhYv+pxqXNSwswGJjpKNeOYuzcKAQW+JsqUpP5?=
 =?us-ascii?Q?RoNzwjKR4aWyLoJFD4+5ejXXxhLjtCEk28e7Ct1T5G4uGguXfKVbCaKqLiqP?=
 =?us-ascii?Q?ySK53jF+nqPx0SEiP1jObRfdrTQfWZy5Z3FHC+eznb89oPPNKvyE9d3xrR8V?=
 =?us-ascii?Q?07V84kUAJS95IQSQGgrbCwuN4YybUuWPewE8lPE/ReRvACEVl2yFsSs5mBHJ?=
 =?us-ascii?Q?siXDmTEDXi5OkwQJTeJkvzSSsb0TRaLnHqvB77PauS1cRSKinv5WcOdhj0Y1?=
 =?us-ascii?Q?3KCf7op83tDoQ3UxDz0PElYTQLUj5+hXw9mUevwHNPqbgXMMXPvAjYU0J9rL?=
 =?us-ascii?Q?bM63m/wtd2FAB+yzy8NgrcgZF7UotlDssdw1UPFHxU7h6WZb6WpNutpgQT8L?=
 =?us-ascii?Q?Jziz/3myrnoTAVjM4e+fNL2+HszuG4IZ2R5abRarOrNsaa1lK12ybEejkfrt?=
 =?us-ascii?Q?UEgOCSVddR95tayLphmMTwdLjs8cPIbt7biB3l2+Gh3PP0S7CrAUGL7Fl6Bk?=
 =?us-ascii?Q?RQexTmBGXOxyud0+HC1OZR8yINdqJEGwOvPRpLxDd/SC8BL/UrgadQsodT5w?=
 =?us-ascii?Q?4Mr5xbN/YwJMBMSZVCehC4qtL9CD1PWMbrFFbw85hRBJt5ihGWV3siCbdm6Z?=
 =?us-ascii?Q?RFh3FwRvck+zx5J2ojI3TtW1t6+HS03Xw1n70GC1uWxR1qRQZQEG9zeJV0Sl?=
 =?us-ascii?Q?gunnc82lJvDY+I4e2v9JbqBy687LXvcedwWHW93Jpw1dapn8ObanlIP7mSOR?=
 =?us-ascii?Q?wOTSJJZfAecmD1qiVBForBFP5NyVQ4KYQQKwZF+L+0ig3YxxJDqG2y1kxynw?=
 =?us-ascii?Q?TvsNqMhCB/7+khFXTBBx/V6JcySdtJ3IH6DD50S/xsKcS/COZh5OHsHP6/hV?=
 =?us-ascii?Q?yyXR+CS4K027X4O2gU2JL6NzmCTmc+YOfoS41yuV7n2edmbZHMAm8IJBz0ND?=
 =?us-ascii?Q?XbJc3rrxvMPhf1yfh/aspew7GE4uUORF0oeAhLrudA3Zd/Acr0MyHfdWk6mN?=
 =?us-ascii?Q?nie1PhHjgloDsBTi+4k8HLJrxfaRav9RI78uKWZ7+LVrG6zjWicxgCmnIoYX?=
 =?us-ascii?Q?aLbTIjOoLKDpUg5yc7ocOBNlM+QT9kDtQK8l6Iv1DREx7anFXQH05pP9FKds?=
 =?us-ascii?Q?9bPqsRpvhLlCRiXBXZsGvUkxnRsK84TYnCJ8SfLpiCUs5lNEWvQ4WF5/vJif?=
 =?us-ascii?Q?sFkChwoYXAuw63g04U9H2h92F/6nmuxnkieEbO6la2JdHrNYClKY7SiQW3QQ?=
 =?us-ascii?Q?IWIzF1SLHiAL5Ta7B/FTL8Mg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b177ae-5036-4808-39e0-08d979dd37bb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 13:15:28.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeW+MiApDGVQhsewbKc6DV4u8Yz/W5vp6WhQvmPSxuatluzvlh0gzpwoJDNzNyfW1rJ8sR4PSsGKKOdPOfDQNdZ3aoD83uReSyUjnoIvkQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1247
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109170085
X-Proofpoint-ORIG-GUID: oli3a4_9af83vGyUIvp7d-4WBDI6N4lh
X-Proofpoint-GUID: oli3a4_9af83vGyUIvp7d-4WBDI6N4lh


Hello Larry and Martin,

The patch 0d5e4bfe47ea: "staging: r8188eu: Fix smatch warnings in
os_dep/*.c" from Aug 11, 2021, leads to the following
Smatch static checker warning:

	drivers/staging/r8188eu/os_dep/usb_intf.c:286 rtw_hw_resume()
	warn: variable dereferenced before check 'padapter' (see line 284)

drivers/staging/r8188eu/os_dep/usb_intf.c
    281 int rtw_hw_resume(struct adapter *padapter)
    282 {
    283         struct pwrctrl_priv *pwrpriv;
    284         struct net_device *pnetdev = padapter->pnetdev;
                                             ^^^^^^^^^^^^^^^^^
Dereferenced

    285 
--> 286         if (!padapter)
                    ^^^^^^^^^

Checked too late.

This warning was silenced when Smatch could tell that "padapter" was
non-NULL but Martin removed the last caller in commit c0a099b7341c
("staging: r8188eu: bHWPwrPindetect is always false").

So the correct fix is to just delete this function?

    287                 goto error_exit;
    288         pwrpriv = &padapter->pwrctrlpriv;
    289         DBG_88E("==> rtw_hw_resume\n");
    290         _enter_pwrlock(&pwrpriv->lock);
    291         pwrpriv->bips_processing = true;
    292         rtw_reset_drv_sw(padapter);
    293 

regards,
dan carpenter
