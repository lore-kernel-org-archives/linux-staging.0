Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D23219A8A
	for <linux-staging@lists.linux.dev>; Thu, 11 Sep 2025 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616732; cv=none; b=MvSoUadqMMrKKH7o2PxNNJT2YCgxr8Mr+J9VPi8J3SzMeZLBLnehedXtdcwQChp0cfSRq1JuznAkVRt7zPh06J8RJqStIKs5QPcIEgIkgR0uCsJf7U78S/1j3u23E/aVWhpn1FiN0/25MulLYQD1HkRVsJtCeKM7Nl1tW9zHHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616732; c=relaxed/simple;
	bh=rXd/6eNnkgwcu1obGsgNivj+t82h/1UPQb10m9TrnYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMn7tZTB/ur9lDODoQVRlg1JQ88fl1jKdXczAN8Z1KSqrzek3FQ7va+JrMhfgWYG3di6OPPw8ANhdgauoAmit5Bj/+13WeId0sHQgMstKG84xWOPQrVxZDGRdJtpZVymonVUYL8Xl2XylipDnnes+O4PU1iTCF1BenjlpAOnzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UKRz0toc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKRz0toc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso8202865e9.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Sep 2025 11:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757616728; x=1758221528; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/qPRJJ/6GDpv3hVxWcXnPmSZ8FtyUTqpKhwovBWsMd0=;
        b=UKRz0toc+8hUH1hSa7Gxc6CUHBD8YDeGnx+a+e+LIXdpQ7bERCRqFc9yzId5pEbiYZ
         GpwqPDJpKPiOP+82u/oXOfFeJHI4HA3T4hoqHttXknKtxKasy/OtG6oJ41IO3H14UTZk
         yQwtkYrziPEA6B7niQncC74UQHBk53I8v5vsFNIx/dRCIEiaBUh9MIW3NBDC6HHzbYkm
         ThQ7iK1gmKsIKGhSjGUTWO9PIgSApddxyMzxD4z9l9+zDekjsphPTw6AQIbTN29iDKlC
         6cvVCV1RqrHTsrm7Ric6+r7pp+baSGaVJ7wi2iCA8UCKo51hUNEICvZalyZctVkHvtNX
         FFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616728; x=1758221528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qPRJJ/6GDpv3hVxWcXnPmSZ8FtyUTqpKhwovBWsMd0=;
        b=XEzdld/e/NFS6Bqy5KuzO420koVK40c1wjMnfZc36UaP/H+d+GyA/pCCzbLS+ovom8
         G0Ev537Mo//GwxXcV0JR+0U1wCxpk5xNiPzxiZebMUwEB/iq27x8OHSg1Vz5pOegHCsj
         phvGKb7iiUvzlcrlHQUnilsL153NTsE3G/MubK/WPrNCc1B18RdMrFlbWtwQPV89fJq1
         x8rcpqciB8reaMblGRD5ghDiY/CYEYZr87S5ipgQ2Y1u+TieZLYzis5YdB+a/uwaLCzn
         JEo7agxa5adqAoA7BzDbGMvP3ebhfZpoYQ9mGKGeYRGNup6hcGUCcuE4Ir1jr1vOoPPn
         8Kcw==
X-Forwarded-Encrypted: i=1; AJvYcCVrfFXl4+cpazjZNyrsGXa2HiEZXBaPalqGy2rNhvInih8nCgfpKvlCmZKoUR5rW23Y50V+kncT5w31JQlx@lists.linux.dev
X-Gm-Message-State: AOJu0YypRar9z1lBc5QmgSA0dXIWQum6/AM23hIR+LX0+YT1PxwForCD
	Y4ORdj+iyxnNSh9ZFEp2v0os8jRP4srkZzyct4BQ5EZ8LvCb9Oacd284LT5GTGWxmRM=
X-Gm-Gg: ASbGnctM9sM8DlQxSf83+AfvJEAkWEF2jYsqQeIvY+gAQuWCsChy4WGO9+83FaewNnD
	boExILOGhEpWxfNX5yn6eTSo9dQCuYjmouioEYF9w7oocMA31VY3kS0d9CFEfA6/I53Yl3ohTKw
	2TG8s28LCDWpY4gr1G1W4VG0Q+QW+nO1CwLIOC+eS+Y8qx0F8Q5nnyFEUUCzSP8UQ1jHzNMyv+Q
	abOGhwNERwwMl5X9QFlQWwvGgkPNpk+H35vYOfMuj7pQNdSH9NiiWtBuCqSENydbrFzi36WibTN
	1jY1Th1ZjSOUx5hxXKP/hkFgPI43PgjIa4wL5TkPetCMUUOPQ85C7EMstu2BHI2N2mV/l+CqF2G
	KQaQmmHPWuiZ24eQ3m+AYpXlrSZ0=
X-Google-Smtp-Source: AGHT+IGbe0i5zX7GrPZfXxtP9KwFOHD5VEyjXbbI2e/fygTlh6S6/f6eSWgbH0sRjrbQGsV2TsTPvQ==
X-Received: by 2002:a05:600c:19d1:b0:45d:98be:ee8f with SMTP id 5b1f17b1804b1-45f212609f5mr4155545e9.26.1757616728466;
        Thu, 11 Sep 2025 11:52:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607e2d43sm3441866f8f.59.2025.09.11.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:52:08 -0700 (PDT)
Date: Thu, 11 Sep 2025 21:52:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix typo in comment
Message-ID: <aMMaVOSQx_8zftnp@stanley.mountain>
References: <20250911150207.602285-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911150207.602285-1-weibu@redadmin.org>

On Fri, Sep 12, 2025 at 12:02:07AM +0900, Akiyoshi Kurita wrote:
> Fix a spelling mistake in hal_pwr_seq.c:
>   - 'configurtions' → 'configurations'
> 
> No functional change.

This part isn't required.  It's obvious.

> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  drivers/staging/rtl8723bs/hal/hal_pwr_seq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c b/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
> index 2438931ca51b..fba67a7c069c 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
> @@ -8,7 +8,7 @@
>  /*
>  *
>  This file includes all kinds of Power Action event for RTL8723B
> -and corresponding hardware configurations which are released from HW SD.
> +and corresponding hardware configurtions which are released from HW SD.

I don't know how you did it, but you somehow reversed this patch.
The - lines in a patch are the old lines and the + lines are the new
lines.

regards,
dan carpenter
