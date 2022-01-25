Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA60E173
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 10:21:24 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PA5w7Q019388;
	Tue, 25 Jan 2022 10:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ViDpUouitwVf8gQugV5pIfb2z6c+STMSJkDgSSlGPT0=;
 b=cfpPEmvsFcirFlDwUUz6z3AkNb0NCCmtbb3CucugqJBumBVXxWN+E/ADHkiE1dwH0mOH
 Wp/5dEnwhWMqkgBqcYgTIAnUFfH5SHFF09Qwf0GWhOyuE4ZjU/sb/2buAyQoHTdJSLlE
 PxuJRnfq5+dftHTb1gTkCK0bLt36e+4SdCdgs7oJdT4kI7/la02KMxMMLPsoPanQK6qU
 /qVHPUhx9USnFxHkoFR8CtH4M+QSlALJ2YzrTNcdItGazwztMKVYhVBIzmC+lVUzYhBd
 w+7YpBkUReaPsGtT+aje/rnkltJbputiTh0s9EYAhfP7lIf9XLogHlM85n78x6Dts2l6 uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3dsy7atnha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jan 2022 10:21:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20PABNTr069995;
	Tue, 25 Jan 2022 10:21:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by aserp3030.oracle.com with ESMTP id 3dr7yfgj0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jan 2022 10:21:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+CXRA5s57J+H6YXUjfPUcyVXRu2xZolM6jOk7n6Bon5YcSsVit9UdCftDETLqON1fUbZrk8gEHr2+ARJfQa+QpkJnnohEJDacqnEILp+T6ABGlLNUw4d/ORpgKDUOvopUXshtTSOntRxZSfYnh/hS4QW77Di4sZ26kSisC3ZDNo0BHHrWm0bTBcUMBRUlek/yvQJlCgocLA12HdJXVrhkJxjuWzWOCTP/lgU4Rho/JiwmkAKWTAnWH+hQjihSNL8oYTbQaU5I+En0YhWURHLqJ0VlG2LG0oWWL9SM6R9Ta9oBC8B7E/OItDC9Z/YLJc65G6+mAkOV5YC8Pr2eq5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViDpUouitwVf8gQugV5pIfb2z6c+STMSJkDgSSlGPT0=;
 b=HmsQg0svVYSbzF571F9u+gOVPnnxJhrb/ub7Nfdnm0+f/h9vx1SI4bHVkOjKQukWMlw3COfsstv/+QSjyBJA1muD3yial+mJER47YZVsWIShML8t+HzCUN23E5Bp/9Z+Xi2UzjKEMCPQT/OnmD4xhwIX9EtTQH5IY4NBgesFLIJu2/bIhByel+SZvmYx6ioqPWkSxPBnqpTJOTFpQhHEq96y6tzlc/0Z0ryFhjEjihPLWmwqVFC8Ccn249MaMTyrTsO7fKsWZ5wo5+ZW1/x1N+a0XQM8wHxXKWLVuZs4r/LbYAw87OL+eDWIIxnNoqM3rn+/uL5uGQ9o8h/jquPmcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViDpUouitwVf8gQugV5pIfb2z6c+STMSJkDgSSlGPT0=;
 b=oWavXgHWlk3YiMbJJO7YdCHuKwpw+R81/+FeCMIkC+qZb6R85QQhJls09226c3x+Md4y5lQ7TlxAy1GGpQyJbfKs9WQ9qW2QomqU2+EFE2DgYCwmrSgfeit+e690SpeaEKoJIlQbQHdHgEgRUcLYZm2iZQo+B4WoU3/g6JGwG9A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB3924.namprd10.prod.outlook.com
 (2603:10b6:a03:1b3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 10:21:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 10:21:07 +0000
Date: Tue, 25 Jan 2022 13:20:49 +0300
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
Message-ID: <20220125102049.GU1951@kadam>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
 <1642968143-19281-9-git-send-email-stefan.wahren@i2se.com>
 <74c587ca-4ce9-68e6-8eb1-f956ca05cef3@gmail.com>
 <20220125095940.GT1951@kadam>
 <99efd1a3-9605-ffe9-5d3c-51312ce7a4d6@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99efd1a3-9605-ffe9-5d3c-51312ce7a4d6@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0022.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::8)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3359344a-0f4d-4e00-f445-08d9dfec66b1
