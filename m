Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A0C2C85
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 12:51:09 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BCTKHK022710;
	Mon, 11 Oct 2021 12:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=LRLKZavB4NhfrW9PQy8rOqHgVPMhtRbys6IrjNIkmL4=;
 b=V2hCWuz4yEHTJ24SwGlzhQD2lPb9OjNtT/Kcq5c+qQXYlW31seAMSQPUwIW0IuaZcdno
 VA9Rlu08ZThzUruEyJPeZrTG38pp4D/PqlgkU11EfAhIT638IwB9z+zkSdRTvf+WDv9j
 g2jRIlSyFXuDgrgW6kdH9nqgXFhr37ywxUOmYfzD8JTxAfnqLZXGD4nljjMU5dxCwQjk
 uNYrMmW5I/YMeoi2jUcgsszChjNqjS22M08F+i813vgq30Ntn0cP4K8APrBHRxyCkqtO
 qrveHGUif5VMOtlWLcRhcFV1+DxdkRz+vfZmG6JaNmpc4HfAagaJU2qpizxJPktPJzjG +w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3bkxxabqmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Oct 2021 12:51:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19BCoKb8023107;
	Mon, 11 Oct 2021 12:51:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by aserp3030.oracle.com with ESMTP id 3bkyxpva0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Oct 2021 12:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhaGSoqYfXu7IomqXxbMECHz0sZMulTHKfjilrAE7Ux30toirS4cNyTND23IK6Yi0MV7Wx2YihwTsnptfxEsjDhDVOAvHKkYxl/03Mwp8gffwMBdXynPZQiYll8aVvOhQiL+SfDuoxDzojrtt8MVR2gRHbeobonM00ioHIn9JG1G3FV04+aSq0nDCwcP3w5mE4HzVicE7aA2oJCYhllNoWIbXzG5XSSwRE05FrtUdGakuqmAq6KDa8KiM1ZUeJ4AfoJ9yPm95RvKyassKMJDErs3xjRy65N0HkRUBnIEk0CLb2EyoHiYjSgCIaoUkhBxc9g9B4Q7dZv45iI98MilJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRLKZavB4NhfrW9PQy8rOqHgVPMhtRbys6IrjNIkmL4=;
 b=AqXsX/fLGx/aWzie6a+J5aq7vJ4JpetkDSnurC3jI0MOWfzE9MCckDvffDfhg26HRPA9YCAw+afrh9YtSp1MeQ3pt09XpCJqRx/GvlHtoOrgo59lw6aUtF+iaSwcQ37V3W3SZGfWyIQiRCzOl08pgOf5H0yF5HnbdzpKN0TVakNA98CF9mLbgwVGmQ3/L5aw3FIuOPZ/fNjockSKAmFQordPcFlpDqcCoCemzUFZOgDJQ5MxbXFKSCPIxdOGwdUitCbVz6hTFvU1r1RLtjYjLhIXZLwg50rW0uFCRWT9/wTqQbUex6ap7Gb8tuN/0Pf7TU87NnTAO4RGoAUOjCnhhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRLKZavB4NhfrW9PQy8rOqHgVPMhtRbys6IrjNIkmL4=;
 b=a6ZvWlMlZhkF8dhi+aCrqdKqnQ66JbwIbtWpFcxgrzuDGc3echZwGecbs7b68VQWCrBwGRTQxvRU1Yt2Pdj8IrqgZzCKQD2C0WIboIPfnXtNTGkA9rnXFMFMncLmG/z5m/u0n+K9uLSqffSQBdP4apjBnAT3oi3wf03zzffoDBY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4483.namprd10.prod.outlook.com
 (2603:10b6:303:98::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 12:51:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:51:03 +0000
Date: Mon, 11 Oct 2021 15:50:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: hdegoede@redhat.com, linux-staging@lists.linux.dev
Subject: Re: [bug report] staging: Add rtl8723bs sdio wifi driver
Message-ID: <20211011125046.GC8429@kadam>
References: <20211005090646.GA18431@kili>
 <YWLEQcxMY3sX1soJ@agape.jhs>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWLEQcxMY3sX1soJ@agape.jhs>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0058.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::6)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0058.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Mon, 11 Oct 2021 12:51:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7afd378-6627-41eb-0f8e-08d98cb5c8b2
