Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48893173
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 10:00:11 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20P6aJjY001330;
	Tue, 25 Jan 2022 10:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=igw1vSvn55i+5i4ePREKMzAF9oPOD8QzYaFihG/N1sQ=;
 b=K/maH2ALgKjQGEKVp4JdhKfTFEoUL4pcJZIq/WJ03SHZfxm6ptKovyTjcZcTIZBM6e1+
 kSbQQTkj4qSHsh3EjZsmoietp5cPOEjYuy3RIN+MqNTVqfADTKmaAIFBTI6ygzUYiy7a
 7PO16f9DZfT+p1gS2z830DwKY1TJieTObCdhOVLyJlOcuOpcME/9gL15mtwR5tXyQaGp
 r8YWukW1DEXi/1evMUKPW8mFR8Biqej6TGwYipZO8xvCwooIK2KguDzf9317BJgO4mDo
 XGJXUxAgUGycD62A+CdhfH9yDuwHiODVpYcTDrRznLU5IjRhrx78jiqWw1bzmDhOXLBt 8Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s2hr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jan 2022 10:00:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20P9uQFw163540;
	Tue, 25 Jan 2022 10:00:04 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by userp3020.oracle.com with ESMTP id 3drbcnemqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jan 2022 10:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6kRP4xazgZ52KvVt5oom53JBJMF/fi6UaKO2pIbHrB4HpNCSjkWjyS1OY2D+VRs8UMY98YwBjj0dCRT9w3lZB/ik2X14oMzIpV3poMafa0E7OsJzQ+C/FuyF1QS3xUi8P8ZV9ydSxwo4ms9JfW8qhQEuIp+MxpfkgGXFh6E5icCSC4Mu0ItoWd1bVOiZG9kiyR9EI7HxrDVB4rb1xAG9JC/fyPjUtWA0Ygrw4j/g8RlUYeSBRqEwKy8NS22NOx0Qy4Ak4gTxOYzOdmwaAOW83VzrbCYKpf/B7ZXtq3ygzOG5ytNdvgHEfJ5soCXDVBhw+kcNGYpjaZfZp/tFVEp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igw1vSvn55i+5i4ePREKMzAF9oPOD8QzYaFihG/N1sQ=;
 b=i9jGAS7Fpk77/nyTzre1iccu5nHPNS/fGe2e6Kx6XIPL5CI7wuBaGv2EuB9QGfQwoInhEks/GQLXwNd6nENC9UYl679soclN5y3fF1rpDFUeMVfMdJMGYRskZXKNekpK6V6r4l3GFmY0S5HtOi/n8SXmVgk8P7CCpvOxojAnIjj26f1lyaDA9AgcjUwQvZrUIyhAAxSSJ+Jnn5zdsoUg8b3+uMPEPmZY9fMuOycBhyEvOZN7FQ0U351q1sS7Jxv0rp+OBvxGntlt/rd2O+g9JO8TimgoasO05VddNnQ/Nil6212PsP96UgnjDgevgEw6eb6wNWGNuoAslmTcowsU6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igw1vSvn55i+5i4ePREKMzAF9oPOD8QzYaFihG/N1sQ=;
 b=iWMihNYbxOoT6wLjtNUwaxfgfllftuD9huJ40EcCK3VurxnvFmF+cvm2G1XU5nmMDq1OjzojkzKEhIDQ4XpTjK/MSomeYa3aUwwmy5RuZJhqxgwLsVBX5beZEePSqO03meJwN0D3d7N6pRl0bkYzjQ+xRqXX3On71KwldYTsTME=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB4872.namprd10.prod.outlook.com
 (2603:10b6:408:124::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 10:00:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 10:00:01 +0000
Date: Tue, 25 Jan 2022 12:59:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Phil Elwell <phil@raspberrypi.com>,
        Gaston Gonzalez <gascoar@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH 08/18] staging: vchiq_core: simplify
 vchiq_add_service_internal
Message-ID: <20220125095940.GT1951@kadam>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
 <1642968143-19281-9-git-send-email-stefan.wahren@i2se.com>
 <74c587ca-4ce9-68e6-8eb1-f956ca05cef3@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74c587ca-4ce9-68e6-8eb1-f956ca05cef3@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dca0486d-d255-4413-1547-08d9dfe9733d