X-MS-TrafficTypeDiagnostic: BY5PR10MB3924:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB3924B5AB5BC02EA6AEF75C978E5F9@BY5PR10MB3924.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dHa+66pu5zviAPAowTkKSSCUFDtfrrLIX7PHnYJdLbSQz/qCxr5EDgc8gHGbmgCC/fMDi5H7WE9ANJQBy7JKNXUt6r1oNjIoc5AVNn4UXs+/DS/X+ulOzlFjamIh7xF7jhHIzdSCUQXlnA1TlHDp+Ao0QOlMQLpzUv3yAmjVK3WGuzrnFzC9L54zW6nYl9Vx7K28br2ty4vw/vcRAybdA8umsD6BlmMTMUjX/GvIQK2LtH+BnpY3Pk76R1zUhQq1fX8zuoOe03hgIcdgqa0G36ZNIwqjqxmXyL+wMBwZcw8ZvH/b8mTDrwDXiauOnWfL4J/Jmc55pEjgDa5ty3+4U8sU+HZCC1vUI2iSN0S9+3iHR4Gj0A5xPdcboLub2N+nEj2LKjhR93sd21oMzUpvo6OYklNhu9gVtmDZ8X4eAgcDcNCBiKKMNO03uP7NDgCR7KMVA8BxLect3XptLXwzJHzdnF8UF0GsPFDpcyL7kklHBnUNqwqBZ1dBsoJqSDZ4VSmh+Jh9q6+83E/pEE2tjAau7m4l2jUd7SgrAwjAMVboZH/BpMLGHFkvSg8VogXbgwWAgJimiUTkgV8Zbt037SHQxw1rb0yiSkge4kyXcVrp1XfJOAHYWjVfjG6EJ9TYBGFqVPzaj9XGnX4ibP+S4rbnWqq9GNme4HqfEhR0NxtgOd7e4Q4VcEobNfvN11NAmNzHV+q/kAvSkIXnEy/u5g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(4744005)(83380400001)(186003)(26005)(33656002)(6506007)(508600001)(6916009)(53546011)(52116002)(1076003)(44832011)(6512007)(2906002)(316002)(66476007)(66556008)(9686003)(66946007)(6486002)(6666004)(8676002)(5660300002)(4326008)(38100700002)(54906003)(33716001)(8936002)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FBJdBGXPCufw2Ea6Yoh4lY7uggNgq12Jzv6StU3eFK8ynIGJukwMjk4hAwBm?=
 =?us-ascii?Q?m38yrQTVYdSpWY6Hw6frqa+bL61Fnvhm3FZPaagVYf9/nK5lWIDlwtrfdx5Z?=
 =?us-ascii?Q?div9Dm8P6W76GLg9sjJTzf4S1JeTwv6NP6792r3rH9gi+udjfbF7sSF8oQ3X?=
 =?us-ascii?Q?HR9AiMYtZitP9n/39He4hwf04+qTuCqdxRAz2gZdUmp8TeDgbZmbQRZuZiUx?=
 =?us-ascii?Q?vDnJVeRYy6n2rwLAw8DDUz2yDqhVoaHuCfdttl2yeOjC//ZST9AZEZsZsDyo?=
 =?us-ascii?Q?+zyKcp6FZIiESPDappVAr/CtCFp9GDKORXKE3OjaKiKlpt2gFmZ9RTVrFoWw?=
 =?us-ascii?Q?J32f8yLX6niBTmQzaJ+pwuuSYGnjZV7ql4Ni+MaUIG4FlNQ3kDomYI0BT7h7?=
 =?us-ascii?Q?id3uWt9vjChkqB4hTk88ZKHAVdlWCph4nRKsYGwGw1TtImftyW5WsebUZ+3D?=
 =?us-ascii?Q?g6LoRThACFI1GbylT+e64xVcKZ2vqmB+8j7UEPNbBccYwi8CM/99RL7Zkdn1?=
 =?us-ascii?Q?NKn8oZlRI3leSABGzqIIH5Iknb3jPE+8DUT3mQK0eU75ReLfEi81fnZwmRi2?=
 =?us-ascii?Q?+S+BRFEyNuAzkDgFpWMUNPEuKlB3cBKREb8D5gM4xZOSeNe4SNZQu460yl55?=
 =?us-ascii?Q?Erz2MfcYQpjWaZUzVC3KwpOg8/Yv4y/w0+4T3+P/m0Dy7VFkk/6YBQiz6Vut?=
 =?us-ascii?Q?CJUjcO6AW2ws3yy2I65o1w9gFjw4h2tZ3Qlnypg3E+lRYa86j9Uc8i5tgaEg?=
 =?us-ascii?Q?/28JA08xt8DagiHDNS/5YWKJqxPXC6s/ztDbVaohJRk0DhSITL4v9tAOuq/e?=
 =?us-ascii?Q?n2aj1ir+fXPndb+DgktmFuFroDmwFPC267Y5hV7rrfHU0NZag3y2AQh30vXn?=
 =?us-ascii?Q?Th7jnLlTurXThj/cwrO052y1QTzrgcKtDXz7EZGlCEYbDPfEnDC/4hIbb1Ov?=
 =?us-ascii?Q?TNz0po34KcD+X4Lq7L7lK1HOzzKDAyym+CkqcoHF5t2kxOtB5UtKx0lgrtkF?=
 =?us-ascii?Q?4Xg2/Cqmk7p2pHizKgQXQd7z+xPNkDVInLngJXfS61aWHM+uDLnbxGtLeke6?=
 =?us-ascii?Q?CxuVPu+yRLUGaL06z8F6B5G3Wk22ySMuJ838LPsiE3A9arl1X/6wLlJKk/eH?=
 =?us-ascii?Q?UBpLe38jVL88Sv6wEfLZ3bk4FDgYtC6l6LsDfOqrRfCCyxd6MNtOesRks5P8?=
 =?us-ascii?Q?G/0xEmRXoEVAG8J3AxqH6f780Y8krfXtG+frfWXMXput3SNKqq2+/Ys482SP?=
 =?us-ascii?Q?p84YzIUIsPF/R/TByPg9wS0I2JZeQxTLYk5kRdeNd9nF5CQc6Vjliri1u0n0?=
 =?us-ascii?Q?U0FyDBaylKEFFID6Z64mZA+EEJgW4HSDwO29XHHqwvOR4LSv2JNqpsn1tPqz?=
 =?us-ascii?Q?c2ktUlcG7YGaSTmA3OzJUd6J+9U4vscZH5WCzX1CC6ZknRHqBjET9bS74Cx1?=
 =?us-ascii?Q?1vVP6mdr5ZfI1vUmwguamxu/Yu5FJStbFk24sKipAXdwo5Cl/kHX/UpB/vxe?=
 =?us-ascii?Q?gJGTW1ka6FIFhIHL3E1ww+r7l1eWDrg+f7BQ+fGvHseVxB1fq8jCr7jQKFRT?=
 =?us-ascii?Q?ar3IlRaRC9p/nOf7jjRN6wFX/M3VdV9tlSlIM8uozbUByPqBDVD7J5QTeUqt?=
 =?us-ascii?Q?LbCLW7PrluIdrl1N3Ur8oseOmn0aVuoOiWqI/eJhoIM8itByoyvMPuWhf1ih?=
 =?us-ascii?Q?RkGWq6+pWjqy72PETqlfMYZoxqE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3359344a-0f4d-4e00-f445-08d9dfec66b1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:21:07.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKv+yb6hpENlbMq66l8f6EivJ7PF4H65PcqGs39Ovys291o7GJ2y0T2lkIHra254+byv0OjG2rg51x2EurUO4iebbLtjybexpYAynhrH0Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3924
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=660 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250068
X-Proofpoint-GUID: f_52mrwF3057Zo_0O-8KAtb5L_kWTfPO
X-Proofpoint-ORIG-GUID: f_52mrwF3057Zo_0O-8KAtb5L_kWTfPO

On Tue, Jan 25, 2022 at 01:06:14PM +0300, Pavel Skripkin wrote:
> Hi Dan,
> 
> On 1/25/22 12:59, Dan Carpenter wrote:
> [...]
> 
> > > > -	service->trace         = 0;
> > > >   	atomic_set(&service->poll_flags, 0);
> > > 
> > > Nit: atomic_set(0) can be also removed
> > > 
> > 
> > No, let's not write code that assumes it knows atomic_t internals.
> > 
> 
> Isn't atomic_set() just (let's say) "magic" write to memory in all cases? Am
> I missing some design issue here?
> 

The point is atomic values should only be set using atomic_set/inc/dec()
etc.  Anything else is wrong even if it works.

I think it might trigger a kcsan warning these days?  I don't know what
that instrumentation does.  But even in olden times, the rule was you
always had to use the accessor functions.

regards,
dan carpenter

