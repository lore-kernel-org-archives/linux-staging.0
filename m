Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EED1E520
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726411475; cv=none; b=V29FUGmgRYwRp1r3g16AAMJ/N8XEnsKPPNH35cMA2oAqsTPRvmkCeiy964PvzVEjSvgBQ5Fs7J9zyt8wprLN9/Z5x6qWyIGTIQ+dkGXHy50MykXFclhWTPoehROn1425/6KiQCJouxoy4jK+mE+oDlQbNhe3Wo1G1z0N8XwJwPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726411475; c=relaxed/simple;
	bh=P03z3/vk9tX66eDUKP1sZ+GOLBzjfiQP8T1pS0h8a10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVeZ/2veRsm/oHdKKP1JJVKVnDP7hKKopljP1U0h9fKpwVHlDT3mL5jjtlErG5/ALf37yQRO77ex000byDC2lBd6s1FxK6f4tvzo9H9l2FJRotEwapETTOUckM4sS6g+ydBZgBPH6tXf3MPqehdUkmUDqqOgZzRzxlVGQPo1Mo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zsn+oHkM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zsn+oHkM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cafda818aso35294715e9.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726411472; x=1727016272; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Im5mohdnvwzPYK1S2aukh0tGBmiMd0JUcK1Fzdmufzs=;
        b=zsn+oHkMhz5omFJCG/5hkxT8qShIf0wifPUeHntnVrbARN87FQxcLR7DE9U+bxETXZ
         G2WTQZVrsuOElpuurBiQsPgiNxoh7//BE4rtSp01+K+A3VJt0LG5/Szkp01Ikd5dqfea
         NwiwsdxZHsVK04pIf3f/d85VbGKOqUVr51Pa1573JnCouFxuoX9eo2iHCg515Fp8R12k
         2ahN7iXwVfrx+KEQm5ROwTDU0Trdhps8iExYi5J2AQwxkdEYDLdlkefamkOM1z+05iH8
         RZgPUiL8xCZ9Z2ddvSJZWupt4V+iewj92/SnI+JMB/qMNCn2kOtPcJQTjuQ6GUgESCk2
         c6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726411472; x=1727016272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im5mohdnvwzPYK1S2aukh0tGBmiMd0JUcK1Fzdmufzs=;
        b=B8yF7EP+KA8UIKADbDuqZHXfgLKRD378Ho0jdclA81+nJi+pGQeXIUR7tJqwTsKdN9
         CdAurwVb937U5YREEBnaYFqSMwEeBwXVQIwubhbAMrMkxcERP7KH1/sPabD6ZaugqPXJ
         ++Q3R/TZ1gDlOpbncpeZ3Phu3gdKBIcoSnRcZ0InTsDIF3xFvofT8agDXtWfI4pZn2oU
         JZ5mPOJy4LfLx0mzt0Elt8QtqmAJ6+9P8lnd5r6ZgZXdrJDPjLT+hMX+y1QwZd9PMoMi
         MG4BNO6ZoE1c2IwAo4W5wrI8or8tsptw4zpTUNQoVACNbDnWY06SkGZ5hpxBa8e7vw35
         T3sA==
X-Forwarded-Encrypted: i=1; AJvYcCWugS7ee1cMhkU10sD1v+fXzmDuGLqQfC/SNipzFIbKO6qFPB+6qbI3LinTrDwDAFMUzWsTMiUkwcjrzwO2@lists.linux.dev
X-Gm-Message-State: AOJu0YzmO5FRPCO/4CiGCRde+rHUflrKCZQiRj+j3rVZXQllTVOCH920
	UuKtr7QY1FaAR/pZyV/Mmth54JAdr6FKhGHKgmuuemfLdlVU+ZQJVTa0yt+yGgg=
X-Google-Smtp-Source: AGHT+IFFIav3HQrjidyoF0GojUNGWBSCwS64zJ0ttCd35kkMnPXYBhdHgMnmP9VgeKOeeSDjeETmGw==
X-Received: by 2002:a05:600c:1d1b:b0:42c:cdcf:2fef with SMTP id 5b1f17b1804b1-42cdb540484mr103275215e9.15.1726411471952;
        Sun, 15 Sep 2024 07:44:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b05d6fcsm83832645e9.15.2024.09.15.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 07:44:31 -0700 (PDT)
Date: Sun, 15 Sep 2024 17:44:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] staging: rtl8723bs: Remove unused functions
 including read_cam
Message-ID: <952106c1-e455-46bb-962a-a6f1ecc05f30@stanley.mountain>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>

On Sun, Sep 15, 2024 at 08:38:14AM +0200, Philipp Hortmann wrote:
> Remove unused functions, macros and one enum.
> 
> Tested with rtl8723bs in ODYS Trendbook Next 14
> 
> Philipp Hortmann (17):
>   staging: rtl8723bs: Remove unused function dvobj_get_port0_adapter
>   staging: rtl8723bs: Remove unused function rtw_search_max_mac_id
>   staging: rtl8723bs: Remove unused function read_cam
>   staging: rtl8723bs: Remove unused function rtw_get_oper_choffset
>   staging: rtl8723bs: Remove unused function rtw_get_oper_bw
>   staging: rtl8723bs: Remove unused function _ReadCAM
>   staging: rtl8723bs: Remove unused entries from struct hal_ops
>   staging: rtl8723bs: Remove unused function PHY_SetBWMode8723B
>   staging: rtl8723bs: Remove unused function PHY_GetTxPowerLevel8723B
>   staging: rtl8723bs: Remove unused function Hal_BT_EfusePowerSwitch
>   staging: rtl8723bs: Remove unused function rtl8723b_GetHalODMVar
>   staging: rtl8723bs: Remove unused function GetHalODMVar
>   staging: rtl8723bs: Remove unused function rtl8723bs_inirp_init
>   staging: rtl8723bs: Remove unused function rtl8723bs_inirp_deinit
>   staging: rtl8723bs: Remove constant result macro is_primary_adapter
>   staging: rtl8723bs: Remove constant result macro get_iface_type
>   staging: rtl8723bs: Remove unused enum with first entry IFACE_PORT0

Thanks Philipp!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

