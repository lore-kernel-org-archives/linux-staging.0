Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C1271
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 10:07:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.82,214,1613430000"; 
   d="scan'208";a="502615109"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Apr 2021 12:07:41 +0200
Date: Sun, 11 Apr 2021 12:07:40 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Mitali Borkar <mitaliborkar810@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, 
    mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH v3 1/3] staging: rtl8192e: remove
 parentheses around boolean expression
In-Reply-To: <30a330377667aa5043a60ed3cdf1bbb37099631c.1618133351.git.mitaliborkar810@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104111207000.2854@hadrien>
References: <cover.1618133351.git.mitaliborkar810@gmail.com> <30a330377667aa5043a60ed3cdf1bbb37099631c.1618133351.git.mitaliborkar810@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 11 Apr 2021, Mitali Borkar wrote:

> Removed unnecessary parentheses around '!xyz' boolean expression as '!' has higher
> precedance than '||'

The log message is too wide.  It should be at most around 70 characters
wide, because git will indent it a little.

julia


>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>
> Changes from v2:- Modified subject description.
> Changes from v1:- Removed unnecessary parentheses around boolean expression.
> Changes has been made in v2.
>
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index b1fa8e9a4f28..431202927036 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -276,7 +276,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
>  	struct rt_hi_throughput *pHT = ieee->pHTInfo;
>  	struct ht_capab_ele *pCapELE = NULL;
>
> -	if ((!posHTCap) || (!pHT)) {
> +	if (!posHTCap || !pHT) {
>  		netdev_warn(ieee->dev,
>  			    "%s(): posHTCap and pHTInfo are null\n", __func__);
>  		return;
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/30a330377667aa5043a60ed3cdf1bbb37099631c.1618133351.git.mitaliborkar810%40gmail.com.
>
