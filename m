Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741CA17C8;
	Thu, 14 Apr 2022 10:33:46 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23EARCKP029741;
	Thu, 14 Apr 2022 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=NhYZIoijGA6P9DhNzZqi3PYD706wAKrpB93kQpSy37w=;
 b=YkHOvSHKbGXf9X65V2VRC2HlxtItvAfdk5OCKghbiRJu+StxprHXe1N5A8tQH3tDJZKu
 KdbyvQRxKPw8eJCPO7UWzvrARSrKDo8yPNHI9G8o4rFFBextabXNGt0P6t4fYAU0gfZm
 rX4PEcvuDTy25DvisFc8ke+0fu3so0C+sz1Ni5afebzF5GjMoFPcg0C3T5ie3tpEWt9N
 M1sDA3jEy+os2QD3PHyAXwOB7Oc4/7r2fnckyswXyz1K9a3TQSHVA1q6L+wiECzj/InF
 MNwQwryFarkuMNoNW05UPIMNaPKF9Iye950kR/ig1HoL8JtMIJBBp5KouRXRtlv/Pyr+ nA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com with ESMTP id 3fb0jdc2a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Apr 2022 10:33:43 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23EAGM6I012774;
	Thu, 14 Apr 2022 10:33:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fcg9knemt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Apr 2022 10:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT1r++Tl/5r9OAxdML6rtDvCKbLoHSMf5geaTsKDoxngCPPBMvdCY9GlaLWY7dO685tnighmuhPAGZXLLIhFWhrJBHQx4aVbFv/1stMhmh5xVsKps1iVDzp6DRtENaS1A6x3C+zN4NWSc6Ln684NITeNJdu66OTuiToT0D0nDJVh70236Rr2BptPl42FrCHu22BcEfBcxUq2L6NGuhkv76W1QaXP9JzzLF8lLlOUZBfFnlAUoHyK59iD3R1D2AMkMFlXh67HlEd2V9URRHjOWjioDTkrkkurH+lomjxNqmvAi6RSBfKf1nL5O8maSqd7mxSgU1/lUW/8gob34VfxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhYZIoijGA6P9DhNzZqi3PYD706wAKrpB93kQpSy37w=;
 b=JpW/0Nzi3QgqtL+2SR/yHm4YnjAiuxsM5tnDPtXuX+6R0JEStPpBApjjzkz5dvih8I1sHnyj8zY+wJHKS/M/OVOOnXvdRECo0HCJwyZxxp/coOhtXBY3ledHo43YgTVT9U2kChxbs9137bOkfwaTg3/A2nDAB6NueUlYlhlkvJ98vsD1a2SCDu0a9fU/MOwI9VQG8FVatxYHxzgBHnylsATeZEjHcfgthEXN4JiHrljoSJ2WBQYxImhXgbXu+i+REPdAC82N0lNlBPv8RVsPiuQMl2vJm8BW32WSdMlWM6V9yoVVbewzuS0t7lMpD5XDp1U6ejKzZMAA0ovN34/Zyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhYZIoijGA6P9DhNzZqi3PYD706wAKrpB93kQpSy37w=;
 b=dcMi0Pyq8CpJaytrVmrf+G9Jl14lS3jJ8ux33XM9OVdLWHoXngz/VULibAljJdCC3NoBZ8prU403216AKbshpdsLFgP5u75X/zz+OleY8cnYSKfB9/CZ0AuDVjhOqu0DNDoiLF2HLCSiVeIqcs+iJ5fN3aYVK9D9Ww4ioCzVp7U=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1441.namprd10.prod.outlook.com
 (2603:10b6:404:43::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 10:33:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Thu, 14 Apr 2022
 10:33:39 +0000
Date: Thu, 14 Apr 2022 13:33:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Aliya Rahmani <aliyarahmani786@gmail.com>
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
        linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: sm750fb: Remove volatile
Message-ID: <20220414103328.GI3293@kadam>
References: <20220413203914.59533-1-aliyarahmani786@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413203914.59533-1-aliyarahmani786@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6138a63e-05e7-48a6-3174-08da1e023cb7
X-MS-TrafficTypeDiagnostic: BN6PR10MB1441:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR10MB144138B3D8F26C9E303F809E8EEF9@BN6PR10MB1441.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oZ/rSyZFVvHf6k/3K/RNtVUXJL4jTqXbA0RNT7Y3p+fYH8QBbWSlkKpdq5uCisyDpmenJ/VDBUPVthjcF0pdNcCj+5OkqEXtGHVlyFnXBBbn2Y1jDGw2xmSdYbeVAviHJCy0/59ZF9u9FmXJibFK2jzTuJNk0tQLfGNz9JVHXSEwu3rdgoPTNsDVURXT+6CTeZEVQG8vs5DR5pEe9p/dFF5Rj3EQxSQNzKTu91L+MJRVUzYdkOpy/pHfvg7jpTLG6jMUzhyIlb5DvMHyzCuZ812+dAjs1O6a/AdNmn6EQsmuqOh0BVMhLXorS6Tuy1exFz/Gy0v3wwq7KiPcwCT5X/O+JooAUFyg+NUdR4MkBP5jHfGYCisHn8eKnptqguuhXcKr4Oe27VEneBYYB5q9/zwjJFl1RI+cDOCRIjdjBuriQTCXObDm/IjQF1vD9P5qEHeB+LOXszGrd3U2d992fUn5kvjrDmKusQ+qV+Ru2fTmItDn3LeSHfPvoQVOjMkRVkTKT0MuqfMf7TwozCYotR2AwFpQ5z4on+xTJIS6+xxsACQMRr8ZnD7gAmDF5NGxhskg2hsoSoyQ8sgz0/DdqTTAweNO8VzSMvDrZlXEU/4S/F3EzqgAyXvGoSidRH/vbAvDcNlTm72BE0F77rnDBAyMK9fO7FI3FavR/LxfEd8BXmJYgU24kAoC3sXldg27QzEvF3Ok/o8H9djtQ+OAag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(5660300002)(6506007)(186003)(2906002)(26005)(83380400001)(1076003)(4744005)(8936002)(6666004)(52116002)(6512007)(9686003)(44832011)(66556008)(38100700002)(8676002)(38350700002)(66946007)(66476007)(4326008)(316002)(33656002)(86362001)(33716001)(6916009)(508600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pUO0cu6OOJ6ezHnx1ShWK0TsPPRCO7hPuiw6mLCR1uoqW18B4J6+TLM+CLrn?=
 =?us-ascii?Q?D4MogmsLp7yKBK441MZw7jfLwuaP4H/4MCVoWvFKRhDgqun3beWRY7Pvu8yx?=
 =?us-ascii?Q?Z6MKNKDYGT/pX3C5QpTTyvmX1+MmurS9kJbSRYhwOBR19gGzSDSY6NtBNlcI?=
 =?us-ascii?Q?3An5tlGTDurXmESfnyI1s3KhMVYvjW41vTc3oivVY7MpR0THG+mhW+zFqQrE?=
 =?us-ascii?Q?lQjAbcirw2cCun5QX4krEy00yaHMQu0/ZL0ATfnshX5JwZbmrq9XLQkvJjI0?=
 =?us-ascii?Q?G8ApvTJMqH0CH9o+J7Poe9Jv8eDy0z2p27stFDgOoKfWt2QhU172boLqpHoo?=
 =?us-ascii?Q?+4iVngj3M9fTEu4QP5ghNWLLCCi15Kq4tTLVQuf8nwfe08GKooYgWh8iLTIK?=
 =?us-ascii?Q?deUWI3wkcM0h3vpQApyZeBWgXdPJMT1gs2iS4ruMUpa8CyD2Zzsy3pM8fjqw?=
 =?us-ascii?Q?SlVjhYxeDyaatDJ2SyzceN1OHOyDYnCm1jE8puysZIMed6RLGa/P47SNMBfU?=
 =?us-ascii?Q?15RM78x2G5yua83USefLLhZv+ZyFUsSaB8E5ubnzPc2Y+Oye1oq2nbvH8ycW?=
 =?us-ascii?Q?1ZnTsZBcMIcKUmvCETOy8hy2Sy1+cOKn3NxU8DpjXmFX01+FbhAcPbbcwvNW?=
 =?us-ascii?Q?UekK8DX4qBh0Kb8edPimtsai6MHeX/tm9dgx5gdQ7afAzcVCX2T47m83G+dy?=
 =?us-ascii?Q?w9Qdg+rwM1xIfZirf7eJJF45i5HaPbLyhAeebKPV6l73yz8TuX5Wp/2LIJEE?=
 =?us-ascii?Q?POj45GZC2rykbNgXRD458M1SEtvdT2EzhBkEyNL4NVvf2vh/iqsTeZBQqubo?=
 =?us-ascii?Q?1vvY/CN5rJvommRARnxkcW5uPn4QRiWhL4T78mf78/bRZY+9O6TCHGyI8TFL?=
 =?us-ascii?Q?54rPwgYGIw1sERJCjmzNsVkeHU22uFiho6JCGSj1tAMuFhXo1H2jCPE48WKC?=
 =?us-ascii?Q?xOPic6VI2KLbL5eu/9BXf60nIDfrWAm+tgcIJ01PLvM+viYYZwoZBa0VG2GN?=
 =?us-ascii?Q?l3Pu4PVF/uJIQUjHzjaSN+lDpBC26lyjwUSdY5Nj8n55e+1O7gijYPX2axVV?=
 =?us-ascii?Q?9qNQAVjQWwJyrOYNrYl5JE8spNAvD3WEsXx5psz3DQk6Q/oQb57eurq5la0Q?=
 =?us-ascii?Q?j2n8B1rTAwzTGKiqDF64PcIP9hFkLt8VGBFGekQzB6Hu3yMzBKLRiqSYYt0M?=
 =?us-ascii?Q?tZFyIzaeFNYr7Uqu2TQzQ5aiKWjymrsoTnbiGzXY+HpCZTDmIXzCvvf2INBM?=
 =?us-ascii?Q?EF4wxDm0AVYebRbhzCvlQdq3GxzqkdhQEkWkFG0/iXMZxbB0I6/Vh4knMgjU?=
 =?us-ascii?Q?1rc+tPpE7laANXUYKMjIVAu41Dlgsr+6VQ5CTzTKFZPPN+TJV3x8unMECQRB?=
 =?us-ascii?Q?dONiaL6KjdbGP7zZ1gIF3NcbB/C2qoUZiOq+d2zzhn1jFrDy3JaqqmYJBsBJ?=
 =?us-ascii?Q?jbR0z8b+ALHwlZWIz9udXJ9985JAh0jdOcD5SkPZDZK5zmZgyhZxnwTHyV0A?=
 =?us-ascii?Q?hW3yYC3ER4HuiCIhgKww8O4h1pcmfIHR4pg9RWwPN/R0SzHunonZ0F6xWKsD?=
 =?us-ascii?Q?CRL72oEeUrW22O1KPf1KukbAXkDbuw8UpKIyigkplAM6f/i7cpMEjMSifF+l?=
 =?us-ascii?Q?pVnHiSXybzqf6N3ZWQAYtNoi3xFjT32O/kEDFOl0SE7eOeyZxwH/0IrpLWKb?=
 =?us-ascii?Q?pmIAHZiNqq68HiKAzGu2ejFgQG8iUyFlFpxJCrggDHZra5L7kSnKVroGKcN2?=
 =?us-ascii?Q?3pL9aNnBZCpMc04tb6jNAR4VGRMNtQw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6138a63e-05e7-48a6-3174-08da1e023cb7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 10:33:39.0158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grC9qHW4mh+4NKGM2BqJmoBT2Io9qTnF0uM+r21EtacV824buGKK1pqK2gMG7Uw1WsUKxHd+UdQXXrcqe0qCY1Tof54u45A5wGAW0vhLByk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1441
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-14_02:2022-04-14,2022-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140056
X-Proofpoint-ORIG-GUID: 4ksvf6Q1pbOzOkfKpsiF3ZjGDfuHbY3A
X-Proofpoint-GUID: 4ksvf6Q1pbOzOkfKpsiF3ZjGDfuHbY3A

On Thu, Apr 14, 2022 at 02:09:15AM +0530, Aliya Rahmani wrote:
> Remove volatile to fix checkpatch.pl warning.
> 

You want to sound more confident like you know what you're talking
about and not just doing things because checkpatch says.  "The volatile
is meaningless here and checkpatch.pl complains about it.  Delete it."

> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index aff69661c8e6..7a11f8593596 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -52,7 +52,7 @@ struct lynx_accel {
>  	/* base virtual address of DPR registers */
>  	volatile unsigned char __iomem *dprBase;
        ^^^^^^^^
Missed one here.

>  	/* base virtual address of de data port */
> -	volatile unsigned char __iomem *dpPortBase;
> +	unsigned char __iomem *dpPortBase;

regards,
dan carpenter


