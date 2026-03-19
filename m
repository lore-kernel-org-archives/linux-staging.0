Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755353A544B
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907913; cv=none; b=VXawORpiJGRO1pFq8IPAplDZRbP1H/vEhzaMVTcrURSgjeuUPBjB+fCSacHTEGg4wjqhoWUs/xGKZgyjtBcAqKMGdumN2/yAbXQmZPCYkpqhcIxWd+SPCoHjVOgvkHvXl2fT2MWnAZZlSKnp1F8KQlQAEGHq8cqFcTzgqDnQOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907913; c=relaxed/simple;
	bh=AvTlZwl3Eq3gEVAQRBcNEHdpUnSGv301KvWojdi2zIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0JsJHDTHSIUyZVMl3e2/Bv4c4XokRzIO54mmQNDHeyGj4wBqwxP5l8laLyHfwdrcb1JWyypISCVPlcqnk/no0FG9RdHiO+7PT1VJVlVj97pF5LkGPOyOFTVBBp8zM61pyltkc/mvGejG+EmtxQiRpx4LJzVpeOF1dCraEHnv6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xi657cKj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xi657cKj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fb14227cso4124295e9.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773907909; x=1774512709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m98HIpnhM5vgvcVCxZI7C0rfqkBDtUJKk8BrMpO2jjY=;
        b=xi657cKj7IT1yn/41TNwRKcApEIW1HFtOGEHX8qqAEvycbTGAE4yPmWauqRsN/9wkK
         CdDkHzjL71B0XtKnZZwWSQOGER46agOqF99YnbUM+6VzB9tJb3gutmRzYhdMUDkwiyWj
         +VwmlTK6ocYRfUFASe+m/lD4q3087CGSDo5me9kvdMas8iTxgQQ2yzQKTVjkCqirSoiH
         aHctEIURGeppEHAFXCmT5r3LKfLI+tQUwRmkO1xujN9S+ZMCGhwH4d0+TtPyYYJ9h2Q8
         d1jcxkX1j18/7gE/3z+yV6NJ3ycdjHvV1LtAlqVRQJExa6JvLf78zPf/ooBO3t4/Gz08
         WDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907909; x=1774512709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m98HIpnhM5vgvcVCxZI7C0rfqkBDtUJKk8BrMpO2jjY=;
        b=qq2Pobfk4gK2NFuSZYZ4FobeA4El4vk7SDgP8l16ISkq9PscbMBuEPqNFtUsj6+wVj
         kVtYq6hfSjR98pHOa+tqvxRLzew+LAAb/CzhNayHCSuonNNtXy0NcQEmhXyq7kQAlrPU
         iHnadKfrs0OmUiG2DPNJGbfD0Cx8WJp4IXOj57JtoCdm98gq9iNL1crTrDydpUbO8170
         hycdQLYihAK2h8ha7C6yE5D+4w4bnepinuqbECG28e3wrWY9MDWiUHNlKvpRNk8/Ki4A
         ehwZ1BYkgNbmUkZTnZLEB9pq9/w63TFTiHfyjWfgGlOhfPM8o78oiDLSKeZomSR9a9hS
         3naw==
X-Gm-Message-State: AOJu0YweckTejSBuamYuVwSSWg5/UYQCYTtUMA1zcq7Eff1szFwjaJAJ
	QW7RimHoQos5n+VyciMzHOse2mF4B8MoegxRJd4AoMJhHUuCIUBzquLT1SRkm+wR2SZCQub9b/O
	RKAPj
X-Gm-Gg: ATEYQzz2WMPMmcVNN3CZ7XS5+76hrSenKjpp+hxuM1ROYGj+7Cq+q3jnp/eFmAnyG1w
	5MfL65Hxad0RlBXMNRqanZvxCQLrKCcknX4Vt9lyvs7BMVP695Jqpsjun1BOkMC6tG0L/m/DTv+
	r2BKVIcgwmYYZZg1tOqinxXpY0flhORe824TYd8LgKcsAAJ0jU+ymkdi9C9cX//yxmjQXqOi4QQ
	hC6KyvbD86EpAyCeUFRR7famNSn10kw76DkXblhhnQyvGnR1Ou28rjPW22zfcDRxNzfttS12r+r
	7fQIV8INZjHZSaFZyA8fW6W6HLtDL+OZdiioOe9/f0Swqzmp8VZ/oi24Dsew364Ax9jRpp7mcaw
	VzodTOnSwYt41raPNSrT0hFFjUqYG4oC6ggDORHbr48ylBN5ar25RT8nj32NrP/KZjME/4c5ExT
	+sTDhjrg+JnWev0DF9FRrkABU/xp9W
X-Received: by 2002:a05:600c:c490:b0:485:379b:57bb with SMTP id 5b1f17b1804b1-486f441bc19mr101424465e9.3.1773907908693;
        Thu, 19 Mar 2026 01:11:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc3b98f2sm12630455e9.14.2026.03.19.01.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:11:47 -0700 (PDT)
Date: Thu, 19 Mar 2026 11:11:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Reduce indentation in
 rtw_joinbss_event_prehandle
Message-ID: <abuvwYrjkXZAaPxx@stanley.mountain>
References: <20260318225550.535368-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318225550.535368-1-azpijr@gmail.com>

On Wed, Mar 18, 2026 at 11:55:44PM +0100, Jose A. Perez de Azpillaga wrote:
> +	if (pnetwork->join_res == -4) {
>  		rtw_reset_securitypriv(adapter);
>  		_set_timer(&pmlmepriv->assoc_timer, 1);
>  
>  		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
>  			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>  
> -	} else {/* if join_res < 0 (join fails), then try again */
> +		goto ignore_joinbss_callback;
> +	}
> +
> +	if (pnetwork->join_res <= 0) {
> +#ifdef REJOIN

REJOIN is never defined.  Just delete this code in a separate patch
at the start.

> +		int res = _FAIL;
>  
> -		#ifdef REJOIN
> -		res = _FAIL;
>  		if (retry < 2)
>  			res = rtw_select_and_join_from_scanned_queue(pmlmepriv);
>  
> @@ -1260,21 +1197,92 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>  			/* extend time of assoc_timer */
>  			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
>  			retry++;
> -		} else if (res == 2) {/* there is no need to wait for join */
> +		} else if (res == 2) { /* there is no need to wait for join */

Don't do unrelated changes.

The truth is I haven't reviewed this patch properly.  I see you have
made other changes unrelated to indenting.  Don't do things like:

-                                       ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+                       ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+                                                       cur_network->network.mac_address);

Those make it harder for me to review and they're against the rules.

regards,
dan carpenter

