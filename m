Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E656FC3
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863701; cv=none; b=jgGohjE14BNW8lb0/Q+uqQnIdQPAxezSUaDvmQNo+o+oxkBl7BwJD0N2jKnzmGbjvxqYKbtFvFHZJIOCtBGgRrnyhCg1uCxdtxt/IWP/RmxAqfLT8Lk4WKToxCZGc7V5FGLe8XfyR+Xph/fRUGmH6rNzHywVsG4F228mCy2zvE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863701; c=relaxed/simple;
	bh=Jz2jG35a8jxkfJR/K1JGWyUsAohw0IVAj9COzgsDaK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1UTN6BCipJHP6bWGCsgQA4bYe+fDXteIB50T4inwyFvwGikaejwxogE18aNO/QK1YFM21e3xVrt33TYO+xfx3dRImbc3yD/kgdyXsG3yvHmMKiUdHOWWoURDAh2Z6lHnNgMxcCzyAo9U3hoEM6/VftUXzTLVl/eMiDVC9rTkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E65bNmJz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E65bNmJz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso1671385f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Apr 2025 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743863698; x=1744468498; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zhyg0t58cU1vi3f6vTrT4cSrowyxcOvo1z5RkDWvOMc=;
        b=E65bNmJzUzBLnCyQARC8zkL2CaliJIJVYIGfqKHTt7g0C1rhiJX2caC0X+0kVk18Ju
         VZXPz/xdl69qM28Csd+mlkuPJr62dXVNve3+7W3jUpFzHIdo3/kXDfAaffIuDYOX3CC6
         4KjYYMzjJ/Fs0M1mBjVWUgWCrNq6MmGSS5gKaALmr11FmEluvHF2vnMU9mVDhV6TTcJC
         9ffQzaxmjewVVJ1IBavC7n35pA661Vl7dI7hgbjT1UwauPTSAj9UVl9kVJzOzoR+muu1
         T45UZPjqcU6oczFaUsI5XlerOfWcvgI/pWeowBQKPluxbmV8cJGlXocLY6d1HSIciQxN
         uZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863698; x=1744468498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhyg0t58cU1vi3f6vTrT4cSrowyxcOvo1z5RkDWvOMc=;
        b=NC2XSEnA5Cy7YSYYY+caR8jV2eOMQbPstErc+HpERv8ZYpyd7SdpImcWuHyYsZfsSV
         2yzgxoCa+5W06YP+bxEEIlZPcMU7t8OjlwCJPrMJQV5JfkkOdGckHJahYGrTQe2eb67r
         97oSavr2uwU51pO/PcYj5ZNwfl2XWuP9/kCNYAI+AvvDAp6mPcxVP4omlD4mNXBXSJHs
         iI/A5ORm2autNYCrkXmYqDnfyHJQjQvWs5lG6H/lb7OLXUTmV+6w/5WTdSUOhPzLDLZi
         d7kuGPz/DQ9/dJj1h66cfG1qYoU4kasTsoknFIHKpkQU0uxUm0PvzW8f7/uHRB4uY8zK
         UYsA==
X-Forwarded-Encrypted: i=1; AJvYcCV/S9CNKYqk2wJd386oKEjyQURImKafvUroiKdtR48SF9BOQUjoFZfkDOkg8TvKqb47UAHJc87ZZprulqXt@lists.linux.dev
X-Gm-Message-State: AOJu0YxO3n1fEcjgUt0b6yA5M+2slkykBv8DyY+ZNvTsIiRMZHI2WKDL
	8eJppGL12Kg5j6opn39hu82Ub4yupC372acExQ46NupXwXf+AfysEK0AogXZtVU=
X-Gm-Gg: ASbGncs/chHuDS/nrroubj+akPe2OEKjNNRHNtbT77euIm5Q+8DvQSdVUxafHbkN1kG
	7YHQXm0NymAGFyxb/RS2rmxH0D6SJRxY8vc+J2EwFqI7JvfYkI9ex+FUUDId/vAIqq2pZOiIEXS
	5onJ6zCIq9BaAetIuix4+dUCWHzCO/RHwQpLzyYpLrGCJQesPe/7LP5vPYri2e/DPDoZSpooTFC
	001qhlhhtTPBz5+AtKNv6hzML3iAv2mVOSY5BlJmvGV0QHmZov46g5MhQesOWyDMTht0d/yOTsn
	8Skd1ogoSG7GvR3Sh3OmCZUt/ZbUQGArza9xofjDSEyDCNUh9LLJZXf+kR8A
X-Google-Smtp-Source: AGHT+IE/M9txzHe0PtFaLgR9ct861DaYcfnp5n7x7JLLBKwz5m7VyOjZai/5+5Yi3USWwxC/jRVIdg==
X-Received: by 2002:a5d:6d8f:0:b0:39c:e0e:b7ea with SMTP id ffacd0b85a97d-39cba942a90mr5605476f8f.20.1743863697655;
        Sat, 05 Apr 2025 07:34:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a7586sm7163739f8f.38.2025.04.05.07.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:34:57 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:34:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Add error handling for sd_read().
Message-ID: <948e34d5-95b0-4f7f-acf2-c93cd2536300@stanley.mountain>
References: <20250405140703.2419-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405140703.2419-1-vulab@iscas.ac.cn>

On Sat, Apr 05, 2025 at 10:07:02PM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling to the sd_read(), ensuring that the memcpy() is
> only performed when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org # v4.12+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---


You need to add an explanation here what changed in v3.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index 21e9f1858745..b21fd087c9a0 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -185,9 +185,11 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
>  			return SDIO_ERR_VAL32;
>  
>  		ftaddr &= ~(u16)0x3;
> -		sd_read(intfhdl, ftaddr, 8, tmpbuf);
> -		memcpy(&le_tmp, tmpbuf + shift, 4);
> -		val = le32_to_cpu(le_tmp);
> +		val = sd_read(intfhdl, ftaddr, 8, tmpbuf);
> +		if (!val) {

The sdio_read32() function now returns negative error codes.  Probably
a bad idea.

regards,
dan carpenter

> +			memcpy(&le_tmp, tmpbuf + shift, 4);
> +			val = le32_to_cpu(le_tmp);
> +		}
>  
>  		kfree(tmpbuf);
>  	}
> -- 
> 2.42.0.windows.2
> 
