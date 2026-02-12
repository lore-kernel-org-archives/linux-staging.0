Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1A635CBCA
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770908412; cv=none; b=oNhsaOsI67DZ5PE8lcLJiPDsuEnxMKxKx/jrMmF0lXy5cymtJ0C9KQaeQg07zUFDff++lsKqWeE6iq9EG7P252Kwk4gyDzh56Kz6rdkdj0R7tWAbYBZ9tFA1UOzncEpVLRaRoPij+EWBsiv+VLK0fqCz2M6cZuuVV6LAWu+D5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770908412; c=relaxed/simple;
	bh=p5Hmrmgn1UcxHmYPea4G80SvvCs1nZ6lsT+jQk3xr2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akhXaYv/9YtnBBvxF1J8epngPnx/JU0ZN4lrLoWokmRwMuAJC5vaKpfi6FYWhoxCJOHxd8J4ANQxskgzmCn35xmVZ+3AKilb7cOJRuw8dypO0BWrjMyCSRPY4z5seO5HPuj9E+oaX3huxGTGVYhFUCKjZa+Ebmdv+CPG5nwR2HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NfbcHBaG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NfbcHBaG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso2824515e9.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 07:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770908410; x=1771513210; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IINbxAJGaRHEvEhY0z4nrEUHRqDZtjxcQiB88qmwdnM=;
        b=NfbcHBaG8EjusgBcDoMQftQDFnxHNdhgOKdf0w4drKXyn60WL75L/anB45M5jGHYoM
         J+35dpBFe/5LOL59bOQXDQJhI2C19ZRtdXpPqHTPrM4VJuOek3HGlA6pPGMg+yG0jioK
         GJigJC252lNaC/wiKzun9HCpPqtn/KJaehmwQK10v8z3h5oO1QHS4IglUEOJfGqe1+go
         PY8s1yQQnJGK7YgZ9ki7jEHDEx0L3gRVErGWhzC0N5l1hW+Ud1PsVpRDQkoQe6sccRY7
         7YQmj8E/2wL7v6vEDtxAish8MrZsEKts6tDMaBUQdZM4SCUD8ElH5MCdPjc/eUP+Vne2
         byww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908410; x=1771513210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IINbxAJGaRHEvEhY0z4nrEUHRqDZtjxcQiB88qmwdnM=;
        b=pimL37pf8BbtmnDQOHrS5K3VTHE6l8hsnemi1gOBf9mf8OEl6o5GnpQ+03+9xaJ8YO
         uhUFSNcZzHjbxcZtGGw74vqg4mkeHHYKS2GnDycZauw3uhxmgZam5hyoyokt1sXak4kj
         IfRxPzPhaLGQzJNYaYnXRG4ZfTEXKhcgj2Yw4wlsZv2R0/2iXUi25e++AtsgvNG0+nzH
         MIugNUhE/L+GOyR4jqxS765lykaXz3DvhwSdWNKlFsyXgUDJQDrfPPydUx2OObFsyh+k
         ZF7xJ4X3caoH+0hdG4kkCiuT8Wx6JYAAvxZfsagNt7/bJiG7vj5gNg1j2lAS0F7UdnvC
         T81Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlN4SSK8STi7p/zdz6HqYW0KiPnjoKhr37bOjBu7WM2yjsHWcDgdwLVExx0aClX/wxfKnhwTu5UFPxxw5U@lists.linux.dev
X-Gm-Message-State: AOJu0YwONs/HMsohCUOZXOzW2bhKwD5fDdLVF3p4JYltVo09/OHUxJXV
	kTnP5q7hRe2KVcyjp6RXGifkFcPhDVV3FWruY5xPbamgaizX5KDShtG3xepSG7RWsBQ=
X-Gm-Gg: AZuq6aJ2tiuAHrfAb5G10kvcvqMJjebKdsgwIm1HAUGXciG4Zv0eFKq9ptSLMApIz+h
	nUeIFJx8DYnINxVX2jD1uZdIGukalVDgaBBc/vxKOeqLlOdh2UIAOoxuEsRL79KtC1eM3124Uxn
	ZuBf75Fu18EILEt/ZOcJiNZKUVazPo6lHw4g4RG7mW0mGRCwl/y8KoiRKWEQ9Nfv539lueLr3th
	ImNkS50UIcxF4WTpK1NFO6IACYC2HHu/1mbCi7NHpq/bu9lLiuK54bCY5yaVjL0UsQ7XmnZVPC6
	8sjaChPpiFbBO8OBWF9nKxRfYevSUR4ct5VXKchQKkMLo6M7UU6xlK0PbCL6P69v8GeqEl9zZRM
	56Fg2Pv7GdaZT5/QlcopDQKXBpR0YdBx0RNlsATAYqN8BNnPv3uESznwT/WgnotafRoXTJ03ITs
	iHrgoKWBDS/HKtgkyylHfdpwNguCiY
X-Received: by 2002:a05:600c:19ca:b0:482:dbd7:a1c1 with SMTP id 5b1f17b1804b1-48365720147mr47963225e9.34.1770908409591;
        Thu, 12 Feb 2026 07:00:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e0196bsm13599697f8f.23.2026.02.12.07.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 07:00:09 -0800 (PST)
Date: Thu, 12 Feb 2026 18:00:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: RachelOvrani <rachel.ovrani@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: sm750fb: Rename nDirection to new_direction
Message-ID: <aY3q85hAYWUGPngz@stanley.mountain>
References: <20260212105842.36431-1-rachel.ovrani@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212105842.36431-1-rachel.ovrani@gmail.com>

On Thu, Feb 12, 2026 at 12:58:42PM +0200, RachelOvrani wrote:
> Rename the variable 'nDirection' to 'new_direction'
> to fix the warning reported by checkpatch.pl
> 
> Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
> ---
>  v2 -> v3 : Change the commit message more appropriately 
>  v1 -> v2 : Renaming n_direction to new_direction
> 
>  drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
> index e1877e5d0..c796d410c 100644
> --- a/drivers/staging/sm750fb/sm750_accel.c
> +++ b/drivers/staging/sm750fb/sm750_accel.c
> @@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
>  		      unsigned int width, unsigned int height,
>  		      unsigned int rop2)
>  {
> -	unsigned int n_direction, de_ctrl;
                     ^^^^^^^^^^^
The old code should be nDirection so this isn't going to apply.

> +	unsigned int new_direction, de_ctrl;


regards,
dan carpenter


