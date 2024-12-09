Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6B233139
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733760757; cv=none; b=b/DKOffe7aLITQNw6JUQlXqMFH5G60yyz9sLezA5uq3hKptzjUOe30yQ52+BoRcmkkgn6cCGAvDMGjBNxbyg4N0PhKFJ6CtH1dYxXB9eAt0AWZQaaJc1OEeS+n+hl5GL0JFNs8ybrS7O0tfE24MX9lh1RxuRF407w244R8B+Tss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733760757; c=relaxed/simple;
	bh=ZNw4fp2C4QYbIsK0RQbUfF/stAnQsN8yx5jwM1hdQIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WO1V4r/KxidlbzEuZu1Ias+S75nMDaPF8viQHODHmxeoBDR8f/OnNoTw6jVh3mg5VLGJ+KPIe02qi20UH8a40qcwubjSepIUqFnFKap8uCuKCTkUPYjt9jKevJDO5z/xME1TNRofZz/BREFhaahBxPdtRcfeG9XBCCnY3epg1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exr+r+gk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exr+r+gk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so32545615e9.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 08:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733760754; x=1734365554; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uX2zea6t4YtmQDjreQIsADkaIAGEnjyr87qXnrZSqec=;
        b=exr+r+gk1NYG9SJHV5nzIRRdosFhqVy1118TsKWKdVh8pNEmD3UrJNY9HNbfDymfLM
         8CQwHojKb3DfJiQLzrycntTn4woMhgAcUkYJHMWeElvovBM3mZuLlwhGQiGIGl21LSN7
         d3c8yjP4M4QtkwNthx0YBegtpEbDUd2buRiVHgRzFoW2Oh+dW8iRx8X1DEMBHt3f9bwL
         gzWkM/LOzPGDzlpH+PyhsqU4xU0xv6tx7wNsgfinyjwWOaMw8sUoL4HslpNPToq3Y22i
         Ufd+cX+50mfES27ZH8rf5VWQfcHSW3PIK/Bg56n2qlVzriBaz2fZqjgA635w97JZcZUP
         4XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760754; x=1734365554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX2zea6t4YtmQDjreQIsADkaIAGEnjyr87qXnrZSqec=;
        b=oyakI5osE7/lzAtLAzYngj3w4uwWaURd512NpnSDACgd44G0NLXd4lfywiJHZAy+K+
         Vb5026CoOkTxUQW4wz5+Mimfp7O48pHPvXOcEJqCOd8QmH0bemfVAh6LpTapn30VH1ND
         /T01zZlShTWgz/afSE0uqwhPak9rKVeL3gcEI03e10x+UXzeXUCKicJXI5sriDzYHqoS
         lU4AjgnVWy2Pt38mYHSJLGwLGn3y+c8B969zB24M1Ht6Ff8DmxsvDCS59iQuiEieYgfb
         GFFYNm/JN6o0YvcENNGS4IfZvkP7U4mN5/wiaR1L3XIXSw1mmR7dcPcznwlzjZTf7pqy
         sVqw==
X-Forwarded-Encrypted: i=1; AJvYcCUxW7QVGAVSIkpCELmas1RYGsAto7RGgT2clgp8HGuZ5U0Ho0J2t4/u8mfag4a7hYecA4cd5ZYIDkUcE+gI@lists.linux.dev
X-Gm-Message-State: AOJu0YxUCOSTnskcSGQFizCKXNGntJBD6Wiv0xSaztFIwV4J7ePHtY8d
	aJeTmfnTDmo7y981DyGttDB0yOSBrwNdAYiUcn1tbbJvUSjxtsRO
X-Gm-Gg: ASbGncs1Awp81qi31FuSHtGGklnFs0MVTIfnObeAi/QOMH1lzfzBbd2VqQes9yF1iqA
	VueHHIE1qEChune3U5nI3jNJ7f0vrt2W/aOlDntpQVeX8a+ciN2xA1zP2NuaXGFyqE4Ua8JB1Df
	Kj8adz5FVH8WQI0ViEWfY/Yj9KmqLo/OYDip0z/wDVZY4U3k4hNOureXRlGRRz8Gp8ncu6mWQVL
	B2xJnNrgi3EdW+QObdwiB7vy5QFDl3nQkz2eToHdImWXxzx7xFzYgE5GUtlhNT7CA==
X-Google-Smtp-Source: AGHT+IExkdgpP7kbzKSBzKp6R4wEoIAIMtqGdSNfyUy9NQb7ie77vdhSGKCArjukHLIcvRVhUWOLfw==
X-Received: by 2002:a05:6000:186b:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-3862a771f72mr10599032f8f.2.1733760754251;
        Mon, 09 Dec 2024 08:12:34 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862de365f0sm10363936f8f.3.2024.12.09.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 08:12:33 -0800 (PST)
Date: Mon, 9 Dec 2024 17:12:31 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5] staging: gpib: Fix i386 build issue
Message-ID: <Z1cW78qDiLb6NxjC@egonzo>
References: <20241204162128.25617-1-dpenkler@gmail.com>
 <CAMuHMdVUnr4iAZmuy8Z3S+sCYN4P26RdpPwXevwiJrh+KN025Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUnr4iAZmuy8Z3S+sCYN4P26RdpPwXevwiJrh+KN025Q@mail.gmail.com>

On Mon, Dec 09, 2024 at 05:01:19PM +0100, Geert Uytterhoeven wrote:
Hi Geert,
> Hi Dave,
> 
> On Wed, Dec 4, 2024 at 5:21???PM Dave Penkler <dpenkler@gmail.com> wrote:
> > These drivers cast resource_type_t to void * causing the build to fail.
> >
> > With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned
> > int which cannot be cast to a 32 bit pointer.
> >
> > Disable these drivers if X68_PAE is enabled
> >
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Closes: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
> > Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
> > Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
> > Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> > Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
> > Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/staging/gpib/Kconfig
> > +++ b/drivers/staging/gpib/Kconfig
> > @@ -50,6 +50,7 @@ config GPIB_CEC_PCI
> >         tristate "CEC PCI board"
> >         depends on PCI
> >         depends on HAS_IOPORT
> > +       depends on !X86_PAE
> 
> !CONFIG_PHYS_ADDR_T_64BIT, to match the definition of phys_addr_t?
> 
> Or is this only showing up on x86?
> 

I think so. See this message from Guenter
https://lore.kernel.org/all/7d7e65af-b818-45de-a92c-ee59a864dbdb@roeck-us.net/

cheers,
-Dave

