Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C738DD1
	for <linux-staging@lists.linux.dev>; Sun,  8 Dec 2024 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733653643; cv=none; b=mdWNyRaAgEC2Z7EBpVP+gC9ZPCTTPLwc8iYK93zq9OJKyaJaY2nhW7U8CB5Bty+7Ogv92PVKFVb8RVOZ82ju2lmimXOZyH2N0v0EfX2wusM9WBm8V5kbayApBeqntZwUNPwWIfBfIWRZLUAS5RswNLO/Y4b1ru52ZFIr2JDyE2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733653643; c=relaxed/simple;
	bh=43QPSXP07EKZyV7T4JoNOYWykPBWTjQq3mvEzDAEXME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN30AQdLv4TVt/NzLaEK15NdZ/jWldgxImoMgwpOStKt93iKEKCTn7XisyRUUVS8aUdaDfcrtt4WoGnIxEjJgZtkmyCZUA78KV3QpyLazXG5n0O5Ilim96GC7xxfHdEjkihugi05AR0iaCGG9HFpoy0CrPG59hpeRzJM0kp5I5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9uiispC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9uiispC"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862b364538so1125746f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Dec 2024 02:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733653640; x=1734258440; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+XgVysOF3i6TtaEuaqKhK4jZgdb33XhdYEvJd6wftbw=;
        b=y9uiispChjm4gaC7Be/Scj9W8+v9gPYCCuJLAPpbWIqdenOiaz22YwUmQcro0xEo5n
         HjVsDAyJdqJ9UXYS1UP7fJeXZT8Ac8sfBo41vnp/sRqeoJ3k0T71ZVXkLNa/pve6bxli
         zSkHSRKATmmofLIhY3PC3jk8aYI4yOmI6lub/vaNgpTry3dy9BHsgi2mPXjv0ZK335mA
         R6t7liL2Q/oykY1RRJvIO5qcLrYK8Rv+bdYW84Wi5Oqe6EVzbCaOgJRN243z4p2JB6Um
         E6+Y8ebXWJLl1k4CgG4qmnmfZGpIoFQhw4ybCW8cD4as5zgm0qyN882LJ6k0COmDZ7EZ
         vlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733653640; x=1734258440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XgVysOF3i6TtaEuaqKhK4jZgdb33XhdYEvJd6wftbw=;
        b=nTkJSMqQuCkFJ+sJXUzk/wovCp1TWiLPpukazm54/gn42ycTlkE1V9uPulycGH5Ebd
         6OKEwzorQo3sjfb2V6P/bNxhP2ShR9iap0O9PY0hfwZDSR67DZYe7sVXpfZygsWeJ8CN
         8qWyNcNekawcWJ3VnINA2Wn6vkNSLfjIQfAcA6AxRrOJwsRskN70GPk7AYfeK2fjYaMU
         J8mQitxKwho4SP20wIi6/TqW/27l9bJNkvM33r0gpCrTyfdmC3N3bfEq+Ax/klvkdH9r
         4fOyrzXR2a7Mw11HC0C7MBgA6e2pwgvSpLV9cuYXP+iuWCN5hS8T7RJHMuP6poO9mW0Y
         rmKw==
X-Forwarded-Encrypted: i=1; AJvYcCUFiE/zC6Npr/BFuAFOSkPCcAIX3yPDKHSzieYNNZXcd5H8mTmdPNH1KqWkuGaGHvUa6kTm9+pz0nfWtnUH@lists.linux.dev
X-Gm-Message-State: AOJu0YwvYLU5w3Oriqpt3FCxQkftmelBLKfV/zEfj785GNLydvzUxUvV
	FfclgxiHR/nVzdW5FY8QyNUI64L8FoNHKDJmE97FypYfF5DvP15Nj6/cihafH0iSRGkKHXpuKjU
	3
X-Gm-Gg: ASbGncuaL+frZCi0xyOF4Vxs3Cqt8OHFbRrVE6sH1VejXRklCV8jiF9qvCcOXRmEd0L
	CooxLacW6aMlzAxn5D2nFl3rWBc/O/NOCZnlKCg7lJN2unobrAqC5CDFUfsXAPVRwplJUrxxuZi
	FvPDYfvvfdDZdhnVIr6T1DRqxoVazF0OJC/8QtaLgdknFRePOZRhYoKgS2WRRNmD+udW4TLZN+B
	TauHMLcU7/9QQcmjkostoKDlEb5y72BIfEV1HJIEjx9qm+7Mx7KEcQ=
