Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AD8390614
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928215; cv=none; b=L0vUU5PIGoq045zBVEwiAKOACtjXXopdzoqgyzYcYdyAANsTQK/qMQPY/C73p88FWAt8eL/Tx8XSDVWHkIEgAf4w2NjXdirp6wGwEb3BgKGVOA2r8uD0XTPUqL2B06rUzXpWRMWfxiawCXozOPc0ZB2Q8nheSJ6nXcoJ7ieYELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928215; c=relaxed/simple;
	bh=zg8/SoEgcPhKfcaKqHDJnIgdf4tSdM2gXNM+dTYRN2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUTkAYV92Nzk2mbZ5+tHAS065G1t+fOYaUmuBvEMnuJeFZnnXrX1LmG4ZnIPjNbAA8AcfdCNUqXN+wD2CE7s3GXM7ImPRGo1WFYNNG9QUZXQoZayCEM2aDJ/QruMiNWJBBecPMqJeB5UBH+HOi4JZ/9wUtYFhE14hOwosSZlDzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8W9tSAc; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8W9tSAc"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4472500e25fso1347270fac.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928212; x=1784533012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zk7P8lJ+ecloI4AUiW845OhwWku/fofjpsy+knKmNDE=;
        b=S8W9tSAcXwhI/WKEIGZDZPQnSr4li7JxnGq6hTg1Qi30oxzDZRNx9MjtlBAZqGNA2E
         W3oCau/D/uB4soG8+PghUKmafO4pbw11lHqo81NQjzQ4dqqwAnIItMIJybgpc1Zt33eM
         0cjdtXku8lO0yS0TnKWXvNpTu1nSV01FCTih9azgy/MBVcigwiOskRLVCRWpGzsa1Upy
         cy/NlC/vbKmDNE72/6RAv4rvP9i9zuosH079G55ijb49tQMEsI59+wvepB7VIJ2QR21A
         x2/pjXOKCoPsDtONMKdKao+UuJM2V3rG8ePR2InyFazUNOBbNCxt4qyahkzkfY1vxUZq
         zqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928212; x=1784533012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zk7P8lJ+ecloI4AUiW845OhwWku/fofjpsy+knKmNDE=;
        b=c7C+4M7OeCYKqx/JvGC3+R29FAm2X5uQemzp1HADwq41it40zRn7QXXOsBztJYcK/w
         qaee9dvX5AjuHt/72u0gCFn82h4SG++1jn1ayITyb/QQ9j4GzJ7X54TPoteAndegXEfl
         Hy5WF14UFz2IetGyr5ZKYlgucYiKA54RWNTaQRvFboovcD2wmydWPDgmsMGsjkUbVPhi
         key4VkZJ+rtJmuparIt/oyX5+2mdGv5biGv81rbnK300q6CKJ2+bzHu8VxZJMN6ggAa1
         wq1JZ5lk4cpKELTUyNR0lsdgeJ3LHCe7SfQ57QptJuCFpFIr9QK2lcoR+ypGwJmjf5sS
         pMiw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2GC1jIk1UHFEr3Im4XvSWA29mVuUn9HLkaKc6rS6T3/9m54KS810MEX0wO/EWIlvrPVqzFgfY3qvZStTD@lists.linux.dev
X-Gm-Message-State: AOJu0YyqmG3iAA+0HEDORNJDTfIhJOkyzR3RdTNFP6n+uWx/NH1Pc/NS
	ac25IqpaM3lNjfbKJtUC1PVr4/mqHtNZLJBUbyzYL06RQLlJAHVETze5
X-Gm-Gg: AfdE7ck6LjxES2ojKse+jRBNoKEv3mUBkIcymtQFIqE8ab65XnO/AY74UqKfUbjCmVv
	UEa9jyusDHBfM1sloEwdC7SOgzj1DxeKEuARHZ0Qz1O0PhJLEWEQdzdf+Pt8NEkNebirSdMeKWE
	g264jgimd7giZXVyeVkrA65NfcMIIUUtBJ1LemCnoWxC7ggZRY2pqGPT6922+TgA6ZQjZQbrCe/
	mFtxthLw9vI/K+ck1HmD0T9zJt4fLEPS1Dt6KO2J+x9sCzHDIvpNUQC6eyE4ZLfFTyZIidBWEzw
	6YjigYHwYFZwlL5wDxA1eoU4MrBl+5TQvNyGn10Af9He+pACPouUP5wPWJ+s2UpI+3bU98B0wKn
	oEWnEugNdsseYMkjRJpT+PuBrwWknS/mOfTRzFI27Bdm+CKA+5PaWl488KwcWpbks5T1I/cZLam
	s7kHOi