X-MS-TrafficTypeDiagnostic: CO1PR10MB4483:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB4483ADD860B5713C180B1D3B8EB59@CO1PR10MB4483.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pRwsGXD7bkiEMp4wRzoO2Z+4aPOX7A0CVJ/ISLE/nQjmkVio4vqSbw4VPOfO+pYfxrNji3BlNuJEpT0NFovy2qpdh2G36ghZoQdCft6NEkKTjik3UxHW40YLGV4pb0cAzhWqhwvZtBWWi4dgy9EOl7fq4qYmPEaf/wgX+KCpohB+Dj/g/WWewwmBaK1+DmS1qYYk1rwVv1/LZb0KIuoB12ITxZNJuHgS9mRoKT1b4nm/ilJ6Ds1Sttd8ecyQ9r3s7u4+yis4BI/ZDGEWnZT0r4n/EXQ1Zhg5WBEhbojwbzdXBJIvilQ0+RgIGXkm6+MpNgiG+l9l4NJyP6rfvBCxGggkI3E/L2XB5M/KAh7uaYbd4fg34ZadXQlGjBFh111zIMXOxylN0T6+lqK4zubHAIzXnYUctkcNTdaqPp1sRNRqhmUg13auGsZNuajr7VO6X6Z4K3juvxOHEa+T0VmdCYk3TN99tfmIpH589EG9/iwE8cZwcCBqvkmN9RTlYG4gmtuLe854V+aZKEBM7MlSFXpwS6GKzDSSmhJib78qZjStKV9TstfcQfa+Sy20V9GCCUcZh8WqJrZc+8iKokGw/dOjnKFeXvSsCPuP+EAQSw+VFF9FK95Pjx3BKHR6OniLC4tVu1f4Esu5bGYDW8RcAhv1XZvJANFJWHJZ7egR4F9L9yyuqbYCinQ65coN+4K3fNbuqU/dNFgqcUHnb2bwVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(66946007)(6666004)(6496006)(316002)(66556008)(9576002)(508600001)(52116002)(956004)(2906002)(83380400001)(4744005)(86362001)(9686003)(26005)(8936002)(44832011)(33656002)(4326008)(66476007)(1076003)(33716001)(186003)(6916009)(38350700002)(55016002)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y73TTKw3eVcCeedYZCb50QzfCsEZXX+wpBRNavUr006BCizWwssp6uzL3j+d?=
 =?us-ascii?Q?SCBVsJIhj9tdc4qql4GMSG8TSx4KLHBRoxp1UaYHb72t7rPNWr8w7MbXRSdi?=
 =?us-ascii?Q?LOcmfyvQfCh0YWuD0cqWbhzKjdTx8MW6KCviJOZe/dLj/Bmq/R4caM4QtoFW?=
 =?us-ascii?Q?Cz4yjbvP6aJrRlDp3DHtnnjvffkHKhNYzxy14hwV9DmGpB+ghvAq0crH01YG?=
 =?us-ascii?Q?ADeGIFBUnRYdCv3Aw7MFcKz1N9hJ18mm+PLxEWEsFojwobaWZClYAUe16QGX?=
 =?us-ascii?Q?bhYjSn+paUrxY/JVc9pqeGY3TX5gDbYf44Qi7xodxdOigbURtZmwDpnTGgb6?=
 =?us-ascii?Q?BuHWOzhm52Gz29FCElfQ6eXTWVdqdmanrwIzlAyFmgpsVXdLfx7R4dQazbJK?=
 =?us-ascii?Q?MTXQprX82q4Y6ahtXWWd0AHpULRxdAV50LPenXuyoXnQPem1YozYDT4kDUvm?=
 =?us-ascii?Q?KIPEqWVm/XQ+CVwFEKw3pqXRHbi1zrvnGotsDtwQRzguwUcpDNJyjIpZmeoG?=
 =?us-ascii?Q?Qji1V3rsIY8LmKuJc2yNX3ukHU1tmOaYEKFmTojtkPS6guzAN0Hkmo67Wriv?=
 =?us-ascii?Q?RHnH+DFm4ptg0dnpdi4oJLtx61oKIMVCnLOrR2WVsVUmtWhnS+ylHbQ4dxSj?=
 =?us-ascii?Q?AWlkXR1dIAE/lNoEXwK0cDlvSt6K6pRznXc6iPuJrutoG24vl9BpfIxHXBBr?=
 =?us-ascii?Q?z+zxP8BBW61gMsx64L8rte+tl8JRW3V++2+ZVjfv1tr2CDTPRJupuaXxG75F?=
 =?us-ascii?Q?9L1h+LPo1Wg6oGjx4DupFrzhqipIVZw6PaDvrgc06pCzVRqxAdTJHzBiZdUn?=
 =?us-ascii?Q?1m2EwuMhAeAUtD3K5+LKq13Emt8YuD7FUyCFD2FiMCkFmFbmYW6kx+SFZoA0?=
 =?us-ascii?Q?xEkPWVKZDSXXOKpXCGeyb4NtYRYcOft2zvN+hvqc5R5fvYFPCo+T7HWgeJcy?=
 =?us-ascii?Q?wdkQXfnS5AVnjYelm3b8DLBwj11yip5NSzDVnfFDZRVFgu9+8/I07JmCKdcm?=
 =?us-ascii?Q?QJ/+frngcXjFSl0Tln5nLe2KYTpb//p0wephMx8uiKs6ZxLcd+Shf/VKHZA6?=
 =?us-ascii?Q?U4fE2cmKQhZkdJKfGewSv2YfNwUxhQ8DZokb8boliKz7+I/ZKIAxQDwsbAVs?=
 =?us-ascii?Q?SsaqLPCR++GjtyxBy5vUVFljRPfPTv8pKpaPHPU9crNExED+GqQNOX2nUz1i?=
 =?us-ascii?Q?MJsk1Lk3FVtRC69irmD9gw0Y2yH/Nptqx2cZVxJ6KNLdBEvKP+Ktu7CT+Jfx?=
 =?us-ascii?Q?959o5y1c2iZ7bHuJVuLTzhm2t5cN/Kw/PLC8ZANacPOJtDW1aEKK7BHeOd4t?=
 =?us-ascii?Q?Gxaa3kt9f3pIVvGAhGeHecY6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7afd378-6627-41eb-0f8e-08d98cb5c8b2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:51:03.8514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xWnNv9yv1m04u7w3rULyMH5vrllnc6AeMEYSDwKxS6ROCcyHAUBU1+/pG8Bau6s7pOz1T+GKNpOzfJ17Jbof8Jr4y06b5NtN4maPtMDy+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4483
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110110074
X-Proofpoint-GUID: 1L6BP4fsEb2wq7L_MmPt7C2nBuoHSvM4
X-Proofpoint-ORIG-GUID: 1L6BP4fsEb2wq7L_MmPt7C2nBuoHSvM4

On Sun, Oct 10, 2021 at 12:45:21PM +0200, Fabio Aiuto wrote:
> >     1406                 /* BIP packet number should bigger than previous BIP packet */
> >     1407                 if (temp_ipn <= pmlmeext->mgnt_80211w_IPN_rx)
> >     1408                         goto BIP_exit;
> >     1409 
> >     1410                 /* copy key index */
> >     1411                 memcpy(&le_tmp, p+2, 2);
> > 
> > But this part seems totally wrong again because we haven't incremented
> > p.  p + 10?
> 
> I don't know what you mean. I guess that you are adressing the code above
> (lines 1406-1411).
> 
> Anyway I think the code it's right. MMIE layout is:
> 
> 	1 byte element_id;
> 	1 byte length;
> 	2 byte key_id;
> 	6 byte IPN;
> 	8 byte MIC;
> 
> so to access key_id I have to increment p by 2.
> 

Oh, yes.  You're right.  I think I got confused because we are not
parsing the MMIE layout in order.  1, 2, 3 4.  It goes 4 then 2.

regards,
dan carpenter

