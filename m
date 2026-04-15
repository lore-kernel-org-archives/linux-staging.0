Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5288C3D47AF
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243505; cv=none; b=kcGXJ5KmyGMYhriIBchTFp0XHhXELsKwlyBBMsR2s4EehLBTjH2f1ehtfdSLqh650y/znZ3zvAux/US7TlBhrKUj0ji1LCynqH/MS41T8DC2GHpSpz+XzVnMA7UUtgVkht1Ugkxd44v4WSlNEnzzmlzuTBHwuId2cn8wf4EoKdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243505; c=relaxed/simple;
	bh=tjwxoCh8RsswJL0AZaKD6YnWt2NGDz3mZWuPI5eieOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+bRth7aGO7W9PDlRq2hnQIn0PkhMKnKXzFIw9PIaXd+Nt9XjXOkkfeDFgSqxQsdTvELgy5P3vclHq6Ps90iT+vZ7y3OKoPSdM/BZoUq6VxKHPq9maaKljzj2oLLAIjloCWoKYn/c9/yFXtwrNCSNF0jGvYxLY0p42CebyUkhfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUCKfpxN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUCKfpxN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b150559bso50958325e9.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776243503; x=1776848303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6h2N9ksCXacxSbGHcgLCh/qKq3F9bELd0+y8Uh8lUbQ=;
        b=oUCKfpxNMH2iItDRoHQi/HT8OHbxfMuvv1bM6EcXl5yD8kWyEEYsIA9w/5Pjsy7pAF
         fpEMzt9/XTIlGP4erXmIn2NRPpw6AGI6KyuudYI6j6i3QvxTxbz4iBA2xzq7g2muiB16
         74QQo5faG/LWUnl+1OjskwY6eeP1DnCpkatuj07WmFIEwA0QUaTzZhWVqVYlHR1WAY55
         Ye3CxsmlBc5DqslMZi5I8/qdZ9Dt8xF1XbpiuqA7cd5WiCyXSgE04SUdbxAcA3nAV3ke
         usFBAw5L/ociTyGxi8MrL17TRq6HO/umy1m+KVpROo8IoBziWp5FaZm54Keh8q/pBDIH
         rtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243503; x=1776848303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h2N9ksCXacxSbGHcgLCh/qKq3F9bELd0+y8Uh8lUbQ=;
        b=DFWsvGymxRaVdUiekOe71iPbuvT3C1iZs/ntix6RtwHwnJLOx6j7tMJ9NeQMjICF1G
         eGII2De+SPRGOAI9RdZPhmv0wR/GbdeTAazoK71xFsNza59yOTn00CMl7LiIyvV3dnyd
         meiZbXaLvwxbUAJQazIgjbi3TbPYdh9dVIx7E/4WVAdc1OsJTmrJEmuQ9Uf04sQcad/a
         +rbh5v4085RVjvwnSI+PkCEGRTVYfun73+kinsekuQEmRa3rR9/xHXRtfnwL03uTBvWP
         +yN2ZOd1OtKI6xy3T2wXNkBfC4c6yGMltfSCbrr2YAplPYnsG6/08oX/+M7ihWZ5HxT1
         DI6w==
X-Forwarded-Encrypted: i=1; AFNElJ/qKLTn1omgCo1B2J7VuWqy5uuXiy+J2UoHca9H9d10LfaV7Ot21aWkSuri9SGmla83EP66c5WcfVj3GgGL@lists.linux.dev
X-Gm-Message-State: AOJu0YyZTQM98X1XISxWZJ5y8OfNK1EgYL51T58Bx6oXWT2rrFD54N22
	Lkwm+KUsiVM1Aw9rDqTcKkqFMoXxrvLtGBDIjyV66YFA83WAEzpnbpdB
X-Gm-Gg: AeBDievNXqsNqMs/8acfMqbYtGHmGBqO1gVqS7TXSkZubLt3rnKOU3X7IZtoUDwkRdq
	2ShnVRTqscQkHjFWRVw7svi9qO3alxcYmPGxmKQaQggPwflI1KauUAJDgsBs1XaG9z90BgcPLdA
	eP3CEFFHmh45gVp8MrDWlts5+qfefvF8Gbbg8BcqauYZ7nDK2tEKF/hQNbCb3yAiYsu/GdgvekL
	1zYeRtlTys073XG+AAeyIntk+ci+93bWvTXNESVuxcoF7H8IaF/TIWxld56/UA/xf+DVu2rUUw5
	MOwq3FB38KvBIRaSz3jIZjQbIfko7uFdDGdIZWIesuq/hJ1zkEcOQ4S12mAO5VaHO3SmwkN/0Gb
	XqmY8oYA4iA7zu3MQy81lAEMRd+t9f1IraN8e9sewZeUlZmgCP8B6Sjs7Z0YDxsHDYvDkek1qP6
	VySxkUUkLbdzsdBO8GJhs=
X-Received: by 2002:a05:600c:820a:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488d688688fmr287096005e9.23.1776243502635;
        Wed, 15 Apr 2026 01:58:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f096d110sm19990255e9.11.2026.04.15.01.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:58:22 -0700 (PDT)
Date: Wed, 15 Apr 2026 11:58:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix remote heap information
 disclosure in issue_assocreq
Message-ID: <ad9TKjTLxDRwDyIy@stanley.mountain>
References: <20260415050302.9934-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415050302.9934-1-luka.gejak@linux.dev>

On Wed, Apr 15, 2026 at 07:03:02AM +0200, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> When building an association request frame, the driver copies the
> ht capability ie using the attacker-controlled pIE->length from the
> ap's beacon. If the ap provides a length greater than the size of
> struct HT_caps_element (26 bytes), it causes an out-of-bounds read
> of the adjacent heap memory (HT_info and network structures).
> This uninitialized or sensitive memory is then transmitted over the air,
> resulting in a remote heap information disclosure.
> 
> Fix this by clamping the length passed to rtw_set_ie() to the actual
> size of struct HT_caps_element.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
> ---
> Changes in v2:
> - Refactored rtw_set_ie() alignment to follow "open parenthesis" style.
> - Allowed the line length to exceed 100 characters for better readability as requested by Greg KH.
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 5f00fe282d1b..08e597bc0345 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -2954,7 +2954,9 @@ void issue_assocreq(struct adapter *padapter)
>  			if (padapter->mlmepriv.htpriv.ht_option) {
>  				if (!(is_ap_in_tkip(padapter))) {
>  					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
> -					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
> +					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY,
> +							    min_t(uint, pIE->length, sizeof(struct HT_caps_element)),
> +							    (u8 *)&pmlmeinfo->HT_caps, &pattrib->pktlen);

You're being conservative and trying to work around the invalid
pIE->length, but in the case where the original code corrupts memory,
we're allow to just give up and return a failure.

There are two other cases where we trust pIE->length in this function
and those need to be fixed as well.

regards,
dan carpenter

