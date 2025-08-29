Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F31EEA49
	for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756501622; cv=none; b=N+yHIh1leXtLyMCWQb3eY3/LzoEwVV1WOy8tNE9zxIsjh854pQfoh0xufs/NAAZIhiRhFQUKEAsPizIbcQAGTSSxH2hRUhNsJ+arHTv+jpbXlgw2aTPx7dznVQL+tgWM8BgJpLECjD9XkeT4neELxZUpKf2231MGRiBnmIFvx+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756501622; c=relaxed/simple;
	bh=/0rai2byvDOWFH1XZaEpAVgSAWVS2LnNItZ7xlZkr94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H39HFx5YrAQ6U5hAVOpxrG5FiW0HPs9ch3QOorUQeQThM2+nMRE6FqGyKxhCTXeR1V2G1q80gQ8jjT+R8M/e7s8lu7CIbdpzcuEsNvAL8fq9vCst3rJcLeFxgJJpm6K2pm39dW1iavXfwZ4yxcOT0ruLxdfzgEVoYpHV5+d1faI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXKCKEWh; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXKCKEWh"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afec56519c8so431894466b.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 14:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756501619; x=1757106419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNcEdygy0CWacLJjTJErfBlVOBzD7yOoe643gT3i8mM=;
        b=aXKCKEWhUSJ7bZ5SKbtVX8hoWOn2cQv3pPpcVxNcZpc2UtOfWghAv/qI5MVruYjmpH
         hq8sjvrKJc+8rsNHq9WLvD2awBRqGMwmAOfiNbYKoc8uoQnjCRP2C420VroHvLf7T79w
         Dban4HTJnbam2OCHVgzlwWAk70enOsBLGA/iUSaiZXvhzEAhd1XxEAHJ0DuCANXNnSDE
         mEex7r75YMuJSrccHQh/BJp6265CrdFzUaCfSxDbxc4tC6itGAoz71Rns/u9FZy80xhJ
         gc6q29XVkG94V43V2eTKwzcQSUrYskVVdmOeuMgslFskn+aTpfeMLk42objbmh/CXcRD
         rqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756501619; x=1757106419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNcEdygy0CWacLJjTJErfBlVOBzD7yOoe643gT3i8mM=;
        b=kpycnOE3QXcOSeN3AN5vOOvJg2CPHb8JTKchM3+4gTgevzWCbn236JxQRgbWlmf/bZ
         DMOt9Vqh/A3q4xEgeRhAoAMkO65vCbMnYCNTrRGwvsd/7Ohom9emFRma41EfA8thIgO/
         kcg4wgRXMIgxDV4QgD2I6k16AwTzasJdx1GOyWBp6OHl3XKOQbdpQ0JK9scvUF8jUpRb
         M4bivdoeaTNUVAswlzOhFXonkx8vm/9ScT9wN88Ab3PqLScpRkcEu9aKIOrTHPm0sfko
         RBu3Cm6rENbgJoPg/rWfX3VvLt76Jlq5WIuOLAHR2+JlpoUPqtp7nGdbJfRkjfGFKcjT
         Xtqg==
X-Forwarded-Encrypted: i=1; AJvYcCWuL7JXB3241TFFqU3Xg2DXYVDBi4bwO6P5xxm8X1I5s84p9hHlaBnTXYJ6/dJBBVK1M2Iz1Ixsg59n9H4h@lists.linux.dev
X-Gm-Message-State: AOJu0YwVkaqmRcBLvv0GehrHuSm8GbmVfGsTK4A4bw1Mn4kvCRXKRWgd
	FnMr9K+WPx+iqob53/ut0KYCoPs/3tYLQRShoT+tAXCB1CGpDbB+2LickuQtwp1B
X-Gm-Gg: ASbGncuNmq/uBlgony1eaKV5aI6FheS9BqUFpIHPD/IuVBTlJHMPJEAQZ0i++VHVZi4
	YUt9r5ogIeL5uiagbnCY2E29smF6j8D7MtsIS/kAG7/cRKChjawrTCXBeWbUzAZmXB+5m0nqy4I
	zhF1vjbFdhlnwXVabdbVBO0JD2r4MFsJ3i4ZRBFYdvh4HthHgKQ8gu6yRFeyI5tMSdRY5Ib6Qeh
	F97rWEuocBFCSc/RWIHbisFhfSwa3bZLQ2YKD1eXdb19id9yoW7k9uqICghq3bY865qLvlfg4Mx
	PB/iaf+yA67eO6Xy1EUzZ7jX1861sN/0AK/KFE9Lw0k6bOOUi26emuPQWy9JC7Dlcn+WhVAqbtl
	IG/J+Q+uJ3e3bWl70huSnhxqrPEpSyWidK1UdBigFQi7TOIPM6Cqs5P01rBY5sHzbnlx5YMU=
X-Google-Smtp-Source: AGHT+IGgWe0FyC8zcZgJTdl4Svw1qbqKmDGcyAwEXcA5/m/jHxsg4BlSThvn4DEk2IG6pnEQxtDyGg==
X-Received: by 2002:a17:907:86a3:b0:afe:d3b2:8b2c with SMTP id a640c23a62f3a-b01d979e9b2mr1094866b.52.1756501619010;
        Fri, 29 Aug 2025 14:06:59 -0700 (PDT)
Received: from kernel-710 (p5793502e.dip0.t-ipconnect.de. [87.147.80.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff104fcdd5sm146505566b.55.2025.08.29.14.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 14:06:58 -0700 (PDT)
Date: Fri, 29 Aug 2025 23:06:57 +0200
From: philipp hortmann <philipp.g.hortmann@gmail.com>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: rtl8723bs: more efuse cleanups
Message-ID: <aLIWccuFa_gHqcaL@kernel-710>
References: <20250824095830.79233-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824095830.79233-1-straube.linux@gmail.com>

On Sun, Aug 24, 2025 at 11:58:26AM +0200, Michael Straube wrote:
> This series removes some more efuse related dead code on top of
> [PATCH 00/14] staging: rtl8723bs: clean up efuse related code
> 
> Patch 4/4 removes an empty function I stumbled upon while working
> on the other patches.
> 
> All patches have been compile-tested only due to lack of hardware.
> 
> Michael Straube (4):
>   staging: rtl8723bs: remove wrapper Efuse_PowerSwitch
>   staging: rtl8723bs: remove bWrite from Hal_EfusePowerSwitch
>   staging: rtl8723bs: remove REG_EFUSE_ACCESS_8723 and
>     EFUSE_ACCESS_ON_8723
>   staging: rtl8723bs: Hal_EfuseParseAntennaDiversity_8723B is empty
> 
>  drivers/staging/rtl8723bs/core/rtw_efuse.c    | 31 +-------------
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 42 ++-----------------
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  1 -
>  drivers/staging/rtl8723bs/include/hal_intf.h  |  2 +-
>  .../staging/rtl8723bs/include/rtl8723b_hal.h  |  2 -
>  drivers/staging/rtl8723bs/include/rtw_efuse.h |  2 -
>  6 files changed, 7 insertions(+), 73 deletions(-)
> 
> -- 
> 2.51.0
>

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Trendbook Next 14
