Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675B529CA
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 09:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8123CC340ED;
	Tue,  8 Feb 2022 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644313438;
	bh=MVQhg8NpG08aednBukcoUd9p2iT4HIpeS1hAaBzlgiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgC3owl0d7PScJDX+10Dq6sHiMpDwqZv51bZf2cCbpj4GkVct6QyY4jLSFijPlMYJ
	 0x7fh5DZeH2Kqms8VJfq8UUEyVpkIZIutidqwtH1eBU/ozMb16/KtYdNeuRQR9Evvk
	 r0+geT57FuTxHegGAGWfGJ9S3scLcsQWPJRgmHak=
Date: Tue, 8 Feb 2022 10:43:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Leonardo Araujo <leonardo.aa88@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: r8188eu: core: alignment should match open
 parenthesis
Message-ID: <YgI7VtmUtD0nJ2O0@kroah.com>
References: <20220207234824.27893-1-leonardo.aa88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207234824.27893-1-leonardo.aa88@gmail.com>

On Mon, Feb 07, 2022 at 08:48:24PM -0300, Leonardo Araujo wrote:
> Fixed a coding style issue.
> 
> Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_ap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
> index e02dd8e11c95..c7803144355a 100644
> --- a/drivers/staging/r8188eu/core/rtw_ap.c
> +++ b/drivers/staging/r8188eu/core/rtw_ap.c
> @@ -942,8 +942,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
>  				pmlmepriv->num_sta_ht_no_gf++;
>  			}
>  			DBG_88E("%s STA %pM - no greenfield, num of non-gf stations %d\n",
> -				   __func__, (psta->hwaddr),
> -				   pmlmepriv->num_sta_ht_no_gf);
> +				__func__, (psta->hwaddr),
> +				pmlmepriv->num_sta_ht_no_gf);
>  		}
>  
>  		if ((ht_capab & IEEE80211_HT_CAP_SUP_WIDTH_20_40) == 0) {
> @@ -952,8 +952,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
>  				pmlmepriv->num_sta_ht_20mhz++;
>  			}
>  			DBG_88E("%s STA %pM - 20 MHz HT, num of 20MHz HT STAs %d\n",
> -				   __func__, (psta->hwaddr),
> -				   pmlmepriv->num_sta_ht_20mhz);
> +				__func__, (psta->hwaddr),
> +				pmlmepriv->num_sta_ht_20mhz);
>  		}
>  	} else {
>  		if (!psta->no_ht_set) {
> -- 
> 2.29.0
> 
> 

This patch does not apply to my tree at all.  What tree/branch did you
make it against?

Always work against linux-next at the very least, and the subsystem
development branch usually, so that you do not duplicate work that
others have already done.

thanks,

greg k-h
