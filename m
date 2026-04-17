Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7121933B6C6
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 07:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410022; cv=pass; b=GlNHQOAW1eQLMbhh34ykpTtrMRlVX3qkVwz2XqyJ/Wi61WGETMclhld4A2aFM1SfrKDhDTSJOPKKoYkemfwUlEqTTZP+ULv8cC8YoaJr6DDqfUPLRXLOfa9nXGqTXSQb6zqXA95zNRlXwC3S39bWbwy5AJG00MVRcAgupo+8VOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410022; c=relaxed/simple;
	bh=akd7HIBiOl2zes6WbtFl8EbAfWbnby/iKl1DHS5R4LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJxM1CftJbDwJP9+26c3yjQ1iyw38sFfaAG4AmMbphfZgGqGRRrp7XYXuKkh9wpTcPSKZO7kLtV0FpULkb01ZxvJxJ4L5KgqWEQrdhJqK8LTbiYTAogxWoPdoW/QbbqXQ/pwe+xqomjNTlD2A4LOxWHMD47zVeFI/D/6IQxoXaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/FO40Nq; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/FO40Nq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so4606515e9.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 00:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776410020; cv=none;
        d=google.com; s=arc-20240605;
        b=BDYdIA5EaAbbtnij5zg0tYWqOuov98ZQdqiw0GhjpX93Rm7iQKIqMpaDQYR7xkv5o/
         M0+RFaLow8h6brPQzCM+wBUtaAJu40A+IioW0yP3F1Co0M6ROuXpJkQfCHxLrJ05duwE
         PzQdYNv2vmx4Np+/nU/gJy99yZk/Kcpohf3kb7BeHm5F2W1svBLdqIywJRFySkoJGIuI
         gwg8r0KqEfsc1fIaGVIuinWyZhX+r7qwc4W7CzO/HlUDIslQYuziKTeF/Ghex9oS9fLW
         +liCC1D5TfUavxzWAjo6u2HafwpwJ1EvYyUM1++PAYf7xvP1sVI1NriqcS9yRsLnMmBj
         UwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=onobLBgRd2p4ezygh5Ux0L0xRK0kx6wb+n95CatH13w=;
        fh=oDHzwCddN1eGgmjBv3ddiSGNmME/Rkhup4aNR02X6Dc=;
        b=aPsNsKluiN0DD2/ot9+lI+v5frf0DXFaeVsKrnSbqjkXYhzozdYosC3nIOStfmFFQN
         t5iFNgqfIkaw7K7PGS9FHX4h42sVJCO6+aPPKApPVUNz0vO1xjQo2cfWeaNLY9yKDYws
         ZPNk8Uh2jzed/0vGPOTUP3EXHJJqSJWMFqxbcphNWSo7LWnK8OlxocXzA4n/NDlRjNxR
         pD5Cpu/YYyN8RsILaRRLji9pOP2i8ieMzbI0kCnvnAeLjFU9zs/6khPrlUxwzx2ETTwK
         nAkWfY0V7OxYF5lKk/W00F6xZMMKA7xjIin0FIoFcZqLKfhhoPabMuC2fryUlNnh93Ck
         EV9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776410020; x=1777014820; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=onobLBgRd2p4ezygh5Ux0L0xRK0kx6wb+n95CatH13w=;
        b=n/FO40Nqf1AA00lNTAXcWnBTspIgZBLf2GAiyD3+2xHGxP5jJ8yXxCKdyda4cFAIRl
         5mtxhjud2/z5kLEc2RrwM+5E+ZDL6XgKa3pG3oFB+kOcxCk8aoCYley0pBfo9gNBH9Cd
         Xy4fV5ybeWPd5ZZZ83lqjWNkmhF7SWgwfYTQijz7QKgf8RcH0tojK9u2NHjM66/K3x83
         KmAkUFzeDvBcE7LZ9OwAm4Q1qwWjO2ZppNd1HRYz9gGTjtnKEgwvqb7rFxh8U0LVpyM+
         HsEcPTi0YIhBH8XMCCdsElPAwa1xSDggSyau+Z+avdtw0p7g39vaXErSg3smTWs691eb
         WGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410020; x=1777014820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onobLBgRd2p4ezygh5Ux0L0xRK0kx6wb+n95CatH13w=;
        b=iQMM8yC6NlFMO1j09ZyRLX6C5mq21omfPMhVZW3wwO8rEAXDrcMgpZ+8rX4vk7LRTf
         T0gXrVBwF5j/sXwxBpM+xK/JvkDmOcrdoooYK+Zp8v/OeO2BvlFYyOMo3L+HgP6mi0eh
         OfE9Ko1kU/SUFH8HTGlChXxnaTKCEK786Bxfe11ndGQSkZkIB/T0RDBEsmeIY776tDPb
         W4bwkH/+ubde21XfcaUCEjPF58q+2cNztAbph9rR0Rqssy5ixOAtkIWUOV3Nvertj+mz
         iEYMyoSG5xhXOUa9yORnpOO4X3m/F8m3rRHsrgoDQvcrpN6orqBLHb3WtIozJ46fC5pJ
         AtLw==
