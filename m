Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031C145B0D
	for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724402431; cv=none; b=m/eOUKnSTuXwtbfukgxQfMwxipzM+hRzLv5MjQYavFLiiic01tfHmYFcWjrZYk1Fm1frbr/qtklDXOUkXPayZ6MzQZfusmqI4uUgX1ofn5tUkWZgsagoSZhUYld7m9TB0I3Zc7R1EYcoKyKL2mIKM9V+jlnI8bX4oMAvXxWdwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724402431; c=relaxed/simple;
	bh=4MFsLweXpcj4nF6A04h1Qu5QFvXdA/Hqoh0p9msZQiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7lF5yr2EX8aXqrpfT3HOx2pv8TZzTZgn4QVygo6lmYqGmy8bmjY3YH7lfXaFJSSyWzPUH3sEeDLWx/0z+QNevilPr7GPkyr3r8ZHW7DRMZjP4mUB+jOv4uatabgSPuAfrzhf42pEBzJPBvuLkb+IzDf59DIwwAjyVo6G4eo1+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tdu+xvDM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tdu+xvDM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8682bb5e79so246346966b.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724402428; x=1725007228; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U1pa7E49sl/YII5qs1pBYw/u3WGyDMldXse0AluXJUc=;
        b=Tdu+xvDMXFP18Gqrc1AX6aJL6EKhW7PhUeuyxWx/q+Dycxs2VV9fZeDTkQoessOzf9
         ecF0aS7Ybv1SczESU984S4FULTnaMTiFFAecjmti8r112ksq4HOhzj+BVf8iFMsjW672
         WmZbFtKXnEtAHOsgPaJ/2fO2LE7u8mCGj6mrw1BuaM0DbdyxK5oqmwspRD+Xx3Rpaxg7
         +L77iq6dXtCSF5FC4SMJCxN/x8bnJOcjP/LGNZBsYXJNsDiaRUpq7mddEbFN3tknYPef
         gTkEbljp9F1epn7AELDSlJ64MHQfDaJqNdzg6Ap0ekgEGam7dLOGLjsQcdHFnDcolFuP
         l71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724402428; x=1725007228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1pa7E49sl/YII5qs1pBYw/u3WGyDMldXse0AluXJUc=;
        b=Gy0vNOxR2ZNNZW+1wpWctV+6uxE5r06CR4zGxM2yVQmA96j86Ddz45NwISc5S4Sz9N
         hDLmhtMVePBFgB0MwCAOC46Ry/E5UbUIii6gGMWO0g/rkTmKF5ikv+HuED5EJ7MWoapm
         iDDluTuni7MDfFcKtEN/XRPd0chMyfyroqkp9e1187CTB4UTzU87PqNJ4zRzp1S/bFOO
         bR+XZVeB1qRhWgsbSeV99An8FPzLtPHgUMCGOy/gH0OCnQoWw42ip16naJ9xGCn5o01l
         P4TUryLH7C81pap8v+gGsuDKTyYFPeiEFC1bR+xs3IxWhZQ5F+bnshJQ/N5B3LlcaY3K
         ovbw==
X-Forwarded-Encrypted: i=1; AJvYcCXxfhGUMo7tsWAdukjiVoKqMrZcDicYpQi9AIeONodY86EMsWR4zZOwlPBRXtqdQErXRijU/3nYfOVoXHrd@lists.linux.dev
X-Gm-Message-State: AOJu0YwUw/ndI/CG8ShONWNpjNBPf9vynIZihabaWtiGVycphxFwPnkQ
	NaU6oj1f1Tt35wFKm/LZcORtiGY7zp0eHYh0itVm0Fw9p3e0aTjXlJpqgnPuCwc=
X-Google-Smtp-Source: AGHT+IEU3rH8SLxwgdg/b9g1i8nA4dWuV71n2Fukh8RIHu5yiqMPwi1HVt1y+bWUu3W19Xi8e5L9SA==
X-Received: by 2002:a17:907:c7c3:b0:a86:843e:b3e3 with SMTP id a640c23a62f3a-a86a52eb624mr104449866b.33.1724402427990;
        Fri, 23 Aug 2024 01:40:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f507facsm228074366b.225.2024.08.23.01.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 01:40:27 -0700 (PDT)
Date: Fri, 23 Aug 2024 11:40:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Maciel Raad <ffunctor@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2 1/2] Staging: rtl8192e: Fix parenthesis alignment
Message-ID: <5b063faf-f882-4f3c-bd11-9695d1ba9917@stanley.mountain>
References: <20240823000838.8207-1-ffunctor@gmail.com>
 <20240823000838.8207-2-ffunctor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823000838.8207-2-ffunctor@gmail.com>

On Thu, Aug 22, 2024 at 09:08:37PM -0300, Gabriel Maciel Raad wrote:
> Fix parenthesis alingment in rtl92e_leisure_ps_enter to silence the
> following checkpatch.pl warning:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gabriel Maciel Raad <ffunctor@gmail.com>
> ---
> Changes in v2:
> - Split the changes in two patches
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> index 5aac9110bff6..1f881c27d4b4 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> @@ -204,7 +204,7 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
>  					&priv->rtllib->pwr_save_ctrl;
>  
>  	if (!((priv->rtllib->iw_mode == IW_MODE_INFRA) &&
> -	    (priv->rtllib->link_state == MAC80211_LINKED)))
> +	      (priv->rtllib->link_state == MAC80211_LINKED)))
>  		return;

It would be nicer to write this as:

        if (priv->rtllib->iw_mode != IW_MODE_INFRA ||
            priv->rtllib->link_state != MAC80211_LINKED)
                return;
regards,
dan carpenter

