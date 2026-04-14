Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B922D3CCA1C
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161528; cv=pass; b=CSqNEVqUQBkWi/4Js6el4Kf8Cw51U8iaScdWwH89TiwKegM9NATvcZ7YslWTLRltVmcmBZAWLM+nIPN2JeovrW7DMimw7T9jAyzjMx7uye7K1cDgzhX6ojySqiwPP8FWvjxShZpWyi6HF4657JIHk2m7XyjuVRLJG+5wy33cboM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161528; c=relaxed/simple;
	bh=gktpKhrLyiZgsXkbC8Mv5N7h3N0Dx5x75ujNhIydRv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWZ526wn3yAerZzJ8BdsCmtnjA9wput7sJsq6HDVxsRK/ft6RWigQIDk0eJcJv6FXLRMZduc+R1nSmIGipwS9Wt+AC9j6vWrwtUc225gZmy6mf61YRozy05O09sUhOfmzgvDgKwnFVX29tp4GOAx81ZFvnvw2bOr3AbWIGenHlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9tQpjSB; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9tQpjSB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso63070125e9.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 03:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776161523; cv=none;
        d=google.com; s=arc-20240605;
        b=DV/GZ1nGj+f9PaU8G17jzNHonoSI3nSna3OCvmCoxSJseDHnHuMsKA/esHVqj+WA48
         5f34iynzs42Q7GQjaEjTOExOMu6Qmw1akj7EoeA7f3Erhb55rXpjvdDaquhOGqTFNOAy
         cY2Y5zKLOh2HxcPNlM5mONvKYUnnp3nb9g+n/ydxhY08RdLH1OEjtMpXREY8pkqetWws
         SzV2HOX7U3CaC/RRuldVSQ403ia37ArIKJuUJwws+5AXR2rw2u7Zp/7+BDxPhnVO05i/
         2g9nb4DnFPaMxjdmH+BvpsppqF3VIFWCPvceBmOowyS65znrUvyYdXBKNJgbZeWYks/y
         xDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=amSnPIDL2qKtCh2y1p48A0D0mHm9vsTeEabdiNpio4A=;
        fh=/fDqRlFoAFUUnq7jEpxwG1Xk3PSyoQiuwI2i2v7geE0=;
        b=dm5T5J3bVuOtMkPBTLbb8wpbrsQckMIX7fXwIy3tmGi4BIO+iOXwD6t6c7vbF4P6Zt
         peceDubnqD4Jrxvntd5HumoiAZGZ37nmWA2K6ArfwJYbBgoE9B9HDS+DbFtbWFyivZp2
         dTxPGJIVA21QxKfIoEiX9oQ2Sc1i8uvctlTfAULoAdwEl5a9cEbG6zEm1ARBWnbCP/Pf
         i+5Pyl5+Ly8mI1pSF6mQ3cdtj9YGvNpAQoarlHwjXQHiCdsOPv8U0cURoW0Msr68vHaV
         XvMHTt/Dsj6tbtLRR2R1KhZtrN5jYr7XEXlCFzJahda0k+FcT/hB3BqC2LhNOrspPhdR
         yY5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776161523; x=1776766323; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amSnPIDL2qKtCh2y1p48A0D0mHm9vsTeEabdiNpio4A=;
        b=k9tQpjSBEvxoaXcQaYHh/5xoekfHJvtRFGW7whtwzzxQz3fylq0SKuNEbvFSwGFplT
         t5Ztb/L9Ow+KAYySAcALCE9pZ6AWbE+i0AZNHijFET5uajZsh93ubqsu+khs+Gid2Bbj
         /9/l+e/9EwPU0mVNXGB2fjeGd1xZdjusXuo12kd3bokL6Fv1z7mw24ES/OBLuzy+TKO4
         3Xyh+N7bWbAz1BdFDJYS3T96WgR7zAEnlMimh/xCSfR9zCXQb5RHp2etRV/wnHrTto/0
         irLMbX45C0BilNkEoIv+R5q8CYGxtMuBwUNVbogAooT7Gko9MQpXZc511mM0z3/u7FfR
         W86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161523; x=1776766323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amSnPIDL2qKtCh2y1p48A0D0mHm9vsTeEabdiNpio4A=;
        b=A1D8CsSQbbRcUMlLk+5cBHaEeIRd5HBHPGDVal4mEdiU8oh+1kvwnzGOFfCsc9azPg
         G4PsQrsfFhgeKxda0HTXkS2swk80T80Lq1auqrUWOjFqGpuMRFzonuCMPuKK88b4e4FI
         oXQqrOTzU6sdee5e054733V0IAk9yzSIZHlGHhOGruH8pf2dbYZIfyTcItzyb0/xTPbZ
         pLqrLFjJNoaAfhSUbL/7v6YC/P42e/5HwW0SQOVGBKl01uZf/TyPSjSPz/EquFKVRAzs
         fvYvRwzs0DS2ZhU344D+R4p9u/5q+YRLzeXvGVTUOuI2BuNaRLXxq7xiSUr08kNqRCJ4
         QHNw==
