Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38912D8DCA
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776357873; cv=none; b=hfhFUIeuyn13hFDOXTG2zp4Z2OPWNd6Jr3So3fZO3T2Ut6c88KJ+1J1dIzlLfboMF+rMSdKVHGBpquQon6r8QqJHQwg6Kt7+xtY3v1VwfzDTjz4Jg+SBf0ch34lpoIhelXfD1HXNxnlpZsQahsradPum/jqxKixkA7Ec3USscZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776357873; c=relaxed/simple;
	bh=YUU3+xjeLdsqtZTdFxdFBIaeAlTtFbDXLvp82LEvJPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/1yXYWZ7KsRZPHn2PnOvx40EPN6Xl3NALonbdD71Q3WzHAEwiMq2i5foatz3KWaqCeeW5ufmQME7heHRWgm9PKa9/o7dQJDAes0h9QZ5QBz7FVy2+g6bFCBRBmYXjQ0fBkvEl9qLPPcmjmK2/MRmkVrqp41PIdO852DD1zRyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtXQjx0V; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtXQjx0V"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so109414735e9.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776357870; x=1776962670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g9D1OzvPa4FIenlg0nAZ/POcm7VOaJA4WMHxYv2Zv/c=;
        b=LtXQjx0Vb0S95wKui5a07U/+noLytDgS4rd4wipOA4PRqBk+/ifcT8ETzNrEAS+GT2
         rpndHB60mXV4WvJ088AareJyJUEsfknIn/Gwh8bY6l/ebKCVtz1cgefUtFzelHGBCugL
         Oqv7sj4pMdT792hOA6aafel00FOadwQ0BSdfZb1yzuT/IYSV/+9pdFgvV63NXSBcf+f8
         MGDpLP9hf3mEor2LfAcOJxoxNX6KLib8+vCMBxGZcddNgnnpdyx7AZPx4EYNELvgQUnJ
         07TzxLOu/Uuw0pAzsfyduQ5TpQ9LROF1npYqZPuqek9kCoKk617R1X1Fq7/mJ7W8/gSz
         f3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776357870; x=1776962670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9D1OzvPa4FIenlg0nAZ/POcm7VOaJA4WMHxYv2Zv/c=;
        b=kxaBdncDqx+A7mKc0p2nsQnXqDHAkBIyQygd+9Jhj7qsGg+9lJ37UciACQcy1BLe3P
         LgIr8H9EYEr4HXYTsJ5xQP86EW8nJOuoaa4Gj/AnyvMD1Fwku1qA74lBGIqPs+Iipj7I
         dAZbP2kALG64Q7U6cy16EEpMfsTujtSKG7oTeX/sFiN3W6RSZL4MvfcD5ANR6BjSwurv
         Qy+dnjLPSQPo/yNs84ldCqyl0xxJANx4CrVlHRlHufEo8SVxppuqml1PovDByCpJDS75
         Js9M2EmqOePCCK6+fpbZeWV2Bna6KJHcQLNg0yJ9CrHGB2d0DtozMhNeWaroBpfeu70P
         /RMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ANLGCL0H4zhF4z4Tgt5/ciFoKf/MzH5TIHoDDpfXoKIwFza8m37Z/f1qYgNFlPMtGmtn7be4Ug/CwWqXu@lists.linux.dev
X-Gm-Message-State: AOJu0Yw84+8vU8/ghTZ5/xn8KQIQXtVHmQBuG9FfgvEyaN3zjM8VjRUp
	BzV/WRcPu39XcKAdDI1cj4UR5X4M8ItFrWajzqyD585DgaHTJX10kusZ
