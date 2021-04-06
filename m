Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7356D0D
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:44:02 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ab9AzvK7gFcUdhT3guAPXwaCCI+orLtY04lQ7?=
 =?us-ascii?q?vn1ZYQBJdIiji8urnOkH2RKcskdiZFgLn9ecNK6cBU7G/Zlu7oULeZukVg/quG?=
 =?us-ascii?q?ynRbsSnbfK6TvmBiH466phxb5tGpIOeeHYIFBmga/BjjWQPM0nxLC8nZyAocf7?=
 =?us-ascii?q?4zNTQRpxa6dmhj0JfzqzNkFtXgFJCd4YOfOnl7R6jgGtc3gWcci3b0NtN4Oom/?=
 =?us-ascii?q?TwiJnkbRQabiRJ1CCyi1qThILSIlyywhkMUzZLyfML63LEnQv06+GftZiAu2Lh?=
 =?us-ascii?q?/l6WxIhZi9vlz9MGLs2FjcYYJ3HCigqsaZ4JYcz8gBkF5Mqy5kUrldzF5z0nO9?=
 =?us-ascii?q?107H/XYwiO0H7Q8jil+yoh+H/mzFfdrn7qr9aRfkNHN+NxwalEfAjY7k8p+PNx?=
 =?us-ascii?q?wLxMxG+C3qAnai/orWDX+9baVxRung6Munoliu4PnxVkIPEjQY4UhpAQ70NRFZ?=
 =?us-ascii?q?9FJTn95ZwsDYBVfaPhzccTWk+VfHDdu2Eq+9ClRHI1dy3mfmEy/ueI3StXmXVw?=
 =?us-ascii?q?i3AV3sobgmoB8pVVceg+2830do91mqJPS8ofKZhwG+sbQdamY1a9Jy7kASa4PV?=
 =?us-ascii?q?r1FKQDMzb2tpbr/K9d3pDTRLU4iLAvlofAVVZR8VMjYk6GM62z9awO2QzCU2W5?=
 =?us-ascii?q?WDyo9vp6jqIJyYHUdf7BLSORSFUqm4+er+4EAsvdMszDXK5+MrvJMWX8GYNN10?=
 =?us-ascii?q?nBU4RZKD0kXMUOvNFTYSPsnuv7bqb3uP/adfPaYITtF18fKxrCPkc=3D?=
X-IronPort-AV: E=Sophos;i="5.82,310,1613430000"; 
   d="scan'208";a="501847436"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 18:44:00 +0200
Date: Tue, 6 Apr 2021 18:44:00 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Add spaces
 around operator in HalBtc8723b1Ant.h
In-Reply-To: <20210406164001.13646-1-fmdefrancesco@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104061843260.16390@hadrien>
References: <20210406164001.13646-1-fmdefrancesco@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 6 Apr 2021, Fabio M. De Francesco wrote:

> Added spaces around operators in file HalBtc8723b1Ant.h. Issue detected
> by checkpatch.pl. Spaces are preferred to improve readibility.
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
> index 59e8c68cdc20..719e19420a3b 100644
> --- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
> +++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
> @@ -15,7 +15,7 @@
>  #define	BT_INFO_8723B_1ANT_B_CONNECTION		BIT0
>
>  #define	BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(_BT_INFO_EXT_)	\
> -		(((_BT_INFO_EXT_&BIT0)) ? true : false)
> +		(((_BT_INFO_EXT_ & BIT0)) ? true : false)

There seem to be a lot of parentheses in this code (( )).  Maybe you can
make a series and fix that problem too.

julia

>
>  #define	BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT 2
>
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20210406164001.13646-1-fmdefrancesco%40gmail.com.
>
