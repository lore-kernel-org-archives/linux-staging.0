Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA98278174
	for <linux-staging@lists.linux.dev>; Fri, 11 Apr 2025 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367833; cv=none; b=FQujJdkYVO/44OXIB8qT/5kK1p7PQ524TBT5RmSYen+Ex7WDnFH71XWMJWl5iqSZOu83hmQi1Oisi1WOeBQmlcfdZIZHSKFDdqOHzqYO8NxGoyELXTlvtE9dsa3PsOBjflWK9Eh6HESfT/MJC93xbFNXczI1G9ZgURPS1fYvpxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367833; c=relaxed/simple;
	bh=sLgEhosIiClkmN38ByDrkKMD8MCsL8n4/9O2uH1NbTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDZM6I5vwH094zcgDJjskUS6J9EaoY9O28NMLVNsm9cYljrciRUglhyXqlPPk+DdheSjHesWYSIPEEanZMkw/M9NRQIHRd3UpIygUtU4rlqbpyAR1HAhrdvMx5dYuUTxJ0FQWKJ4W1NYdgLE8eoORnpf5kvJniR+p/N/6a9ncfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cy5xRu54; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cy5xRu54"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso16234595e9.2
        for <linux-staging@lists.linux.dev>; Fri, 11 Apr 2025 03:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744367829; x=1744972629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dQWjyQgcrnSXNH4I07TDBPfUgXp/t8CB8smCTP5VOok=;
        b=Cy5xRu54Gt+sJ1jNeveoHcTkEBkEdlASk1i9mZZ50ei7LTUcEwRmcwCXj/COEYbO7+
         BHfKYM4juYW6qBZnPi4t/vGEO1tH6MQ84qzzyb2RopAlyANa0G2lKLESk3gKKtTxcmuv
         qLI3xruXWGCce51iXDkmFmvrNvvEvhfFYbmZWAoTmaGnf4PCYjDWqKEMlspsaLZGjXyl
         EzKU2zuCIGKYy5xJ6tHEgBxxB9lyWRrkFYI3LxHRZYAuw2mUiL1BQSblb6xsZInMMQWh
         6BNK/5ev4wnc5M4J0Y2UwXCa6VMPcxA/57iOy2iODd7Obp8x1axD5dujOewbd7GwXzzv
         2PcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367829; x=1744972629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQWjyQgcrnSXNH4I07TDBPfUgXp/t8CB8smCTP5VOok=;
        b=DjKTMREqswU7yQwSuUdStIl5tJQc0zplV2N92QBeDlPqsDjBy5o60Q1fkLwAhKOYoK
         ZOQj3UNDvsfRmoVcG19yBfU6KeYs7QH1A5BTPFjFksFzFucbGpl63C/9wc6yBIijpuQg
         +xwDCQp2sLudEsyviVcEDr1j6LMEi0npCDpbdZKXGryJqDfXKpjd5s+ial458gHAS9Vr
         JTzFomEWTC0geGfEMkSAV0lY8Cs3RWdc23lJEg+VObHRCvTgkjB18jIFDQ6AdvM3LU91
         V8iOGdYsGT2gJruUgFaqSaXNBSJsawomngnV3N+yFt95pr6TuxI0o9lFFEtWBAPuwr8t
         1aVw==
X-Forwarded-Encrypted: i=1; AJvYcCUGf65KQENBQNhCYzObiVcmLVq016Dv7PGrc3OEo9Hq0yjwFjPMW7RlYkLkmu/oodWeawrEVjlll2KNyJkj@lists.linux.dev
X-Gm-Message-State: AOJu0YwK9/CJdar4aU753yeGFrC7EXlkDn7QfYh0F5bixypdHYRfG7VZ
	Z12Qp0ReWh1L506U6NW3ZsRhqfazIrJFBSl2hrb2uUcWItJvwFEm3UYf/h6kJjo=
X-Gm-Gg: ASbGncsQNcorGUEU5NlpF+KI0bTCnMiiVMUzQemWMGx30MJArHH3pv9chXoM2pNcKaZ
	USEHmLhwiNMSanXYOAOP2SBx/GbC5nUrV6vmIsGGYPVbUczhicN4S2tX5AoMb6ZqxpuGT0FeMGL
	mOuuWU+xFVh8hCwYIdNGji7aprk5i+jeCC2S6HTJBI5epQ/Ldf7xGDoVK9uYnBNISR/StuBPSnK
	uIP9aZs562ZyrjorsHYopaNJ3fszLFzTQZTV0XT/1GSWeO+M9qeinmb4o+G5xZhlOsSwyh6tgy8
	r5K8foZESpmBXtypDgCw/pZn1ozHGrkXKrkHwhq+06OSWQ==
X-Google-Smtp-Source: AGHT+IFIi/9zGRs3AClAo2EJWnN7AIzxihbTuvReSRFjk5w23zf+QxRBAsm62BO5WW6Htp4AsQx40w==
X-Received: by 2002:a05:6000:186e:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39ea5206fb0mr1660915f8f.15.1744367829113;
        Fri, 11 Apr 2025 03:37:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae979637sm1636544f8f.53.2025.04.11.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:37:08 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:37:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	andy@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
Message-ID: <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain>
References: <Z/bA4tMF5uKLe55p@ubuntu>
 <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>

On Thu, Apr 10, 2025 at 08:43:53PM +0300, Andy Shevchenko wrote:
> 
> > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> 
> cmp is good but not good enough in general. Here it shows the 1:1
> binary, but in some cases code can be the same, while binaries are
> different. To make sure the code is the same use the bloat-o-meter
> tool instead.
> 

I don't understand what you're saying at all.  cmp shows that the compiler
was automaticall tanslating the "& 0xfff" into "% 04096u" so the resulting
object files are exactly the same.

./scripts/bloat-o-meter just looks at the sizes so it's less useful in
this case.

regards,
dan carpenter