X-Google-Smtp-Source: AGHT+IFafUqTyHZB+bp4EdtMwhm1qHbOJFTadaDBmWtEiOKgUBIvCZ9iEuyTTNGVjtAv3wTQGjtJTg==
X-Received: by 2002:a05:6000:1ac9:b0:385:fa30:4f87 with SMTP id ffacd0b85a97d-3862a4ad280mr7117003f8f.0.1733653639844;
        Sun, 08 Dec 2024 02:27:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4164sm9794923f8f.9.2024.12.08.02.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 02:27:19 -0800 (PST)
Date: Sun, 8 Dec 2024 13:27:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove code depending on cflag
Message-ID: <42d24db0-b403-4c4b-8607-38f3cd55cf63@stanley.mountain>
References: <20241206230110.11893-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206230110.11893-1-rodrigo.gobbi.7@gmail.com>

On Fri, Dec 06, 2024 at 07:53:15PM -0300, Rodrigo Gobbi wrote:
> Remove code that is depending on DBG_RX_SIGNAL_DISPLAY_RAW_DATA cflag
> since it's not compiling and there is no reference for it's usage;
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> The previous version suggested to fix the tiny error over the cflag usage.
> Greg pointed at [1] that is not common to build using cflags. Since there
> is no reference about this debug usage flag, I'm removing all the code depending on it.
> Tks and regards.
> 
> [1] https://lore.kernel.org/lkml/20241125225308.8702-1-rodrigo.gobbi.7@gmail.com/t/#med5299468bc43fa89d18892d6d869a93d6138475
> ---
> Changelog
> v3: remove code as suggested;
> v2: https://lore.kernel.org/lkml/20241125225308.8702-1-rodrigo.gobbi.7@gmail.com/t/#mf22f30a9c689bd793988d7e7a58c0b119206116c
> v1: https://lore.kernel.org/linux-staging/2024112500-authentic-primarily-b5da@gregkh/T/#mea4fba3775a1015f345dfe322854c55db0cddf43
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  1 -
>  drivers/staging/rtl8723bs/hal/hal_com.c       | 55 -------------------
>  .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  4 --
>  drivers/staging/rtl8723bs/include/hal_com.h   |  5 --
>  drivers/staging/rtl8723bs/include/rtw_recv.h  | 18 ------
>  5 files changed, 83 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 317f3db19397..952ce6dd5af9 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -4959,7 +4959,6 @@ void _linked_info_dump(struct adapter *padapter)
>  					rtw_hal_get_def_var(padapter, HW_DEF_RA_INFO_DUMP, &i);
>  			}
>  		}
> -		rtw_hal_set_def_var(padapter, HAL_DEF_DBG_RX_INFO_DUMP, NULL);

When I'm reading this commit I think, "How is this related to removing the
ifdef?"  The commit message should answer any kind of reasonable questions
a review is probably going to ask but it doesn't give any information on
this.  I figured it out by reviewing the code, but I shouldn't *have* to.
It should be in the commit message.

This commit would easier to review if it were broken up in a different
way.

[patch 1] just delete DBG_RX_SIGNAL_DISPLAY_RAW_DATA ifdefed code
[patch 2] delete HAL_DEF_DBG_RX_INFO_DUMP and related code
[patch 3] delete SetHalDefVar() and all the callers

>  	}
>  }
>  
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 95fb38283c58..b41ec89932af 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -682,14 +682,6 @@ u8 SetHalDefVar(
>  	u8 bResult = _SUCCESS;
>  
>  	switch (variable) {
> -	case HAL_DEF_DBG_RX_INFO_DUMP:
> -
> -		if (odm->bLinked) {
> -			#ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
> -			rtw_dump_raw_rssi_info(adapter);
> -			#endif
> -		}
> -		break;

So just leave this like:

	case HAL_DEF_DBG_RX_INFO_DUMP:
		break;

Otherwise I have to wonder, are there any other callers which pass
HAL_DEF_DBG_RX_INFO_DUMP?  Because if there are, then now they go
to the default case and that triggers a bug.

patch 2 would delete all HAL_DEF_DBG_RX_INFO_DUMP related code.
That is an easy patch to review.  There are probably other unused
values in the enum.

patch 3 would delete SetHalDefVar() and all related code.  Again
pretty easy to review because any missed callers would trigger a
build error.

regards,
dan carpenter

