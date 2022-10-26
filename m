Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFC110F9;
	Wed, 26 Oct 2022 10:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028F2C433D7;
	Wed, 26 Oct 2022 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666781079;
	bh=mv+nT/fYds+81lQzwzMKAsyolciIF3Ndr3XzU773gZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yJGawvpN+O+Hb8WEAFiiNKOwz0dKk8onsE+jbC9O4hgEmAOfyMagD/N2TJj4LNsMN
	 AwBdYJuWj3g4nQ/23nC6TXtQKjl5oH2N+cjhs5589RpvL1Hm6d4+zQcTknVIesFadr
	 L44u3HzLjJ3GcgkE0ietNDGedvb9VsV98rAttjxM=
Date: Wed, 26 Oct 2022 12:44:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8192u: remove unnecessary function
 implementation
Message-ID: <Y1kPlLyo7sb8OfFx@kroah.com>
References: <cover.1666754500.git.drv@mailo.com>
 <a15fe9f6167e76e4422d303ceafbd4d9b432dd13.1666754500.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a15fe9f6167e76e4422d303ceafbd4d9b432dd13.1666754500.git.drv@mailo.com>

On Wed, Oct 26, 2022 at 08:57:48AM +0530, Deepak R Varma wrote:
> Current implementation of function ieee80211_tkip_null simply returns
> back to the caller without any useful instruction executions. This makes
> the function call and its implementation unnecessary and should be
> removed.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/rtl8192u/ieee80211/ieee80211.h            | 3 ---
>  drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c | 6 ------
>  drivers/staging/rtl8192u/ieee80211/ieee80211_module.c     | 3 ---
>  3 files changed, 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> index 9cd4b1896745..00c07455cbb3 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> @@ -232,8 +232,6 @@ struct cb_desc {
> 
>  #define ieee80211_ccmp_null		ieee80211_ccmp_null_rsl
> 
> -#define ieee80211_tkip_null		ieee80211_tkip_null_rsl
> -
>  #define free_ieee80211			free_ieee80211_rsl
>  #define alloc_ieee80211			alloc_ieee80211_rsl
> 
> @@ -2256,7 +2254,6 @@ void ieee80211_ps_tx_ack(struct ieee80211_device *ieee, short success);
>  void softmac_mgmt_xmit(struct sk_buff *skb, struct ieee80211_device *ieee);
> 
>  /* ieee80211_crypt_ccmp&tkip&wep.c */
> -void ieee80211_tkip_null(void);
> 
>  int ieee80211_crypto_init(void);
>  void ieee80211_crypto_deinit(void);
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> index 7b120b8cb982..9bfd24ad46b6 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> @@ -716,9 +716,3 @@ void ieee80211_crypto_tkip_exit(void)
>  {
>  	ieee80211_unregister_crypto_ops(&ieee80211_crypt_tkip);
>  }
> -
> -void ieee80211_tkip_null(void)
> -{
> -//    printk("============>%s()\n", __func__);
> -	return;
> -}
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> index b94fe9b449b6..3f93939bc4ee 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> @@ -159,9 +159,6 @@ struct net_device *alloc_ieee80211(int sizeof_priv)
>  		ieee->last_packet_time[i] = 0;
>  	}
> 
> -/* These function were added to load crypte module autoly */
> -	ieee80211_tkip_null();
> -

Ah, but this was created on purpose, did you now break the module
autoloading here?  Is this built as a separate module or is it all one
big module?

You need to explain why this does not change functionality in your
changelog text.

thanks,

greg k-h
