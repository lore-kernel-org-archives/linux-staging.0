Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C61376
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 13:46:37 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DDYiDK015684;
	Mon, 13 Jun 2022 13:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=zFMfGMkq+cxHqPgN8RM7yemRXHvxRjVpVtqtigPtVjU=;
 b=oBHluQ62ZsrjC698gtJ/cqx/YWLJNLV1KcjnKn6DQSEmBXzmAOoFGjGwAOw4OglO+22c
 Mx49mtspK3ntlUihvERawMhuv9oO5ailqkSkdEdbQNzX+XhurlMQf9HS1y9rBDFxb8MR
 gOAzAK1XXRCcRrastKPXJj67hpLj5Lfkr5Pt2wyxv3g7wA0kwLUDJu6tQQfPMjTYt4R/
 YA8wK6OM+ubjydaim788tCn98QS4n107/ho0kYz8bP6XCXXvymFsqJVp82GSOCh55fRp
 U67RZhVDhHnONcUpjcKCjDMWWyXP68Tzz1MuxbICHMIol/IE1pjK1NHNoYdvAdxQBQas yQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0b629-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jun 2022 13:46:17 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25DDaFWx038566;
	Mon, 13 Jun 2022 13:46:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gp5yv8rps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jun 2022 13:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3Nkx3dCQ+a/XX3yc8c7a40IGCqDZUhhiAuFHyzLld2dNnrxpMfBgJL6DrEcTHu6onv/jjen3gxFwhu9Wq7im+NfWvA9wXmh3ksGqR+RA7QEJOYgfAavWp+ocOJA1JmPv4Xm/a0gcYvN9YatqxnJmt44vjxRpjWTDlwxBchjO6Z/G7UfDaGWygDlmIGRtizAsVjZyKRTzQ0tDz5lOR9SPDFax/fT3vZzPHRpmGbGcI8c+V3W6V40lltxg+iJpABBXSyUFYhMFNqDvKNPE+s6F072X6fWAa23f/F4VEYwCiUA76riYVTgJdP+r4FIM4+u8t4k0Jo0MH8ywTS7Kixn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFMfGMkq+cxHqPgN8RM7yemRXHvxRjVpVtqtigPtVjU=;
 b=Dkv9CjruyNGmgZIUuR3RRx1//OS+gU9/atUJ6uf58tC/su8gSht+bFkSpUqcsf9QiGl6zX5LbCqi7BN4ojnbE3f09Yf3f0H8ORvsJYl0Ei5QMaLOFUYYscmRs4OGGsqb8amjniJNt3h0sPTUz0wkfhyPR4sfqWel+Qxldgw1/DiUOmLmIAknw25cWnKy6jawgd6QGMz2eT0DddRdaoqsQOJk9q8zuGDXullKKmCOQtzGzE697MVfATNCLGt4eJkrWrnFl6wESEwfxY29dRnC4l+2MGLJ0+IrHCIYHFD8tgosqoXnkfKuMTSITANOlhUT5gnsBGCao4kEvvJK7b9JXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFMfGMkq+cxHqPgN8RM7yemRXHvxRjVpVtqtigPtVjU=;
 b=PfBRJFb456QFWNlo2ZjvfLnSQjZkEpCf40mv2kIBIs11+rIiw9/r58hJ8gPafZnYi5JvMgxsy3suGcLv3LFmqCuoCsIfWdCxLdSqnr4HxHRhx8GJkX5Y++Oxc3UT1BzAzeBopJSa319rpwINzP/VIb5hzwAxDziLFKMW78ejxdY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ1PR10MB5932.namprd10.prod.outlook.com
 (2603:10b6:a03:489::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Mon, 13 Jun
 2022 13:40:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 13:40:21 +0000
Date: Mon, 13 Jun 2022 16:40:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: athierry@redhat.com
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject: [bug report] staging: vchiq_arm: pass vchiq instance to
 'handle_to_service'
Message-ID: <Yqc+Oavmh0zMRVPQ@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0144.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 722e443c-e6e0-411b-1849-08da4d4242bd
X-MS-TrafficTypeDiagnostic: SJ1PR10MB5932:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ1PR10MB5932BCA41EFCE366A69DCDE58EAB9@SJ1PR10MB5932.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	czkn6MTohx63NTCCK/vCsDJpcylrMoAAHMOnmvrE/qopNji/0D62zQ7YI863F1NZAUrNKgt9gKzpX8QDQaItuqYzNuQpDgkjN94D48rO/0R5o7diKM5LiqP/OQlHj6+Bb1ZkwzhsRCeKISvcP5ig/cCZ5GUwbKcgoti3EtM1jGslQXS5gKXEa1g4++TrFYrel71saHIwwtyMXdBvVLIGYZcc6ljpiwmRg9ajnGhbDrEQr7uxLVZnsbcFQuFsCLp0LA95/zqiBnqthZOwQFvvoYy5i1ySyrLUxjH54ygX7JQYZ6KgSDaNyVgbo7gIcnsfIQU7zpAWsG7sb+9E/HtYGsPbEKDjSJLaYI9GfpxbOzpcKonaZ+w5p3uYWIdPLPuXS++XqnTsPsuaZKKBXClZBT36FoeUPlRzstjGohmm9Q4hDaiGsVldJGUYIiq6VipDvh20U9QKrWoirHYuAwfmS1OvlApYf6DYlhT7YeOnmmxSkQBYegyyJaPyIElcHFUrkKSv30Daw+mltOCguV8u+zNWqBHedsX5FlmjYFxnlSlxtVYH66PHaZASb97rgpRGpEpMIJzghO35atDvEkmvhvFSp2fSxpj3LvE/moi7hGA5gQFdM6cHHAwuIb9gzp5EzurqqL1tYYlzlhyFh2u6M0vE/nz0fGJzTcggHV6gNFA8QdGye9KTunArYLEMO1f1YP9o7nIybqoe8pwoakg9C1+wXJceXUpcVs24GUPOCkM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(66946007)(66556008)(66476007)(4326008)(186003)(4744005)(5660300002)(9686003)(8676002)(86362001)(33716001)(26005)(2906002)(8936002)(6506007)(83380400001)(6666004)(508600001)(6486002)(6916009)(38100700002)(44832011)(38350700002)(52116002)(6512007)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZWnIsODdQ54TWUqXuShK90w365pJ1Pt/pa77siQuSYkdPqlWPr1Quy2+UE86?=
 =?us-ascii?Q?dZ9T6ntrdftVWiwFJaZsu3waJRJgg3dIaDDlAqhXZEyZAaSpVbdiSETc6AUt?=
 =?us-ascii?Q?D6KvY+1AhnswZ5V0kn85Mj/QBCmIigZzIAbu+eMQR8kxVrA0dV/+XCs2RzL1?=
 =?us-ascii?Q?uVNAPi12vwVmyOIquwDwPrCzXlzAb601kuKTqoIJnf+A+BC1obaWbhII6egU?=
 =?us-ascii?Q?bPZFhewRdoaU+xLqzA2K9V/v8AoKKk6CD3s9feYoZLqRdksw6VuYglY+NG9T?=
 =?us-ascii?Q?QF929k8L0TZYeDmon/VDxu5BM8rzbj16D2+dkHA3Pyyn2jaslNQQYqsJVcai?=
 =?us-ascii?Q?NaVtbLrvTWmnskcRciVKWSOKS17m6XYAqUXuO5pR1wc7tvi/0FchYG+jugoq?=
 =?us-ascii?Q?ag6z8gDEa4/quhiykHJHRyL+KA9vDBm836RxOuvx9Hur5HmIx3GtGctEGYnI?=
 =?us-ascii?Q?GHdiWu/vCEHq3gNni2Cm37HSRcvmU3H/1e3Ro+6+/Pz5YZZ4G105HGHmWCKX?=
 =?us-ascii?Q?BQB9rUcm1F0v5gtzIG/eFoq5r9NCdn4bXPWEMuVkr1a+QxgL2QmjEO87jI61?=
 =?us-ascii?Q?UcWnd3EBYXZ/pkF1Lz62V+OISelVCRY3EQv1daO0dJulqVz2ptCnGy9Gnyjb?=
 =?us-ascii?Q?pT0WwkAaXB65q2PiXSRA4FgJIEbDXXiFNov9RbaYiP09CREp1C4r/nQN0HwO?=
 =?us-ascii?Q?NG1PBAvEnxMg/ni/JAgV59fQrlgTPQzzF23KY/Qws6iWF5i9Iv/l7c0B0Rjt?=
 =?us-ascii?Q?Mt1KTV7n8FRND8pu9g477nhjyndjk6Ft+ZlcV4+0ld7MYt1n3O5Iu6oMH8jT?=
 =?us-ascii?Q?TyUEkT8nfnRY4b0KXKDpLvX/qzh9FkiKSBAGowCLtNTjAOHWb7ofBKUiCAaW?=
 =?us-ascii?Q?vFKBoFnNCmbc4KfgLadpusXHrYdwyJ/Pwf3lhjSgChKNw4SF8hyR5F0KlxkG?=
 =?us-ascii?Q?5P1TMDqXEtVs3TRC3e6MidacIA326ZlkBIR0MC02yz6OZk1WPpc27KmmmwGH?=
 =?us-ascii?Q?Yeis10uKM5A8gucLrIxIyYt9klbcjt7/vbrFFQzmNiF5+a78tzejpaGkZtFB?=
 =?us-ascii?Q?vrQp2qfC8VeW8soMY9dEE3PeR+hCbbibQrQMAA6jvgLmdAKZClyGIhnsmtFL?=
 =?us-ascii?Q?FVrzrZqPHAZybOAJHdpkzwTx6YsJwCygkkwgXpIxdxmZ8Dn/r4RO3bzBqa1x?=
 =?us-ascii?Q?7FD7JhpdmUUFYxP7GYIK+XR6pzRqZln9hAL10p2XBOKHcE1cUo4hSaOP3HAb?=
 =?us-ascii?Q?nyrPDvHCFemMjoM0nfIQtFkk96HVBFaL2IQIUv6uzIlwmHgFzXd+22aFU7D8?=
 =?us-ascii?Q?E+WlfUrlhnQcU1Zrpsed6oyuLYb1q7QpOGQnIGav1I4VQkcaNGGXzv5eZEF0?=
 =?us-ascii?Q?bNkEifB74i3f1VqSbToCxC1p/Q07Y5lreEUFdYDlNqXPKXaD7RHgtE8l9UiT?=
 =?us-ascii?Q?AQj3ZKwE/vWJ7Hv/G4lS3J6cWtQylLOCA8VdNKvKk/zud++pyuevcF1RdjLn?=
 =?us-ascii?Q?xXwOqr3X/QtG+BwogdvSKmVNo5MHGW8g+wonLPdbihnp9w7j8gUGBvb2eiBx?=
 =?us-ascii?Q?D1bOJPmh4o2rmmg024YW7YOXD0spXU4wRBngro6NntV2h8MtH3jC4qNJO7ha?=
 =?us-ascii?Q?3fJ0Cjg8IAUx+yJIoZhP+LrKRSlc+5d23i21gO0gx0O7/ZV6BPKU/hFcOOMU?=
 =?us-ascii?Q?9k8Xc5Q66WK4PnhhSDGJm2RYq4BrP3b6hZCbf9fvdBnn+c1AmVJONd2+yTRL?=
 =?us-ascii?Q?mfKuPMedj6qOmnfHKukWmG7ykDp0VPQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722e443c-e6e0-411b-1849-08da4d4242bd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 13:40:21.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4frDYfdt8dAb0MKx/9W9+gRFWt+nvRudAOvruRhT1+lBdyl16Hhhxp8ZD99jsvRi32CL6w1WdFhk70qPIk54CY1s6em+AFJRMPZQKa0g8LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5932
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-13_06:2022-06-13,2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=626
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130061
X-Proofpoint-GUID: yaGcurlhLftD7Df4lYp_nlKDJeYJJ6Xw
X-Proofpoint-ORIG-GUID: yaGcurlhLftD7Df4lYp_nlKDJeYJJ6Xw

Hello Adrien Thierry,

This is a semi-automatic email about new static checker warnings.

The patch 6d02150cdf76: "staging: vchiq_arm: pass vchiq instance to 
'handle_to_service'" from May 18, 2022, leads to the following Smatch 
complaint:

    drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1070 service_callback()
    warn: variable dereferenced before check 'instance' (see line 1062)

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
  1061		rcu_read_lock();
  1062		service = handle_to_service(instance, handle);
                                            ^^^^^^^^
New dereference

  1063		if (WARN_ON(!service)) {
  1064			rcu_read_unlock();
  1065			return VCHIQ_SUCCESS;
  1066		}
  1067	
  1068		user_service = (struct user_service *)service->base.userdata;
  1069	
  1070		if (!instance || instance->closing) {
                     ^^^^^^^^
Existing code checked for NULL

  1071			rcu_read_unlock();
  1072			return VCHIQ_SUCCESS;

regards,
dan carpenter
