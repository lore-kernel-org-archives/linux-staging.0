Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DDF31E859
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 04:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778472829; cv=none; b=Na5/EFydJtDzigzWtzdTQwvEBOrCHgW86wCvvvAFgZIwrD6Ydp7CVTbdpHQh02MlW2C9HSlPcS3i175Z1g5WixhUpqGQs41u5bR1/96bA56oOhOWhKkmgV6cBx/vqFX9PaUt21SFWehsvzpKEFiQ4AY6rarTk/58VqmtVB1C2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778472829; c=relaxed/simple;
	bh=t1m27DAHGwZBsscXewPb4HsBqTPhVufG9Ao+6UbfdDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rfn2m+ew13mY7xLOZAxWCLP9FkFoO/O6pV4HpDa+DhG8y3KsUtoPEXbeiqfRYYYgPjg0LUS0bK0dNah02mOZlbevKp4pELKO5Qtwors8X/oNwOA1KAgDzmTZOHybVyzNJkEqp143XPkxj7aT25YTaqZVhCNJI7kgIyonpdWmS44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMhl+yJW; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMhl+yJW"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3640816e87.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 21:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778472826; x=1779077626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6zZI0KBGiX5GV1JbE7jkE2v8T5GPPErh+4Qk9EtY3w=;
        b=WMhl+yJWqDssziuGLbNgW+z5xef9QOoMuplb4B0kk3aq++3Eu8KOEgOPvnwr0ZB51u
         lhYBV12fPtw498VWUIwHXD9bH0H2DettnfhqCNQe78eExlMQ5KlL68QfB0V6sEiGt2U/
         FfXgQcbblkR9nOD2/bxuw1AXzSY+rGfHjseoBwVZJc+UtFsSJSVBitEiyALd2uZN7K8p
         6hYY1u5lvItKvQdq7ptdaNDGnAcU28P2YmxKvgJMcMjbAWih+9CRSFhok2ivLYgwKY8W
         xng3xhYjPrmdA9S6sAEjm4+8pf9NqsZJoYTe2swiOl7jTakEBL7YJhzMmo+i/bPUqUly
         9Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778472826; x=1779077626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6zZI0KBGiX5GV1JbE7jkE2v8T5GPPErh+4Qk9EtY3w=;
        b=g+BRvSpW6Rs9VHQvLW0MIQ7wEY2yQqy5B7plONTp5HMCJaxi35WqJq4ayctGYzEUjs
         yK8/FBAJKkLPilzhPSCnHuFkIt66DNa4Y36U5FGNIKrolXzwPxpXciBm75SjcbCJ+mAb
         pl7yc4PE+2398tRmdwPme4ErOmugcM4MBOyFlA8iFSltehjtVaGD5yl90ZgKKRlgfUaa
         YCLcMpqQYrMI5DK9bwXmHQ6ZicbqO+dxpKLjZMQAwoCl110I+r4igJVM70Z5XI0k/XVn
         8Fts1MICoEpnlJvA+csdrPJJtVkp6Jd/y3sKGJZD0HlX/BLqxEkzWzqgp22pM5H6w5ul
         9Mzg==
X-Forwarded-Encrypted: i=1; AFNElJ859j74BrSxIePYfwhWb1xGJxH66wkNJr0LS4Iievp8jqK/0xhXKRioUaduOot0vaKScl46lLVTLhVZNTMc@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4Fd/81fXadkKcdvezhVQ5Z/1zD0+DrBmwfGATh2c8IXpG5dXA
	ZNutG02glwIwFkHXLyQ1xUOKyz/Zr91utTQxIlMbyQuB5IUs9+Y2UdonMqzAMtro
X-Gm-Gg: Acq92OGlWWAoBIoZa2uk9Kgcg5avjgXvGlG+km2F7SY72UEHsklhcJChJPefhuUUWHb
	TeuMjRaJl6oVt2DV/sTQvIeE/QxzLA5+cmgitrqH9bjPqjr4vPz+ns7FEvA2rXdq0OGltYRu6yn
	xjTJqmYfNiHi/QIFhetgUiRL6r+nFFmCNjgtwOEvdMC1To9gYGBXvmXo+VpM3UlEibCf+HJUbtB
	n6+ZnolnjBTwCDWCLTsLAiZcwGoA/CA3dMfu6Lk0wViEbtNk5AkoYO52Ot6tvdXDdHTZaRnlZk8
	I4jWKsL/gHi57k06Uztx8EVwuJP5SWHzBmsqOed6+Ryp4wLhxVyRIVcObzBx6+gUEkoozCMqoCq
	Z2LvQK1+Puy82PEMMFacxZfxgS5/zqP9Zu5fFH3v7ext2KOLrW5vRXwQEdLI/x3MIAKqokfNbqy
	eKjbrLsvdOuWJ95pL+FmM6VantTShdtFlqZOA=
X-Received: by 2002:a05:6512:3b0a:b0:5a8:7426:d2da with SMTP id 2adb3069b0e04-5a8b6c9d811mr1880726e87.7.1778472825591;
        Sun, 10 May 2026 21:13:45 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d160sm2318045e87.19.2026.05.10.21.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:13:45 -0700 (PDT)
Date: Mon, 11 May 2026 07:13:42 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 9/9] staging: rtl8723bs: simplify if-else blocks in
 rtw_mlme_ext.c
Message-ID: <agFXdkdfheNSrhCb@archlinux>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
 <20260510134315.64295-10-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510134315.64295-10-khomenkov@mailbox.org>

On Sun, May 10, 2026 at 04:43:15PM +0300, Andrei Khomenkov wrote:
> Fix indentation, remove unnecessary braces, and wrap long lines
> in if-else blocks inside the site_survey function.
			       ^^^^^^^^^^^
Again, better with brackets: site_survey().


Thanks,
Nikolay
> 
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 7ac23ccb39f7..2667adc30b00 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -3741,11 +3741,11 @@ void site_survey(struct adapter *padapter)
>  	}
>  
>  	if (survey_channel != 0) {
> -		if (pmlmeext->sitesurvey_res.channel_idx == 0) {
> -				set_channel_bwmode(padapter, survey_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
> -		} else {
> -				r8723bs_select_channel(padapter, survey_channel);
> -		}
> +		if (pmlmeext->sitesurvey_res.channel_idx == 0)
> +			set_channel_bwmode(padapter, survey_channel,
> +					   HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
> +		else
> +			r8723bs_select_channel(padapter, survey_channel);
>  
>  		if (ScanType == SCAN_ACTIVE) { /* obey the channel plan setting... */
>  			{
> -- 
> 2.47.3
> 
