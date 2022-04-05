Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBF7290B;
	Tue,  5 Apr 2022 14:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD7CC385A6;
	Tue,  5 Apr 2022 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649167543;
	bh=Mm6htJ9QXhibJuptol/3kgU+rb9dRyr5kKvhCP6Pey8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2hVE6drCRXDZpJo5aLZ3PO7bKakIRz5fw4e83rgXNb5uBxju8zGTTiUzRTH8lgS9
	 Iq7ghmIJuzpN8xeZbxYgpMTOlppvJEhiAOIxGukPf9nC17SKRcnEAsccOLHkjL+iQe
	 blc/mkonzw/Fp5HSjjQlmAf2RhNlOO9+KVcsdO3Q=
Date: Tue, 5 Apr 2022 16:05:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH 4/5] staging: rtl8723bs: fix indentation
Message-ID: <YkxMtPimZLxAlkgg@kroah.com>
References: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
 <3bb9687a1057619334d95832f803c9b8d7e7fa63.1649128267.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bb9687a1057619334d95832f803c9b8d7e7fa63.1649128267.git.sevinj.aghayeva@gmail.com>

On Mon, Apr 04, 2022 at 11:16:11PM -0400, Sevinj Aghayeva wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> WARNING: suspect code indent for conditional statements
> 
> Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index c06be65b45cf..5eddff488f27 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -5145,9 +5145,9 @@ void link_timer_hdl(struct timer_list *t)
>  		if (++pmlmeinfo->reauth_count > REAUTH_LIMIT) {
>  			/* if (pmlmeinfo->auth_algo != dot11AuthAlgrthm_Auto) */
>  			/*  */
> -				pmlmeinfo->state = 0;
> -				report_join_res(padapter, -1);
> -				return;
> +			pmlmeinfo->state = 0;
> +			report_join_res(padapter, -1);
> +			return;
>  			/*  */
>  			/* else */
>  			/*  */

Please remove these comments around here at the same time, as the
indentation did make sense with those there, but now it's really messy.

thanks,

greg k-h
