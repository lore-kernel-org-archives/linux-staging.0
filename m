Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163BB21507F
	for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733314; cv=none; b=ZCIbNZznbtqNTHIUCHLOo0uIz22qbq4ceI1uyZC73hdniu7wm3iCxBYYxcNplyK7cL8Ko2FGpLn+VjfOOUKkl4purJNY6ss3nypH1awlOudsH3KuU0km/SCYqbX5hfphPWgSM4YQ2fv0duyJoFhwLXp7zmcH0YXRkZAi45Dkj/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733314; c=relaxed/simple;
	bh=Epp6DWQBFHduWN1dTbfRFnc7iki98bhG5lprQjMcCx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLC2bFsPSTSjgPTrv2zZb+stErrGr4/R/PSRLfT3CA2Ph65x0ewbiARHd7G2uMjDwT2iMWsb0PGUZntCptTmqnOycDu90YMPX4QYyMdaMONL0ELom21HrovXp1Pd6sISV6VO7LQuvltYMt3SVqP1NB1PwITvusUIJ7G9eZAcf1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKV7r034; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKV7r034"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736c062b1f5so4865558b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744733311; x=1745338111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o5KFN8rQwRDsAQ/Yg9O45rfWFUONIccvAncbkaEGxW0=;
        b=VKV7r034WoeqqbKIouZWxINAjOcqNZlzrz9nYSJW1o/zwQ5/CaiUKByu1wM42fN7Dk
         gUG9fUQveB7i4LD5KS4gdPMUBUtaUsYiSu6NiPgAG7NuWhWu6RedvSskj1GdnJ9yZJaf
         zPZR7SODgIzdah+i63D1znWaCOwK/snkzpcSJsbZH7AwND0tB7KPwmLEAvfvJHkELUEI
         WAEqr+KJNefCC1IVKDIglYkOGocF9s2Ggh0T9KDBEmuKG5pRkT2qSCqaSrlz6H3o4DwB
         dtEuuBcavjvMwf7c2cOeveKG28A2VEYIb9Ql8TR1KJ1/p1ZoFhkbMDE7GfkvP0bZj2qt
         5jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744733311; x=1745338111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5KFN8rQwRDsAQ/Yg9O45rfWFUONIccvAncbkaEGxW0=;
        b=ZczC4dzp9Jh8YC5+keLr/ztiAzuh65AqzS0GFFUeF77Std5tM4Nr7j6RNemz47m6OF
         VUk56K1CwI6G9Ew7SkRQ+8pPTGvgwlTPmTV4scxaixD9LpBX7h0Py2yiiTneh8ejmozF
         dTDOt+gjVJR5RGNeavwkKaNbCj5Zr3otWgqvTGgOD/fBt+7fYprLY/0Vs25NKS9tj+jr
         i7ajCR1mS6obcMLPC/WEH2Kggp04U0nMmcd2VnCle6JcNwXdnJaSwSHwSK/j1yYQdMrP
         PL65AlzHL+rdwmJ8aXZ559ZTVMmgDeEJ6aAcvlQCUbOdrP3g/58dmh06cPZUjsQx+2TW
         qUsA==
X-Forwarded-Encrypted: i=1; AJvYcCVapHFV56s7vcB++h/7RTt60HfdcV9s8sYWdioBFP8oUfU6DkKH/SCnkQ6SErZV992F3cZAqEWvuK3bq0JG@lists.linux.dev
X-Gm-Message-State: AOJu0YwnEEkj3BHXKSnANyd0Oi/Api1g9hp1Hp6hmEHLBCI/2rauBHbA
	Ssw+qd2Ayv9OqfIuUzY8GjTeGL8nzo4O46RR7444144OHoLoz3dV
X-Gm-Gg: ASbGnct/GXE02VpRvYK2l/gfsgh4KG2R/CIcz8lf5KM+3uitBXJ2OoUJK/DxxhhmBKx
	IrBnwBAcMfpO8Dyk2/SDGh+c1n+JJpuiOU4wpuwu3/mzg3XsXYU55Y2HrQVZy4hxmx5gWeQfr3V
	a+bJr5ZMvGLXxg3bkYPyF65qACrWbdJyKCvi9Ez/HiDaOq1RTmJFAq7OZWjslbeAzn2un7cVKaP
	Ab6Z+w+LgzV16gdHbWeFuAw8zxQ+klfIu4BqtBwkUpbYXQzUXGq6FyBqRz9t4CagvYTn2QiLPYG
	9JqoEx3UGqxJmCZI5278/bNSwOsUkX1EObXxwZ3XJy9w7yQ=
X-Google-Smtp-Source: AGHT+IH6y8NaDWBYMTdPKnRuy2ZV18VnXaLplADliZlMQ0z4zUxVD/TIhKxxpiEyVinXAg5jXp/ocA==
X-Received: by 2002:a05:6a00:1785:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-73c1fb5ee47mr21490b3a.24.1744733311052;
        Tue, 15 Apr 2025 09:08:31 -0700 (PDT)
Received: from localhost ([2804:30c:92d:f600:d5e4:543:c403:4767])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73bd2198be9sm8669243b3a.9.2025.04.15.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 09:08:30 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:09:40 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	jic23@kernel.org, Michael.Hennerich@analog.com, lars@metafoo.de
Subject: Re: [PATCH v7] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
Message-ID: <Z_6ExCvQg8lH20z6@debian-BULLSEYE-live-builder-AMD64>
References: <20250414191453.10222-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414191453.10222-1-simeddon@gmail.com>

On 04/15, Siddharth Menon wrote:
> Use bitfield and bitmask macros to clearly specify AD9832 SPI
> command fields to make register write code more readable.
> 
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
...
>  v6->v7
>  - fix st->ctrl_x alignment
>  drivers/staging/iio/frequency/ad9832.c | 92 ++++++++++++++------------
>  1 file changed, 48 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
...
> -		st->data = cpu_to_be16((AD9832_CMD_SYNCSELSRC << CMD_SHIFT) |
> -					st->ctrl_ss);
> +		st->ctrl_ss &= ~AD9832_SELSRC;
> +		st->ctrl_ss |= FIELD_PREP(AD9832_SELSRC, val ? 0 : 1);
> +
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
> +							st->ctrl_ss);
Oof getting Linux code style compliant tabs and spaces correctly can be tricky.
In sum, tabs should be size 8 and be actual tabs (not 8 blank characters).
Also, when we need to align code at some column that doesn't match 8 sized tabs
exactly, we start with tabs and go until the last tab that precedes the column
we want to align to, then we use spaces to go from that last tab until the
column we want to align to.

For this particular example, the opening parenthesis of FIELD_PREP is at column
50, so to align st->ctrl_ss with the arguments of FIELD_PREP on the preceding
line, we use 6 tabs and 2 spaces.

		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
						  st->ctrl_ss);

Setting tabs the right size depends on the code editor. For vim, the following
settings should ensure the correct tab size.
set tabstop=8
set shiftwidth=8
set softtabstop=0 
set noexpandtab

See Documentation/process/coding-style.rst for complete code style guidance.

Apply the same spacing to the other cases.

Regards,
Marcelo
