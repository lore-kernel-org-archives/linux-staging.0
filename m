Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996CC3C6BA
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089043; cv=none; b=LnYiYuvyaGBL9R5A+0QNbJeCfzMn+BDvyAxdPFM2zItLgHqC43eJSRdo1SzNHllmdZ3jjU3kuWg4AkP6fowg4bYbPt9K5NdYaG8arXrces+PwiVki58bQhu9xV5XjOC2cYQtGdZQjCo7/0YbCRFQxi2UDthvzrODiZnJjAqtSL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089043; c=relaxed/simple;
	bh=ei6qknk7JYLrhU+v3Hn3HzShCHP1FkUsZ8Ypk8kKgHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtucXIxNoxMxFXfiE13J1LlOWTrEsCI3Z5qRDt4yrhLJQhNRNaG4ceTz+BcXe9reYjpo5uxQGO9rq3jlDXgrlJkBqcdaKXKAjFAHHbzj19FiIlK8qPn05xsZlQeC62yMuD6n3Jm6VeB4JvPyfZ19E0BLZunjYe9e4XD90UTSDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDxH1fOD; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDxH1fOD"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso271449866b.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729089040; x=1729693840; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRDbPjDKQvbzYcCzLMoZgrq5P3twKPSGx7JEYBJdFg0=;
        b=yDxH1fODUbWQgxnO986vIB9rGdZ52Bo9JwpiXJQU/E3KK4RL6clYrbPr1+Efun5jkn
         e/umbkZknE303aCWVBMOUlPkq9mNvl5ruNHeSL/CHefou9xzysiW4pg8vnt2LH76iFBr
         Iwq4qdNHvfgLVa8yGFTIlaHqShZvRI4oL/+LxhL5KkxWmMpXDB523cdYs5e5JtEY2Uy7
         spPosm7Dijr2eDbaHnyTB1XsZ/fOyyU95iCWd9T7iXTqzKuy2SBix8LMnU7DiqNJkWVL
         GW8f+e80TEiq8SmVxEMtvyWiLKqkXnllwlXN/S3KTM4FBCOMzTUyBbStvMGy/q2N3DVw
         iNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729089040; x=1729693840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRDbPjDKQvbzYcCzLMoZgrq5P3twKPSGx7JEYBJdFg0=;
        b=nRikLcfmXu/PusJIwbcSKrRWi7NV2ArNFZILkeUI7I6y1+VYMiy2tajvdjsHcJ/dfj
         mnsf1GWfc52cW7SQHSevQgdvOcE0i2KrkD3m7GX+HNQ9V9FXMbhes5DmrcyaZgG6RebS
         sztKcL8pANKcSnBW96Yftco1hKuBQIaLRi5x9MtF3yJj7zvSOBdZdwp7EOuQn42MFcVV
         JtrT3qEn6YrOxwQSy2ho53YgWI/FGT1D3TlyLKVebRDJP8k/12S+NrQcqZMEsjTpFm8a
         p5NOBBNXA1rrlOk5f4o9VaHxo5gl5N17JsdxEIgxul+uGiE7efQrj/2Qy9idUN9UxUva
         rPyg==
X-Forwarded-Encrypted: i=1; AJvYcCV+cXD739F1ggS8LKHK6FRANvgPV5f1eiVkkQPw1nWZd0CncnDWha4GZjGtmdTQdAq901x42iw9Nm6vuO4N@lists.linux.dev
X-Gm-Message-State: AOJu0YyFJgtP4wOkaGZEcKc+oKeMJt2nXvveSxx+XlTXrJfjSZvU3UM9
	L0IklH44dUnR/ABHm16NBPa59Xx/JmSrmCwhSd2dkFzmucsK+ZeFIPqE4hO3BMk=
X-Google-Smtp-Source: AGHT+IHX3YBLuMMXrSct3HzGXtNBlDAJUq1r/MAWFNwhnl+s/NfUkDBsUGiT877KVHVlrmlBZ1i6ww==
X-Received: by 2002:a17:907:6d02:b0:a9a:3d5b:dc1a with SMTP id a640c23a62f3a-a9a3d5bdda8mr228583066b.15.1729089039869;
        Wed, 16 Oct 2024 07:30:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2974ca6bsm188896266b.82.2024.10.16.07.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:30:39 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:30:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aymen Khalfa <a.khalfa.1012@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/4] drivers: staging: rtl8723bs: Fix space coding style
 issue.
Message-ID: <f6985070-256c-4d42-b75c-9463bd827399@stanley.mountain>
References: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
 <20241016125630.2479807-3-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016125630.2479807-3-a.khalfa.1012@gmail.com>

On Wed, Oct 16, 2024 at 02:56:28PM +0200, Aymen Khalfa wrote:
> - Remove unnecessary space before tab.
> 
> Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 1ced6f7ac552..56a85174965c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -436,8 +436,8 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  }
>  
>  /*  */
> -/* 	Description: */
> -/* 		Enter the leisure power save mode. */
> +/*	Description: */
> +/*		Enter the leisure power save mode. */
>  /*  */

This isn't proper kernel style.  This is a networking driver so the style is
slightly different for networking.

regards,
dan carpenter

