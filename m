Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E03BED42
	for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768059; cv=pass; b=d4a0zIosApqzs615Cwwe/l6vzJsCFUoA6XQFA5jIsZ+NIIWCY53WBZO8xlAfSvycP5bZWPbqzg2hoxtvKk5WXHsyZ2JjkxLPbKbkjYd/dLRllyjFZTQIAcMSeI5SXIR8Stoyk0EgxHA6IsPW3V2byrUZxO8fZGn2pilLLDqt+ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768059; c=relaxed/simple;
	bh=aYrSFshnjc1dLaRx+4fcphgUxBfodGw4jGAuwnmXMOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+yRvU1fOytEIlsO/JAMeMM1oGUdvexA3RZTNr/KGK5LLCjmr71HcMAGnv9vdx6XNXXdHRMGS2IQYWi7ZZ2/KZRblb+vGt21hn9aEwiJuebHAzaKkr5vcLE2ZrXxVNrvgp8V17AKF/2ZmueBLjs/AFMa2hGLJxBl0mzhBMoaOu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5LFezG/; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5LFezG/"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c72bd8a02fso2851382eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 04:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768057; cv=none;
        d=google.com; s=arc-20260327;
        b=IjtiEkJ2m5bZWcYWO/8kHoRetDhY0S96TnSkCMgWfw/iB+M5BmjUv/pVWoCno2S7w2
         1SU4RdWIQOyxxKhAMUDZa5LG93XAKAqS0ulUwPYbnUN1zTqNLctN4jLs905XMQGGyZtH
         EQ3lRn9gzb6Qt3CWKPkIRt60+Ka6MXiHcW6BSOSpro55HwBLSwOfF7Sb3V5aWFrd6X8y
         /b9dH1EyiOHGsTScDHbt8LVWaqNnt8pxVlL87R+NlRnKlntalpgiAY164zf06Eu67Cwa
         vxFx4XPUWyTkShOy1HTYOrFh8kp3ybod3/ykmQRk6KKNdWzXqzPM5RUD9Rf0IKIhwAiQ
         QiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=srVWHQ34fmEZwN42zGAC9YE78eGz/CHZFtfzts5HK8c=;
        fh=i5iw7t8Kimn9/9lAniNWDxwOq2n2ljsnipS99ZJZjCQ=;
        b=kVVUfRFbKOvOvR4yfkN/0xoFiPd5KdYlLiLYw+WGFQp88POTxgRlkFwx46xTk9pNG+
         BNYWLtY019H0ntMBTWCSRXaBgOvev4h9rmUckAabjc0DcY5rdxj8fNFosZLO+hwxkJDQ
         yQTJfcXhZawgezfq7fDms05v9/U37o79o5I42TlmRGhoe+0eXpq+6Po3q1ze5xqLQ8TY
         pU5Mm+gYc41VLOa5xY08rZ+TT2zOcMUjlfbOaSC0LJQqIvdbh78BPtnbMm7ZrSJYWWSp
         1hiCzhnzrKko+Sh5OBmtCQtEx1YmtMwy8bXAMc4d/4N/TF3y4+uFNCz2mKTTr+Lik5sL
         rMbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768057; x=1791372857; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srVWHQ34fmEZwN42zGAC9YE78eGz/CHZFtfzts5HK8c=;
        b=C5LFezG/TfVKdUPoQrMDf0UbLIu9y9+d8dHB6zkNK/cZIneZ8EfoLH2AKqka5E+REo
         B3Ajn+4ZiC14cAkquEXnoMuhysd/iEAlP4kaQAlZPslu1uSdw+/vBCY79LR74jRukY9l
         ahOiiZLEE1kQs19rv/1C5w6+IkR4dx4Pe37AKRaXqla2zr/yR0xrxiWyWXjrIWxP508C
         1QzDqltzWJ9aYGUZGQszal/HX416zevfeJ4/SNcVrqwKghjXwk2w4qF8PKA+XaPJiyU1
         H5x/fZaKx8Urry2RGr3BSMZhxrUoK6QlRjdXY6R1PsnMfr590bBhsGZL4Iuv+FZYoZaV
         Usrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768057; x=1791372857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=srVWHQ34fmEZwN42zGAC9YE78eGz/CHZFtfzts5HK8c=;
        b=r5AH7kZO+gmb0o6DIGWVfnuNJEUNqJESsCLlvOzgIDhnJLeI2JWSH5R3jJkhG2AYb0
         7dXaoI1gZiIq0X2yFfSr8N3/jLGMwnrn1d+E53XwTXMofFlhYXROhdLn+v/EaeNl7PL9
         3meBd4A4nqDcBvuM8TbnC3+E/ARPgQEcja1OY/No1FrOWzv1IPxmqksvPfhxRx1K7nAm
         tkORUwXc1wXZE9aMNPvh1C1QRBL/lhaMsg2Nw2SulZb1KrqgimIb2UQGAj/966cei0tC
         X6wegItkaPbtBDzQ0UL1TNH3D+FX3sII969CX0eA+0JAq3z+HHMqhyM2CVr7KLoVPCZE
         H3xA==
