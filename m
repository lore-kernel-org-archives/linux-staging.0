Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8D883CA7
	for <linux-staging@lists.linux.dev>; Thu,  7 Mar 2024 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820418; cv=none; b=QJv5UlC6NMRI86dxXxH3kWUCXumcx07JKpBgdy5TTgcR7s6am3kT6QsLDiseRx4UYD+yZlq4//EiqRhbjBbsb3JDmU2qtsN0Cn5qXPOWXZwpTw0iCpriJEBgL9cgSsudH/K17liJOHuOyoNJhdk9GGUA/0TFRJDzgebCNc1jbqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820418; c=relaxed/simple;
	bh=Y3WU5WFNuijHbfoMjafVbjZAnHLZ378ZaVzq5GO/6/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l01fcUCsUQT/SWpKYcABBywYnfhgyn9uwpMmBKj+rMYoQrHcqBFW9zZX96pzz9lyXnUPJawEfDx5SJpI0Gnxfqz6PCWg5IiOZCXABgl9N4aQcD0MoLZlessCGgHxpOwtbt6hJwqR+tVFeS0U27j52j2vt1qFwJ0EnpSGn5tAooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xahl2L4z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xahl2L4z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41315e5ca60so471105e9.1
        for <linux-staging@lists.linux.dev>; Thu, 07 Mar 2024 06:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709820415; x=1710425215; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rLjk4GjP44V58Ix6FL1JKPTdpg2m8KxuUkc2rO0L62E=;
        b=xahl2L4zNEsHm8TOjjwSRz+Kefh7BwrKbRz30SnyWqrCjRzUdUN3kJPfD4UnzB9fJI
         Uahd7LUxLNMb+xCA16QgrrV7x076spgUM8FQTMIzHLHRaRrNmAneiAaPibmWwb0ViOfw
         dHyZQNmF0Y695/dEzoiLpaUs2B1UIUibQ4cBUN5dNwNuciy8Ptgh+aJ3l0xEVagDYTnX
         Ii2NgzDJi5ZfCfnePclpk7I86TfJlRmneBukN17UiZqIlEAZ9kfmlEKxJ4GTAHCKoslB
         7keMCil4UrTUZSgo6cUpxzS3rnQtiDZdA/D4I4zVlTsZZO9OA6rlLyH8PQYbMBJjRVkA
         w/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820415; x=1710425215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLjk4GjP44V58Ix6FL1JKPTdpg2m8KxuUkc2rO0L62E=;
        b=rdSFcbKQHHZ5HgLMemZ7hNnl5XMynH+ieeCmpBhCTdc5e929x8GNg8bTXiJvCPFw6n
         /IcivMW68tsP+B0z4Cgcjl8IxY9D4xxgbFUY7hy5+M79/hsidP5O8EhPTw+hiq00V5Al
         c3tJ5r0x/EKEweFlFl1kSv4aLLUk/qWbIN4cmv4YYFFwmizTw7NVLsTTF8pFg1oOUMLm
         CKhAv0QYJvGowCDTHjsSx51F7nlTAhEQDrTmDiC8s72vbkeEutrK2SNQKvckvoU7VA2g
         avdahXw6S8GyfZQlaqXwTf2KEhifO3LVxxcbMFlRQK/GnoJ8j8BjbmBuqRSbeNQOC0by
         fXMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHMFcTVFxzTqn70fR1VZGnt4dSMU1RP9b6WGWHapzJgwFKUbNXzMvzGhgBfxptM72Fkgh7BWWJWn3LS+/SfXqXMyfjgE4aI2ZXBhgtFA==
X-Gm-Message-State: AOJu0Yx7zG516I82v8q4Vv2we3ENDxBImwF/z6eqpuoEAsIFsO3fPXig
	etOFh/R1vrH3q9eY4WcYGu2d/nZHqYcX8veBhy7o4Iy7Nt8yQh9EIEyOO2OAyoQ=
X-Google-Smtp-Source: AGHT+IENT+3OO9H7rbgPFZs/sBXiG64xYabIpdVkmpmIAc5ONaZYAhuRIH0A7QnMgT7bQCEaT7o/kg==
X-Received: by 2002:a05:600c:5101:b0:412:e444:133a with SMTP id o1-20020a05600c510100b00412e444133amr1241245wms.20.1709820414553;
        Thu, 07 Mar 2024 06:06:54 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fs23-20020a05600c3f9700b00412f195426dsm2757452wmb.15.2024.03.07.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:06:54 -0800 (PST)
Date: Thu, 7 Mar 2024 17:06:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 1/8] Staging: sm750fb: Rename sii164ResetChip
Message-ID: <27f1ca39-3747-41cf-bf5c-7536d9998afe@moroto.mountain>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
 <20240306054458.102288-2-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306054458.102288-2-dorine.a.tipo@gmail.com>

On Wed, Mar 06, 2024 at 05:44:51AM +0000, Dorine Tipo wrote:
> Rename variable sii164ResetChip to sii164_reset_chip to silence
> checkpatch warning Avoid CamelCase
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> V2: Added the patch to a series.
>     Fixed errors within the patch.
>     Compiled the kernel
> 
> V3: Reverted a commit in the same patch series

You we can't revert a patch which was never applied.  Please wait at
least a day between resends.

> 
>  drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
> index 3fb14eff2de1..6dee95e60a6e 100644
> --- a/drivers/staging/sm750fb/ddk750_dvi.c
> +++ b/drivers/staging/sm750fb/ddk750_dvi.c
> @@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
>  		.get_vendor_id = sii164_get_vendor_id,
>  		.get_device_id = sii164_get_device_id,
>  #ifdef SII164_FULL_FUNCTIONS
> -		.reset_chip = sii164ResetChip,
> +		.reset_chip = sii164_reset_chip,

From looking at this patch you would assume that it would break the
build but actually it seems that SII164_FULL_FUNCTIONS is never defined.
The advice is always to just delete dead code.

We can't apply any of these patches...

regards,
dan carpenter

