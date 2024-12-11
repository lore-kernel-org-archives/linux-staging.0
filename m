Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6821577D
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907655; cv=none; b=Mhrnjmn39KUXi2r2eLbtc1ETMau7ePS1FeVszBYhwJvV0TwAx7JNVVyPLvI9lFNvS3UHssIHNgbeABTa8ekSqTJqwihbrjSwwY04wYaprUptIWTGgrUIM0yzNp4YYEMY0M7av0wFhnu2mxTwcqCnVwwm7YO0TTppS6E4/biTDj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907655; c=relaxed/simple;
	bh=rOgeUWSp6bFTjRYXEmRP5Xg9oywmiCVNYTXOjviZUf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4tyt6Va2iJNnMPqIbvLaw04JAfjLMAUCf3Ej8cTMSp/AYV9TABmFPdmzSusCZOqxD0Nbo5+wCBqEyIdv5BTIP0txZrgU5Q7kHCwgIInydEXLL6OmhAYxmulf4MK35yyagUMrmUfgiWroTJQAMDtzw7/RphqjoBkcT3xc1r04TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=an6ZV+I0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="an6ZV+I0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso8469625e9.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 01:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733907651; x=1734512451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehgtAI9FILi9H1ERbtTxfeQX/RXwTuwJwbHxNT8tUfM=;
        b=an6ZV+I09mQz9fek+Rd+4+H1f/6EeI2ahyoZCBBXs9Bm0cPUsDeYCWzA28/Tn3wBvN
         3HRV9SJMB6haSKoWASpnR+tMBbCTJE7ZpBAhkFhQg+Pii6epF/Yt5KA+pxEfgVOsZdNd
         MSdJU6/r03sPauSSWwhY4KbPbclrhKRwHo6ZBXgBSP+EomVkl32NAg5jdT1wyROqd4su
         DhhJGyymE+sSM1uvxmAg+DdbsJi3QUYx7Auip6V9P2skgV2IWTffhuWwT+4PDmGw4V+e
         caFM3dYBzt63thN7KlTBE7aOw7JNdZDIoqAX/XBI8S5GUjOHTKP0senW2plrbLhtotKr
         CXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733907651; x=1734512451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehgtAI9FILi9H1ERbtTxfeQX/RXwTuwJwbHxNT8tUfM=;
        b=jFXUZq33WUaacgXUlvEJQeZ8bBo26K5qHzUsEfUwHl2tlWQWkA3FLQj9Q/BS/6dbIC
         pFalBU/HzQDnoGtpaBOecMVBRZoDmpdcJGc22Vdm3t71eJKbZnnYw2pKUP8Jwl/80yHq
         BnQbiBQ7TvuXrK/0JCZsu5uhCgRjjLR6aeeGdYldfSs6KVzvyZpGNmhl5pd6MaIgMiRx
         LikyDggIMIooUvmc69Nckdwi0IrmpSNM1Tu262EFzrB/wBqZVr1mP3Fx2W2WoWH7gebt
         CD5+JPhOCzeppczp+xdqO+6uJVzCp1NY9FnEK/gT7qcLepDqSEGDBrkJ/MlSSpjwXQSb
         ZpnA==
X-Forwarded-Encrypted: i=1; AJvYcCVrBh7eBI5vn59KbxICIo/WOPb1Ov/v+x2bVrWVQEoLkDTqae716jBIPzJz+T4niWUSq4KGSdU1C/KCJvJg@lists.linux.dev
X-Gm-Message-State: AOJu0YxW1WXinWU9SSY5rkkQY8z37dERVPAyKkmoXvsWH6WgrLjDQpst
	B0UY/jI1jOy9c9xWFjqzKK/yo7RIOGHfHd0I4Qkkm8XxSjEjh/GgMGPSA9AJWfo=
X-Gm-Gg: ASbGncuasUFyq3GgQQFxLDHyib29RJ+/aFR6miWu+XpFgdYFgohAiGZGZH/Z7rLemOA
	YNadYkDT6R2ajjE5gI8ozherPIsEWnsqG24bdTxEBaa95E4zwBH7alznKMuRZWIf/Mscx5hbSRq
	eRG0V6nllpWZASDT7fqP7kGgDPwFyVfzUz9KC7CboRsZ53BTPh1/0HGTjmMt0HwumIGTrfgfvAM
	SC1sX987DcgsvqeuOvfGk5XSVqy0tarzcBl5OUU0uUqAONIQr/q6znxYjI=
X-Google-Smtp-Source: AGHT+IFrbT6yUxTVKlbXZAWJjA6u6YhH7qTzIBw1u2o+5qJHy+OJ03YHoWeo2ICrxH825yoy49qOMQ==
X-Received: by 2002:a05:6000:156d:b0:385:fa26:f0d9 with SMTP id ffacd0b85a97d-3864cdec006mr1484907f8f.0.1733907651524;
        Wed, 11 Dec 2024 01:00:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514f29sm805341f8f.77.2024.12.11.01.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:00:51 -0800 (PST)
Date: Wed, 11 Dec 2024 12:00:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] staging: rtl8723bs: delete
 HAL_DEF_DBG_RX_INFO_DUMP enum
Message-ID: <6a5f8451-32cb-4784-b8c0-ca4a07df8764@stanley.mountain>
References: <20241210210741.17101-1-rodrigo.gobbi.7@gmail.com>
 <20241210210741.17101-3-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210210741.17101-3-rodrigo.gobbi.7@gmail.com>

On Tue, Dec 10, 2024 at 05:48:19PM -0300, Rodrigo Gobbi wrote:
> After removing code isolated by DBG_RX_SIGNAL_DISPLAY_RAW_DATA cflag,
> HAL_DEF_DBG_RX_INFO_DUMP enum lost it's use.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c      | 2 --
>  drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 1803c0cd3a7e..b41ec89932af 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -682,8 +682,6 @@ u8 SetHalDefVar(
>  	u8 bResult = _SUCCESS;
>  
>  	switch (variable) {
> -	case HAL_DEF_DBG_RX_INFO_DUMP:
> -		break;
>  	case HW_DEF_ODM_DBG_FLAG:
>  		ODM_CmnInfoUpdate(odm, ODM_CMNINFO_DBG_COMP, *((u64 *)value));
>  		break;
> diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
> index 282e141616b0..85de862823c2 100644
> --- a/drivers/staging/rtl8723bs/include/hal_intf.h
> +++ b/drivers/staging/rtl8723bs/include/hal_intf.h
> @@ -144,7 +144,6 @@ enum hal_def_variable {
>  	HAL_DEF_PCI_AMD_L1_SUPPORT,
>  	HAL_DEF_PCI_ASPM_OSC, /*  Support for ASPM OSC, added by Roger, 2013.03.27. */
>  	HAL_DEF_MACID_SLEEP, /*  Support for MACID sleep */
> -	HAL_DEF_DBG_RX_INFO_DUMP,

You have to combine patch 2 and 3 together otherwise it breaks the build.
The fact that any mistakes break the build is what makes this sort of patch
easy to review.

regards,
dan carpenter