X-Gm-Gg: AeBDietmJWqNeLke+Q7bhC8pet3nEuraGZ9aBTzQcCQl9auUaiInAgfyMVZ+2oT9lk2
	DIPwF4FrXEw6a8bW56cS4ed8NZEp/2mR/FDJeLKEfxYzue+5cRp8izt4BMichB+1nx1EO5h2KWf
	jpMLe8J042keEf0RSi6BLaUTuFInt84dEnjAD05PZZ9p4u5rXXDJqAl2hSmnjvpJg2N2TcVmjAt
	rKXakOETa5PkrirdokNQIxhjpbHH7j1+Aep9hNai4/3YjCqbZn4H9o6QqYNYd6TVojS1TNxozZj
	JYsSV5glqhs4L+hY9YFqnrFEcavDLr7TJkT7eaTe1HK0LoXgBtu8fYPpvtmyoHQpfncR2AbmZe3
	A49hvccQC2T5pFq7WXIg6b2waUsDKn8SEtMyU7hin5hw7wYlePvuMeZOKgwCLqjbitUxhURwgDY
	GbpGKLJ5TxUAeZ755+T/k=
X-Received: by 2002:a05:600c:681:b0:488:e192:6fbd with SMTP id 5b1f17b1804b1-488e192710cmr170540595e9.30.1776357870042;
        Thu, 16 Apr 2026 09:44:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f585cefdsm68242275e9.14.2026.04.16.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 09:44:29 -0700 (PDT)
Date: Thu, 16 Apr 2026 19:44:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 4/5] staging: rtl8723bs: fix out-of-bounds reads in IE
 parsing functions
Message-ID: <aeER6sBPtdGneLuY@stanley.mountain>
References: <20260415185501.440492-1-delenetchior1@gmail.com>
 <20260415185501.440492-5-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415185501.440492-5-delenetchior1@gmail.com>

On Wed, Apr 15, 2026 at 07:55:00PM +0100, Delene Tchio Romuald wrote:
> rtw_get_wapi_ie(), rtw_get_sec_ie() and rtw_get_wps_ie() walk a
> buffer of Information Elements using the TLV length field without
> first verifying that the length byte itself is inside the buffer,
> and without verifying that the element's declared length fits
> inside the remaining buffer. Both conditions can be reached with
> crafted input, causing reads past the end of the buffer.
> 
> An attacker within WiFi radio range can exploit this by sending
> crafted beacon or probe-response frames carrying truncated or
> oversized IEs. No authentication is required.
> 
> Ensure the length byte is inside the buffer (cnt + 1 < in_len)
> and break out of the loop if the declared element length would
> read past in_len.
> 
> Found by reviewing bounds checks in IE walkers.
> Not tested on hardware.
> 
> Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v4: add Fixes: tag and Cc: stable (Dan Carpenter); carry Luka Gejak's
>     Reviewed-by.
> v3: rebased on staging-next; sent as numbered series with proper
>     Cc from get_maintainer.pl.
> v2: rebased on staging-next (v1 was based on v7.0-rc6 and did not
>     apply).
> 
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 72b7f731dd471..e0fed3f42de0c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -582,9 +582,12 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
>  
>  	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
>  
> -	while (cnt < in_len) {
> +	while (cnt + 1 < in_len) {
>  		authmode = in_ie[cnt];
>  
> +		if (cnt + 2 + in_ie[cnt + 1] > in_len)
> +			break;

It's a pity this function doesn't return negative error codes.

> +
>  		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY &&
>  		    (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
>  		     !memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
                             ^^^^^^^^^^^^^^
here we are assuming the in_len is at least "cnt + 6 + 4" so we need
something like:

		if (cnt + 2 + in_ie[cnt + 1] > in_len)
			break;

		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY) {
			if (cnt + 10 > in_len)
				break;
			if (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) || ...

> @@ -615,9 +618,12 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
>  
>  	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
>  
> -	while (cnt < in_len) {
> +	while (cnt + 1 < in_len) {
>  		authmode = in_ie[cnt];
>  
> +		if (cnt + 2 + in_ie[cnt + 1] > in_len)
> +			break;
> +
>  		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) &&
>  		    (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {

Same in the other places as well.

regards,
dan carpenter