X-Forwarded-Encrypted: i=1; AFNElJ/mBfpaHpAvECLzfMVnWPJNBsGcup/IXN7EKndsgmg7NTqhWRemRTiShdsjHqAYYS3n+ELzziTxPiDTUYlr@lists.linux.dev
X-Gm-Message-State: AOJu0YwixUSDuG+vXDUiOoJ/EnvgRRv9HtEr8moLVk1WsR1uY78O0D7I
	t/p/6qomFaAM72b+XP0PL+g/fGd66fwzl442QzSpJHqPjtuFYOwfNjwyTkdIiidoSQchExoPBle
	og+swoYVvYaWz5LTl+FGDciiRJNscS2g=
X-Gm-Gg: AeBDietpCvvYwhDQakeBatzXvqCj1WOnt3G6tcYoqspNkliOvT/z+Wl+v8dttwfFo0r
	v+q6c4G/941xl8yf7CsimlW/VtRS+Q/lDtLSUFW2Z9nCXryfU3ZOHdcnHHOaCJdyyiKfF4e5CBy
	5nsULC+lmnB1yRZBi13lz/f/QyHkTPDrgZX9mNCaoKGT5dGu7Ef3wTGaXtiz23KoEU7Uv1dJPLR
	gnOD+rb0BLkyIq4Ubla4/2GiWmJVgIw99+kUf0vq99SUg9SsH3FW+GunUNNPF8rNEqakHCRrNH0
	kr4XK6Qn8ZdRLRiq7nKIN4EhKT+j5JXO2WvxBLJ24s48YDn6pz5HrctpitdPn0ir9eMzpzBP+to
	hnLKHPeTp62itjwHPLgH35ZQDHwjdO2Fz7hL6KXO1RdsiP/aN+Td2OueZVMuSrpP9SxeCmE/xZz
	aTR/NL3bjCbHpaNQYb
X-Received: by 2002:a5d:64c3:0:b0:43b:5097:6f62 with SMTP id
 ffacd0b85a97d-43fe3e141bcmr2193334f8f.36.1776410019561; Fri, 17 Apr 2026
 00:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416093240.1294-1-joshua.crofts1@gmail.com> <aeHXi8-zYZu-9NPr@ashevche-desk.local>
In-Reply-To: <aeHXi8-zYZu-9NPr@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 17 Apr 2026 09:13:27 +0200
X-Gm-Features: AQROBzCmNJ4DWunQ0iNo95-q4JVl5-6OrYAgT0MMb7tusnqxjMjjr_ZBVM1Ggo4
Message-ID: <CALoEA-yhUTYzHUkOqAQ+nunUrH=DqzCzMS=hW5ZxO5M46ETa8Q@mail.gmail.com>
Subject: Re: [PATCH v3] iio: frequency: ad9834: clean up includes
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 08:47, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> I'm wondering why in previous round the tool haven't noticed what I did...

Yeah, the tool is pretty noisy unfortunately, even with tweaking it's
not exactly 100%.

> > +#include <linux/string.h>
>
> Hmm... What's used for here?

sysfs_streq() is defined in linux/string.h.

-- 
Kind regards

CJD
