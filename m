Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785F623AD
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 09:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E97C433EF;
	Wed, 22 Mar 2023 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679476742;
	bh=Hs1wGaNY2e5QVCceq5jv/4QsLC/Wr97AzDg/bWaIJ8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MuSY0K0zJH2Dzv6tiYfzBEUEV0bGa+Tq/gcpPhO8ltzHSPrKW4VaAUTBpmKJY98el
	 ZHo3uIbbZMKWgzFR+NIiWutvRsUwUw0yPC7J+cQTa9xfpABTL103UMNHzs+zJLvQR3
	 BwE0G3Izh4GYs2BxtQU/ZU2VcwDwsKE2fFzpYGWE=
Date: Wed, 22 Mar 2023 10:18:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Inshal Khan <kziaul123@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8712: osdep_intf: Remove RND4 macro.
Message-ID: <ZBrIA/y62yTi/wdu@kroah.com>
References: <ZBqPTz9j4tjDxaHo@mehmed-HP-Pavilion-Laptop-15-eh2xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBqPTz9j4tjDxaHo@mehmed-HP-Pavilion-Laptop-15-eh2xxx>

On Wed, Mar 22, 2023 at 10:47:03AM +0530, Inshal Khan wrote:
> The RND4 macro was found to be not used anywhere in the project.
> Therefore, it has been removed from rtl8712/osdep_intf.h to
> simplify the code and reduce unnecessary overhead. In case the
> need for rounding macros arises in the future, kernel rounding
> macros will be used instead.
> 
> Signed-off-by: Inshal Khan <kziaul123@gmail.com>
> ---
>  drivers/staging/rtl8712/osdep_intf.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/osdep_intf.h b/drivers/staging/rtl8712/osdep_intf.h
> index 0e097b4a8670..446ee09159fc 100644
> --- a/drivers/staging/rtl8712/osdep_intf.h
> +++ b/drivers/staging/rtl8712/osdep_intf.h
> @@ -17,11 +17,6 @@
>  #include "osdep_service.h"
>  #include "drv_types.h"
>  
> -#define RND4(x)	({ \
> -			typeof(x) _x = (x); \
> -			(((_x) + 3) & ~3); \
> -		})
> -
>  struct intf_priv {
>  	u8 *intf_dev;
>  	/* when in USB, IO is through interrupt in/out endpoints */
> -- 
> 2.34.1
> 
> 

This commit does not apply to my tree at all :(
