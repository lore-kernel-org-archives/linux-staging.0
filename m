Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC623D79
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 10:27:59 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H8JEpL030081;
	Thu, 17 Mar 2022 10:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ft5NkSGf+Ffh5Oogy6SNemHLIn4hZZs9Rf3IS4+JGxY=;
 b=KCqJZSCZtwK87WToXVH3wu+0fGAt+dyGOggkv2ZdKOaR00sVzhg2TIgxmziORVH4Vzs/
 +BARBgntTnVJ0ABijEYEKkchF0ZjO3h2EbDYXx0/mM4Aarpprrw8Vc3qBBdK2yvaV6pM
 80ioWtuwWpkv8L8Qbbimqi3QiIz+NbvcoXdYuroxDgLeFFrlgPPC/1udg+GAvlylFoGl
 we1/ut8aOemlaT9TAE74I1ZJS5zQ7CYkMIkf+jZfB+tvecS8CJJ041HsyYtH5qolkVlq
 ZylQlxu924NWvPL6g9jBFmXKgDf6mGUhsp+IQj1ZyhfvICwcLyCN1iGP7nEXjyQNg589 kQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3et5fu90b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Mar 2022 10:27:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22HAB8tY058649;
	Thu, 17 Mar 2022 10:27:52 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by userp3020.oracle.com with ESMTP id 3et659duwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Mar 2022 10:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJzUxd1txh5ou9+9qNYcG32Lp6Xn5GvMo15ryCKqsa5ecuLOvHTT5hpzMsWf1gkp6UiqMqPXQUOhEPrntTTtxO7yXaMHFhj4CGaH4r+0v9iaEEKH3kvWLW2nR6HHdkU461ltOXuOMEVnqD4txx9VI6l2v+fIZd4Xg7Gtmy4tHs1v2Jzn4OWOnDsG86tZEn32M1eMfyDsw+bTskN4Zlamko7Tgcp6R7UESP6qi+HyZtd7jW9XrwMHRAxO2ffpg6EokFSLXNTe7x/Lvw92MD+e/lVigv4yFFkOswOKvQyPMPOMLTKj93pOFNOdCcj+ljPZAIu2XHl1ahjIPExCdHSSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft5NkSGf+Ffh5Oogy6SNemHLIn4hZZs9Rf3IS4+JGxY=;
 b=B7nQP4rJ+SGhjUWjYMhOJyTsbnQb267gFbXJoXLzK3QyxfIy9Fi65HSnBUw6IhPMgK0FkeccDXAf4pxaRctSbFqqLOuTs+kyNn9fkTIoRv1ciJMNOJuiRIC368y19Drg4bqMrqxsl1wV+bJn89T0t9I4UcUeb0WtAC1dxn8XrWw7eOMk2ZQXyYbuHEyWTDJGsGHvZOlgdwGVPjNX+wCwSgCUGI66TzDOJJ7qGhWKSzhIDnwkJOndy+NePeNHm8KcWHx/JDWFXT4bdEti8yh7sEAoDaUYzNvydcXU/zEz2qKH4DDUheqmmobC7x771VASs1xmCwgE4ReBxOtev9484g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft5NkSGf+Ffh5Oogy6SNemHLIn4hZZs9Rf3IS4+JGxY=;
 b=XhX5UtslOc6GWu8b4N0zHphSFRsUTvjOotyeETZvoLQ979hIOEsPaPpo3tQTKZKmPDkfg2HCziLRCTf0QYTa3UU1/aY5/nJmSKHrCuAyX01ESFftlCccg3uufuxkGzJm5ryIa7ahGIuclgNpHOXdtHGkny4U+Yajep/WBtGmM3o=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1315.namprd10.prod.outlook.com
 (2603:10b6:404:44::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 10:27:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 10:27:50 +0000
Date: Thu, 17 Mar 2022 13:27:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <20220317102741.GZ3293@kadam>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <20220317101942.GX3293@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317101942.GX3293@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc4346ba-06aa-43c5-06b6-08da0800c967
X-MS-TrafficTypeDiagnostic: BN6PR10MB1315:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR10MB1315532E403001A98C8412458E129@BN6PR10MB1315.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZCxDgZLOjy5FJ2L879hFWj+J0OrmyTvR1JMYlEPwu4z4wD9DLmYWUJkxgxCG8H7ghdzCpOL0fJ+t8wC2rxENUQL52/r3i8FDwdCRZusCmugqIDIq2NZUlBhpLQpLQ0gbLrd6GrxtpG20olhueWGURCO4jSipBZ1fJkbqWz4fgPZtpAf+WKwSm21Ur2fLp7fqnvm4D2HSEW5mKf/6Lfr+uQH7lD0cQIml5X92irAfVSkfPYImKXeFoD6V6mivFftXUNND2EO7zqywW62Wy0A90kguPD9FYEp4WKnm+pmPiKWDk9qw+55pdEC+G3eQpxbAkzugDZOePwNIMNnhm1hPHX582R+jun3WEQ+u/oU9hFyZ4jWxrvotkVEh3Tb+P9tfMI9uT/HLZjpAzT5GY+slfBZnOT5TXdc2vHYTmhtMedVPuwy5U79QFa/wpwO0AmDePtvnGaIPwfZtNJ7Jd0+QAhe0FHU/lcH1Dn7RWZjVyPK9kAm/9I+HgWon3+t8l9AIAeGnzTQwITlaOdIFfqhlm1z62toaGGlpjb6OIItqOH02g453gK2SwldDFOajVJ93Fw8vR60TKBXW6MpfQL+CY0PO7wExAmVOFDUJl8+Mmk8UBRnL5zYwTy5XFIlUP2gAXsflFdLIzlmh6a4OTlMRO/nUNuUjxTz0/bI3/7M7whwXHC1NLN3haOS1JT95qeEoUiEK0zARsA6RUklSrJjsGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(2906002)(38100700002)(38350700002)(44832011)(5660300002)(8936002)(33656002)(508600001)(316002)(6486002)(83380400001)(6666004)(186003)(33716001)(26005)(9686003)(66946007)(1076003)(6512007)(4326008)(86362001)(52116002)(54906003)(6916009)(6506007)(8676002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iHXURCRRKhsCTKpB+iIdO7EzqY2KxmngPgWnpBh14QqM1yyIIjNpmwsUNf/5?=
 =?us-ascii?Q?ylQx1rzfJVmmxp3VTiXq2anLTm/uI3UajTwA2/2DEMEOtPnLmaWK/UA/a7y5?=
 =?us-ascii?Q?8drR5sGWmzyC7yETrJXz58DhuIsTRvJikw6nzlY9Ekq3ENiFXCiFCCBf0ZMC?=
 =?us-ascii?Q?b48gBcyJfthkgF6N7+TJR2PMyRVsgQkCXQZD3jx04hriOdMlrZhcX8RdQBLx?=
 =?us-ascii?Q?yvHQuxTPj7AipiO7751QTCHJ/Ko90cSfj1RaDvwrWD2QG/PthwGp5RLo7wrl?=
 =?us-ascii?Q?KM301C/4ukyMEglpFEtSDLexQCa40p+gDrthdj4mbIKLV8Nqb9WSYEWK3EpJ?=
 =?us-ascii?Q?tLjbtWGOdWkPk53tV/3H4WES0OIJN0n5xJOGMiB5kppSd0+nVP2FRL36A1C9?=
 =?us-ascii?Q?yIwPzmI7k7PVD1Amwi+r4WX5cP+nHQynNECJ+VDnjxush/6eYQwR5fBDctPv?=
 =?us-ascii?Q?fYiWxJr8BUrDeOvrAAqybzcXzqSffSS5NzXvzJ+H0dyKTMg/m4JbUBg9IJcB?=
 =?us-ascii?Q?7QHNbxSl3rGe1SK+30L2kEu61yjmfI/1ImovmXt+Ik57WiaRejkodl6VS2ll?=
 =?us-ascii?Q?LGNVCJY1lj62NC1DbJUAl4nUmFY6IyW8SmVClPToNd/ZlEsnWLuc9uPLvu/X?=
 =?us-ascii?Q?BPPFtR8y8jiX4lpX/tfrxivoockkcEyUAREuRB4psO+L6UXM9/Skqu/FN23D?=
 =?us-ascii?Q?j0mMzKZUOeyRIvYTX/NmdGNStrIk2modgcm1MFuUx9YF08Wuz+bZUq/L37E/?=
 =?us-ascii?Q?JQBxnvWuix8FxLLCJ+oFVQzC6oUysG/awDZoYu2/Vsfwizo5kfsKvVqqidzB?=
 =?us-ascii?Q?SEf+RnppIklgMlXCqMnYGW8m4ygPB7PPCwyOc8TTbdx2ebUuNh8ZM6OuJBmE?=
 =?us-ascii?Q?FajLm/ZlBcCfp82ep0X/GRsQgprlgFQi79FWv2HLtXDna4deSHEDUkpKEcVu?=
 =?us-ascii?Q?4b6vvoEciZ5uN0clmbfiKNXIqS+S2VcqXqgdommeM+Pi2lz4++ta2E3N8Utv?=
 =?us-ascii?Q?cA5MXgSQIhuIsje08L7nfnPBX0JWEtZCs4eyR69yrhCBmnnU140PchM2fUIv?=
 =?us-ascii?Q?3bXbr6hD+gHTe98VmPRqgucT3cJKiKQYjvA2DfFTMoK69WqOmcvzIa86H/SU?=
 =?us-ascii?Q?Q61mB0FtqV5ptO8cte4+FtvXTwpMmu6m21JzSCXU+MUTReAgrHqB8I0WGLlj?=
 =?us-ascii?Q?URoK8p92csoJ5Xtnrv9uERcklJjsKpmneWh/et5deoSFZp+3Nf4iGuM1XCoJ?=
 =?us-ascii?Q?V5rRPJ8/rksbP+Z7Oz5gPqwvUubrFa7dNKo2/ZZkWzl6yPoKv1EO1UucgfrZ?=
 =?us-ascii?Q?cNCgAI0Ss9p0Z3TjS+IZAyNYuV2AWGe94yncrkzlDPpaCUvYp8ld0NX8fFSB?=
 =?us-ascii?Q?F3BaPfk+/rxe3eKP9XurT2I63NcSR1qLPGdT+GPLcxSDqTo4neEx7I99c+dv?=
 =?us-ascii?Q?BEThSVXkp4r9v9xjdX6OCb5qq4Dgw0JXo2qYoeIDuxzU3ikKJQqbWg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4346ba-06aa-43c5-06b6-08da0800c967
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 10:27:49.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RT+dEM5A3Ou81Cr+6MvjvSYvWjJ3NHqHk12dPI4Bn/cz+JBNjKDn4Y4NWsg586J2Mj8m2xyL5bVU1dkyyUxyFuDFChhFYZkjOUUigHmgGa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1315
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=866
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170061
X-Proofpoint-GUID: tGWUkfDTYKMSy_X64b_F8xVsKoXwqaA4
X-Proofpoint-ORIG-GUID: tGWUkfDTYKMSy_X64b_F8xVsKoXwqaA4

On Thu, Mar 17, 2022 at 01:19:43PM +0300, Dan Carpenter wrote:
> "new driver" is too vague.  What is the driver for?
> 
> You need a README or a TODO which explains how to move the driver out of
> staging and into the main kernel.
> 
> Run the patch through scripts/checkpatch.pl --strict.  You don't have
> to fix everything because this is staging but a bunch of the style
> issues are easy to fix so we may as well just do it.
> 
> There are a number of bugs and style issues.
> 1) Find and replace every -1 with a define or a proper error code
> 2) Never do assignments inside of a condition
> 3) Do success handling instead of error handling.  Try to return errors

I meant the other way around.  Do error handling.  If you return an
error directly then code looks like this:

	success;
	if (fail)
		cleanup;
	success;
	success;
	if (fail)
		more cleanup;

Otherwise if you have two successes then it starts getting indented a
lot.

	success;
	if (success)
		success;
		success;
		if (success)
			success;
		else
			more cleanup;
	else
		cleanup;

Pasta.

regards,
dan carpenter

