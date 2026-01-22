Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B41FC7C5
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769062819; cv=none; b=fPcE1hefx/vq81O5F5hjTbCfWLlz7Tgv1y4bw/eGeqWfjQo/1vfP4JQpWGlTqK7Wikblb+Ob6n+Hiv0wLKH/q61rs/2EjvYyPnUM72+hqDxzeTWFmHtsqT3nPt/PonP4A5oidB3lIb/TxBTkW+kk7qoeg2Fe7/+oxovptb7I4jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769062819; c=relaxed/simple;
	bh=OzXuQ4xbN7FDjWTjEfE80G+1ONvRaNcTZOStSmt5pH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucHKgAaEQTGZuPjihc1yjiTgel2euTsrC/R5AF6lcNRcj69q5xEXtUwVxD2BpTMytmkwvrc/C9LWZMi75H0MBEFCrnBQHJBhKeESqriEKnoTd95hNOfvqqQ4GIsVleJ3NHmneiPKB0u5OT7hJxc0k7WqM/fmM8DRWWjf9gurmXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZGT72qCO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZGT72qCO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so5690315e9.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 22:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769062815; x=1769667615; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lOTy2622GXa3UDPHBgR4VCjibhjN7Qyx2Oj8387gVe4=;
        b=ZGT72qCObElcJxdFLeOsA+pWpD3qP5A2IbtL8PnkcmTbyQxe8SNrd77GrK5haMz9zr
         twxzXW+8WbA3vflzFZSo65bjFo0eXT0OwSBVI59HEwh1oLUjVEVsUIjjzVP5MlFDy3TL
         bZJnnC9B9oaFbrmrOhigIBuL355oYHk9sdoT/osvCM4jfAzHHpTWRakPcJ/q9aqBvaNi
         /qwL0OzbYGaYxqZi/djo5r4pzHt9BRSbqqiwGXeSH+uo3j7r2MexBPA3jtGrUXKffhSr
         /aYmGTUn52yw96YPf10w4GbP9HHewMo9TdbqzuXzWIEAwYLQkUUgz1tFCcSYcdnW/P92
         U8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769062815; x=1769667615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOTy2622GXa3UDPHBgR4VCjibhjN7Qyx2Oj8387gVe4=;
        b=kTBj7sbi+NnZAVjrEdCjGiA2tqPMPRDiXxMsDllrjvd6bKSlmvjGUDMhVyh+0odSJl
         QbHf3xxZTDppL8xAihPoxTa0coeIZ6gVkOWQCLP96MKC9wjbtJIYDEEjMri/ZEF6qE7A
         x6iWQsLkJxfJkDNLvwLRFku+OtXyXf0Ezk2j9Uq+yKvAhtrYHAoOS/joDJMkxPQ5a73R
         vtOXcY4H8WHqU49fh/HzmqAdbjseykM+ALfASCIFMBVshX5OpdoxXwgVcZWx2KIC5/Oa
         w4tnaf+WQ+KhaaBUQfuKrI6MsWRqja8c4OGEA89PIAvh4822Xt8p852siQf6gKmlGYWi
         kgTA==
X-Forwarded-Encrypted: i=1; AJvYcCVh6gvdCkwrkJ7MTVW7gRRAD4LM+bAPqIgcG65TpROfnEKHTvAFl1NB/nKQRcDjcCsBvbomImuUSz96KaDG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz85bQ5J9UaJaTzpekkrTl3f7i+ia2Al0lj9QoWKD8yZaH9UOXG
	nVaoBQeUYpC51QHHfWmZFMDlIAA5BauO16lNY/bRSJ0WLzTf33ME5lnmkWp9vxC0E33X1I+RSTV
	Iz2yj1Ic=
X-Gm-Gg: AZuq6aJt8Mz78Y58bbwXHB4k85B5FPBQmEaqWKNM+TcuKBNTgUfEv7lgApSubRHxBzf
	oW0keOvYgt5rsUnDVv20rtIdPsBcJK8KyEjL+rJbI5gi/C4yfVPNpsR4xJkUhMB0IynNC/8m2Tl
	+qdFklWH4VL4On4mUKJUT316fXqhsBbF+Gd+eMcaXJtNNY2uIdQoyBKtYbs/sso06aWJuOtR1Bm
	eZMmcoj5TICFUjdjOhcQhzMp9j0LkfOsrMWH2+ZorBPddjO0J/Aeo3Wif/RLQFrlNUXPuU6Dg3S
	8yvNehukVXg5+i7OG5u5GwwS5LyNSv/bveX5iEYOFHhp7xra9sPIinkRO+KSxgrMT/9YDCr4MiE
	I9FNoK7ouJTpc5nnZbbxB4hf/rCixty5oMwey3AKqq2W5vPyHCB7zXL+5FIJTKgELGTveVxcYMd
	LFDJ8uAf1iFr4ORxcg
X-Received: by 2002:a05:600c:8b82:b0:480:1b65:b744 with SMTP id 5b1f17b1804b1-4801eb0e10emr271572955e9.28.1769062814484;
        Wed, 21 Jan 2026 22:20:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm40813054f8f.18.2026.01.21.22.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 22:20:14 -0800 (PST)
Date: Thu, 22 Jan 2026 09:20:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kzalloc directly in _rtw_zmalloc
Message-ID: <aXHBm-HRYuV8QH4r@stanley.mountain>
References: <20260120054036.3783680-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120054036.3783680-1-s9430939@naver.com>

On Tue, Jan 20, 2026 at 02:40:36PM +0900, Minu Jin wrote:
> Replace kmalloc + memset with kzalloc for simpler and cleaner code.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index a00f9f0c85c5..be46132a533a 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -24,12 +24,7 @@ void *_rtw_malloc(u32 sz)
>  
>  void *_rtw_zmalloc(u32 sz)
>  {
> -	void *pbuf = _rtw_malloc(sz);
> -
> -	if (pbuf)
> -		memset(pbuf, 0, sz);
> -
> -	return pbuf;
> +	return kzalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);

This in_interrupt() is garbage.  We should use GFP_ATOMIC if we
are in an interrupt handler or if holding a spinlock.  The right
thing to do is review all the callers and figure out whether
GFP_ATOMIC or GFP_KERNEL is appropriate.

regards,
dan carpenter

