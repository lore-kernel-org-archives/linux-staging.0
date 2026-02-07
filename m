Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE13090EE;
	Sat,  7 Feb 2026 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770469990; cv=none; b=vEbgbAq/L5WPIWxWvQLviHNKVjEN54lx7aYuBb4UGpcmmgCDf0LQJymACAlbnkSOQr/fOpdPKeO22rwoRMSkf2WDvEKyGwsJGNvMyJf5qYpUN7yN2G/AUCPB2DPO8fAl2Ht743bapQxh5mE5ufgHEyufDFW5R87tkJrTQac6Jck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770469990; c=relaxed/simple;
	bh=DjWij7034r9q4cSveHFB1pBlHJyKixwb7kVVNIEgPrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnb2WJ7eTa09q+zYFunpGOU1OE2DyDhKWl1jHVUoKt/YRYYMOXclQUBhN8vKRLe+jM/6o3Go2NXm2kyWruNmbwH0DB6tGUleWaktJcsK6wly8tUQu1jXgjfCumoieHE0gp+NgA6LYzvZSdbBdjZiT5qzonv+JAmjwvuEmYFLBB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XBcbMMmP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XBcbMMmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7831C116D0;
	Sat,  7 Feb 2026 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770469989;
	bh=DjWij7034r9q4cSveHFB1pBlHJyKixwb7kVVNIEgPrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XBcbMMmPV8p3+h62VUJdzMvM72wcUCCNtroqn/BScgajq4Iuf3L7lho4cPAVPntDZ
	 j8US6Cm9ergnOvtj12dcEC8kGxDQr9amqm+0Gw6BMJUUvzFSyYOag8xDnxypbJzmM5
	 em2oGr3K80Z/5FCb6E8jOBVzfbnea4LRhm6DvS3Q=
Date: Sat, 7 Feb 2026 14:13:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] staging: rtl8723bs: simplify boolean expressions
Message-ID: <2026020744-dweeb-wimp-dba0@gregkh>
References: <20260201113837.8531-1-khushalchitturi@gmail.com>
 <20260201113837.8531-4-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201113837.8531-4-khushalchitturi@gmail.com>

On Sun, Feb 01, 2026 at 05:08:36PM +0530, Khushal Chitturi wrote:
> Simplify boolean expressions across rtl8723bs to comply
> with the kernel coding style.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> 
> ---
> Changelog:
> v5 -> v6: Extend boolean simplification to ioctl_cfg80211.c and
> rtw_ioctl_set.c
> v4 -> v5: Rebased onto current staging-testing.
> v3 -> v4: Fixed alignment and removed extra parentheses.
> v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
> v1 -> v2: Corrected commit messages.
> 
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 63 +++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 40 ++++++------
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 14 ++---
>  3 files changed, 58 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> index 2d37ac4c50ef..dab20b8a9b18 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -61,14 +61,11 @@ u8 rtw_do_join(struct adapter *padapter)
>  		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
>  		/* we try to issue sitesurvey firstly */
>  
> -		if (pmlmepriv->link_detect_info.busy_traffic == false
> -			|| rtw_to_roam(padapter) > 0
> -		) {
> +		if (!pmlmepriv->link_detect_info.busy_traffic || rtw_to_roam(padapter) > 0) {
>  			/*  submit site_survey_cmd */
>  			ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
>  			if (ret != _SUCCESS)
>  				pmlmepriv->to_join = false;
> -
>  		} else {

You also removed blank lines without mentioning it :(

Again, please only do one logical thing per change.

thanks,

greg k-h