X-Forwarded-Encrypted: i=1; AFNElJ+eOdiRZdppSV5BTtD4nfRZDFP5CQkhu6AjT/Jww1qGLMyinAlhjZTOAIn4l8EK1XwHFzfmNQlVS/PXgnyg@lists.linux.dev
X-Gm-Message-State: AOJu0YzVH818Y0QT90Q6GIqX/BWtCQquq0OcxnfBhvHdzs7KyeJuLrTn
	cQJPeJIAT0R18D3O1QVC1kTffWM/0s9E18gPpab48sYvCfH44O3d9uEo7BFmQgVZSo2AuQq34Q0
	assfYVVPOO6MUexVrcnxQUaRABxmo9YI=
X-Gm-Gg: AeBDietQqswiEEWYWkseW8ImWPnUmUUU4kEnOZ+T5jb8saPwcTN297sJNicBpFn3XCk
	KGEga1uE2ieLHyijpWz24AjJVRWk3UNo8BIJSvuqganNhKkkc44SIlOEcHAA/NFG0ZB49HOpJqF
	XXk2JvpBZe6+TkDu3XiAybVrjDQWlNna7hb40Ql5kLkddZdejINE/4QfHe5+knO+5ivJBP52PCd
	Ag79gzb2Y0zoQh8fEULOxWy4/51KKxd7nIWQ7c1vwYsqqAzSHYOPwPI3ZmO0CzrJgIAPzX38i+d
	TxWbojmJxkffM5/vyEywWjhE5CEI2j7dWc8t5VelWL9uVHKK6MoWFWbhon79cGteSkYh68r0h3v
	CLFVxcwgqHMXgar+SERGX7dPS68ZJ8Kt/ArZr+KgzWoFVG0Ppzc6fbwwHYzoB3D2GwN/NkIjqUz
	Ef8yI3f4tSWOsucZkP
X-Received: by 2002:a05:6000:238a:b0:43d:7883:87c2 with SMTP id
 ffacd0b85a97d-43d788389b2mr10338819f8f.39.1776161523503; Tue, 14 Apr 2026
 03:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411123512.84739-1-joshua.crofts1@gmail.com>
 <20260411123512.84739-2-joshua.crofts1@gmail.com> <ad4K-K3MpwD3U4F-@ashevche-desk.local>
In-Reply-To: <ad4K-K3MpwD3U4F-@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 14 Apr 2026 12:12:02 +0200
X-Gm-Features: AQROBzAAlcUriNQtY5Q61vVA1lrvNQ_aeSTgeXl_TJZkOdu94zvGGZu5fUYB2i0
Message-ID: <CALoEA-wikg1aDAfhgHYR10ep8a0Ab+hJ4mAUyAR4nuV4Uysj+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 11:38, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> >  #include <asm/div64.h>
>
> While at it, you can move asm/* to go after generic linux/* ones as asm is more
> custom than linux.

Sure.

> >  #include <linux/device.h>
>
> What about this one? Is it used?
>
> Many drivers just need dev_printk.h + device/devres.h. Some indeed require
> device.h. Please, double check.

I compiled it with the include combination above and it passed, but looking into
the generated .i file I can see a full struct device definition, so I
assume there's
some sort of transitive include behavior (spi.h or something)

-- 
Kind regards

CJD
