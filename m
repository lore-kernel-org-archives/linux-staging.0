Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C33C1B967
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709543861; cv=none; b=lUHCTUodwapUHSMiMAN0c6sWnP5L3jBN/ZhbejgF1GJYI3yI8LgBA05nDqu1fHMo1W2ZEtAh6AgYeJchm/D+Z7YmVWNKFkh6QJqnB0oELpKetqiHE2bL7/zOKq9Pu46wnnzxAJbNlpLQnZ4c5tFNkoVccwVGA8SH64yKui4K0DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709543861; c=relaxed/simple;
	bh=Qq1jg86NYicltpYfn1YXwPRMwEdiM2aWEnn4TNPiai8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h2ESVor/MYOrk/gjN2tFQAoZBZ+JWZzQRM566CvgYH5cMFqGtkWesOZEHNbPiFVnEz770hLQg7+uIFYr10NwS/UYrVv36YRRjQC/HrN/QtP+OfdYJn4v/PksehEPv0elGvMulP4INWCLD4SwVxxgqFTB+xqBeKPokv0Ie4mmvnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzVOxgjf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzVOxgjf"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d2ab9c5e83so41402761fa.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 01:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709543858; x=1710148658; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxb84sArYHWCge17RqY2dnfS8pZorGfPXvmpeXBM+UE=;
        b=IzVOxgjfqbDCGRAm1UvsobFIvZDuevow5+Q70ekZQUqJxXqSJKbtjiO60qM2ptRwV7
         ha5/3XDCcT+2FzHHAa3dyyIiqlgqk4YzxjHNkAUFKkEjoxXhKY+c7Xnb4WJvJv5iZCuH
         StvNtf3JXtvdCQQIpwp1k60/nLc17LZg4E+o95754Nvgmt+qeNUmDo3NjTxP+nijiixQ
         VrDswrj/JCPcBLslzlJD4rDMYvUbPydqPoXgmrWUEXRhlkBHpTxfsqFTqGi4C1kPnZKI
         EwQrUPinQwY/03Zy23WoUUgficvN/F/ZzXBaTm1xJ9bxDdspGBfaJeQehta5zSpYBKyE
         errA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709543858; x=1710148658;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxb84sArYHWCge17RqY2dnfS8pZorGfPXvmpeXBM+UE=;
        b=tClCDmtyqCteScje7CksN4p08eglpOXW/hu61lMtkfhjkTDp1mA2ptQU5nkPhpLFcn
         qFaJgOb8af+ScXIu6MK4YQYMsOWON+EnEUMb0tWXx4zWWQeEUrUZ0yyNaNx7c6r1iyrz
         264uhoGuvqpTLdQh2p32qJStNfUuNMIqm967k01vYYCdObMegSSo2eN5GTFLKOuRr8S/
         tCRC9raeyl3c3vV3sau9JBOA7m3RItFVPwhMvYu/Yk7A20lFOvmxo4NbEqZxYASfh0uW
         tfBs+J46xJu3qBQZgLIMWtgo4E+8MwtDrF/KUSZc5YU032PeVo3Xgbyq5Y6IjbWhleg8
         atow==
X-Forwarded-Encrypted: i=1; AJvYcCUrEUh/CrIfJCty+Nvbv+SUG8KaWkmeRcZrqZFH+AV3pd6Cu3EGOkemkjkwy4amZtu8t56n1+jVFhZ8ulOFabG2//niTkjPNc703IOHjQ==
X-Gm-Message-State: AOJu0Yx01Fn7luPoK5AGabNanXuDnQemOEerQW+FYYEtRTl8YlU4s68m
	6fmmwv+fX/yMPRLY0PugjZQi2Gucp97pzcLwNiuWt06P+EiKdllz
X-Google-Smtp-Source: AGHT+IHoWbhv0G7/RF1N1tx36guIvvx6OukW50GAMYLBOZmWqoYnRwfEqdFQ9lwVbVqHZlcw8HR+hQ==
X-Received: by 2002:a2e:9cd3:0:b0:2d2:b068:6d2a with SMTP id g19-20020a2e9cd3000000b002d2b0686d2amr5802516ljj.16.1709543857438;
        Mon, 04 Mar 2024 01:17:37 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id a10-20020a05600c348a00b00412e5060995sm1679557wmq.34.2024.03.04.01.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:17:36 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix get_channel_from_mode() failure path
In-Reply-To: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
References: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
Date: Mon, 04 Mar 2024 09:17:36 +0000
Message-ID: <m3sf16tky7.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Dan,
once again thanks for the patch.

Dan Carpenter <dan.carpenter@linaro.org> writes:

> The get_channel_from_mode() function is supposed to return the channel
> which matches the mode.  But it has a bug where if it doesn't find a
> matching channel then it returns the last channel.  It should return
> NULL instead.
>
> Also remove an unnecessary NULL check on "channel".
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
  Rui

> ---
>  drivers/staging/greybus/light.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index d62f97249aca..a5c2fe963866 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>  static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>  						u32 mode)
>  {
> -	struct gb_channel *channel = NULL;
> +	struct gb_channel *channel;
>  	int i;
>  
>  	for (i = 0; i < light->channels_count; i++) {
>  		channel = &light->channels[i];
> -		if (channel && channel->mode == mode)
> -			break;
> +		if (channel->mode == mode)
> +			return channel;
>  	}
> -	return channel;
> +	return NULL;
>  }
>  
>  static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
> -- 
> 2.43.0
