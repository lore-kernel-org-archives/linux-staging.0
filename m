Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6323E3D6692
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782456495; cv=none; b=DZWOTp+GtLFyHdFK5Kq8f7CqI6rjtbJO23jD2CNNoEb2W1L03w+60tVMWfOLGMfwq5ve4QqFQKrzsoSle8MRf2PztU03CHFKL30CKPCAn7LNb9hc10M7h3O7P47e1x9RcOmguJ1Tnm6t4Y5IPGOHQ0PkcpoSfAHd0rR0dHTT4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782456495; c=relaxed/simple;
	bh=piuMXamwFeb2ty8Py4xAcFtdGIavuUxn7rU5cnWtoPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rrFtyIc/m5FiZSutODpHtuoLOJ2Rc0OcJDt2XLamfZxfWWAfVLZ1ZjL+TeAxk1k5C43m/iPZ7sediasXR4lt0VBjbKpcNcmsrXqAGyUCnSkXXHMNbjMUs+W2+Keeg0xt+XuvXcQn/fch0PpHzK22ZCjKvTJ7ge3g4Zkd7JOmrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikXH+Md5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikXH+Md5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49261a64cf4so3683285e9.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782456493; x=1783061293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N0cksKNHvZ81428H3lVKSOV4A7mJ0/dw00DfAdSSuw=;
        b=ikXH+Md52GvWLnW6ysOWcrK0L16gY91vgVfvx6xkH6OVccWnydNIKrilHnfF8WH7J9
         V7x86EHb29MU4cwD5rHxHg4b0dcBTwmnLP+DePs1vvGqvuzL5kqbD8p+aN5sf0o6M8ht
         QITlq5AcfEsy+J2dwL7PORPU3MVE5uVuHk6zwZeQstXeB6fSlnJLfKuDidz0iLkVLvAt
         qIZ4tCEuxn58DQ3xGnVsOCGBv54qGLXfgz+VoC9fhrZZVPQT2OYmj2vczHqt1ExiGiMj
         V5meiNMLfxlO7B8OmXe1TuwXw+PuFIYk7Z6jfBQtMoIkdNZhLu9MaZVKx7bsyWPjcjk1
         4+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456493; x=1783061293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9N0cksKNHvZ81428H3lVKSOV4A7mJ0/dw00DfAdSSuw=;
        b=htg2B5YxXaSol0p4SXatz9jXzUyYYDH6dIaVe0af3qqc+SHKa09Kz6Jtja/QOVMEwO
         SaAJlD+tehyvGKvBGiQRa7WRc1izU+8Gy0o4tM+c7j1fs0SOJSq1jmX/7BoUiqp0vBZY
         Ts6oMxUL1RpTlraUEBA/RjQ7HYrBrUtXlHIbIzy/Vp7ia4XZmqFVsYJxKgsf6zE/GvHp
         UPoqyhFDSgP/cnyOO331WFQgtmVBKbsZTghSwkuaBAo5bju6OZGR9JCK/j7LrFGCXxr3
         UNvEBFY3OnQMxBmLwRPblBhOfhBUW8ke1Q92khCS/KlJ18KbPqi0KtNBOc0eXhxAu0G6
         S7NQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5/cZ9MaWojT+Kxk8oJXKxtDRlPxQQv8f/7xLce3irgdatOZlILz/2AuJlSXJlL5DoQrSqBARifu5POO2l@lists.linux.dev
X-Gm-Message-State: AOJu0YzPfBrxm9FInQCl9yfTEvH/dMhIQN/VTplYyKgfd3fpIz5UenLH
	EEcJ14lfha3OJLl/fmewod2x0NL8cTvHz5TVlH+wYlkQ9HYViocn4ahL
