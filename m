Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6F42561A2;
	Tue, 25 Mar 2025 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910974; cv=none; b=IxEqgXij3tHbmK0F7BGbCbRlFFg28vG9kmYaA1cyYULPA04aLVAL3LN/58JS9tGsTG1CVEdHFyZbafJlDbewU3iOToRITlb6ocS4HXUQzBqQnbWMG5QR2OR/x+xuYQWBwKKvIuMrltcnuBVZLRChqHNrcjMWIiRHJsREhxG9iwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910974; c=relaxed/simple;
	bh=qEMNyQ5ds/VmKFLRDJf2+qMtoc35WfaEw22SNJ59GUs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CexT1MkW+L6gQSyq8SMG8rAV0Hfaack3dnqw4P7huDBlacPnsnYyO2plYWk0+KWYgjj4iTaD3QoKLM9IlagScC/7rKWHz93WPaxPFfQ8V87JJmOLqhFE3e74QXk4E3xir6xE+Joh3Ck+4TyBAichyv0lKMhr1mOE5G2q6FVkRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=J2Y4LS4z; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="J2Y4LS4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Q+5awqeE5/5JpbIYKZrW0uZUXFfOxvrShRVsEromEjQ=;
  b=J2Y4LS4zbjbhorrwatNvMrgKR35paPRget3yRAD9D8IA1ew4HJ4tO/sl
   xdvZUGWOsx7sxWeKq0gWWADschgh/Khmtli8f9wXxv61DnFqRwK5pXqlp
   L0UCVbpm3AD7bDqJZpICuLkPRI2AFxMZeMv0BsQOwWKWNDOmpVaLAlgh0
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,275,1736809200"; 
   d="scan'208";a="214672165"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 14:56:10 +0100
Date: Tue, 25 Mar 2025 14:56:09 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: simplify if-else block by removing
 unnecessary braces
In-Reply-To: <Z+KraOo2DfmH5zMX@HP-650>
Message-ID: <36d38aa1-39f7-ba14-633f-d3411a863a83@inria.fr>
References: <Z+KraOo2DfmH5zMX@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 25 Mar 2025, Abraham Samuel Adekunle wrote:

> The if-else block contained braces around single statements, which are
> unnecessary according to the Linux kernel coding style.
>
> Remove the redundant braces to improve code readability and maintain
> consistency with the rest of the codebase.
>
> Reported by checkpatch:
>
> WARNING: braces {} are not necessary for any arm of this statement
>
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>

Reviewed-by: Julia Lawall <julia.lawall@inria.fr>

> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 0ed420f3d096..53d4c113b19c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -988,11 +988,10 @@ void rtw_macaddr_cfg(struct device *dev, u8 *mac_addr)
>  	if (is_broadcast_ether_addr(mac) || is_zero_ether_addr(mac)) {
>  		addr = of_get_property(np, "local-mac-address", &len);
>
> -		if (addr && len == ETH_ALEN) {
> +		if (addr && len == ETH_ALEN)
>  			ether_addr_copy(mac_addr, addr);
> -		} else {
> +		else
>  			eth_random_addr(mac_addr);
> -		}
>  	}
>  }
>
> --
> 2.34.1
>
>
