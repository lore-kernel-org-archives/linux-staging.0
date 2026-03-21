Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E04241CB7
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079255; cv=none; b=UME7kWiqdO1D+EKc5+8Fn0weuA4niJfo+UL3NMDeHfaUi5G06FvqaZxldRIaZuIZeyY6JqblozqdIpkalyfkurBI8qOxPI4cvS0ZpPtwugtE6l7bGh53Fovdt1uACuTs0FRuyGblDIA2fI/j1Fc7LFWF+KB1BDYmEIGd5acjNpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079255; c=relaxed/simple;
	bh=D1bR+ZMSEYc8TaALw65NJI8y3xbn0+30h6I793bzoKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWLPoz6KOAY1ojAg0O36oLLKlog8s/bUYbQEjx3obCGcIF6PHyMe96PK8no7h9xjGi+qYKqLz235977KVD4nCmBFIVp/OJnY6EbiEAicq5OMmweBa7C9Kifts2Z3Xol/70tGo1dowe4ChpBW6ct3ytM2qQEZLV85yBwho4RrTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxeWwuJR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxeWwuJR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so2404903f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 00:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774079252; x=1774684052; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MiQ792kHHHn00blfaUy7hM76QTaBAWEx5tkF9QD2vE=;
        b=JxeWwuJRNN0jOZOKQuT17S1gOcZzOEbcLBkOLGdqdxhj47sJmOybqd4xye9QR/uwAq
         r15Ft4C1/GXlmROj+ucbJA+wPURQR9OKkmgbnJL1gbIqfTW806b3Y6aheE+coi7U+f/y
         OmelulWhCvqQhjWjGEenPNB+hjcbeY2YZzvRoQs/C2VmX8IWHDkKOlimED2JMYoEY0+r
         6Ctd8opcEnLYKlKz+PtuJKVGE0lJozqWMakUxw3Pm6LDaxCCJsNICQ/h6Z9KMX25CYV/
         InDpVQgbEH+Xx2FQpbD+G6mjiykh3MbmRAdICoTpt2mHypyhnIML82L6KCIPoh4ztkFf
         w4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774079252; x=1774684052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MiQ792kHHHn00blfaUy7hM76QTaBAWEx5tkF9QD2vE=;
        b=XTrJlfY4u586mnch8NTyq1sdi5/74Jq7Ug1UKbA8MdEFhv3abUcD3UNS+eIRBXEazQ
         s4uhAZkSpbrFDJG4E3+tX1LfnDBOhJrHHrTMv+EB2vRe1jbwZpIL7ZpaQA1IIb8/iZ0R
         ZGU3IBx34DYPVNKEjarrvfhUfZuq0u4b7ysaRWb9DdD7zELdLpg9QEdGYApn8ep29D5Z
         h7c+KDAM34ttiCef22dogMpqH2/9UhE1szJtbl1uMd1TClsj31RKfe7kQhi0zRV7FL43
         c/niQXa4YVSogZe22Fomy/tz618YbOcM1eKHBZUNLaWkHQyRaFpqzidTBzelcu1Bo7SW
         ueUA==
X-Forwarded-Encrypted: i=1; AJvYcCV0t0O05jWn2JwcosMM6/tF++v3BvLUn2hL8ZzWR5nQdDPpQ03vzdF0AbJJU+NJbyObVwBjF2tNqK8ysEuU@lists.linux.dev
X-Gm-Message-State: AOJu0YyQOjeBx3Rm03Dj3LnAndZJP42afYRjdt12HS92wDnWqw9oCo2i
	E3XG4jjUZKFtkqcQ1D80moI6ckc7mDi80I495n40aAfWrHF1+GzuBsDrPgHSEUGXmEI=
X-Gm-Gg: ATEYQzzECAsiShJuZpIyEdTMATMGBMNlpiEkU9Gm7tHCWdb6DxZOzH/zW7OVHspyfUl
	kYY+B0Lr5s2zCBCc6DTpFOOouiW6gTrHfBOi1KmtGmXJpb0GlJ+cILxWrcIwjp7c5rowLI8XSth
	hzzM9uOssuHWTvV15FwOefXXTUu2yM+DPR6QRJ96Ym+6rpkuDP1FVc5il96upwz2ukz9n+TLISP
	wzQ+azNKIkHrrPbbH4SU4H1I8AH4/hVnYnVtNRnFEPxtNaaV1AMdUL65v/Vkc2/ckG+LYYlKOkH
	xcV6k1zCfIlJtxX4AqCrsPLjkUBgoY1U+id6XvIShc4U5rv4jMeoxWEeHIQebwN0ZXfPoMCtGj5
	GxXjzBib0lPc6rGNJ3g8MXZbm13nyiip5fHM227q+xykLd37d+etkuQH0rZMNIpfI3hCS6uzYed
	UjeiifSPDgcP9hbgcsP9oSWHTMXHg/
X-Received: by 2002:a05:6000:1861:b0:43b:4703:9dd5 with SMTP id ffacd0b85a97d-43b64272ae1mr9913678f8f.18.1774079252483;
        Sat, 21 Mar 2026 00:47:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm14023715f8f.5.2026.03.21.00.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:47:32 -0700 (PDT)
Date: Sat, 21 Mar 2026 10:47:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lin YuChen <starpt.official@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: initialize le_tmp64 in
 rtw_BIP_verify()
Message-ID: <ab5NEdircVtveJN6@stanley.mountain>
References: <20260320172502.167332-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320172502.167332-1-starpt.official@gmail.com>

On Sat, Mar 21, 2026 at 01:25:02AM +0800, Lin YuChen wrote:
> Initialize le_tmp64 to zero in rtw_BIP_verify() to prevent using
> uninitialized data.
> 
> Smatch warns that only 6 bytes are copied to this 8-byte (u64)
> variable, leaving the last two bytes uninitialized:
> 
> drivers/staging/rtl8723bs/core/rtw_security.c:1308 rtw_BIP_verify()
> warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)
> 
> Initializing the variable at the start of the function fixes this
> warning and ensures predictable behavior.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-staging/abvwIQh0CHTp4wNJ@stanley.mountain/
> Signed-off-by: Lin YuChen <starpt.official@gmail.com>
> ---
> v2: Add Fixes: tag as suggested by Dan Carpenter.

Fantastic.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

