Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF0F384CC6
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313348; cv=none; b=llP/SP/67rRUFk/cs3YfMXyTiYMrzDVHulXXZfqlLRgjnfkCuZR0eXt/S9s4SB69yS/4KAEpfq8bMl9spvxWWlR8ZISEmRMBqmQKGxRsUjT76knFbLDA0bjHVvfHg8AcQfQMnA4kPn7KywHtzDUuSfkvE4LzFX87siAiDnNJkek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313348; c=relaxed/simple;
	bh=0f6NuXc5QBHbcrP089lHyilyIEpGfEMRuODqvbMR3tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrTwxQoKRizowvWMaORlgQhycm31r5sc37cLsYXl7KH59Kb3TqPlBTuo8swWbRT6cDEBrwGlqwBfgXQo5+hPQTvjoPaYpB9/J/uM2Q6ya/QcwPzTVPrqBUE9XqEygUefSzHGPfdSOfhlEkO23BteFPWbsRD6MZrcPIcm+3RwyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5OVEYEd; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5OVEYEd"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68c1653ea0cso4283929a12.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 04:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780313345; x=1780918145; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dnas+wiD4/81j9F8DaAEG6ad+WURnj/jBxPPwOi/tWA=;
        b=K5OVEYEdfQNXxzH5VEhY8oalAfQfMV4ymvxY66blbuPTsBZKyE1hnpGSXLTqba2AVT
         xOWf4qlvt2XBhHKSR1kV4ETDPSJ1yFg9MCv0kZTWsIPYqCPf9YqGiqUUFnFgMA/Y8IIw
         Z6+NM2rIUM02URjCXRKw1m1KtN7Ie7NRY4sqz0q+3esOb+HUBpSCDUbX882uZ7BFFxAD
         A4GIPTHIfP5JNqqVU0YE9JR3KCsmiRk67z1hNKge/lroSwNK4u9R+vfhPh03gk8I9SK5
         WhWqBcjfe1ccb9znltsr3hTetPdrzwx/avYwg2sMXQ0hRg20Py8jPKI4FJo9r5wF6xik
         io/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313345; x=1780918145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnas+wiD4/81j9F8DaAEG6ad+WURnj/jBxPPwOi/tWA=;
        b=hP6tbEDuUTEr31ujFbzW+E+oj6bgaH+NDUAJthhx9MBD/tM8Ru74dU1ptYXyMOGE8/
         EFb41NNJL2we4wrd00ZVZP+NM/oGt9mOq95ZdlBtMnw8fKA4sYpy80VS1ipDP+waC4aL
         qof3JwTP8oxFvxunL6kHzFrRh7YA0Q/J0UjcYYPzpXxcVzX07TLIk/jpU5izhCajxp0R
         UmpDnpro/hDEeZb9X2xSE1q+BFK8P9+0DXtEAUwYhcPEf02YY7fr75VJcbQ72k3I2MJb
         hL2eD07WE5or+ElONt8gMAEwlC2Qcu5c8dKofHzXVEOOCO2fETNSyzT+tldaoTX64Y8O
         r7hQ==
X-Forwarded-Encrypted: i=1; AFNElJ97yIf/fCKKZR5cLltbNnH807CB6zoMEQiV+Mizt5Pb+ryYh1dK8nckGEAn2mXvhKVTuATIO9rKmxAwoIGK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+MkjPfTef2gkhCWy/kHAMoY7NQGRcnVGifFLAwErPAZmxyU69
	wQyaHY1cG9dx4G9Lc98RDX+64PwNWyYmsP7D9IVz5tYSGiyao30sTn2jL0xq6Q==
X-Gm-Gg: Acq92OE6voZxg2EOkS/uoe2U6k6uib7CCc3TiHasJN7IVICO3iqicsdcdLmKvl+o6VI
	svIKmWuCP+qUDkNuDOG03voReX2eOfCuRZkR9wR/7l/ggQ536oGV49+ekpKuVZsvT79eTthQ2fV
	QupAcR142f+s4vSPS6K1YvWkEPgz4ZudWAjsKj15cCt6X0hrZkx84Jo7hHVulW036oQoyS7Baom
	RaA8o5ubmzyToiQKARiGXM7tbnUXNgz1s2gFCzmWLC0wn0/lTYsE39YS88qqldtgpKRKanDd0v4
	YcioNDr5si+tYFAmJx/4KoqNMqj8kLaAnxPbhsbsYFPphyb8AIMqH2KzKa5oOWdXmwuutUVT1nV
	uQb7YxantFl/Elt3sIE0xo3kizcvs2lqUj756gJNH46jbbjp+oYTu3B20TY0n0Zm8AkUZpejVpK
	6v0cKkvNXldZrso1hcZOiEqeNaS3qdmTbLXre0WndMR0sU
X-Received: by 2002:a05:6402:2112:b0:68b:583:fb37 with SMTP id 4fb4d7f45d1cf-68c8ae13bc3mr5363368a12.10.1780313345032;
        Mon, 01 Jun 2026 04:29:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb7a7dc1sm1882521a12.9.2026.06.01.04.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:29:04 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:29:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eugene Mavick <mavick4022@gmail.com>
Cc: gregkh@linuxfoundation.org, khomenkov@mailbox.org,
	tomasz.unger@yahoo.pl, arthur.stupa@gmail.com, jannik@jrehkemper.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <ah1s_Eveaka0SHvQ@stanley.mountain>
References: <20260530031621.443015-1-mavick4022@gmail.com>
 <20260531061022.573089-1-mavick4022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531061022.573089-1-mavick4022@gmail.com>

On Sun, May 31, 2026 at 02:10:22PM +0800, Eugene Mavick wrote:
> Remove unnecessary parentheses to clear checkpatch.pl warnings
> 
> Example of fixed warnings:
> CHECK: Unnecessary parentheses around dvobj->cam_cache[id]
> CHECK: Unnecessary parentheses around 'val != 0xfe'
> 
> Checkpatch warnings regarding line length above 100 columns on modified
> lines were also fixed
> 
> Signed-off-by: Eugene Mavick <mavick4022@gmail.com>
> ---
> V1->V2:
> Fixed following checkpatch warnings on modified lines:
> CHECK: Alignment should match open parenthesis(line 1114, 1249)
> CHECK: Logical continuations should be on the previous line(line 1251)
> 
> v1: https://lore.kernel.org/all/20260530031621.443015-1-mavick4022@gmail.com/
> 
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 93 ++++++++++---------
>  1 file changed, 49 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 1d37c2d5b10d..84e9772a39c2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -118,7 +118,7 @@ int is_basicrate(struct adapter *padapter, unsigned char rate)
>  	for (i = 0; i < NumRates; i++) {
>  		val = pmlmeext->basicrate[i];
>  
> -		if ((val != 0xff) && (val != 0xfe))
> +		if (val != 0xff && val != 0xfe)

Just leave this one as-is.  (staging rules).  We deliberately silenced
this checkpatch warning so it's weird for checkpatch to complain.
Same for the other conditions.

>  			if (rate == ratetbl_val_2wifirate(val))
>  				return true;
>  	}
> @@ -351,7 +351,7 @@ int is_client_associated_to_ap(struct adapter *padapter)
>  		return _FAIL;
>  
>  	pmlmeext = &padapter->mlmeextpriv;
> -	pmlmeinfo = &(pmlmeext->mlmext_info);
> +	pmlmeinfo = &pmlmeext->mlmext_info;

These changes are fine though.  Can you resend without the condtion
changes?

regards,
dan carpenter