X-Received: by 2002:a05:6871:89d9:10b0:454:e0fe:a61e with SMTP id 586e51a60fabf-454e0fec342mr1990326fac.30.1783928212342;
        Mon, 13 Jul 2026 00:36:52 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm11505717fac.7.2026.07.13.00.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:36:50 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:36:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: teirua <qndkdrnl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix inverted HT40 secondary channel
 offset
Message-ID: <alSVi8i-OB7Y51MW@stanley.mountain>
References: <20260712041100.11787-1-qndkdrnl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712041100.11787-1-qndkdrnl@gmail.com>

On Sun, Jul 12, 2026 at 01:11:00PM +0900, teirua wrote:
> From: MinJea Kim <qndkdrnl@gmail.com>
> 
> rtw_get_chan_type() maps the driver's channel offset to nl80211 channel
> types the wrong way around.
> 
> In this driver HAL_PRIME_CHNL_OFFSET_LOWER means the primary channel is
> the lower 20 MHz half of the 40 MHz pair, i.e. the secondary channel is
> above the primary one: rtw_get_center_ch() computes the center channel
> as "channel + 2" for OFFSET_LOWER, and bwmode_update_check() sets
> OFFSET_LOWER when the AP's HT operation IE announces SCA (secondary
> channel above). In nl80211 terms that is NL80211_CHAN_HT40PLUS, not
> HT40MINUS.
> 
> Because of the inversion, cfg80211_rtw_get_channel() reports an HT40+
> association as HT40-. For an HT40+ AP on a low channel (e.g. channel 3)
> the resulting chandef spans below the 2.4 GHz band edge and is invalid,
> so the regulatory core tears the connection down 60 seconds
> (REG_ENFORCE_GRACE_MS) after the AP's country IE triggers a regdomain
> change: reg_check_chans_work() considers the reported chandef unusable
> and calls cfg80211_leave(). The supplicant then reconnects, the country
> IE changes the regdomain again, and the cycle repeats, causing a
> disconnect/reconnect loop every ~65 seconds for as long as the link is
> up.
> 
> Observed on a TECLAST X80 Power tablet (RTL8723BS) associated to an
> HT40+ AP on channel 3 with a KR country IE; a kprobe trace showed
> cfg80211_disconnect() being invoked from reg_check_chans_work(). With
> the mapping fixed, "iw dev wlan0 info" reports the correct
> "width: 40 MHz, center1: 2432 MHz" and the periodic disconnects stop.
> 
> Fixes: 5402cc178c5d ("staging: rtl8723bs: add get_channel cfg80211 implementation")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude-Code:claude-fable-5 bpftrace
> Signed-off-by: MinJea Kim <qndkdrnl@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 1484336..e472687 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -1949,7 +1949,12 @@ static u8 rtw_get_chan_type(struct adapter *adapter)
>  		else
>  			return NL80211_CHAN_NO_HT;
>  	case CHANNEL_WIDTH_40:
> -		if (mlme_ext->cur_ch_offset == HAL_PRIME_CHNL_OFFSET_UPPER)
> +		/*
> +		 * HAL_PRIME_CHNL_OFFSET_LOWER means the primary channel is
> +		 * the lower 20 MHz half, i.e. the secondary channel sits
> +		 * above it (SCA), which is NL80211_CHAN_HT40PLUS.
> +		 */

AI always adds these comments...

Normally when someone fixes a bug we just allow comments like this
because if you fix a bug then you get some say in the style of the
code.  But with AI writing more and more code, maybe we should start
talking about nits like this?

The documentation for HAL_PRIME_CHNL_OFFSET_LOWER should go at the
point where it is declared.  (I haven't looked to see what is
there).  I suspect just having this explanation in the commit message
is enough, but I don't really want every constant explained every
time we use it.

regards,
dan carpenter

> +		if (mlme_ext->cur_ch_offset == HAL_PRIME_CHNL_OFFSET_LOWER)
>  			return NL80211_CHAN_HT40PLUS;
>  		else
>  			return NL80211_CHAN_HT40MINUS;
> -- 
> 2.43.0
> 
