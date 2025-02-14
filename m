Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD73221DA0
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739534672; cv=none; b=VTWBv2aLv9DESl8JDtxbHmcgoJSHbieIOoAeNUHE+XA+TvnbJa5/qGhJsf5xc4yhTczqGnh4+woaDJ1UpIydK7hzPvRVzlSBUfl2mbHSiIp4qbb+QbjSSTHHERhZyCsLmoAc2HCm/GZQMkvcqFlAl3zerVJR/TeiKTXGLP+Ix1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739534672; c=relaxed/simple;
	bh=wFAGqe8fwXyyIsVzC6HVfv41qXizSC8Sy/9GVTM/gZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aL6OH864l+Iz3FFdJ0JG1tfrt8OPyoSOPlx4MWGbrS7G2cd3eX/TQe5Gz4Cb7f3k2t5mXXWuKw1k2oR35ryNLdO9IxPSfQx2Ozc6ZDGl8oiE1Cma3/avcwfoY0nkaA7z2km45VIwjyxOy/8NgiECQrXZXJzdTg26AZlFvROV49M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH68fv22; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH68fv22"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso12752455e9.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 04:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739534669; x=1740139469; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2/EmkyG86XB4+zPcE4otxsWMOKAE2ROdD+dHLtdsjQ=;
        b=YH68fv22ZCrabdnLQCTCNdTnHZd+7zyLebkdBaLu6dkbmIa0bA60sIENuiZobu7CKF
         vmwsK1mQg5YEv0ZHCajYwzFD6mDRO4S72xOh/lCuoh72F0QyioZUfZEBXhKX9mJg8Q8I
         u9KpgWN0C/QTSRQvdmQr1Sd1JzqmdWdnC5M33ij5VQIIAA5nLVQKMAKflwTLMLK9UTgG
         ot1k5LcRhPG7X2NbiubbxR6h0ZpjyFfYHjqa0FZAmB0aqRWoOlMhb3Vk95vACDUH0A1N
         JlYwIEW0uRkU0Tlbo2l83aA+/0xxGf3x93tKfYwNOSpPcnMbwUEYRgaZ5rKOHJ945hxz
         Vf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739534669; x=1740139469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2/EmkyG86XB4+zPcE4otxsWMOKAE2ROdD+dHLtdsjQ=;
        b=SM7UUw+9uNywFqftvVOK3lzwgLElfTfxHQHy6cH83DlmjubJGseV+xuPyaR9sJJWQN
         1iUqHDXc8NNpdaLtSDsdZlxHnvUGBZ0NqwRpYr4Hx6okbqkdXn7BZzgooc5spO9+KSzX
         /hOnhD1/AJjDmeYbLCNDYeSe0YABLUgHe/b2VKAvxSQLpBD7EV+j7kfZWFEanSC9Fzqj
         9Ul1l3b/LXRIz7vQAZzohtIuwS7dU1dfe5ky+5YBfQ4+xDwcDVTp3XbDSolEq6bLyhR+
         5IQz55cwLXZZ7ljulGPQzd4u2S3bbYbpeYmG5EBagub19GqyBzhd2J1ViUzWyzU69wiN
         INFw==
X-Forwarded-Encrypted: i=1; AJvYcCXPy7l3jeFQ/AynMNwuB5wQ5U4qINO9BboCrZoSJKvGBBYZ/xQEuu+wJO7Gb5hYDeuX3a63smWDDprDetKk@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7uy8jS5z+iSeSikM4ovC5QR4DKXCkw/Mq8oz8qy9xQNY0cvtJ
	TignV7Gkpn41SGhG4vL75PDXJrNfFAu0A8HZ/lzkWEr05acrwaOv
X-Gm-Gg: ASbGnctTSpCWUYUUJ94qWfRkLs9CD8GT+72jB/hbEIG4cgsOEHgwZ9bL1dSxMYENvbg
	XQJifgHuc1y0A3cvb1wrLgGT/K/D+uIZncaQLNGbLM5qgqJTr7wW31z1+FDf3IZ92nPLxKQjAYZ
	hXl9MipDM5YGNbDSLO9S2N2ygDSmy/5fzfHladnBRpuPkTskXB8agPmk4nU91xTjCKgWtPjgs5d
	oQIL6drZsOxDB/oiCOUQSABeIrTq8Wa8uU30dUGGIDjyyXJBiuP9XwyZIVSaTebtQv50NcC15mK
	OAbgA944/MtXf6wWQWnISjBUFZDWkJk=
X-Google-Smtp-Source: AGHT+IHrlbR4VIv9nfE0+FPkbcscuBRo8nT4S+i0mXwVTsqlmVQjTcn0OZ3jXYuJt036YYwFj1nuSg==
X-Received: by 2002:a05:600c:1c15:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-439601a116bmr79885005e9.21.1739534667950;
        Fri, 14 Feb 2025 04:04:27 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7c7sm74879825e9.27.2025.02.14.04.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 04:04:27 -0800 (PST)
Date: Fri, 14 Feb 2025 13:04:25 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Ajith P V <ajithpv.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Resolve prefixing 0x with decimal
Message-ID: <Z68xSay4rBSecuMO@egonzo>
References: <20250206092815.3267-1-ajithpv.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206092815.3267-1-ajithpv.linux@gmail.com>

On Thu, Feb 06, 2025 at 02:58:15PM +0530, Ajith P V wrote:
> - pr_err() of hp82335_attach() in hp82335 uses 0x%u which is defective.
> - The iobase is of u32 and correct prefix is 0x%x.
> - This error reported by checkpatch with below message:
>   ERROR: Prefixing 0x with decimal output is defective
> 
> Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
> ---
>  drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
> index 451d5dc6d340..6ce79b17a419 100644
> --- a/drivers/staging/gpib/hp_82335/hp82335.c
> +++ b/drivers/staging/gpib/hp_82335/hp82335.c
> @@ -274,7 +274,7 @@ static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config
>  	case 0xfc000:
>  		break;
>  	default:
> -		pr_err("hp82335: invalid base io address 0x%u\n", config->ibbase);
> +		pr_err("hp82335: invalid base io address 0x%x\n", config->ibbase);
>  		return -EINVAL;
>  	}
>  	if (!request_mem_region(upper_iomem_base, hp82335_upper_iomem_size, "hp82335")) {
> -- 
> 2.43.0
> 
Hi,
Thanks for your patch.
This patch is now superseded by
https://lore.kernel.org/linux-staging/20250214114708.28947-10-dpenkler@gmail.com/T/#u

which uses dev_err instead of pr_err and corrects the defective 
prefix problem also.
-dave
