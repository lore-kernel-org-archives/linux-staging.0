Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990125;
	b=LNHKNT63HtqgzbxcxPT3//KwbcxQDvfbZAk/jCmuUPAzMU+z89zYNaIg58AeRd9eMoVN
	 qwikug0fHhfus9XPV/0OtdeNQmDXCLgc1cbzQF79XQxtlzrZHczAjaC46gJTcJlIC9IIf
	 +UK078jqzvGfKFQIyCsGm4rhhpO6f3RAT3SCp4N2x7Wonb1VIq7v2pUhIAURgTOoOR/lW
	 41wsiNguWINISgiOvQIqLmE0jtBhAy28x5nzPC0Rsn/S4DBqXTJflNqJsavDhvO9e62R+
	 lPRmEEXCVFYd9O+ZSFwwtSvQJ0lY7GSppWzU3Cwe8TNGqfAs/po2W2vvVG3q1ItyV9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=56Y4H+QOpsErxz20UwuJ3uqXiwvb5kpke2jcTVoosVI=;
	b=QPy3VP2ZdxnTQQE5SQDAZdIid4hOCc9gA+LD/6gYx4MEPutfGVQhHfsA3nQaz9fIVlRW
	 T3vKjEQmRunHrfxM1mnDKqa84NCfpQh+9G/cEiBW3z87hdQ0jCIXrCc0LAnnDa1ZpbTRc
	 LtEI9it+6U72vPmjeZ4VKw6ce27yejBOrTfFRQ+9f2McIs3/Rl9S5Jkp75QT5ioLoAwZh
	 dNJsdySBSnc60kbWjHDh2ztYkNiKMlQdiJGaYBV4dlyrq/5PWu4M9Po6zyY5OqebSzIzg
	 vCJwW6fMxsdjZuioi4raHZc2dsR3QUFoKfhbktGAJFImjbHssFR+FMUMCfJLN+jxNEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTkRcn1k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD3606A31A
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 04:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FD3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTkRcn1k
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70059e4dab6so1842942eaf.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 21:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792990119; cv=none;
        d=google.com; s=arc-20260327;
        b=NqkGbqDLVTinTs7hRJP7GWBle3b5DumKQbTeLzB08SwiqdhYNcc93rnbpVwuRPA1nt
         nUSOPiCO0ROHP+y3oZWVz1hPx/kkKp6l8b7fEERMya0Ydgj90CsjNdV/pdr2ZDvk4lTc
         Cesrp32YrN/SKT4Awe4n14sthcxxgnIoRW6pZLp2MAZ+jVLPDC360oDJ2R/Fb5/6d509
         b1qtTdSz466JgPQAebDijWVX1hvUqxN+uAaDu5wyoCGpGj9uXlHxIXJTd/1ZgzQTnJIA
         dAQTa2q2bw4flrMV0hXslFG/DRPM+pmYZdpb6OiNecvO9sSY6uQuDdNzNtL1AtdD1LUU
         KYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=56Y4H+QOpsErxz20UwuJ3uqXiwvb5kpke2jcTVoosVI=;
        fh=XFCtQG8E8HginEU+X4k3NP81DFY8ckDv2dNFKptU4iM=;
        b=loY8XIun2yTVLQ46S3JQgpPp4BRoGzB1nKq9TJUCJ5Sr1zrx2e9gI8WQST3cTqoGMJ
         YegrBQdxZxc+vpBxSAh6sUnXQQYu9NyE9uVwxowmm7eaYvx0WI/EI/xhClH5RK+PAukJ
         PTS3Mxj+6/UcHNCEJgmFsGHfcAKeUSOM9hOWnw3EUqq+DVl/QpeE5US5cY9wMKuDaBJT
         07WQNzpWGZgsKsGi6I/0aETG/utaIJFAzgHLBjEXmCuXW5m3JpuGls6VsaN/N3OHbmvz
         mg0uZBi+LKsTfrQIwFNwEQgCq1njMFjnUSvA8PIduZaBoebIJEbuspvAJw4znYmrFatN
         pc1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792990119; x=1793594919; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56Y4H+QOpsErxz20UwuJ3uqXiwvb5kpke2jcTVoosVI=;
        b=PTkRcn1kfv3fteSAK8xVqh3RJ+dHGYhgCgTR8Dpl8qEVYmTMQus/isOjoo2iaFMk+E
         SmeZzJVRUeVprV5V9vKbw3kC8gg1K6qlqFwRc+r4NSOLF0Sh+GQcoPzyW5ofBtImn8s3
         2BUKrXHsplanKSEWrlKHjO/h3exzE7Lpdmye7YUkl9k/7eZKCTgcRF9+h5YgESb4CIpV
         jYaZ6FRpaqphcj63Lfdei3i3ZHXjS75r8OfjK4chHgMfhTEWN2Rg59X4LiXPqXNQlJly
         GEQ7MeKPMzB6H0DEuBuBoL5XmGy1C3QCRXs7AELgrLAw3iZR79Fbf9HWqdYLcFF/YwtY
         qSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792990119; x=1793594919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56Y4H+QOpsErxz20UwuJ3uqXiwvb5kpke2jcTVoosVI=;
        b=z8zmA/zVcefJmbdWfsBtDEgkpPhF+zqePAF9vjXbdhDA57d14FjSoSVoXcuCKBnn5K
         m4eTCMeNVvMWNsRe5FfpXFjizasHs3gUZmQJv9mzhR+mxUzYvskijy9ez9SzLTAA1upM
         U5ytal+ug5WNqQxZpQc/ktwHhtlUJ8ZJ4DHFZ7oinZTeEtLd9vCGxNvwfVnXzPqrKbO/
         hyM/IqbsDmARm87U78ub8reEfUQ/P48IFdRVwY/ACI6uLcg5+Pz//v1pmZZ+uhw6ChNA
         0wU5W6Xjn98Xts0p3cQyIHR20D66PbL5MnrE6DZ2m8zSEiiLLKmM0oppw6sPTUmDsrD9
         DQVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwro4r6nfwvE2cYnpD9VQZIXuiOxeu6RmT+w4+MODdTurPLJ8wIEYpcKDPWFO94gDcM7Q+kLtPNY0QJKapg@lists.linux.dev
