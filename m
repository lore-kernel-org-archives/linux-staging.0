Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C7D2C85
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 09:50:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E04E60F55;
	Sat, 30 Oct 2021 09:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635587444;
	bh=KaftmMC1X4hMAlwADoIc7z1y1me8qGOYuUsoTWs6/NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQX7ddRMqM30ZGUlRlKs1t/idfM3xZgkUuuoW5VAI5TrnqiV5gS/d+HJ+NWpCbZBV
	 3q/rEpvgXLn8w8CVY10dotju5vOwu7qbFJbrxUQER12zmf8p/c59qf7/kj265xXwMJ
	 ltrBX7c78mf2Q4YBiSGtGef39ELw1rDqEmtwV8rs=
Date: Sat, 30 Oct 2021 11:50:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Goller <gabrielgoller123@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: wlan-ng: Cleanup fix parenthesis alignment
Message-ID: <YX0VcfPnHTBAyMiZ@kroah.com>
References: <YX0Ut9BaVBQk5Z/g@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YX0Ut9BaVBQk5Z/g@desktop>

On Sat, Oct 30, 2021 at 11:47:35AM +0200, Gabriel Goller wrote:
> This patch fixes some style-warnings of checkpatch.pl:
> Alignment should match open parenthesis.
> 
> Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
> ---
>  drivers/staging/wlan-ng/cfg80211.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
> index 7951bd63816f..de2980c69711 100644
> --- a/drivers/staging/wlan-ng/cfg80211.c
> +++ b/drivers/staging/wlan-ng/cfg80211.c
> @@ -476,8 +476,8 @@ static int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>  				return -EINVAL;
>  
>  			result = prism2_domibset_uint32(wlandev,
> -				DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
> -				sme->key_idx);
> +							DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,

And now you added another checkpatch.pl warning?

Please do not make changes that do this.

thanks,

greg k-h
