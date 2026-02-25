Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414D3115BD
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002694; cv=none; b=jzunPSpEtO/BwUW2JrSisetrtr8483NNd+XPwRrlBegKkz0CkhMMVZiruaCWSbq9ayHy3DmFWhsolEI/vp14RGYz9cPju130DlBF+tXdoq1bQaLiVRMYPGu10xm6QHAQnt2xh++82uzOqChT6uwtI1VOLpHTW8YVy8YLs57GbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002694; c=relaxed/simple;
	bh=v60r68gfDl7wZWbSddD8l3aellAxLobWK4TkWXSqT5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHCMdpJwdCrD75BcIhW7CUn7GfcNVlCULSJkiBcwTuYwlJToShL4EGI2Dcp88qIsO3rGe68/ewqVsD/yiVnG/p5FRwji9Dj9Pn+6skbsAE8sAIGRUEQ2xD8ipbtTXo8l7cDTzr8/hDbAogMrlo7W90W5GCzbONlusayT+EoyfH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5zQU+IV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5zQU+IV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48371bb515eso78570285e9.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 22:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772002691; x=1772607491; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R6+NDOY5H+WoTBtir80X8g3iQTGFT3zn6+YzwoNyzvw=;
        b=f5zQU+IVjkn/em5nkdSQtXYWStLILwt2W0/COXBO/vNdIg+0D6JeAeWVj7uT6qxI9/
         s5dFof4r4BgVfG0mq9oWvZl8pf/8cKZ61bf8+97lhxrHXAD9matZwXmnMsfXOukojlKW
         HE4DsGjVb0pbZr64sXeh88Xj8x8hKMIrMLqgVW1KQzze+x1E37E8erhY9LZHRHUVW7xl
         yNDNIa6ni+SsJBPaDiFhxOkC+Koisqn2/6gMe3xLau6MVT/++6/jGylAbOKE90ABU5lq
         Ui+3NmVJGSjmNbcLzd2kcSgnHB/N+4e23KfTNPba/aZYLkcMeTf6n2jILcK/doMhtSvv
         uERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002691; x=1772607491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6+NDOY5H+WoTBtir80X8g3iQTGFT3zn6+YzwoNyzvw=;
        b=C/mhG+7FrtRSrNHrMKHmbNm1lK9BUtm8WsBUrJdxgui1oVfyzh0oUe29yAxUq5HBBk
         lsPFnmcFtfakI6G/f8uXzUapGp02jUIhBsx+OXV8KmaXRMjMNp6S1KqkKFm9deViDqom
         QPZsjU5UUCeGBEgiI1aVDucuC+lmXyB1x6dSMLI/jgFftojlWhn5HzhehmdEcWk6BDN0
         hOwMy2F1qCxO6tIlzgHyOjcj8USH9nmE/fyVtbrkz2KCvbx9G6haSs2T1ziA//69boTi
         pEr2du7A+9BoPRmagADXFCgVuHai8eOqt+bRCjhDIOSK9QORIqX7hn70ZY89U5VEQB+H
         DZew==
X-Forwarded-Encrypted: i=1; AJvYcCV2eJSB8ghuhwocsjm8sNKITNUccPSTx1GjwKN27YX1jjACH41kuDPzNLfDFWfYdzQJ5ok6gtvXl50vRDzj@lists.linux.dev
X-Gm-Message-State: AOJu0YzaZrqWFK/RXdHyalGYc8YzsnU1pvscMkHcuIoHxTuu08AiNW16
	ymlm2mt/m4m4PXTCpPStr6/D/JnEVbK1Fp0KVZ495np+gxJR3gookjpM/ix4sLl+eKD/7IIEWre
	/7u5A
X-Gm-Gg: ATEYQzyFra4oitMnJaJTXGEyxdBK0QN55qNwEynKqEp4e9cfq92r1VMDaorFUTv4rNB
	v3pWD6shpBRp4kyxIpmTZMsym6xSx/NYGkvXAot2ZeaQtRo/eoAZIPUS6q41sQxvZ5HtBoRfUNr
	kTcmlLySAdrjIYR5hOM0+fcmnHPFBhcP2K+Hpamn+Bjub5nwkrueB5te4yqlq+ry3J3uXMMbbEU
	qf3sDdtmK4geJKt3n5eB1HAvBMujZxrpJXdxa2wx/U7tCRGBruF4XDn98JxDkWnzqMvnjRi8IgX
	GrfsKweFF9mk+usidCR7uodul8V8L3h4jzztZoXWf4yqBTIxhOL9mvy4dbAbuX1sN8YJTg0qsyX
	1tBckwj8wED3qxdOoFpcr9+YpU/KD5IyLbs7t/hxch0oy2LMmt0qJohYYMqLmFbbZ8NtvQdOsFQ
	WvZ/tJXU+SRNpGDIFSh2fATalAk774
X-Received: by 2002:a05:600c:3147:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-483a962e3e2mr229792055e9.22.1772002690819;
        Tue, 24 Feb 2026 22:58:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm9329075e9.4.2026.02.24.22.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:58:10 -0800 (PST)
Date: Wed, 25 Feb 2026 09:58:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/21] staging: rtl8723bs: os_dep: fix line lengths in
 ioctl_cfg80211.c
Message-ID: <aZ6dfxhSxcc5_TZf@stanley.mountain>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
 <20260224132748.12336-11-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224132748.12336-11-luka.gejak@linux.dev>

On Tue, Feb 24, 2026 at 02:27:37PM +0100, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> Break long lines exceeding 100 characters to comply with kernel coding
> style.
> 
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 134 ++++++++++++------
>  1 file changed, 94 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 51725c302458..c04af493f24d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -127,8 +127,10 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
>  	if (!spt_band)
>  		goto exit;
>  
> -	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
> -	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
> +	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) +
> +			      sizeof(struct ieee80211_supported_band));
> +	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) +
> +			     sizeof(struct ieee80211_channel) * n_channels);
>  	spt_band->band = band;
>  	spt_band->n_channels = n_channels;
>  	spt_band->n_bitrates = n_bitrates;
> @@ -207,7 +209,8 @@ int rtw_ieee80211_channel_to_frequency(int chan)
>  }
>  
>  #define MAX_BSSINFO_LEN 1000
> -struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wlan_network *pnetwork)
> +struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter,
> +					     struct wlan_network *pnetwork)
>  {
>  	struct ieee80211_channel *notify_channel;
>  	struct cfg80211_bss *bss = NULL;
> @@ -248,7 +251,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
>  		u32 wpsielen = 0;
>  		u8 *wpsie = NULL;
>  
> -		wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
> +		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
> +		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
> +

No spaces in the middle of a declaration block, please.

regards,
dan carpenter

