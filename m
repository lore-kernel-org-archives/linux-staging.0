Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF493115BC
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244068; cv=pass; b=qiWWy/n4O7W2ZxYOHLduZQwmOB9lfAVns1Np4sBVBTmxDDvl+AJYiKMnl2nByT1PG+z9dh5ghkUtpvhN+PruG0by4YUrAhJse17/M3Z2HtsV+OK31gKSgkS5L08Vav8s0ZF8zlUSL5xVTkbe7dV4faU4fXSfUwW7OvUrYOO04P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244068; c=relaxed/simple;
	bh=151BP8vcsa0+zX8pYKwIkR/HCezO88QMGHgZ7tI6xqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tL7gcpsA88IIx+B/cSckbO96HdRQSDQV6mNjIZlefLGcwgbJpkTAQ1QZ04rgc3eu2eoDUTHT8UgoLF2PbP55Joy+7dLJ22ye5nuFyWxh2skdC58rqLRnzOhVrgLGVA0vCfvl6imDK9injeArKxKczCXCAX5Bf9fe09YUHAf06io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rk2MvTwV; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rk2MvTwV"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d43e09de5so3900146f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 02:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776244066; cv=none;
        d=google.com; s=arc-20240605;
        b=FsjAwiFiomrxNIVwH050D6wSHIWQ4WRze1XFtQSC7NG25FSUgzhOvZ1p8PU6J3hIEk
         3jlumBnF1VCszWCNW8lHC0AAjUoLqMlYTwNnioPdOI2Ghx0G45aMPu0g+tvlYBVCNZzw
         J98BzQeCCIbgyF8wv+OvDtkOFBkd9Spv56o1iZVoM/W3VjsKD48RxQr+pfnsp8MpNCre
         fliVp0yyS2ILAAzbNwq63k5OUAGFSvPrQ+mmN/pSfTY5ILPz6mpFLkcbri+a7r4Y33NA
         HkIVbY26BoAyks7Kry3hCDDN7GsJLGsjqUdE67E6IZ5EF8NLPtRrUWck6kvW1QvVFZxE
         mptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gj/EOd1gHxCjf+KoyC3qDsih2SCIEDANiIgeEbfv7wM=;
        fh=HGw639pcklb9x4037kBYwSMhSmygf3QKcqjM8ahWAAI=;
        b=F3+oViQev9r07Sds7qllQ93OxDkQ0Nn6P4mjwl/6SIDReRahkG9HqdrCaHbnOI8zmR
         IU8ywS6aYOF+KyeHvEGjplFHG/lItJVXbDATYdYgi2pxzsvcsc2TWnu+PeON6huoeuT9
         OVlT+P+rWzlqn9lPaPkpZ2LFs8u6UN7Jh1XwV0jeHeCbGrf2XxG1GGGuvrux11RJ2CDu
         40cMtgGJQxBYKcsgQ7i2mDIv1vv6rIAMz4B7F+zkNMLTF/lPL2JPpBWHQ1h55IzLfHI0
         qzgFuoye1EBUs8XfDrfoB8s91/mmwBmzUjGk66G0Fz/tRRgNzccdQ+CI8haKIvxucHQv
         FJpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776244066; x=1776848866; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj/EOd1gHxCjf+KoyC3qDsih2SCIEDANiIgeEbfv7wM=;
        b=rk2MvTwVPCF8H34ILF4nG7PBPJ1J9ueIHYAi4PzA3HIXuCUjiOmC3V2uuL3kfOIIvr
         dAaf7e/xNicHPWQ7ap0EKnWRERiwjt6/B38omdn0ARMvJ8ru9Yo1Z4grL3xP6zLwnQqf
         BOp9E3qXhJyMz4e7R+fxCuqjctdowHbck5vhu/gDzZjId9gR+2FyGPPNl3IH2kNmc4kx
         suolURmvdsvTfpnh3pOwfdlAqs7Fthwy2fykSGjBTsToWK56exIvC3dRkLyaTM7rqDX+
         C2PBQ63npjmxRjBKjPR9YhCu9yFw3/Rl9guZGTQijsRsMOeUxirsXrE7CouasTLc0tHQ
         Je9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244066; x=1776848866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj/EOd1gHxCjf+KoyC3qDsih2SCIEDANiIgeEbfv7wM=;
        b=LYyXhjUjlWnO1Wx7LsL049Mwp8IJWRRVxrygjMAcG/TJYXzd8klvSF0ZfqbPBul83/
         DKmGgJjnETPkdo+RkbbhzuZoZCsiEET0J0WQowxbjzAs1+qjrk4eg3u4lrhYVQGM9JdP
         DGQfrQ1m6ykn1Gu6zuAk09uCZDftWuqbZBCFz6BvHFq58+aM/pYUvDvf4j5kG8WGv+1w
         Wo3y9JcnRvdbG+rOEI6lKMgG7Dwmr9GjIzCy3Tm0S8+0KjYmB08Q2ra9dqwPEOkiea1F
         TKi6iGKVWZQV4H8+iDZXeO4d5e1eGEpSt8RJmXm/0A85vxKT5ncHP9ylqklfjkAPJiHO
         sHcA==
