Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE334CFD1
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323826; cv=none; b=bl1hEcuDCMMEgWza9wf6z68M9Fw3zzxTbL8pAdu1BRUvldNcb7XW1cXpHacE2E5w3F9L5b/91r4W7B/9edBl1uq8LnjBO2E55C1YGd51ihG5y7Gw4xqpoKVnB1UXle8G5zrbAOydZEsngpe8H9Oe1KaSv+zvQzUM+e0D1/5/wdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323826; c=relaxed/simple;
	bh=iN/UwKVJuP69SNyoLwLZ7RqGz0VPJ36dbcNR08CBkPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYxZTxybIZSR+bVcTHzW9+o0jHXXYHMGjOPuOoMIrqpWbMnl+pSMtT0uvohLtoAOMIG5ifusqmHdC8GSb+u4QCo/c8HL5+A4pu5Y5xFYqW1IaF9CR6Sjch+GBlEisstNXdoIWWZOuC4rEIZ+OsQ/LfumY6UkoxdRouHifIKFAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/XJaZs3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/XJaZs3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso8582995e9.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773323822; x=1773928622; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ktVDN7qYq0WOHCD00szxOqNnI17BzE5korotOZpq77s=;
        b=w/XJaZs3zGc23qzevaA7DByXyMPZIuiIK8p6R5JlixAfPnMwsrfD53ILoFCtFVvU4/
         jzNILbsOByqIWqzvQb1LsildH38S52/90sSmeqJMAiLiotldwfoghgA+ymkbMNoK2i+A
         KiWctaChLIl2c8h74elSHTVH24kCKJ424HuRdrm7Rxo+PR14eT/kmtuEqZabOWFl1sph
         lVaCRxKYcDdOGCqajp3VRqSRlHfHvjafhcJ85WjzC10XvatZtA2+d2CaSyJX2YXeT9Et
         ewHsJ7rkr+AOmmdDeMKpg3dLjbl4zNPaX8NaKND/miUZ6beemBmneo57Fn+3KhRAFK0f
         Uc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323822; x=1773928622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktVDN7qYq0WOHCD00szxOqNnI17BzE5korotOZpq77s=;
        b=wDUSkLw7cRXJA+aVsBU3Bfmu0uuShswRtlstAmnB2k0jYakslaW7VjBJYPoeNhn11B
         orvAizWcF+OlVj9qjdJjGQXPHd/5AEipjPvVwhN0SL/Dk22ktSjRbcZJA0AoaTW7P2ZD
         w0QlIQL1PsBGZTaGtMr3z1OWmcq5rjxX0BMggwqQ260pDTi39orTwjcdGZPUy/wLyq8c
         72MxzbD+eT9PBds6TQIMLy4bzP9oCa5W3w4le7Rrtn7x560uR2yM/eOUn39gVMR10q69
         zQSeeFsuZmwQ1S5+ARHUua3s1LA6w3DufqmWNBjO3ImWrJZeRdDPdfusxA8V5sK2HFpB
         fzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW14lEu7pct2res5OBT0jJoC4cRzRpQ8uKJFwoRfMa8YxTm03HAVT6ThFFzDJzkUvddpA7F1hgj0/RiIuVq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5/BEnx5JpBEHUz26oW9VaydwIzNMVt+pGMuZACfcQInFMRTw+
	SZO2mAsPowltNOfM13WvQygZ7xFfr//qfPCCGW/N1RtfHRRe99Ylib83oN8Uto8CJgA=
X-Gm-Gg: ATEYQzwGm3VantMCnWmM7jnluW50FBC7CKjUPmxiN6N4k2Hv+OR4Ke4qgsmp6jp367z
	VjQSqCrKTBuXFe7H72C3oU0KYrCEei4kdTWdPDV4nuZ24ihmxbUC/amNbFMgSN54lukYqOFYAY2
	5KzAs7wQ/p7P2iRtaet9Ob5aA/ASSPdrFmI/cHJZK/tJFSVF+1jt1bdLm5/BkOL+AdcXFSqP/X2
	r1bCEe1GcEpjm0UbCvG+IwjrVKlQgYlczjlOetIYLrAQfoRgi8lh6/uYyOjEBKmzCQtqM7BLLc5
	hK+YflMN3ERPjRc76txQHcDlLfgmRtS1MDmpqNrVw4bguu/a+b3ZDVL8kx6ZmUZN/kt1RKUN9y8
	KGtf/0aX7Jsdw1lymljJU4eX0RzdIcprU+O4MmM88QSRt9pDZ86z/9TsiRVsuz/pTrKKLL8olk0
	QaSHcktiJGoUG/FGo7AZlaLhHSAbC5
X-Received: by 2002:a05:600c:458e:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4854b0ac93fmr97513165e9.1.1773323821702;
        Thu, 12 Mar 2026 06:57:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm7606686f8f.32.2026.03.12.06.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:57:01 -0700 (PDT)
Date: Thu, 12 Mar 2026 16:56:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zile Xiong <xiongzile99@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, deller@gmx.de,
	abdun.nihaal@gmail.com, chintanlike@gmail.com,
	niejianglei2021@163.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: avoid empty macro argument in
 define_fbtft_write_reg
Message-ID: <abLGKjvKMorbb3Vb@stanley.mountain>
References: <20260312111807.96789-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312111807.96789-1-xiongzile99@gmail.com>

On Thu, Mar 12, 2026 at 07:18:07PM +0800, Zile Xiong wrote:
> Replace the empty modifier argument with a simple identity macro.
> This fixes the error reported by scripts/checkpatch.pl while keeping
> the original semantics unchanged.
> 
> The generated code is equivalent and builds successfully.
> 
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 30e436ff19e4..380dd374a566 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -61,10 +61,10 @@ out:									      \
>  	va_end(args);                                                         \
>  }                                                                             \
>  EXPORT_SYMBOL(func);
> -
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +#define fbtft_identity(x) (x)

Someone sent this exact same patch before.  Same name and everything.

https://lore.kernel.org/all/aYECoy7Apjwgzr9r@stanley.mountain/

A better sollution is to learn to just ignore checkpatch when it is
wrong.  My previous email was longer.

regards,
dan carpenter