X-Gm-Gg: AfdE7cn06hGElTZT5LNc79bgQClMdNa7ip/jiLbGb7SpehDI8lHCoZlB3QRsidVICXS
	Qx7DPYg+mfZzOzc1sXYlQQ4MNUDs3aL8KSdybrpQJsilvE9ZHTx1KJZk+0W8vP6YR1ZDrt8IpdA
	K7gMkYgd7UaEk+nF89t5tfq/8KRNusPFkNPEveUU7WD08Wf/jE7zMryTUfCGRaGcBDs5d5KNHUW
	NTGai2WGhiP7bPVfvVfosfC5jxxN2FrLo0CXTX0NJ/XiSfGK1ocDtWTwJi5HpuhTjPf13Ia+JPB
	7XIhMHF7E5KZcDUu8hi3ht8d6gZ3/Mqrm3PdXKNafoOgEwj9ly53FIUJg1WauruG+t+SGRiTyf5
	UFj8MMPM7Hz+GsI76O1Cd065guUxwKKfDyqZF+uiYOaFkmoHPPOuimfGqlz3C8LxrtHDvoLJis7
	saWwmc/2mkazzyxmCtEiacdW5FGffrpKo8HXKigi6o3eKGnO9QEQ==
X-Received: by 2002:a05:600c:3143:b0:492:4cce:53e2 with SMTP id 5b1f17b1804b1-4926683b1a2mr69365785e9.3.1782456492535;
        Thu, 25 Jun 2026 23:48:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm93653035e9.15.2026.06.25.23.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:48:12 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:48:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix unaligned access and buffer size
 when startbyte is used
Message-ID: <20260626074810.433c4006@pumpkin>
In-Reply-To: <20260625103041.281190-1-suryasaimadhu369@gmail.com>
References: <20260625103041.281190-1-suryasaimadhu369@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Jun 2026 18:30:41 +0800
suryasaimadhu <suryasaimadhu369@gmail.com> wrote:

> When par->startbyte is non-zero, buf is advanced by one byte creating
> an unaligned pointer for 16-bit types (u16, __be16). Dereferencing this
> unaligned pointer can cause a kernel panic on strict-alignment
> architectures.
> 
> Fix by using put_unaligned() instead of direct pointer dereference.
> 
> Also fix incorrect buffer size calculation in fbtft_write_buf_dc() call:
>   len * (sizeof(data_type) + offset)  /* wrong: multiplies offset by len */
>   len * sizeof(data_type) + offset    /* correct: one startbyte +
>                                          len items */

That should probably be a separate patch.

> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 2169f8d1d..cfcf4d7e7 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -4,6 +4,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/spi/spi.h>
>  #include "fbtft.h"
> +#include <linux/unaligned.h>
>  
>  /*****************************************************************************
>   *
> @@ -40,7 +41,7 @@ void func(struct fbtft_par *par, int len, ...)                                \

I'd consider changing that to:
	func(struct fbtft_par *par, int len, u8 cmd, ...)
and probably reducing len by one.

It makes it more obvious that the first parameter is mandatory and the ... is
associated data.

	David

>  		offset = 1;                                                   \
>  	}                                                                     \
>  									      \
> -	*buf = modifier((data_type)va_arg(args, unsigned int));               \
> +	put_unaligned(modifier((data_type)va_arg(args, unsigned int)), buf);  \
>  	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
>  				 0);                                          \
>  	if (ret < 0)							      \
> @@ -52,11 +53,13 @@ void func(struct fbtft_par *par, int len, ...)                                \
>  									      \
>  	if (len) {                                                            \
>  		i = len;                                                      \
> -		while (i--)						      \
> -			*buf++ = modifier((data_type)va_arg(args,             \
> -							    unsigned int));   \
> +		while (i--) {                                                 \
> +			put_unaligned(modifier((data_type)va_arg(args,        \
> +					       unsigned int)), buf);          \
> +			buf++;                                                \
> +		}                                                             \
>  		fbtft_write_buf_dc(par, par->buf,			      \
> -				   len * (sizeof(data_type) + offset), 1);    \
> +				   len * sizeof(data_type) + offset, 1);      \
>  	}                                                                     \
>  out:									      \
>  	va_end(args);                                                         \

