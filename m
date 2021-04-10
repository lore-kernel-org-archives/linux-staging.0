Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66FD72
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 12:08:32 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AV9AJgaqWA7P3crQT0RgVjsMaV5rKeYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnxQb54QxhPE0ItNicNMC7Kk/02oVy5eAqV4uKfA6jg2?=
 =?us-ascii?q?ewKZEn0I2K+VzdMgnf0sIY6qt6aah5D7TLfD1HpOL3+hOxHdpl4PTvysCVrNzT?=
 =?us-ascii?q?xXtsUg1mApsIhztRMQqVHlZ7QwNLH/MCZfmhz/BarDmtc2l/VKqGL0QCNtKum/?=
 =?us-ascii?q?T2jp78JTYJCxk7gTP+7w+A2frKVyKV2RoTSFp0rIsK+2KtqWPE2pk=3D?=
X-IronPort-AV: E=Sophos;i="5.82,210,1613430000"; 
   d="scan'208";a="378283426"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Apr 2021 14:08:30 +0200
Date: Sat, 10 Apr 2021 14:08:30 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Mitali Borkar <mitaliborkar810@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, 
    mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8192e: replace comparison
 to NULL by bool
In-Reply-To: <YHDnWpWztxeZospi@kali>
Message-ID: <alpine.DEB.2.22.394.2104101408100.2975@hadrien>
References: <YHDnWpWztxeZospi@kali>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 10 Apr 2021, Mitali Borkar wrote:

> Fixed Comparison to NULL can be written as '!...' by replacing it with
> simpler form i.e boolean expression. This makes code more readable alternative.
> Reported by checkpatch.
>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> index 65eac33aaa5b..476875125e87 100644
> --- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> @@ -269,12 +269,12 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *Addr,
>  {
>  	u8	count;
>
> -	if (pTsCommonInfo == NULL)
> +	if (!pTsCommonInfo)
>  		return;
>
>  	memcpy(pTsCommonInfo->Addr, Addr, 6);
>
> -	if (pTSPEC != NULL)
> +	if (pTSPEC)
>  		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
>  		       sizeof(union tspec_body));
>
> @@ -328,7 +328,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
>  	}
>
>  	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
> -	if (*ppTS != NULL)
> +	if (ppTS)

You lost a * here.

julia

>  		return true;
>
>  	if (!bAddNewTs) {
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHDnWpWztxeZospi%40kali.
>
