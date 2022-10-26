Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6491374;
	Wed, 26 Oct 2022 13:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEDEC433C1;
	Wed, 26 Oct 2022 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666790010;
	bh=Ah8J7PoQlRB6jZMoHEqS9VaV9N1dUhinY5gk6j9XEas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jv/sSbzLau11B3W0jeIeI45SCwvt8IhDb03Oi+qaaEHDRug0e9XLBA6677Sa86dwd
	 HGiAR6viXjlxcIh8oeh4BLQ3ffgvp35ah7X5UX/R7+5YgO5BBsx6AOR14oHY/QN93x
	 Ub7iFNoTZ2Oh7GZAgupJc4bmZccwITC5jdu1sfGE=
Date: Wed, 26 Oct 2022 15:14:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8192u: remove unused macro definition
Message-ID: <Y1kyr/hWqbKCzaaR@kroah.com>
References: <cover.1666754500.git.drv@mailo.com>
 <b7053d8737c048d6a878609f0ec24d66b18c5abd.1666754500.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7053d8737c048d6a878609f0ec24d66b18c5abd.1666754500.git.drv@mailo.com>

On Wed, Oct 26, 2022 at 08:58:44AM +0530, Deepak R Varma wrote:
> Pre-processor macros that are defined but are never used should be
> cleaned up to avoid unexpected usage.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/rtl8192u/ieee80211/ieee80211.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> index 00c07455cbb3..0b3dda59d7c0 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> @@ -230,8 +230,6 @@ struct cb_desc {
>  #define ieee80211_unregister_crypto_ops ieee80211_unregister_crypto_ops_rsl
>  #define ieee80211_get_crypto_ops	ieee80211_get_crypto_ops_rsl
> 
> -#define ieee80211_ccmp_null		ieee80211_ccmp_null_rsl
> -
>  #define free_ieee80211			free_ieee80211_rsl
>  #define alloc_ieee80211			alloc_ieee80211_rsl

These #defines are a mess, please look into unwinding them as they
should not be needed at all.

thanks,

greg k-h
