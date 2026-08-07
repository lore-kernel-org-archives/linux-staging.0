Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F763890E8
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088202; cv=none; b=YhbwOtNaGoMCfV42gcRrF6KIAV6hxtCmdTfrKTf28NdoG6MDV1Zh0XAosSn+U0UhXQ2U+DpOXDPmXCtzo+hWi+jKwzX4tzMAVkUGcM5c+5sm8xgoXaYSZeQa7ANX3EZfbcpU1RLuvwbla+K8obDLVDBo9L6LGcrDWNNfAIgAiFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088202; c=relaxed/simple;
	bh=wQAVvH1tNXlAzIGB7zvqrPD5lgABH9gvcOKmiSO8R/o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWuxLgbyTKeLw5f/X6S6iE6Al3YQpMTC0qICjlT+ycLR8DDiCgGLqh2i48f5Oggw3lIfJQudRNoGxX/zqmUOT6rM0nBbbzBNbqYiCi7a/rmSCRqMTFH0WNwha+uH8oPsomejYcxZqPzDBAUOZVVt3FZ5WxFJE1lNezCXMWougZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3JoXUCA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3JoXUCA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1842616f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 00:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786088198; x=1786692998; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/WXJlREgBQORjV26H3RvXyQimV7YRpmumUNnx9xtAU=;
        b=n3JoXUCAP8IsRfjOR2mPTIUesXnhSoenR4iSWzVxWxX3hjIzdDCKGcQr0/E0+RPVI3
         MFA7KT68/1oC4/Ww1TYOWyhs7F4Z5gtOQvJthz9YAU2ziPXnrJjVnRKYMqM0ddLDfDct
         xu6s1/WVH0OBIb7pA2A5FR857gjQ4wYErEN+P3AOuCjDOxMqvV9cuXxcL64NeqWF/Xzd
         layKzg4AsT3R9rer7428YA2JFgLlEjQaT3+A7qDBnZ6vY18qYsIU55cctcRLaNbdyzwr
         KSLVgtjHPxRmJeS5tZiGUqDkH3VPvuYQUdkXXSD0UjIJCBiObp81lMOgpxNRlzwRMfyy
         nLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088198; x=1786692998;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/WXJlREgBQORjV26H3RvXyQimV7YRpmumUNnx9xtAU=;
        b=CR2XwKzxnoYFPum3Mq0DMewDdQn336BYyKBS2diiGqfx97MxHTWKIndcKX11itakxw
         zRxXuOdRxL0lt1GYKb4dLiIJfPe2NPiJ1+gT68WgYxWhUCYb79+P1byXvtBELx2rElUq
         QKClp6O4bwSbpAaCLiri1gXX121SpvOOiD1zooQ7p1dfmNZML7NHgAEkZLTY2xGkxo1Q
         coVoLxd2478nMzrw9IAlSd0Xo7B1zspVbicy6v3UBRZazGZo2KWok025fZwiNR76A3Qk
         G1p5yPPpGbznOo76B9+9GHbkZ8al1pUlVcpGGeGFxZioxn2RAcYIL2UXuZSDtbW7Jn89
         tL+A==
X-Forwarded-Encrypted: i=1; AHgh+RoTJLECZ4GwAoU6Ud95LqjUM5PosM/OR3euipkO8kwADAhyqBqI/fy1IFdJP5HaPOOEKYSfsdoDKAGBT6g6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq6HTfYS9MpxG1DhpVjddyJh/wr/PhUSGApuXqQ/T9+ndYrCGk
	E+fnh68blffNdUi6BN7JKrudLr7mgDambtXtI1tUhhoxWhahpwSdP0fl
X-Gm-Gg: AR+sD10o8eeAj2mlBBmoNwrhLZLukxwYPzGPnbeExnH/6idHc3lgxBEB+9ZojznKqaC
	XG8teDJrkPdmXGQLKggReERC5Uz4pm6sXlOEMnAtViE1cF5AyrJ7Y1wtfyKMg8QfRgiF1aUIbTb
	JoRNpqLNeJ4kbm0iIZ/rKjoy3fOY6KSybu4ks/lZS7awbX5eQ07dMuo9sZcqZ8CDRvCQ2m2OFm2
	4xMuPYgUdIQfkY4ytgY3vp1aeUHe/44/zv9fg4senn1GBe/RVXc3wg/IEfPd4+XOzNZUlVmzogC
	xSMfPu0arXt+vtngr23WTm7I3Kx78XZgNQ8jw9icYc+itjn8xS1vHpCc2OQSy/T15jdiO6dcD3w
	x7vCVPz/93GqE3fq6bZVM0jHNyM/I8lFndjvR1ZIu+UP/zF2ut98W/9MKR8FnxX6ns/h3TWYDDK
	VW6fOxbjfvbB3/WXU/ifH1WvjSWQyJ/AzvWxE7qeALEmziepEC0aeiWYOxGjskiWlWE0JMSNSRC
	ENF+7FhRwGLE0Vn5eTQ8NQZL0OmDCqLq9E720yMjCoYohMIdhaSHI4OWzSmc8ylxLkfN17saltv
	T+mG+0gVeSReNya+M5CHB+MPsLnJRYygZd8xIewYeV89qp5q4w1usaUaLhyd247LmZwLPjx/BoI
	nE3+GyH93Dk8bloJ7dwMAmlEWzJOehGFVrfMSbgtqPOTMukeklOUFqZy3dLG5ian0JHACj/8=
X-Received: by 2002:a05:600c:c8c:b0:496:c18c:f9a3 with SMTP id 5b1f17b1804b1-4994e79dc76mr250053215e9.5.1786088198056;
        Fri, 07 Aug 2026 00:36:38 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f0230sm13148745e9.6.2026.08.07.00.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:36:37 -0700 (PDT)
Date: Fri, 7 Aug 2026 09:36:37 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: andriy.shevchenko@intel.com, jic23@kernel.org, dlechner@baylibre.com,
 andy@kernel.org, nuno.sa@analog.com, gregkh@linuxfoundation.org,
 skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: iio: frequency: ad9832/ad9834: add comment
 explaining do_div usage
Message-ID: <20260807093637.00002bfa@gmail.com>
In-Reply-To: <20260807060348.6477-1-raizudeen.kerneldev@gmail.com>
References: <20260807060348.6477-1-raizudeen.kerneldev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Aug 2026 11:33:48 +0530
Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:

> diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
> index 33dfd723923c..85f39ceb3c4c 100644
> --- a/drivers/staging/iio/frequency/ad9834.c
> +++ b/drivers/staging/iio/frequency/ad9834.c
> @@ -103,6 +103,12 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
>  	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
>  
> +	/*
> +	 * mclk is an unsigned long, which triggers a Coccinelle false positive
> +	 * warning about using a do_div() for 64-by-32 division. However, mclk
> +	 * for this hardware will always fir within 32 bits, so do_div() is

You have a typo here, fir -> fit.

-- 
Kind regards,
Joshua Crofts