X-Forwarded-Encrypted: i=1; AKwUvBzwp3ifK7IjB0xMDVeQ08zc/iOs35MjBKVhMKPjKXFJIXgGUAZ+0YCOKtV5kccMRQoARBjQUKT6NYfRlEMA@lists.linux.dev
X-Gm-Message-State: AFuF++lA4NYDFNDonnu7Xpjhymd1S1LnL+PcheLezf0o17u80P+l9GxR
	doyf91I7Ofk9eupsqdWyl7cnrsZ2eiaZTlwMk1UG3Wx7QHEYGqgBWuPZxh3uk9Lz4OkoDjVCbwG
	J4AunGXkqoWvUHKkd/uH6aUP5+CO51Qg=
X-Gm-Gg: AYBFou2rx8dIc8xT+sNNEHQ2JJj+GrnMgdgZxxZnefBpd/4o5kI6YkZ5zZ0BtZMCCX7
	p7GI4DqTtGmZmfbq+0eHuUo1Wc1d/GQseHb4NjMYUoEBhwcZXJ4lsKB7ITWa4rxm7pDVM4Ezmkh
	6rLxMBCg/arKxtFImH72yzrbTvsavV9/I0nJVnMm81TQ8do5ZSOqyE2F9QPgCE1ki4BAzjWe0yo
	Ji6MUyf86tTvQNn8pXnBrCqmZ7g+p4NCv1Ccl4g42tX36jNnOyVaE3cyUx/Cr51QXZ8rY1wQUQx
	OlqEtxbukV44dXE6BtZj7XePz0zAV+TUTijaEARbI/y+LvKthOGPU2/Onu/ShEdt2cQy
X-Received: by 2002:a05:6820:4ccb:b0:6c9:80d8:a205 with SMTP id
 006d021491bc7-6dcf6b1c1efmr862593eaf.66.1790768057073; Wed, 30 Sep 2026
 04:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20260929184900.39515-2-abdelnasserhussein11@gmail.com> <arzUmYfK6mbznNre@ashevche-desk.local>
In-Reply-To: <arzUmYfK6mbznNre@ashevche-desk.local>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Wed, 30 Sep 2026 14:34:06 +0300
X-Gm-Features: AclHuK88JiQnM2CrEgftb3pl5BF2N7zfRmcPmhGHddpC3jq8LxEOXsr2V5NPP8U
Message-ID: <CANpqX3bTpB-y2hr2UZZkZWC1+wPNz1M0HQg_h+c5SU+XdR8n_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: iio: accel: adis16203: fix inclination
 naming and remove unsupported Y-axis
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com, error27@gmail.com, 
	narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Andy

Thank you for the review.

> Read Submitting Patches about imperative mode (search for "This patch").

I will reword the commit message to  use the imperative mood in v2.

> This is a staging driver, why do we care about ABI preservations?
> Yes, ideally it would be good to have existing user space software
> continue working as before, but if this adds a confusion, better to
> rework an ABI as well.

 I will completely drop the 'X' modifier from the channel definition in v2.

Best regards,
Abdelnasser