X-Forwarded-Encrypted: i=1; AFNElJ/xbyy1tt/H9MvYU09ryizQ/Qnx5B0WraC9EbvO+f4DbxpYCWwUAvP0AIlSPc63rOtiibwHRo2wHZlCg0Cj@lists.linux.dev
X-Gm-Message-State: AOJu0YzQt02ZQLu+qZnRvS10VAEXdjywc65bLsG2Xd71HqdTENSuReZ9
	4FCqQR+vbdZxmoUpgBpFlGc3ksTipVqNUxMVQB2IyycpRSErTGWTCZhdHHgjvAQPyKo52uVYYxd
	ngm2A8RDWHSGVB11WyGcscL690rqF2mc=
X-Gm-Gg: AeBDiesIrHEty9fJBn3+8LqZc+rq/TngqzO1uSRRTCASKPsTlz8jo+zM/bz83fJzUmt
	aIB5BxcZc0IYIpAfLss5Agm9x0Z7aIQCNBqKy6S2uBqoMUacha32yfahlozWTUH+Oj3KG/NLMzi
	13Mpd99OKye1oY81NQ/dWDrHtJ/PfajZe8K+467D8VvKQ6Rn2THwA/yhSIEB9gWEu/hMnc6BREU
	/TCLiNR8h9rlxoVmJRpyiBTuE7YjHRETSiIy3w05V7YxqZ7qix53t7lqiew4adhz8uimxgZ8xj0
	wCKX4k/5B/d1TLTT93L51qbD8m8uEXAGuKtxsDgjGIrSkxuoKUXH2gaj6eKHcy7Up+gZ46IuUd4
	Fz+WBusxwbS7sDvpoPaL4/jlvZxqX/dkqa8X/mKg5tcyOG7HX6BIVX/VIdJ8y+M3E6lwMFHknO1
	inj9gWNcXrDreplP2s
X-Received: by 2002:a05:6000:604:b0:43d:7146:ccca with SMTP id
 ffacd0b85a97d-43d7146cd60mr19898783f8f.45.1776244065455; Wed, 15 Apr 2026
 02:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415080812.1284-1-joshua.crofts1@gmail.com>
 <20260415080812.1284-2-joshua.crofts1@gmail.com> <ad9SzwJDwRNldv_z@ashevche-desk.local>
In-Reply-To: <ad9SzwJDwRNldv_z@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 15 Apr 2026 11:07:44 +0200
X-Gm-Features: AQROBzAtGpOQU3zYl9fz4X__8lkzMR5eIzMfFFvxjajnJbOyIcs_AW6JTDHyi2o
Message-ID: <CALoEA-yceh08wYDpoigc6tXg71j=GqGnpngfkDMUh6_m_5fuJw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 10:56, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> > Remove kernel.h proxy header and add bitops.h for
> > better dependency control and code clarity. Also
> > removed slab.h and moved asm header below generic
> > linux headers.
>
> I wonder if we need to elaborate a bit on 'linux' word as usually we refer to
> the project as Linux. Maybe write it as '<linux/*>' (without quotes)?
>
> > Checked with IWYU.
>
> We have a (recently new) tag: Assisted-by or so. Can we use it here?

Thanks for the reviews and patience with my patches. I seem to have finally
learned the workflow. I'll send a v5 addressing the issues above tomorrow.

-- 
Kind regards

CJD