X-Gm-Message-State: AFq9FYJp2B7IuMzeuYbP57fBXhpaGxEuT9gFw4YI2ISIVxhDD3oVJXje
	g9ccSIXkEp3ptHtKYgz9J28dzADwqUVMaA12L/4beYsNf2YGF3bT5LHjwSSEHLRF2xCLjHakODo
	cvm30NecbX0I6IPDMFdfWBZ0kfRbhX/o=
X-Gm-Gg: AYBFou3yNJQPUeWNmsHsxMHJ+8rjBlArZ+O1uuthIfc4ScYsUdHG/GRUCMXKUAOqVLR
	l/QGWXJ91i2sLiSDaoGTWfSswiI6+xjzZTX7tDPXWX0wHuh89IvWHoDcDkrrNpzkFY5SOcgHTaL
	rI9VaEC5Cdbh2IT5nLPKmu0kQewRQgeFK1XkHfe05v6bS2LgHk05bF2DgoKbwxrgzViHeZCDZzH
	5P+zQBdy3YHNBQuTKMn/Yo4OqKfERpXaEca7TxJW3mkTWGpiMgz3BDedh7+ozwUCmDoL2V9DW/C
	aHmI+40jqelRptHXjsLLxWtKelCJaI8m61YAq/C1H0KzANHeAG7jbxrhvcw8ey3M5kW8zBsHnLt
	qDnb66wlkJ5996OqYiSoPFyhWxpe9hoBDvf+H1LZYedrNcJ1qSE+ogfDKyEdaVuEy0nzjWfg=
X-Received: by 2002:a05:6820:7184:b0:70d:a53e:845 with SMTP id
 006d021491bc7-70da53e26e4mr1017756eaf.17.1792990118754; Sun, 25 Oct 2026
 21:48:38 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024180803.108872-1-himanshu.bakshi478@gmail.com> <at4Zyt9QP3Yo-ZTC@ashevche-desk.local>
In-Reply-To: <at4Zyt9QP3Yo-ZTC@ashevche-desk.local>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 10:18:27 +0530
X-Gm-Features: AclHuK-hrVr9XIOU9ZgMN2G04tr1CEuz2jBrJcJQCkK3Fq75oom0ajhxJqnjf-0
Message-ID: <CAGLmz9+B4bcp4WKfBzpS1nO019J3yZppeGKx-ZgZjncik5e4Hw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Fix line length warning
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

I have sent over the revised patch (v2) over the mail, and will be glad if
you go through it.

I have made sure that the \ (backslash) is properly aligned to the same
column as the rest of the macro. I have also taken into account your
advice and hence added a local variable for platform data.

After some thorough searching through the respective directory, I have
not found any calls for fbtft_init_dbg. This might be because it's a
helper macro that might be useful as the driver progresses.

I have also noticed that some other macros around this one have simple
style issues and if you would like, I can send another different patch
cleaning up those too.

I have also done minimal testing by using the macro once to make sure it
compiles and has no errors, if you would like, I can also run any
standalone tests for this macro.

Thanks and Regards,
        Himanshu Bakshi

On Sun, Oct 25, 2026 at 8:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 11:38:03PM +0530, himanshu bakshi wrote:
> >
> > Split the line in fbtft_init_dbg macro to keep it within the limit of 1=
00
> > columns and address the check-patch warning.
>
> checkpatch
> (in one word)
>
> ...
>
> >  #define fbtft_init_dbg(dev, format, arg...)                  \
> >  do {                                                         \
> >       if (unlikely((dev)->platform_data &&                 \
> > -         (((struct fbtft_platform_data *)(dev)->platform_data)->displa=
y.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
> > +         (((struct fbtft_platform_data *)(dev)->platform_data)-> \
> > +         display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
> >               dev_info(dev, format, ##arg);                \
> >  } while (0)
>
> First of all, make sure that \ (backslashes) occupy the same column on ea=
ch
> line of this macro. Next one, it's better to add a temporary variable to
> hold the platform data pointer. Something like
>
>         struct fbtft_platform_data *__pd =3D dev_get_platdata(dev);      =
     \
>                                                                          =
   \
>         if (unlikely(pd && pd->display.debug & DEBUG_DRIVER_INIT_FUNCTION=
S) \
>                 dev_info(dev, format, ##arg);                            =
   \
>
> And last, but not least, have you checked with `git grep` how it's being =
used?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
