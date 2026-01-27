Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6941199949;
	Tue, 27 Jan 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524635; cv=none; b=RfO1SWfbn7aqkYbk7MzKE0SibMVUSw7kgvw/Bl16I6VkLNeNifgLsBfihkPRjsLg80RN2Z7ruh8o7rbzEvhqh0FMedZEnDaLDUXSR3gW84YJHC8jCHTuVbiK4n9ecZ58lv0HOEmghNxSdlFwi6fEacL80Z1PRswen/Ea0ByF27A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524635; c=relaxed/simple;
	bh=WxyuxP7AaWt1YINLcutMXp56fFWo7hRfds2P9KQsEI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLG1zv8drFSaczWzhQ8sJF4y5s10tyEei9FUzQbec2VD1SVpufjFt1w3n112U/R18AXdhCdbCcuLqw9pOk33IqEEhhUrjTWVH5D8heJ17Px317MVz8kmALzZXlVoxBj+TQNS6WvbXGTZnQXN59RmA0xm4W9l24FeLQ2LOYiBzTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sL6H4y4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sL6H4y4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0918EC116D0;
	Tue, 27 Jan 2026 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769524635;
	bh=WxyuxP7AaWt1YINLcutMXp56fFWo7hRfds2P9KQsEI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sL6H4y4uiMMcIupvaHQMlk4ZZlkCD0BHroAPS4Fxa2wHw0D2MQyYoBLyvmgmAUgr6
	 T0hA4TEC0ZZJi0zBfyaljheSoSx0EFAw02YgpqblihsrH0WoQwFIHvIjo+H6HXqmSt
	 F9jdITRw10PxkIlJTxNhiVDo7PhbIRpCC2MQ9EGc=
Date: Tue, 27 Jan 2026 15:37:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: William Hansen-Baird <william.hansen.baird@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8723bs: replace ternary comparison with
 min_t()
Message-ID: <2026012728-dreadful-sliver-07e9@gregkh>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
 <20260116160914.88069-4-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116160914.88069-4-william.hansen.baird@gmail.com>

On Fri, Jan 16, 2026 at 11:08:50AM -0500, William Hansen-Baird wrote:
> Replace ternary comparison for setting copy_len with the min_t() function
> from linux/minmax.h.
> Change is purely cosmetic, however makes the line easier to read without having to reason
> about logic.
> 
> Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 8e41eb61448f..842e95e1eaec 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -4,6 +4,7 @@
>   * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
>   *
>   ******************************************************************************/
> +#include <linux/minmax.h>
>  #include <drv_types.h>
>  #include <rtw_wifi_regd.h>
>  #include <hal_btcoex.h>
> @@ -1024,13 +1025,11 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
>  			pstat->flags |= WLAN_STA_WPS;
>  			copy_len = 0;
>  		} else {
> -			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
> +			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len+2);

Why is the type needed here?

And your new line has a coding style problem, always run your patches
through checkpatch.pl please.



>  		}
>  
> -
>  		if (copy_len > 0)
>  			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
> -

These lines are not mentioned in the changelog :(

Remember, only do 1 thing per patch.

thanks,

greg k-h
