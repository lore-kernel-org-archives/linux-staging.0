Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED051378D88
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769669758; cv=none; b=O7GXEkYPiSEaNF6y0203TZjZKeRB1f+Y56zdGygqQt+SbjGbK8eSgCohVRr3qvEH4SVLG94Y0VuTq7WCCF3UxPUujzDOPt3LcdSq6lSgKVrcc8nGiYGRxi14KBFZr7Bo8aykg5fu+DYD8jHCJj16k5cjIQnxWUesM6bgqwGVfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769669758; c=relaxed/simple;
	bh=gUko5UOFFyVYjTJn5ab9npyLP+v/e6zW8uA8irQInCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsPI0ynhBME9gcgUBo0sgVFjMdAtoOAnfGfO2W0gWo2RWCst9nUi6wkf2r43qHmIPBbLFDu91TpG9QQ7CJHxG38VfbGno+OAcWacw+0V4JAhO4m28yvf44Uw7i5vA6bzWyXeUTrIN97vxb0UYPA432AjlX0Q4MKLlPqioZ2xwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKbZcZqc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKbZcZqc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso4922575e9.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 22:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769669755; x=1770274555; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ati3vG62O1RcEHZqIG23DMy57RyekTsTte70sZ8uPDg=;
        b=oKbZcZqcQhp5VVMXh+e9WAUEBxNcSPbBebaYQwBNkvKG6TYmPcdsWY5ezfvF5isyaF
         j2eKG5MylcKzrbNXGgII03lzv+xWUBQYL4DFIlDHJuJMiKJH3Hql81yRtPVikPKAnYsd
         Vcs6wujcjMx/+GhibUfzJ6tR9sci+MxbF1BsJ62hH37AYStcMw53ihfdN0u91Iy7YjGF
         b1a28ZOBudNovZHvvpQ5Aoirh4bmQsF0HebeMrqkOYtMGJ5GnqxXZsVQ+jyANvuMEXuw
         JXe+PW5XVHJuHgVOyBBcAFz5uU3wY3dqx23h7eIeaqzCn/38OVV+lqIJHB97CEAozDn+
         mdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769669755; x=1770274555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ati3vG62O1RcEHZqIG23DMy57RyekTsTte70sZ8uPDg=;
        b=hRm2KAvjWt9jk8Xmo3MU+1JIC2sAe7AsKpzVuy/JeZCgVHByJsGXU2eLyKlkdCs0Cx
         XiwWQ+GSvrSU/Dpg/83erRTRMmlH0T5CNiJWt2JmWO/vJz8d1fYtjcs9lIcCNwwCFZyr
         1NRcZRYxwneny172YafcZ0R1e+jPrOkdpkbBcCpayyjeiVeTKMyB8UT7LK34LBqJzY7A
         FM7LV0MdXyvqTNHTlB7HFv1IhwP9BKfT5DBpsrW9xe5h1OoB1O2kktpBBYDeTYqbGOeK
         naGeI2ouO4x4Jgxo7bW1oGvws3DhNvFmpq6NBuzYjmv/k+FS0gPu8Z9D5wwuDdjuV1rO
         f/5g==
X-Forwarded-Encrypted: i=1; AJvYcCXWFsEX/juyXyQ0gI72jzHlocudVmRhHWTfkTv9Kr14bTUBEPKlsoVlIX8RytF9DWGRbT2j0qVVcjRf4eto@lists.linux.dev
X-Gm-Message-State: AOJu0YzDL+3v0Bm5MRH3d6m6C0WxIJ8rIVc8zovIA87fR4NS4hpwPlFo
	ySD/naNtlBt8PUZy/7Y7pEkoltY9BdUtn4j9uMUskpiaJ7HxleDzjE6iH4G2txsKUyg=
X-Gm-Gg: AZuq6aLEnTHrpbnJTtCB60kU2ctFuwI8hQspQRCu8gahra86xIrkz/0Hd+wp3uKtVlv
	0S01uM9NEjGd4BG2gEPdJ7tWWY1dTQQyby4KhczRa88hK+lOiMtsXSNI6cOgY0mmJwRbvA22LP1
	OQIatwSdEneaD7XnuFKFbqn2ltBDmEdjyiev/HWpzJuqszjyUDJbNkDA7Qdd8AepeTX5X9W3XhM
	iU3ZoCiJqZs9oDt5rZT7Qp25z9+mWRd2fVQV6uAiALM3Qlm1E5dz00HEH2vFnssMM4Zx8MR0vvZ
	nqHJ4zDHS1MnAqAA1wrWK8WxTCZ43HrENFSkkxW8c+Lan783hQ8Ftd7gtjoKmiSTcr/eW4PVmni
	ozNhjR+LuAd5Oxze8ZyiMslbTiOnr2E1PMcJGxqGCa1iq+leKPO2hqKg4LXZ96G1LZac0+Ez2tD
	P9uNmDVj9GibJD1Qcv
X-Received: by 2002:a05:600c:3b29:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-48082891d3cmr20586175e9.1.1769669755209;
        Wed, 28 Jan 2026 22:55:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5d55d38sm2973585e9.6.2026.01.28.22.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:55:54 -0800 (PST)
Date: Thu, 29 Jan 2026 09:55:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor BSS Coexistence channel
 report logic
Message-ID: <aXsEd2bzf35y8i_E@stanley.mountain>
References: <20260128204510.53433-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128204510.53433-1-tehsiu.huang@gmail.com>

On Wed, Jan 28, 2026 at 12:45:10PM -0800, Michael Huang wrote:
> Refactor the 'ICS' array in issue_action_BSSCoexistPacket() to improve
> readability and maintainability. This addresses technical debt related
> to magic numbers and ambiguous array usage.
> 
> The original implementation used a multi-purpose 2D array (ICS[8][15])
> where magic numbers were prevalent and the first element of each row
> was overloaded as a status flag. This patch:
> 
> - Introduces descriptive macros: BSS_COEX_MAX_CLASSES,
>   BSS_COEX_MAX_CHANNELS, and BSS_COEX_MAX_INFO_LEN.
> - Splits the overloaded array into two distinct boolean arrays:
>   'class_active' (for group status) and 'ch_present' (for channel data).
> - Converts the logic to use 'bool' types and 0-indexed loops,
>   conforming to standard C programming practices.
> - Adds defensive boundary checks (ch > 0 && ch < MAX) to ensure
>   robustness against unexpected channel data.
> 
> This refactoring maintains the current 2.4GHz reporting behavior while
> providing a structured and extensible foundation for future Operating
> Class support according to IEEE 802.11 specifications.
> 
> Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 41 +++++++------------
>  .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  3 ++
>  2 files changed, 18 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 884fcce50d9c..481295224f14 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -3587,8 +3587,9 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
>  	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
>  	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
>  	struct __queue		*queue	= &(pmlmepriv->scanned_queue);
> -	u8 InfoContent[16] = {0};
> -	u8 ICS[8][15];
> +	u8 InfoContent[BSS_COEX_MAX_INFO_LEN] = {0};
> +	bool class_active[BSS_COEX_MAX_CLASSES] = {false};

We only ever set the first element in the class_active[] array.
#puzzled

> +	bool ch_present[BSS_COEX_MAX_CLASSES][BSS_COEX_MAX_CHANNELS] = {{false}};

Btw, use "= {};" to initialize arrays to zero.  It's not standard C, but
it's kernel C.

regards,
dan carpenter