X-MS-TrafficTypeDiagnostic: BN0PR10MB4872:EE_
X-Microsoft-Antispam-PRVS: 
	<BN0PR10MB4872B829E6B6EB4D2E27AB1E8E5F9@BN0PR10MB4872.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TGqgS2TlLxHQBm4eqNqAlF4Lry8TMyOd2dDPjkYrosvx0BeqAsDhHz7QQci7x01bd638a4yjhmUuL9nwBA7cBhRi1oDez63WRxYhqdlUZFOxb2CvWoxDdi/zI+RxS/9XhIfwZQFHXQk/754eJG9fRJfeWpOmqPFYgZsKKgFLyCwG31tcCPD4Ei70H/jKxXNZM7IerFef7lCKQ9L+bGMxBqgXgV1J3vI5ke/NHBRmooCBxxKVIVIgGONc9FYx7oj3m+q3sp4lMAnUipWUIDduWPWpYYKctpqoF6tdsxb4lzgWVq+VF86xRM3n/llWfwRM+cH6Iut1N/fz2IAWHUTUFhUuFZg1wLVaUxO0gvlqCpwV10YRRz9dv4WTpqAodazZUoGLACyKDfzj64FB5pr21tx6VuATdtBug1EVQJZlqC3ubgZd2Qg2PHYRDNJGoVQGCJGU8d0x6sN9ip9eAzmbKi3VPWSraKPmFr14xeuqReDkrQvJkm1RTjNnbzoimQStPDJB7C9rrfR38NZdGZRgluAhg1Oiwx8Db6QezdwefIFsFOIbv7HUntStefFPETU7F6NJmUaHfSxba/MiBga0LJ+GzZWPKaHYeIKFhM9dZpA3+FF75qI3/o+t/yzffS327OOUSF9kxSz254O5LmbRyGSpWltVBzfBsL721AzTCcF6YORBHmv9D5uenxoK1PHX/ZELiBE+uZ8fD6ZPxcZdJQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(66946007)(44832011)(5660300002)(316002)(6666004)(6916009)(33656002)(54906003)(66476007)(26005)(33716001)(53546011)(8676002)(6506007)(52116002)(66556008)(8936002)(2906002)(1076003)(186003)(38350700002)(83380400001)(6512007)(38100700002)(6486002)(9686003)(86362001)(4326008)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lNbGWC+fdpRvalnt8D6PyfXaOdZ+du6WZPhrpbinvwZmjFtblA/p/K37/FHF?=
 =?us-ascii?Q?XOT0J84XIEFBuo5y7Oqbz/M3c/57zv5QcXGALcTaShKQpPXSFTXNhw1BWlf+?=
 =?us-ascii?Q?nnRAmH/1m0iV553JHo+nT8iO9X2pWTMsO2G+pIyJ3T7uLvREgHTSR4blZpqD?=
 =?us-ascii?Q?zEVidFeFRLvfpP+nKT7QYMmkS88pVt+YyuUWbk6NqmNLrnXEhlORg00dEM2C?=
 =?us-ascii?Q?v9btsw4jzxQZ5tjwrxtya972Dd+zr39ZhWhoTl3RGvAGuXH/jqN1tOj9vccP?=
 =?us-ascii?Q?UPylCy3Wz/VrP8t4TF/1VFEZfk6+Q/1VYjRBctjvtnaoqqIpiH6kGiL51GSz?=
 =?us-ascii?Q?BYGrfI2vNC7hPXdcgyltjWM9me4XqllJ3rey9svfAbz3keYGnQUOEfEw5PrZ?=
 =?us-ascii?Q?C++XcYWEFvh6SAbSrh34prsIfKdsv3mACeRMxX/N3KHLnHep4zKF+0ShHA+f?=
 =?us-ascii?Q?b4Nn8wmqSjsQSySAQPSG+SwHXZtRydKFnIyHGFlAa8ft/ixAM8+jFmm4K9aj?=
 =?us-ascii?Q?HuwmQ4YZndxeDayfVrg48hWe1Oi7+YjkL3MIypseY7XYtk7SrIKuwQb+f99f?=
 =?us-ascii?Q?oWN/+42iaVJX5OM4pZhcxdCEyp3SQaSsUTPH7Vz3l03lLYj2zUVNwXHFA8Ng?=
 =?us-ascii?Q?7/ONLJGZg3c7NESQLhS18eF9cUgvmWjYvkLPeC6jMhtUp3sH2ivXlmHfavEN?=
 =?us-ascii?Q?BVS+DoF+dw4EJwZmwZPK9F8vviUKMk96296Ur16GBNZm+Pk+d8R/1wsAlMvY?=
 =?us-ascii?Q?q35A0fmaK13NfqbaJCdZGF92mJ8BF/m/WYhoF0s2KSVXQutw0ITNHX6/je/m?=
 =?us-ascii?Q?r+v0bZJUapjyXpy4m2Dd3V/zRpoK549QVLV1coVO/cB7/HVG+kdFub6uUt9U?=
 =?us-ascii?Q?lOj0OPkOfR2vKTJCO1QthNn43n/hPVhPu2V8Tr7eXSaVaHEq2P5k88VddXit?=
 =?us-ascii?Q?YcD++VB/xOMTlXBgWeoNfMXu8j3y/Xrvhv+Bcmo3cU3gQ6drWj9EuMMEL6h/?=
 =?us-ascii?Q?1OmyHObIDmev4BLUAYney03c1800DN66Ye5/GKSNelT+JEn6oSmtRiptFLj4?=
 =?us-ascii?Q?Ni9Ly7s7y9h2rmfcPojMvVzgTQ3iVNTumu2ey8WLd9pIQWqL0H6LerqeuaNz?=
 =?us-ascii?Q?2W45ZoY/T7+kILVuMrbaGpCjioNemDlhtdYPkcbvDNx5BrmE4NDtbWiEZ6ml?=
 =?us-ascii?Q?OP8lmlogczpX8sjLbvb0XrsqBAAIpe2en82NKaF8I/irSY4Z75k4nXDl2PNE?=
 =?us-ascii?Q?zw1RLxfpAT3vJORplLKNrQ0tuBUz7sFlvvCnp8nY0T9fFWH6to+eOr5yJ6F8?=
 =?us-ascii?Q?C6SpkWE8ZKoR14605LKzGdpTDew9DeXrq3TZIEmOyE/t5CtHC9LYio8SjFV1?=
 =?us-ascii?Q?HW3/+8y0dtY2el4Z0R1dxmW9XuPRmclH78DR36g3kp9vzK+lCiAz+23aKHD0?=
 =?us-ascii?Q?wlVJwl+6V//sQjWIzS7G2h8g1iAS+JDUXrNuYh03OnQJdMbojJveaqRMMRlu?=
 =?us-ascii?Q?SiYaAe3ZehVQfY4sqhlWs47ZxW+2MQgOEk3NPcgN6J3fQcnvAjEzgNLF09g3?=
 =?us-ascii?Q?ExSKvRU1bgPwwFHtBuUjvyqHZVo6fZiufBtEmyBW4+Uk6DrCzjdGJ6Jn5NR1?=
 =?us-ascii?Q?VyDsUZL+t0hvU5TjHWMtpL7KR9JPPfUJuws/BONfRqAQk71MIzdyITtRVqro?=
 =?us-ascii?Q?v9A5KAerKdvs6WB3/B8u8AseANc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca0486d-d255-4413-1547-08d9dfe9733d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:00:01.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3AoI6ZOYnly7V1wKvyPK3dVQRPJCFCEDXvhdrsHznDoZysCqBIGSSXX9aT04ZWGAomUp8Syot1WRh+RnIPxnJuY3vgmnXzHJzNmsI9PuEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4872
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250066
X-Proofpoint-GUID: oMf2lf5sqYT99NxEQC0O6XMQeY1udGXA
X-Proofpoint-ORIG-GUID: oMf2lf5sqYT99NxEQC0O6XMQeY1udGXA

