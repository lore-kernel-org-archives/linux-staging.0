Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CF62DF3F2
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776619205; cv=pass; b=Gx1eLMkXr07vlRsucyecN3JvL3OBp7ImuBynzcEhrigV3Gj/5w+RbYnR5A4RVuWhDCGNdG8XuWPTM7f7Rhbq/unyFG33FbO6XaljT/+h9+82rH5G5iA729TMfC4UTBPFCUbM7+3rmIMMyBHdYpF3RXiGN3L//E0p3wGInaqpAYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776619205; c=relaxed/simple;
	bh=oLK6ChAZ1wI3QuD0mBMnpkIVIGK2pl0MDjhtTIRnhP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOSYgoQK/d2Bu5OHjAj9KkDa6WefD5XKKLulU5g/k+ghzVkv7ZnqY4n1HDLiOVNrZgz5WWrFxBfcKvjohyhvF9Grf0t2DghmXkxKhSQfYDnsT8IGhX8cWln1HqqUyRvlezm54BkEVAQGd3hfpxy51sa+6MBpvOBcXgB8XyzEfQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/4CayeU; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/4CayeU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so15158215e9.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 10:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776619203; cv=none;
        d=google.com; s=arc-20240605;
        b=CznB+8s9fhXejNa9Gs4HbgrDl7YxNou/kDIEMHc56aO7c79RnxNRe6kwCGOKdyLTTx
         bRZap4ZQZyAcOJe4tPQz9uwa/B6ibE9CI4m32iuL2+I1jTdQ57crLnG0n43CbfG1VZXB
         OdfNr6/PGtyNwNhIKTlVZO96H5EKKgRyg6r+lP3fOf5qquTDUy0lVI/QpDV9oJuCTpxK
         YqNoHa59tdWYu8iKtg2UN0CrACM6Kx7EmrXE2WGDDCSjVlrB/UxpaUiwDDwDMzhjai9p
         H0jA0E4wJB9IzYC8Pt4tYWXMl/O5BTVqvB4amd7RztK/ufnO1q3yDyavdSJaQhfnBhVv
         /01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHgQrG1ZSlLeaqJdipykM0N8qMj8Ms1EGiwCLGnePIw=;
        fh=Xw1ZzVMmhN6MOv9JKA8BpFEe0ENxkqEjK7cC5JeeVto=;
        b=XWLYeR0ifDbhy0c//uBWS9Y+jA0Mfbnk3okRhA1LXdwRiHn5E9CJ2aClzRaO8WkgtZ
         q9gG4G4EitVyiliEuGKhFGPgZUIKUa0w4zouKQx2LU2wsy4OArGWIFG9k7+Qv+l2vyzc
         lZp8fJfQFGxRQiCrXyvwVmVVXrLkzoKvwUNEe1urYXmVzP3f91o+SWK01BzW7jwJnQqU
         GzexTSYckmeD3cfTOYKFIu0w3pYH9+ozAYGQmZOsZJzUSRYaWvIhTMtJz7/FTVu5LNel
         jDLiKdr+4yCJ8IgS8AWiEzInjARDEMwN21krgPqBqMhFNH1AgbM+PmNNL/mjrtehRo7T
         lTlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776619203; x=1777224003; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHgQrG1ZSlLeaqJdipykM0N8qMj8Ms1EGiwCLGnePIw=;
        b=P/4CayeUyq8RrOUrediXcGnMQf6xE5wiP4D8onMN/Y2UOtBuir/42aA9Q0WboZdawZ
         erqBxXiUWQGIWgoSFp0z0cnLxKxWjai82piy1eg2vfDirWZO9m7z/B0YZJfbWRj9JKlS
         dLL6THQmbuhUJpGjv2D5nuVom28maDTaaDjSfmfLWGocG6+hTp2EK8eHD8G/XhJE8lb4
         lVpzl1ZvU+DiJWwDqu8nQx3sKnXqQz9xmw6moDAYdY0xs7EUlI+gro0J0vjcd0/D2NI5
         jwz3g80t3bCWsUKLD3x3kUo8KJyrDZSqDEaUytMs0WD6lyUGdNIqwFVJbVdJgyHQAeIq
         ZQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776619203; x=1777224003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHgQrG1ZSlLeaqJdipykM0N8qMj8Ms1EGiwCLGnePIw=;
        b=ZGFhIiwWAa/qoiEWy8o6Rw6WJy27rbX/WHyembVzB1aD9ubvVik8Xr2GTYInK5KSrs
         xfy56DX5wAfEAJtmx2Y4RpEehdKIb2KLVCZFaiVm9EKM9a2b570MWd6tnJ183YLrd9Kf
         FA9CtTS1PAL+rdkaw3HH3VPM051FitZyPuUWuzUtLCzCpEbXSLjA96gH81TQqsXEjOpP
         eV+ef8/x2ToM2z6XGu4EqkkTnSf7OZvptacEsjWCg2AXThSqHeWSvLzdJWiegO4W/FXc
         9RasRAhqP87Nw/CfdXd4Jev/C/4ktj6yuNH9JMp3IZbYco7Xf4Xr4VgOrMM1FsN++5LR
         TgvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+66CtnqMRmNMZXPGFtua8IgzgjraWgTbHzrpBFY7kQVxQqzryxYklwhh88wOwkHlP2jwCDkXIs5pziGJtG@lists.linux.dev
