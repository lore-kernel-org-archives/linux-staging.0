Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFD53A2549
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120047; cv=none; b=KTxz9HaXx0HK55yKUN9cxMJEXWFbxNgF+UzFnRlsbRWO5nxQrabBrHU5VOpUG2Lp9tq1iwplan9LVsxqluW/Ef7NVhWM9YWHK8irh7KFLbBo4pV0jb/NI3YYyU2snqhzHc+1qiDJ9QBfOBfB1zJixgILKdcsjYwPaIYjdCZGwdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120047; c=relaxed/simple;
	bh=Wx9f8iOA6FJPHFR2QcjjZ5qqLADcQhk0Ao2uL+Gl7vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jucCIpxU0QWN8XOly9fKRoqhq44B4hP2fyr4rk2rGgEZeBg5G+APFyn30t1L5fbarCwFe4r0lAq3XZoNFHRipKb323wnqwhf8jBIwvQlzSqs8lHGTBz5OnTAe6UpYHQiN9hWiG8CI7K8BD8/N/gkw4MNklxbG95sLnBtye4CTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6EuvJuO; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6EuvJuO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so7612684a12.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782120040; x=1782724840; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1qxJTCBnKFJDEPnrv8MjfbwGEomhkttMVcfr8ENwSY=;
        b=c6EuvJuOvMTDibMb9bjoGaDbK0cAyZn+z3wX7ZHvH2MXkV5udJ7EUi/zgMFeZ0hc99
         v2/n2j4Y1vZeJHo1xJ3Nqx64UVQgpK2HZGh+Os6420YRve6f5qsgHtj55Q0CwEBTUhO9
         L3KJKdEm/WuTN1Jw+u0vZmtfJs9YhEVSEX2J0XKHs/gPYK6q9bnq/zxEutplJauwi07D
         CfgeWbL8mZxzBMDgcdZMbEL7qGU8/enToOki6HFSkZGpRWaKC9KVnsJJf5QFwPQW/pGc
         WWhFQgA0VoDa1qFVCSnNU1zFC+4hD6aPVNYaBJGiMMflalnO7UF8KJIIzzuK3/VZ/G19
         5hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120040; x=1782724840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1qxJTCBnKFJDEPnrv8MjfbwGEomhkttMVcfr8ENwSY=;
        b=LsiPhHAoAuBuiarF5eFDUiIAKUMEiqdZI9vRxoVc0keRwqL0YrGSVLBKuIAhTa5wws
         yz8I3M7hWS5mkUfOk84PAvvDC+YgObKvRsuztfaoMzyRQkaVC3Mrr184i5XqZKFbFcPf
         aeU4vDNd9JhELUuMaB60XMQD/Ewz0d63BxQRQa5NEc0yPq32YEPydtHvCMmwfWw7M/Am
         1HES3FQqoIVH6yoa4c2oYCCJs09IBx6UYYyZqKy8+6gnm0nNNztijfxCmtpMo+fpwC/a
         ZnaIQ1FGZhkpyn9EE7txAfCE4CDdMUzJcvgoiTtNPQn0D8/Qc4fPyBLUxiQdFQE++e3b
         32KA==
X-Forwarded-Encrypted: i=1; AFNElJ8dTLx6wGr7A7wRG2nLmMIwP9MADwcU8bmX6hf7S9dF2T5hvoSqmJKdshhENUd9JWV++AsUMeZzlzYXBclM@lists.linux.dev
X-Gm-Message-State: AOJu0YyGXkikgOIgnJGYRtCNpW0PV3DW4p58lu6H0S8GION5Ha1Q2xNf
	/ysgVFpbsiIBSPLq+N782xCNK4ZOjQ8EtP8+SgdPFbONBxbxhtfbboAK
X-Gm-Gg: AfdE7cl7RtTLBZIdOVUD/vgTzAeFp87vCSft+vzIdd0yp9wDnqtIbvN4l1YtZ66FDfY
	E5OrAP066IHXalrsnZaKlXAAcUG7AKGiCBbZ7jv3Bz+FnTTBXNUoqqp0k+l7MBXvIDJuAd1IryN
	y4EzTxoe+gAiKJ1/aXSgSa3Y6Kpu1X6a4QjaGdiprxwtV0eVmFxR3lNBf8rcyVDz2Zx1iomciVx
	7P5nlnuJK+IDFZ0AK+t3LRB0TkJNAKv7hdoc3/aw+2hAfA+6jI+pFnPPN/39WepPtqhkdTfXwU3
	BRQznpGmmX2qLFQTEz5IlIiMNartVMHichKW7gBXg/UYCC6LVgIZ1k5HCGmq3cKDQYxPyaGR1IS
	iO1yUH+nZrEVL461tqmXCwm47BHU8nbW/iWTYyyBzXrDe6mV/edm3o2lIWAKnWV0SzktY0noYDc
	8X5v4v7Iaf
X-Received: by 2002:a17:907:3f1f:b0:c0d:ab45:a070 with SMTP id a640c23a62f3a-c0dab45a33cmr261113466b.35.1782120040372;
        Mon, 22 Jun 2026 02:20:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fa67sm3040433a12.4.2026.06.22.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:20:38 -0700 (PDT)
Date: Mon, 22 Jun 2026 12:20:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: avoid duplicate size computation in
 rtw_spt_band_alloc
Message-ID: <ajj-YnZtw9mYALcv@stanley.mountain>
References: <20260621133301.13855-1-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621133301.13855-1-serhatkumral1@gmail.com>

On Sun, Jun 21, 2026 at 04:33:01PM +0300, Serhat Kumral wrote:
> Introduce a local variable to store the channel array size and reuse it
> for both the allocation and the bitrates pointer offset, replacing a
> redundant open-coded multiplication with the same array_size() result.
> 
> Resolves the Coccinelle warning:
> WARNING: array_size is already used (line 124) to compute the same size
> 
> Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 1484336d7..2e65788ee 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -111,7 +111,7 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
>  {
>  	struct ieee80211_supported_band *spt_band = NULL;
>  	int n_channels, n_bitrates;
> -	size_t alloc_sz;
> +	size_t alloc_sz, channels_sz;
>  
>  	if (band == NL80211_BAND_2GHZ) {
>  		n_channels = RTW_2G_CHANNELS_NUM;
> @@ -120,15 +120,16 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
>  		goto exit;
>  	}
>  
> +	channels_sz = array_size(n_channels, sizeof(struct ieee80211_channel));
>  	alloc_sz = sizeof(*spt_band);
> -	alloc_sz = size_add(alloc_sz, array_size(n_channels, sizeof(struct ieee80211_channel)));
> +	alloc_sz = size_add(alloc_sz, channels_sz);
>  	alloc_sz = size_add(alloc_sz, array_size(n_bitrates, sizeof(struct ieee80211_rate)));
>  	spt_band = kzalloc(alloc_sz, GFP_KERNEL);

This is still a mess.  First of all these size values are constant so
the layers of indirection are unnecessary.  Pretending they are variable
makes code auditors have to check for integer overflows so it wastes
valuable time and makes the whole kernel less secure.

	channels_sz = array_size(RTW_2G_CHANNELS_NUM, sizeof(struct ieee80211_channel));
	bitrate_size = array_size(RTW_G_RATES_NUM, sizeof(struct ieee80211_rate));

	spt_band = kzalloc(sizeof(*spt_band) + channels_sz + bitrate_size, GFP_KERNEL);

	spt_band->channels = (void *)spt_band + sizeof(*spt_band);
	spt_band->bitrates = (void *)spt_band + sizeof(*spt_band) + channels_sz;

regards,
dan carpenter