On Mon, Jan 24, 2022 at 06:26:45PM +0300, Pavel Skripkin wrote:
> Hi Stefan,
> 
> On 1/23/22 23:02, Stefan Wahren wrote:
> > Better use kzalloc to properly init vchiq_service with zero. As a result
> > this saves us all the zero assignments.
> > 
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > ---
> >   .../vc04_services/interface/vchiq_arm/vchiq_core.c | 23 +---------------------
> >   1 file changed, 1 insertion(+), 22 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> > index 6fa9fee..a13a076 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> > @@ -2097,16 +2097,6 @@ sync_func(void *v)
> >   	return 0;
> >   }
> > -static void
> > -init_bulk_queue(struct vchiq_bulk_queue *queue)
> > -{
> > -	queue->local_insert = 0;
> > -	queue->remote_insert = 0;
> > -	queue->process = 0;
> > -	queue->remote_notify = 0;
> > -	queue->remove = 0;
> > -}
> > -
> >   inline const char *
> >   get_conn_state_name(enum vchiq_connstate conn_state)
> >   {
> > @@ -2371,7 +2361,7 @@ vchiq_add_service_internal(struct vchiq_state *state,
> >   	if (ret)
> >   		return NULL;
> > -	service = kmalloc(sizeof(*service), GFP_KERNEL);
> > +	service = kzalloc(sizeof(*service), GFP_KERNEL);
> >   	if (!service)
> >   		return service;
> > @@ -2387,28 +2377,17 @@ vchiq_add_service_internal(struct vchiq_state *state,
> >   	service->public_fourcc = (srvstate == VCHIQ_SRVSTATE_OPENING) ?
> >   		VCHIQ_FOURCC_INVALID : params->fourcc;
> > -	service->client_id     = 0;
> >   	service->auto_close    = 1;
> > -	service->sync          = 0;
> > -	service->closing       = 0;
> > -	service->trace         = 0;
> >   	atomic_set(&service->poll_flags, 0);
> 
> Nit: atomic_set(0) can be also removed
> 

No, let's not write code that assumes it knows atomic_t internals.

regards,
dan carpenter

