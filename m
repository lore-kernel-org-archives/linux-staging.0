Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925D158A25
	for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724182195; cv=none; b=Ii7t2UUPiJroLCX3hTYj6UmfEX2/zAq2kdGlp0zq9jxS4T116lVYA7M3zgKVt+07K2cWJN7TzJd9v5Q4fyR38rhkMSEElcuCASo5ymywc8Zw36/Tg/8haqx94IRIc8CwwErvuUrCx+2QqCGzfYwBiAGUTRGIsckO5eroJRaH6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724182195; c=relaxed/simple;
	bh=0DLiLPd13njmu78yKPrzi8MMekeL0FF9I892fb51s+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cgn1+rirANU/OB1rfLtu1FP/gUJsJEop4h/nUomwwGjAUX0Btf82iLd2KYI1ifp9b/u3VYPiUY7UnMImzfG3DFI1sUe5SSC54LBD64+rGxCsA97b7xH7bXIet2fKAuKkII0Rf2aULY32Wm+4fy8G6Hw6f8OCHu4qxnz6w2Dog/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8FnDs8n; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8FnDs8n"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7aada2358fso7178766b.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 12:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724182191; x=1724786991; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TtG5Lka0HNtdGpA1EeQQSE6lBWCGpDbes0Ags1zb6dM=;
        b=B8FnDs8nPK8/5CxR4r3eRqxTtECZnxgy+xkyC5VhHCQAJrinnD7SK/bJYxnQZO3pcC
         3OKFO43UFpqg3Wg+xMFGhRaR4UogxHDenHDexH+x4V4aexeVqpOL/F4vMfvxm2T75GyV
         S2f8jRWvTBJ5uu5tb2cnyiVDl4Q8b2qVfThT5atneVxesS6lliRZkPBwk+4ivG5ujgnE
         vIbDVjjRutBajkDvo5DV+s6tuoVjVwWAt6LwLj0x3ulLEsoVMqoylHmvR0XzprGuu/Zo
         V+Omu3Sd7+n+41VmrKZYECoX+Zr3lfMr+JfapGYitl+w4iY4mDIyy3Op5Wnf9Q2GsCRs
         GutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724182191; x=1724786991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtG5Lka0HNtdGpA1EeQQSE6lBWCGpDbes0Ags1zb6dM=;
        b=jrcJaDVw4JnBEzuuefbp3azYnWdpIvFluc/gZYcRm3XdBW1pykqHCkqdK9g2xW2Q68
         zPp68542+qHV3Ipb7Oa1h+zE1IYVwDVnkE27naHsTrBG9qvckDTKbsaYcA040wx3cAt5
         m32DkUPV+/BKFaUvhn/ePghQNHaldjQ3fukK1kLq/D+G7j50lFANhetdCbg1XYYXy+6V
         84zCWceQiZ7KKPk+HooPt5F26y4qUyY65QYa89/hq+2rxp1LeT/vuR5r1CkLxJLzIgnB
         2KE70gW46cC7zIaNTyjR2PaNV1CXKhwOmh6ERa0sqbCf6timRiQvPXWd4Ukh9lTLXuOw
         PA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ27XPsX5pCsNeeH8pnHJhqyc3aSqohhFElAYIxEj7iSIJD7yqsVefIoVWT9N/wZ+cAsozdIJf9EYtNiJc@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7Ki2i5pUlIfFJOWC+DSJSNUKEiwkokUoJWyL4lw02ZXjqHS4C
	BAbd8FeDxsHK3unxsJgrbFNNhSA5ZC3JyvC6MUTxh3t1PJUrBC+U61ohz6t4qbA=
X-Google-Smtp-Source: AGHT+IETXPjrBHvfjZmAs+zAO1dDalx5QNb/07TUykr+gTYgm5eDKM8K4jqdR+hbv+4h3jvEnLjvGg==
X-Received: by 2002:a17:907:3e8d:b0:a7a:c7f3:580d with SMTP id a640c23a62f3a-a8643fd93a2mr445202966b.25.1724182191308;
        Tue, 20 Aug 2024 12:29:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c67d3sm798852766b.1.2024.08.20.12.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 12:29:50 -0700 (PDT)
Date: Tue, 20 Aug 2024 22:29:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <b2efc687-07bd-462a-b0a5-58e09bde32a7@stanley.mountain>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820184216.45390-1-abhishektamboli9@gmail.com>

On Wed, Aug 21, 2024 at 12:12:16AM +0530, Abhishek Tamboli wrote:
> Replace strcpy() with strscpy() in rtl819x_translate_scan() 
> function to ensure buffer safety.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtllib_wx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index fbd4ec824084..970b7fcb3f7e 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -61,7 +61,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>  	iwe.cmd = SIOCGIWNAME;
>  	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
>  		if (network->mode & BIT(i)) {
> -			strcpy(pname, rtllib_modes[i]);
> +			strscpy(pname, rtllib_modes[i], sizeof(pname));
                                                               ^^^^^
pname is a pointer, not an array, so this doesn't work.

>  			pname += strlen(rtllib_modes[i]);
                        ^^^^^^^^
pname is incremented here.

What this loop is doing is that it's going through all the network modes and
adding to the string.  You should look at the rtllib_modes[] array and ensure
that if we printed every string it would fit into pname.  (Currently that is not
the case.  Probably not all network modes are possible.  But I have looked at
this code and I'm saying that we should just ensure that we could handle it if
they were all possible).

Feel free to re-format the code how ever you want to make that happen.

regards,
dan carpenter

