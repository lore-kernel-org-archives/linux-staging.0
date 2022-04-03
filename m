Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D287C;
	Sun,  3 Apr 2022 11:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1201BC340F0;
	Sun,  3 Apr 2022 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648983713;
	bh=pQ1TJmFzZ56vwkQEI9EHhrO2TSNei/w5QKdyfS8cZgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1JCZmCaEHG53Heh87xLbrgw8bfN4DMqlmOkPMcnhNfpoMAuYp5dHFH5dGtrdYrVX
	 Z7YFlYpdfI0iTCy7JX/Tu1tfI0Ofc4GnlHiFCPNMqtsBkjTJ4dbgMxZChICRf8RR5E
	 L460X6iQ8v/CYsmGaiBlMsOy1MAHWIxAVvdxT2Rw=
Date: Sun, 3 Apr 2022 13:01:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaehee Park <jhpark1013@gmail.com>
Cc: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: wfx: change variable name to be consistent
Message-ID: <Ykl+ngCtuMIeF+Fw@kroah.com>
References: <20220401145350.GA45053@jaehee-ThinkPad-X1-Extreme>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401145350.GA45053@jaehee-ThinkPad-X1-Extreme>

On Fri, Apr 01, 2022 at 10:53:50AM -0400, Jaehee Park wrote:
> Change variable name to be consistent with the naming conventions.
> ssidlen was changed to ssid_len and ssidie was changed to ssid_ie to be
> consistent. This makes the variables more readable. The other ssid
> names in the code are separated by an underscore. For example,
> bssid_filter and num_of_ssids have the ssid separated from the rest of
> the words with an underscore.
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>  drivers/staging/wfx/hif_tx.c | 10 +++++-----
>  drivers/staging/wfx/sta.c    | 20 ++++++++++----------
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/wfx/hif_tx.c b/drivers/staging/wfx/hif_tx.c
> index ae3cc5919dcd..9c653d0e9034 100644
> --- a/drivers/staging/wfx/hif_tx.c
> +++ b/drivers/staging/wfx/hif_tx.c
> @@ -280,7 +280,7 @@ int wfx_hif_stop_scan(struct wfx_vif *wvif)
>  }
>  
>  int wfx_hif_join(struct wfx_vif *wvif, const struct ieee80211_bss_conf *conf,
> -		 struct ieee80211_channel *channel, const u8 *ssid, int ssidlen)
> +		 struct ieee80211_channel *channel, const u8 *ssid, int ssid_len)

This is not really a "coding style" cleanup, it is up to the driver
author how they wish to name these variables.  It is not a requirement
to change them as the orginal names are just fine.

thanks,

greg k-h
