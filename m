Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B4B32C302;
	Tue,  5 May 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979034; cv=none; b=hlJdc3YTeKhwC0tL6foNC0+kDWsCpkUrAbo0SR7q3Mrzk06NRfD4Q8I1tjc7GEefCm0zevFmS/nTxPQoyNqwsTSYxV3f4Be37VRLblGfOUMFt5ySuYG8v7hEByesI8udEB2y+UJRUs/Dvv9lGLeONv2FpNk6aSMKp7BHgdPTU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979034; c=relaxed/simple;
	bh=4kj7JreQkz9Y3PAojB1GgEOH3Ilo0M0dncTpOVtlbto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JO8nhKAAUFwhpI6OTMmcMroGJ32ou/ufrgL88817g+ZA8scXg8Jk/h9FTuEOgBVOwFkMZEphs8xCne2RL52kB/s1esqBPFIoKBO3YjrwniRt12x/MhCV5BfWO0zQml0rU1j/dWQwcH7qpNfyVDUQnTNKufqkC8DStKKvtPRUStw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ScqG3kfC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ScqG3kfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86028C2BCB4;
	Tue,  5 May 2026 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777979033;
	bh=4kj7JreQkz9Y3PAojB1GgEOH3Ilo0M0dncTpOVtlbto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ScqG3kfC8XRtRHHCATW3jIDipzNss5MThhQNvtsoHBTWsVtIouSnw6O8XJX+jaoJ9
	 TvTqFUiwnPNCaG78eoYSolcmMqRbHU61quU83kLVKC5PPZqxGMKfgnT1iBZDrHqqDl
	 Yt9mTrx2VTIfHxS6R/W1q1nJQtTN3L2hhnv4gNJ0=
Date: Tue, 5 May 2026 13:03:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary comparison to
 true
Message-ID: <2026050500-twitch-unblock-7897@gregkh>
References: <f14818bb-0d1a-45c3-93c3-17505571b071@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f14818bb-0d1a-45c3-93c3-17505571b071@zohomail.in>

On Tue, May 05, 2026 at 04:13:54PM +0530, Ashwin Gundarapu wrote:
> Remove explicit comparison to true in check_fwstate() call and
> add spacing around the bitwise OR operator to improve code style.
> 
> ---
> 
> v2: Resent with corrected whitespace via Thunderbird plain text mode.

This goes below the --- line below.  There should not be a --- line in
the middle of the changelog.

> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> index c70541f95a73..c100a0d70fe2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct
> ndis_802_11_ssid *ssid)
>      else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
>          goto release_mlme_lock;
> 
> -    if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) ==
> true) {
> +    if (check_fwstate(pmlmepriv,
> +        _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {

again, your patch is corrupted, and you ignored my previous review
comments.

Please relax, take a few days, fix up your email client and test it out
by sending a patch to yourself, and then send a new version.  There is
no rush here.

thanks,

greg k-h
