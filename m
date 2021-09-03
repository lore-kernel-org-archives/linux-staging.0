Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609553FC5
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 08:11:06 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1836CpCA023075;
	Fri, 3 Sep 2021 08:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=XKzF8NIHFEqXEUHiNQiVN8hIAGt9z6NKid1CwH2PpDQ=;
 b=ikMtinqE94m4K6sxyM4Isqou40YzWl0sRdxBYxfH0ZY7NwCR41ray6ikpE8qmU4VZBeR
 Z76WhjObI6I+h53ku6cRXwGVKlylgd2i6fCKzcQH+uU9xgy8haLgUSr9VMmsW89CWTsS
 wVGBfXCEOhUcKpzbqxHnJqv5jvc6jOlGiOq7imuVghLbECnJC3odkXcKhSushe1/tizX
 ZRodbapj/M8qnlLVqT+golWqfISUs9SK6HYR/3aNZIJmu9KWDKwY7rI4pWmB/uGCeFlp
 2IS/DgjStbY+rdVSk9kqLcd/VBOi/b8sz3RdZGfWTTfqGFvOlRP/TyIu8HLsgG1BSja/ og== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=XKzF8NIHFEqXEUHiNQiVN8hIAGt9z6NKid1CwH2PpDQ=;
 b=F1ilrweMJ9zNMI1t6AmjaHv7ck2kWWQbFWb5T2HydvAjhn61QLbgizqAAdJBk7YdjEvC
 yUDlzwKsNnBosslgOqe/xidBxWkWBVo7C1KjlxsqgG1Rp43SPGaQt+u7ZFQvd02rOJpl
 eb3MnPkz+p/9h0J1sjNkdqPmtq/38y8TK+fgTLCn+87ejOFvSFE1Wh/zm62myQFQt5zn
 klGWzlzz/MTwcA/DYJZNnVXdSLxBW95W3wqFii6OwalUBVO5KypoNXyrbHLDF6pn9IYh
 mVer5FXOXxO05rqES1uE+PM/2w1WQ77aR3uYvBk+Xqd50hYdb9BcDOEi87ll5qmPbLIL uA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3atdvynj0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Sep 2021 08:10:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18389uqN127887;
	Fri, 3 Sep 2021 08:10:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by aserp3030.oracle.com with ESMTP id 3atdyy761b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Sep 2021 08:10:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlxkCmrzRxu6ZrCnFfHc830tZ0TOC3G88ViZmMb2y0mw7Fcauo5J1yGiLOuRGt/91p6mbZx3Ck57uHhI2jd1cGBOYyFQU58tNNkh+tUmdHppn6u4MVbXIh+BAHQEA1Z8lv15QILhc4ZUdpR7BEl1UDhpG/vnbngW7slPV9iPqQRT5X+oV/felwKYp7j/2So56jNI5S5cB9XEnbOjUSLZTb/QkLEVnk8NcBkWaCERgIZTo93aSgYyyZdJn7ApbQ8r5zbC0J0kLwhatVVd5T08ATm9LNktzcDawbYus/aZZjKooRdM12/ovRldP+6gzzb1KFrc/FeRIkJfyzxX/sM3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XKzF8NIHFEqXEUHiNQiVN8hIAGt9z6NKid1CwH2PpDQ=;
 b=kfy3dOZ+BhrkoFIAUFnJRyr1XtUcocmqXFwjnqtUiFxC59WZ3WeYu/zLVKjMLbA2ASiEa9x1Pm7ywL7YulQdIHhGV5nBjR5m7A9NpuKERy2mkusBfD8pUpES6IQL8H27tFowoU7unOynk+emZUiA9XZ0fLLP66KTujMWuCxDj1UeotYJ3/i5jzavPhcCNBJ7cU+dslffh8d/tGj/txbYCNKn47yemFizMQw7ZSe9XyloQ1VkeNrlczKMEoVb591wDudJYBrXU+gAfRFzGP9VdEx5R+iml2C88O4HNmyHZL9FssprUcNS/rQT4LN22gMkir8ckMSnHLwxvvPnvOCcyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKzF8NIHFEqXEUHiNQiVN8hIAGt9z6NKid1CwH2PpDQ=;
 b=fgXYB3R3tVfqOrprhtUbEMrZAysvukpxRt6asYfJ8x38FuyynqeAwM8kxClP2f7aBQ4tNrc2r6w1aCp/ywqHoQXE5SkDPAI1+tHL/RvMUqoE8qs+gQfM4ipZ/+Cc4i2huYU5zchCLvs30oD444XMQ0HpqRyWJ/TNGE2vt/juE60=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1245.namprd10.prod.outlook.com
 (2603:10b6:301:9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 08:10:54 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 08:10:54 +0000
Date: Fri, 3 Sep 2021 11:10:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Krish Jain <krishjain02939@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Use BIT macro instead of (1 << HSDMA_GLO_BT_SHIFT)
Message-ID: <20210903070518.GF2151@kadam>
References: <20210902115215.GA582112@panther>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902115215.GA582112@panther>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0021.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::33)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JN2P275CA0021.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Fri, 3 Sep 2021 08:10:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85b29b5a-8114-460a-8a62-08d96eb25a07
X-MS-TrafficTypeDiagnostic: MWHPR10MB1245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1245FCBE2F1C1E4F5019C16B8ECF9@MWHPR10MB1245.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2xBsofh4fxV7W+sfqb7ap7sKx4vAgPlujLUOnY+k01KrD35fu8xgPpxJM2h5gzdLMHNuAsBVL/CKuS/NxCrA/2mGLSIllzgQVtoskeXlSXPOClp+n4he2cGMhzSkGPnX8Dfy0c/OiwsLVdpRJGPGWIkboPONR3HGrcXedPjLQa3/K+p8+YRALZLOnSUJzFsFMZ6Wu1X6b4FFSAvzwATf8NiiSoVkTlO60xj+jnBU+wobhgjBgB6IKwhBo2hLExTDzEGex89sm5+GYQKJrA7f9WEWDjQ7t5oqQ5glBdSrjw9+eW6+w1kKMSY3VEau5JsEl+Mva/vhH5imOE27qoohlGltgyTMksVsi6X0PohPtMGFYUW6nqn6DrGFb0/ehwAZtJRkJbJk57iwhziQyoJ1ITSC3n0nBFfks9kviWcDjIYdLxGQUnd5Iflx0tRM5Ffqzdg8c1C+C5QniQINSXE1z+wxYKSkh0nEA+ApFZIzV+C3JegFk8zp4mUg9duM+TtMQ7Gf1ibsvqWNWMHKQ78/UQ3MMJJKOXGCROVf33eANrmIqWGpSfhRPel+/oO6U1oX3Bc6jBRbTOUXgmx3g2PxGpjLaW8lySYSZmLbXK9KRxZj61zInFSrr+uZJTniwMzprptkdVQqSXgehEwEOixCWiuW7cRmTA9OdS2izGu5CfWq9tRVQewMewRixx0mxQQbT33WahgDu7oa1m+DpYWbQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(136003)(366004)(39860400002)(38350700002)(9686003)(44832011)(55016002)(1076003)(26005)(86362001)(478600001)(2906002)(9576002)(186003)(8936002)(6496006)(33656002)(38100700002)(6916009)(8676002)(52116002)(33716001)(6666004)(66946007)(316002)(5660300002)(66556008)(83380400001)(4326008)(956004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e59P3XYxmh319u7Jo8xkY3lYbctyXTwhnBn5qvhMHerVMRzJCSeFhoj0iJKN?=
 =?us-ascii?Q?7GpmYthIByz5ymhFsHirRwEsI6ASQYTrIlHcm/dLYMBrVA19+5nddEvXW5I1?=
 =?us-ascii?Q?IpUBjhhtYU9Qz56z+XUK/9a57p0k0/sOUmJLL8kadu9zHKIV/NO0lTGTZFsY?=
 =?us-ascii?Q?jHjQ67TsYX3wscpKdWJASEhwqpKs+7HK7+dOG/6kKR6VSeOYspMhL4VkPnrK?=
 =?us-ascii?Q?xW1FxJqWy7mpaQ+6XI4xstTeSpxEDGj0EaPnLrNy2FJskfQdpt58omo6a1E8?=
 =?us-ascii?Q?LUQ2CJDnzc9+wnwLrcQYoG88TU19DCLZkbyN8E4UrzfmtlEWH//F3VRzZY+W?=
 =?us-ascii?Q?mOZssyzdDxrSlrx5Cm7FfvEmKfVpwfv+m9Aq6RcEmPSRiG78ubWbfc4KW4lg?=
 =?us-ascii?Q?2fqUepUUBpztOfT2OyQtG02U+4bewqWG7V3rGqu0WVOnh6S0MMYDHGiJLk4z?=
 =?us-ascii?Q?ViMt8iTw2k/IM6qZu+YxEh3E/ipzOP24zwtosqdlnMg8F30eAOJxUFseQj1q?=
 =?us-ascii?Q?63Ehc6Xb0cUhbFd4FovUTCJkGmQuB+HlAuZOqAtaVM3/kZUZXSFuGsbj2h2r?=
 =?us-ascii?Q?FG/fXrezmJT+noLHCwsAKmTU85P2Cpxp2jfZM/Ylaf6gYPQ/RyVw1NMhl58N?=
 =?us-ascii?Q?KkSQYdIfk1C/fSgjHXkc9gKOnGknEudOL4MW73JIktBHNwxSHpIzKK3hhLjz?=
 =?us-ascii?Q?qmbWFgYMoGA70T+xUxPq+FIqKftKfIo/eQExLHQVAdeS8cJAx9raWdw9Mj6M?=
 =?us-ascii?Q?K4f9vjqxJaUaLT5FLWrqsMPfDA9AC819IAfM0lMTyFMiWXMk8gkj8pnLcnwY?=
 =?us-ascii?Q?ESFaJGCXyjjRusgfZlSXN/Ua9sZ3g4CLhjc6xYzBvcxTKsvzFA+WNz52i5nb?=
 =?us-ascii?Q?weDMzoE6FmUt+PTA2v01cRLZ3fwrQOHv2n7WEIbVd4V7c2AHEW+UbLFiEnnn?=
 =?us-ascii?Q?Cv2ok73zO1o1BWpHqY+4KMKMNv8w5x5ZgpJZ4kwARZ/wMTbBGpSu3WjRDVfU?=
 =?us-ascii?Q?LWFWYwLexJtpFuE592qT9o0i34c4539FV1XfbRpX9WjNAZElcfC8wabMfE7e?=
 =?us-ascii?Q?6Zi22VxMGaLOMSmtLeSDfVYsCVKc7ItRDTLxMzjNI8Ft9C3N/Dn6/6Hq/DLy?=
 =?us-ascii?Q?mWX9MuuXP/95AvS7QS+LbRhiRf9Af3HxEl+jGeEdWb3QAXPvIcutWQyY8CAf?=
 =?us-ascii?Q?S+Rtafa4CMi8oO314G4gabL7cnqaG5Z0jVYLATZo5EerUqooRGId2d4qfUb1?=
 =?us-ascii?Q?Y/Df/fdHi1onozMt6qWKWvVUzwsqRn4ig/AK+EuIoFDvFtPAMEj7ZESjH6l0?=
 =?us-ascii?Q?WapLw5qJGGzxu/CAgpCRhCEE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b29b5a-8114-460a-8a62-08d96eb25a07
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 08:10:54.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTOx7HnqcDNrXDpXK7uehsHtH9DVbyICaV2fJDS2FXhpXCJTi02Tdjqr91FXds4Bi4318r6oLE76zEuUuualX0vQTW5Da58cLXGa1mq7ps0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1245
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10095 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109030049
X-Proofpoint-GUID: mJJCf2A0BPbn_koysRMaTJi9LI-OQdus
X-Proofpoint-ORIG-GUID: mJJCf2A0BPbn_koysRMaTJi9LI-OQdus

The subject is wrong.  It doesn't have the subsystem prefix.

On Thu, Sep 02, 2021 at 01:52:15PM +0200, Krish Jain wrote:
> This patch replaces (1 << HSDMA_GLO_BT_SHIFT) with the BIT(x) macro, as suggested by checkpatch.pl, for the file drivers/staging/mt7621-dma/hsdma-mt7621.c .'

Run checkpatch on your patches.

> 
> Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> 
> ---
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> index 89b72a802800..a99cec876110 100644
> --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> @@ -72,7 +72,7 @@
>  #define HSDMA_GLO_TX_DMA		BIT(0)
>  
>  #define HSDMA_BT_SIZE_16BYTES		(0 << HSDMA_GLO_BT_SHIFT)
> -#define HSDMA_BT_SIZE_32BYTES		(1 << HSDMA_GLO_BT_SHIFT)
> +#define HSDMA_BT_SIZE_32BYTES		BIT(HSDMA_GLO_BT_SHIFT)
>  #define HSDMA_BT_SIZE_64BYTES		(2 << HSDMA_GLO_BT_SHIFT)
>  #define HSDMA_BT_SIZE_128BYTES		(3 << HSDMA_GLO_BT_SHIFT)

No.  This block doesn't make sense now because one line is weird.
Just leave it.  Checkpatch is wrong here because it only analyzes one
line at a time.

>  
> @@ -164,8 +164,7 @@ struct mtk_hsdam_engine {
>  
>  static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
>  {
> -	return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
> -			ddev);
> +	return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine, ddev);

This is fine but it needs to be in a separate commit.

>  }

regards,
dan carpenter

