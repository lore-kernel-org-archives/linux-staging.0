Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F60D28C009
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 19:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777751662; cv=none; b=qnizrgOXre5OXjdDNf/Y60qjyAVr20d3SuBG2aEu58H/Vb91kSFetFumaA6cHkloFFUbhiDL74P9o1YPzxew4nne3z34vsqOC3Ab+htdHuBRNMLgSmyd4ytkzBoCkCa19UVbQaQbttvxCLBKlAlmPp641SXecra0n4ErFO7hOqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777751662; c=relaxed/simple;
	bh=wEOU4KBtabc99iFh0K3FMdyCelSMRV402iy0H+qB4w8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=k547c+ieMEiGDUZ2P6lcCzZa4b8eye20U/hriIJC3lwJ40/NePKaITbqZlglgJ9lbwsQodQjnajp+zk+iwEhZXk7Ltq922Bexb1MKX9hHs1ABUVN2JOIC0u2opzC+QHih337383bEgR5rhUOmrHSPUHBKzX0mXdVTyYdkk+wR0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxZ4GYkp; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxZ4GYkp"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40974bf7781so2882455fac.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 12:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777751659; x=1778356459; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKrz1i8Pf4nacd6BnyObAlueq1k8W1nzGMqs6R8yKzk=;
        b=TxZ4GYkp8sr6mSib2prNcHIu7G9KgRrY0gXMQNi1K0FZ/maE4yfdOCQ9KyKtksNkah
         OKyVfp4k1S7cSKpJKnbwPzBK7ckeio4OXq+2+Pelh07Ka9faIw/cJfzufbtOJqyK8T60
         y+sTOZvWyQlbrt4OqZhEkb+69ILT35MKkCPGymps1ZesZrozF13If2VZaZbL+aT0H84P
         FV8d8V3g6y6sgUt6TP1yLqI1AqXjt1vaomhj3ntj/KFyWoGAwONJXyDYeau1cWDbjml3
         hrAx3ApaC/cfuoPEftul6XIOIfyuQH7WVBE9psa2UtL9L3TdEXI6OdYwUwDfKmKkK+u9
         Lg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777751659; x=1778356459;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKrz1i8Pf4nacd6BnyObAlueq1k8W1nzGMqs6R8yKzk=;
        b=AWpVN5Hpcm7FUIA+epRSi7z1lso2OayIRu49ZlAMUzOxECkMRL7L8vivzV/FfF4cKk
         sCWegpWr4BlSO6vatqJD08wbhzSL8iN1L58XE4eg7JgJsYbbsTNDnM/w+Wz+FSFy2t0z
         U+nwlo8p9LtDg9NvEVqeSFjQg6h5MMo/8c0FXk7No0vSP6VLB3YJts0xx2yBnrOkNj5M
         GwLYByDar40VfG1UX0BUKKvcpeKtXub6+1Nyefg8um9bdAL/Kz0rWdNurNOsm1BzWMxA
         lT4ZiRR/eDdQsb9R9X0F/DiV3QfBrGK+KvB9ADGIWcG6h/U3FrCyuATQNYCzeLT8INYK
         OwDA==
X-Gm-Message-State: AOJu0Yye4UOcH1oCIsJIFLvOrm6dfPoOTFDDVU0qirVkPzQtxr2Yf5zX
	N2n3t/HD8U+fT89N9IdRnUNPax7O1qMu5XrSX3MSYuHgADk5nqAkFw+x
X-Gm-Gg: AeBDiestRjwfwE3f/xgjABZayX4CRia+DyUHle2zBz3nmQrCFamb2DE9Rq4C1I/y4vv
	PEQ8XHFDqYEZwl+M8npATg5QnWNccqk5Qrq0oHAJvXJPiWdKlRw5zy14K/uXj6b0EgamL6JvV2V
	85v/HNDH/F2/in+q+GOh1bWLZ1QncKXc/B/bnV61Q3SuUQRl5DyYNet48GGSSWjGCAM2wE8mNx3
	e9+R82DVFuXPgJwXDeCEXSu8Rfutyqh4WnOX4Ko5m9nnBk8EZy/s/bxVzJWBqku8Lv6JlcYS4yO
	cSlaGNJh1VxADRTH5CS2LlexkrFcpdtFETNLynxyqh8ZBp8zf7e3WQc2gtlMz/I9MXNOH3fypDm
	SYpV1Wl6Z5BPIsct63nfwlvimNA2Alj2n/6n3NcpnM5tvXXSahXm6wh8hXtULb/FCIPZg+dna8y
	Fnk8/oObbvVWgo4PVNO8QVL0tqdciV17rwxfMk9zgp1YJWryuIzO7emPNU7YZE
X-Received: by 2002:a05:6871:29a:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-43475c751b5mr1793252fac.0.1777751659323;
        Sat, 02 May 2026 12:54:19 -0700 (PDT)
Received: from localhost (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454dd93fcsm6233970fac.18.2026.05.02.12.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 12:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 May 2026 14:54:17 -0500
Message-Id: <DI8GD8RZU94B.Q3VZJO6EIP3N@gmail.com>
To: "Angus Gardner" <angusg778@gmail.com>, <linux-iio@vger.kernel.org>
Cc: <linux-staging@lists.linux.dev>, <gregkh@linuxfoundation.org>,
 <jic23@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>
Subject: Re: [PATCH] staging: iio: ad9834: fix probe error handling and
 comment typo
From: "Maxwell Doose" <m32285159@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260502021815.3953423-1-angusg778@gmail.com>
In-Reply-To: <20260502021815.3953423-1-angusg778@gmail.com>

Hi Angus,

On Fri May 1, 2026 at 9:18 PM CDT, Angus Gardner <angusg778@gmail.com> wrot=
e:
> Use dev_err_probe() for the master clock error path instead of open-codin=
g
> dev_err() + PTR_ERR(), consistent with the avdd regulator error path abov=
e
> it and with the equivalent driver ad9832.c.
>
> Simplify the -ENOMEM return after devm_iio_device_alloc() to a direct
> return rather than bouncing through a local variable.
>
> Fix a copy-paste typo in two comments that referred to 'AD9843' instead
> of the correct chip name 'AD9834'.
>
> Signed-off-by: Angus Gardner <angusg778@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9834.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>

Patch itself looks good but maybe rephrase subject to say "Use probe
error handling and fix comment typo" instead? "Fix" seems a bit generic
for my tastes, and we're not really fixing anything anyways.

I'm not the final authority on naming so its at the discretion of
either Andy or Jonathan, and maybe Greg. So either way,
Reviewed-by: Maxwell Doose <m32285159@gmail.com>

best regards,
maxwell