X-Gm-Message-State: AOJu0YwVJcX7kwAeoG8xE11bK9NceQCZNjmSGLgJ4UhG+RwWvGfytP/1
	OUQAjhAUgGyDphnJ81LUjIL5iSaYL88CollPRcEQiPRLNHaWGCWva+6OeUEjk5Eio4yYobwvMT8
	No8nbNU2t3FSuXe+l+hoGHwRsOoFFqG4=
X-Gm-Gg: AeBDietdofb3MVwJaYshtlADbnHhw96xkjU0XW64i2DAaSKRtxiNOwkj7Iu5KyKqye1
	O3+eLyQX9SkpKwLB1VZhTKjPZcBRUsET15/PaB15TWZyY6/XVGTcL5TIX6I99swYh+zNaQ65MU0
	M+ddcaPQdyUVuucJHIPIKqYuT20uaZ00dETRTCW7Qk0N5YrqRo5pJwY6eO3TBPTP7u7p2ZGoB6T
	Ytgd4811G/jzA6o3pFx0V5F3zf0FNcTti+9zN1Q117QFYmudEgZz2GJNx7m5PJjb2G95RqAj2uJ
	iG75SH/ayhNm61NAQjyQJ143uSfKYppMBYP3c7mdkfJjjqcSxGk1nEtvsxKJBPEC6Zd12zVU1Gt
	BGit0W+cbnczK1SylmMERO85o7Ku8azfk0UFyjGBxKWtlXrZPj0uXY/6k4toGqx2HSqkUeM4FEQ
	BGaOEBMe/VTEBN8bn1t8X7b0B/iTWFa6jDJZY857oRufPQRd8bIg==
X-Received: by 2002:a05:600c:5297:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-488fb74a431mr174153045e9.8.1776619202672; Sun, 19 Apr 2026
 10:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260417101623.1281-1-joshua.crofts1@gmail.com>
 <20260417101623.1281-3-joshua.crofts1@gmail.com> <20260419175202.7f0cec54@jic23-huawei>
In-Reply-To: <20260419175202.7f0cec54@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 19 Apr 2026 19:19:50 +0200
X-Gm-Features: AQROBzB6fnr7Ss4G7awlJzAyQFITQs63jTfcox3zLeOlVJ8sLIVYelg24pQ775Q
Message-ID: <CALoEA-wu9U62RUrRm4V94eL1KZBzZMcQ5znZVetOxUN6keeOsA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] iio: frequency: ad9832: simplify bitwise math
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Apr 2026 at 18:52, Jonathan Cameron <jic23@kernel.org> wrote:
> > -     unsigned long long freqreg = (u64)fout *
> > -                                  (u64)((u64)1L << AD9832_FREQ_BITS);
> > +     u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS);
> https://sashiko.dev/#/patchset/20260417101623.1281-1-joshua.crofts1%40gmail.com
>
> So does this actually improve readability?  Sashiko had fun with this one and
> I'm somewhat inclined to agree with it.  The suggestion it made was that
> the following was more readable still and avoided oddity of using BIT_ULL as
> a multiplier.
>
>         u64 freqreg = (u64)fout << AD9832_FREQ_BITS;

Fair enough, the suggestion seems valid. IMO my initial patch did improve the
readability as it removed two u64 casts in the expression, but sure, I'll send a
follow up patch.

Thanks for the reviews on the other patches, these are my first ever ones
that I've submitted.

-- 
Kind regards

CJD
