Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9D3C2764
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033192; cv=none; b=kCAqFeJ9bQOWvVUPn5F+skMMOkholbwQGdXpd72MzjzHJqg1Rt5Gh3P0MdZ2xi/lufRBC4V024uu2LqxPd95nSZ2g/wZ/WE0kgLo01FqonVX12waXUi7NomgKEpUh4GaRyj3CAvZykvI0Ng4vgXMGBCZAzEQtpJoNp/vIu7S9eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033192; c=relaxed/simple;
	bh=rYDcPkhisb7MzXonfzW190BR7AizLd4YyMRZyjAFwp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbzQ3dYPnsokF3Qbicd6QkfZ5KgTSvthZNJKotUuvNTy7jXy2I+0C12Xv2Nmo3q+/bd2Oxufx5izar3OO2PBiJktQrYP8ABcsikoe6FuMbrnfeGQXbbFZt866NQSCRWTB5TwjlKU+xYHUfiT7fQMEGbZK00FkTV1xswxYLT32lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmUgY+mJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmUgY+mJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so10559935e9.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775033187; x=1775637987; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aobew71sp3lvdyVghFtKMFu9Vc7NsKn2i+4o799a9aI=;
        b=GmUgY+mJZpe667fxGG9bV+IUCMUb6GlkQuXFElaOZPIvDejX27Tj3ixCIzZqMAsfAX
         l5srsNhuT1yXJV52mNtYJuq51a2WBp+ck3P6wuQw9DrHVNXK0WKihO5DuFi6qTxVQel3
         n3By2HMYez8WqpVjCQzut/l25zUZOTnKWn+0zotDgqlGHHYtt56k1vVsigwCp8YYCyQf
         Dv9v9FH3vdo0McsHk9Z16dRgEt1ossBVl3IU6aQSzYw/NSaQxbDWS4YpTFpx+LegBQqk
         +rPcW/k9RlOgBXk3be6GvN6hLF4ekP+i57ahdX79g3GYuP8BC10BodeNG9ZrmoC1uHrR
         OaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033187; x=1775637987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aobew71sp3lvdyVghFtKMFu9Vc7NsKn2i+4o799a9aI=;
        b=NBPqUITg9IBTKsCnOWvm0I+J2lUjvjq4p39GRWn2YNdJerh7aKq6CTjyBKHnn4Q7bb
         IhkciZkqB9yPurtLHbxMnBNnBA4prT3nKVOtpF2Xcw6/a7cpdzs2QTEQnV/njw82VLqt
         lSnOG0/N+gJd302YWAPfBYjmltFSEX5bNeLPHaoxvANEbem+EbDefv0IlEfBEMAMKj5P
         6pIiJxXTXZsIAbOJZjcuVNCqJKaK1Hx572qB8TEA4ZSl11zfUoGt5GLtW4EiRbe2F2iU
         3OPpBK0sjq3l3s0wJZaam+qFCli/N+0Z3cPHX5IDZVODBuCbPI72BOEyW57zPWCxYKah
         ljlw==
X-Forwarded-Encrypted: i=1; AJvYcCWfAU40zkXe5UeliSXOe/fOSjit/yaEzihYDG0MSeWE3N7EuMQpNHc4q6R3vf0os60DArnLBw9KwpGNnLi1@lists.linux.dev
X-Gm-Message-State: AOJu0YxgjbAarF1SQVMmPnjOFxM4UYg3CpGx1l0SZRDw7phMKBMBKsan
	pIM5Ji/84cf6Zx6BQXDda4qHY4DM5OLVcwWEAGuh+vaNnskeT8nFaaQ9
X-Gm-Gg: ATEYQzxvyVp1tMK6o13/FAT8/FLDccQQJNAGP/YB0s4E8DqvTNRNtwylEs3FbZTgR3M
	ZVXE/PXkX0bV6bpiCUF8gBijA3aD1NL1RSgfFUcMOakuhGpFGoCgzn7MHOA13Y6joRCi1F9JexC
	9DqldTlp0kteZUwfEaaUMFDNb0Ei7hABwe/5gGkCVoe5e8YqmEPT6xr/g4w9T7OExn60SeCfgfG
	NP29qMuDK/Aq61fBxc9dOTNXESUXjT9jDI4uyqCdkLKRivCqaJvOHJLDY9g+i2JPndTO59tcI3z
	jKcmb6ECrerxWrb3sI+WXTnmtmHXJ7gsagmmn8DhFJgeUEPzbRSUZ9OKJjse/1GBL/hebhTcA/M
	vAhp6TQvWbkRh4YFtYf4OKW8bwIADal2Gp8Eczx5kxrVWkiMZy97EAQmCRO8aPQF8AeDzUaZM7T
	gZ3yVedNOwpuk5GB7XvEA=
X-Received: by 2002:a05:600c:828f:b0:485:4388:348b with SMTP id 5b1f17b1804b1-48883310809mr47319085e9.0.1775033187220;
        Wed, 01 Apr 2026 01:46:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48880d864b7sm34882765e9.3.2026.04.01.01.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:46:26 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:46:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8723bs: replace function with error
 handling alternative
Message-ID: <aczbXwM38nUDTUpz@stanley.mountain>
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
 <20260331153255.22764-5-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153255.22764-5-omer.e.idrissi@gmail.com>

On Tue, Mar 31, 2026 at 05:32:53PM +0200, Omer El Idrissi wrote:
> Replace the use of rtw_set_hal_ops with rtw_hal_data_init in
> rtw_sdio_if1_init , which actually returns error or success and not
> void.
> rtw_set_hal_ops literally only calls rtw_hal_data_init and just ignores the
> possibility of errors.
> 

This is a behavior change and it's quite dangerous.  A lot of code only
works because there is no error handling.  We can't merge it without
testing unless it causes a security issue or something.  For example,
not checking the results of allocations could cause a crash so maybe
that's a security bug.

> @@ -250,8 +244,9 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  	/* 3 3. init driver special setting, interface, OS and hardware relative */
>  
>  	/* 4 3.1 set hardware operation functions */
> -	rtw_set_hal_ops(padapter);
> -
> +	/* allocates padapter->HalData */
> +	if (rtw_hal_data_init(padapter))
> +		goto free_adapter;

I don't want to see checks in this style.  I always want them to be
in this format:

	ret = rtw_hal_data_init(padapter);
	if (ret)
		...

But in this case, just leave it because adding a new check would have
to be tested.

regards,
dan carpenter

>  
>  	/* 3 5. initialize Chip version */
>  	padapter->intf_start = &sd_intf_start;
> -- 
> 2.51.0
> 
