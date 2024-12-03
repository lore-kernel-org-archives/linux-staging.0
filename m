Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908C186284
	for <linux-staging@lists.linux.dev>; Tue,  3 Dec 2024 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215419; cv=none; b=Z/y+N+pfH/pqMwPHLJndhJMICOcpEQGrBoDT6EMzqIIa8HY/OC2LrHDwKRqPzBcaEN4SEKo7hhrjqP2Ux4h2n0PVtp8CkHWDLdB37lW+Ph3clgMn3sNYz4S3XdBHutLnSEai6NXlo4oywiTYIXdRAb7shXMLtj+rke5z9YIZh7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215419; c=relaxed/simple;
	bh=XUFBDuUtFue67ZYw/w8HYhrY9y8TqE5ABGL8g27JrgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPZS65Ch2AEPM50C6C7/p0oLeQ11KXXSypJ8OXygHXMBfzAe8JKCQGz5Pyzny2cyhm9uCFPWX970cQ7un/mq0oOnKrVPPsBc1MCjLLG4FGR75IMtshldwmQ/JlOOuTHtpyR0BEs3lHNXfNZQQd6bRFKsQTonPT8ljCpZTur7HbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGcoBjQF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGcoBjQF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so48227135e9.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Dec 2024 00:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733215416; x=1733820216; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqAESCNdyH0hYpJR1TiLOsIkSE13c2KuYctoyXS+XnI=;
        b=OGcoBjQFIFCtK/90uls9IVamqVZ4i9y6DLIE8FBiMJWvO+H7LtDBWVmw/L+Ok3ioer
         Xp+LBBelGQfsMmGu8YWYIkArLvyAPJLguUVWS1Y4XxWuKk0baG0koHQm0lrc233cMNOV
         6EApCs8cJmSbMdaxFU4dFWVsixWM+/IYNOf6/uE4zSAG8k2jEv82annfn93vpv10kDXn
         XcVF70vdTQsFZm/Pcwm3pDiQmjxx4/l3/myTDixvaWx6dOrdKyIXmAzZiX62oJ8Ray2Z
         iokTEYtOlez0GtV0SS4tpN4XMiprmPPvVjYmr3bh0TYr6fXzdL1PtkABEql+NXBzMGUt
         uR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733215416; x=1733820216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqAESCNdyH0hYpJR1TiLOsIkSE13c2KuYctoyXS+XnI=;
        b=FvI9LGTuxC+k3WyCqwcT4Hky0RKtGLuh2sgcolcOG0fFFQZra4XkBPxQEtOc6lIpkb
         mEtCl+iJSrQtGuPWZcE/Xf8byrlB6Ib5RrQ0ZBhD637nGznmwrs4dVyjBgAFHzxQwwnC
         fVXPyFAWmPxBQL8JMTB/EJhjZC91KewNpmYelcqZXksEdsiBCZrdpPBWuEvdI+5S9zyI
         YQ5Y6A0wDNvayLY7uCdKKIp5SsgpmAnguxkoJ/elSbdDCUF7QiT21oG5TF2k95G45Qde
         v9r0BLM2WJs6esZ49szd9BKFFVOCtFdKGrh4ADjHfxVA3RyhhFP3kFqR2twzIwDZXbDF
         0AWw==
X-Forwarded-Encrypted: i=1; AJvYcCXo8RGS9r8nKOCpF+N4Vxc5XHsrDf1IClIartibwnsghGlIY8KCy4w0pO8Xob8ISei6YnKvaiyk6+WTQX+y@lists.linux.dev
X-Gm-Message-State: AOJu0YzO023r/mWuDMG5GzG5oE54TG0o4fFawdLfa+H4Bkil8biXOKCT
	nPeHx3e1xNxNGh2MEmIzeUE2x4yqlfXiDNpBfV3q4H8NqfH9qq7R
X-Gm-Gg: ASbGncsEIxoj751qP38e+QzRvc6etdFGv8A67l9Lx4B9A9E1mxijGYBUUT9I0kE+mIq
	A0pud8dBoJ0//ImU6Jal3lai2Cs0GqMfJCuM2imb1QqfIhbLgU5IxFe9ajx8zsZv7NEs1j3s9u2
	a2FQpizeyowfKFpLN5gEhvI5Wgvuvgi65SwtUYLWwppwQALKFGhqiTyC2L4bQOsLWN9KhJF0hQ/
	fmIN2FMgrXP2wHCr8rq0LFdigB8k8WUaszp4m+pNOkMTXP6GF3YkxmfV7FkHRtN/g==
X-Google-Smtp-Source: AGHT+IENLOrwB29hz4yyazQXQj58T2rlPdBVtgNJqP7WpG7tt6gWrr2MNVy6B+j8IhXWXwChfidJyg==
X-Received: by 2002:a05:6000:4604:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-385fd3f15camr1504549f8f.35.1733215416260;
        Tue, 03 Dec 2024 00:43:36 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d25c5sm211926285e9.28.2024.12.03.00.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 00:43:35 -0800 (PST)
Date: Tue, 3 Dec 2024 09:43:33 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Fix i386 build issue
Message-ID: <Z07EtdJpe6mnKYOH@egonzo>
References: <20241202173301.6462-1-dpenkler@gmail.com>
 <88c8ede5-47c0-49ec-805d-161293eec679@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c8ede5-47c0-49ec-805d-161293eec679@roeck-us.net>

On Mon, Dec 02, 2024 at 09:48:49AM -0800, Guenter Roeck wrote:
> On 12/2/24 09:33, Dave Penkler wrote:
> > Both drivers cast resource_type_t to void * causing the build to fail.
> > 
> > With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned int
> > which cannot be cast to a 32 bit pointer.
> > 
> > Use ioremap() instead of pci_resource_start()
> > 
> > Reported_by: Guenter Roeck <linux@roeck-us.net>
> > Link: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
> > Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> > Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
> > 
> > Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> > ---
> > v1 -> v2 changed pci_resource_start to pci_resource_len for second parameter of ioremap
> > 
> Sorry, there are some more.
> 
> drivers/staging/gpib/tnt4882/tnt4882_gpib.c: In function ???ni_isa_attach_common???:
> drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1430:26: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> 
> drivers/staging/gpib/cb7210/cb7210.c: In function 'cb_pci_attach':
> drivers/staging/gpib/cb7210/cb7210.c:974:36: error: cast to pointer from integer of different size
> 
> Not sure if that really fixes the problem though, since there is other code
> which maps the void * back to phys_addr_t (or, rather, to unsigned long).
> It might be better to work around the problem for now by disabling support
> for platforms where sizeof(phys_addr_t) > sizeof(void *).

I think it is dealt with in v3.
- Dave
