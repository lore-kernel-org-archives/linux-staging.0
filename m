Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C971917EE
	for <linux-staging@lists.linux.dev>; Thu,  5 Dec 2024 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385394; cv=none; b=usMkU5k/76VShUBHVgab/3I4rLxm/v8hDEpATmUssCthaxv21Ow2y3ARnZNX9szMnUiWWQXj0IjYhADZqGXD2NEs5WoQo/DPPcxD2L0Qf2TMlqJZljq04RQMZKj8j47Hy2CXS2YZSniC79jPun6t7+SEa9rT9LAXNmHL3tu/LDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385394; c=relaxed/simple;
	bh=DTbPAS/5qz3UYnt9dxcYipRyp7K5TMfuimHNfhAg8oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxZhTOxJSRXxYChLUELtgtk6svxzS2PIeqd7M9RGiv8RpVcR/pQLSNZk8t3PV5xF0O15VB3atwe3i4e3fsXt+l1N/qD7jLGXtqfG/ERA1mM1GbyMrArttqHq0qmbD4u5gnDdFBS3JyhNMh4/k5Jr8IhURzZTqixnF42jW08D7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYjR0A7s; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYjR0A7s"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385de59c1a0so473665f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 23:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733385391; x=1733990191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R4Ve/PEyF/LJiptVxCyJSmBnIQ9cOpOIT+7VMBpJmUg=;
        b=eYjR0A7sM+Dd4THuuldE4sIpmFWl3h+92muOHOc4AeTS/7R6yOqCWGDRmVTqEN9ZaS
         wX/Akw1xI7oMPuMvZlOiixxWQTFr9lbMV1a7l3icwXjJtcnIDgy+0UVLCeyQL62a7vHq
         8pCkzLb+JRS7H2Yg3TvZXVXzQ2xEcDpcUnuMlksRjIYBT+PMnJBjG3X7Ee+xKScxENSk
         EJDOOfDoup38daArIzZCL7SEYQRPb9Pe2Ottl3uljIYBXVYPqB3sF6Y+wcOSjIVeIEX7
         M8uYhAecnPIlThPrjAGS66fi5MYlr6dyBi1b/4brU24bUZX/PS5dVCuOjrAagzPlWkZX
         epSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385391; x=1733990191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Ve/PEyF/LJiptVxCyJSmBnIQ9cOpOIT+7VMBpJmUg=;
        b=hq1Pb9v5lFO0Vptygpv0p9+nlSOzDU5P+LWiTXS/vFbAv+fQ2CE/IHUDHOAX41ermu
         Q8UdBxq4k94vyKwgJ7Rb5JOCOdwUf0T+fLLHFTKnueTZhgJ6mxTpIN/A9RDANRwYDsO/
         Pm9XA1U1TS9aRYV9P8AY7sWeO9omXXG9229dCYkskzG+El5C/lxv7NWErr2f0ywy8Kkh
         0CtLu7p77idLx3who9DMpMp6Yy9FvoAgPph2VuPUya5gWqY3XJG0XcXSuwU/rhYI8LyT
         gxETtNoAs8XxtxJZ7uNeqLWRAnsY7bjjHqDe3cxDrXfI+VaodB9fkaYjdtxj/eR3lwY+
         JbJw==
X-Forwarded-Encrypted: i=1; AJvYcCVlPtfQCc2AiVKmGyjSOsORXO2sh8NVm/YshMSpK2lnqPPE+hgowCWMxa36CUlMzz+qIpgfFbB1pP3bphOX@lists.linux.dev
X-Gm-Message-State: AOJu0YzP534k26IU7TaKZQQekpTe4iSHIo8U/io6swW8sB6PI8YwdSBU
	SOMqSpd7QQitDMXpBS7chYny4tIUlYJFozdF0cUKQ1orY6eTjRT6JJvK5m/E1fg0VY0Q2bk3aGT
	i
X-Gm-Gg: ASbGncuvZ2mgXBJIavGwTV2i86F0VIFCHUwrnqKSSlJ50GFNZ0C9MGizVLsi9du7kx9
	NVQlb1jlEJj3Ahpt5NiO5bZm/GoCchbo5gCOkBiUyIb6TlprDTuKz7vXu26md6ndZr6wqejkSDE
	UG1IgpwBMT3yKa55Snx/QWSxdf1OYW4AdZQva7e5A7saTso1VJ6ayFzrAlQ0JpNtUtlDNu8PcYz
	AJjMpXUP404aDgvAL5jwuLD3AV2bOKkPKCzFVq8x8SVO12f4rAfZ6w=
X-Google-Smtp-Source: AGHT+IHy8GryGXvZfJFDbncgxhNTbcSCyq0Ui2X5JtetHybbTH4RxP5kQXSGmCZtKRmjKwo+VTCYKw==
X-Received: by 2002:a05:6000:23c2:b0:385:e1e8:40db with SMTP id ffacd0b85a97d-385fd3e9195mr5963249f8f.24.1733385390928;
        Wed, 04 Dec 2024 23:56:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59cf8esm1203416f8f.39.2024.12.04.23.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:56:30 -0800 (PST)
Date: Thu, 5 Dec 2024 10:56:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenguang Zhao <zhaochenguang@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: Cleanups for
 rtw_inc_and_chk_continual_io_error
Message-ID: <06d27c5e-2f92-431a-aaff-71b7617e21f1@stanley.mountain>
References: <20241205021610.523528-1-zhaochenguang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205021610.523528-1-zhaochenguang@kylinos.cn>

On Thu, Dec 05, 2024 at 10:16:10AM +0800, Chenguang Zhao wrote:
> There's a warning when using checkpatch.pl check rtw_io.c:
> 
>     WARNING: Missing a blank line after declarations
>     146: FILE: drivers/staging/rtl8723bs/core/rtw_io.c:146:
>     int value = atomic_inc_return(&dvobj->continual_io_error);
>     if (value > MAX_CONTINUAL_IO_ERR)
> 
> The patch fixes it.
> 
> In addition, also rename 'value' variable to 'error_count' and drop
> 'ret' variable.
> 
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
> v2:
>  - rename 'value' variable to 'error_count' and drop 'ret' variable
>  as Dan suggested.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


