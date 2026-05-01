Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515863CBE9E
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777661531; cv=pass; b=RczCJRCCNdOhgHUdqDqU82/TfLudZRU28P4bkrlQp2CzllqCPICZc9WX7KQinu83b7VQES9BULgc0cARWrY5RsiXT8J6HXCQ/yAGpCW7gdNzaGNzCVKeZr4vRJmNqDh83nSA8gbaKHyQsZVM1tDKdNn1fPyDzemeXnpOWrrSh+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777661531; c=relaxed/simple;
	bh=3VIb4Pf0NAkkWRr1YIHvaBV90/pW2+lmTFPT/UOcM+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvXBCmYlDnjDh8Ow9C1q7bmrZGS5G6w7WYQqCZm7s29eIB4MYeE0I8xO42mzxssTHnEISm7orZffiZdJV4QKztMrjm0yb+PcIFpnd0bVa7eQQ5dxbWYRF47I/LlHL+Bd8Ag4N+IBGst7xnhyDUFlwdnSBJi+jvD9BGOLxvGSaaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvkOGYrK; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvkOGYrK"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9d9971d059so289242866b.2
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 11:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777661529; cv=none;
        d=google.com; s=arc-20240605;
        b=a3EETiMi37D9RJp5igLtk8bqbEIRblGJE4hSEbUWKU6APvEDo/TKmwMPn57x8bUuCd
         qPo3nvlX5Zhq2gFbs4ImVBAPvYoqBpIHfKcNSW9nAkMbObBckp0krc/QlrAMNfW0qyVn
         3YNtQwihs5HLGqQr6EPB2c0ChiwGn/QLqylrkPHtUmeiL2vSCY1WauXUKP3k+tMeZ/xB
         oIXEf4mQ9lzanSwJc7XQMRovVwkrRV6X8ycK/pmEWkiC6TQP1CinHqUtLnSjbic76XaD
         fK/EFK3gbVBPe2zSUh4Kp+TKwHOrlrrr89PUGz48P7M747OKeArC55M0u85WpjOimTkw
         pVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUoP+m/IYi7RcPZ6iuZOVHJ/w4zAYIZg82II4m9RBjs=;
        fh=rNQWGHwSIvRdn7vvTTiYI23OvRweDhzcyc0Y6MzkCyY=;
        b=aM4FcaQfMYNoV2EfMgr8T5lPjrqYkeh6tIlI1rmRVF42jxzL/9iFKT5mwtCtS9p3yv
         7pWSe0UouWhO0zN95pB2bcAEOLsrAfsVxnlk9kIAXTLowLyW7O1JKfiuB+LIS+Q3GhPX
         rESMRPHG9b1yfdORJvu9PnrAGXpYlL+B+5ruhFrkW1n5LZQkdw7I/RmN5MbIVAuXX2HE
         QOJpaiobNOTwWaFMwpUn/c9Eh34BjkXujF2bKX3Izcfu1xqQHEkSFVqtNKFbz7vOUIZA
         dhlm3XN0UPlj5ijPG6YYJVCecaY+bSDYS70sUK+JzjODJZJbwM4QSF4+HECpYyqsVOe4
         UpkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777661529; x=1778266329; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUoP+m/IYi7RcPZ6iuZOVHJ/w4zAYIZg82II4m9RBjs=;
        b=RvkOGYrKxfuyvTT82ed3U/qBS/hy563MXAD9Jo+HQ7GtCcaC0YPTfBBdk6rCNx0nBU
         WTDlRxR1vPWc1+RYTtAcKmsEtplMrdq8rwpKlctolXuXw6DJIDdgX2zPdUh1RwOvra3o
         Ri2RgZ2cyA2p89rJHgrcJ8FgqrqqzfGPDCw3nqVefSaCW8i7YoUxr8pR+IgAXmr9TcxE
         v3pOETx60DlvGbyvJ+OMmsk7gfUv2LlwgCcQrE2trVBYlBLwV+Zl1MCmBRhjJHGlrS2p
         PP/gfX+UopCE6JAfNk/YHNhlu+60MfCs3rmah+9JvEGuzIbwzwEazRLkMtpPEkkm7jUx
         W7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777661529; x=1778266329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SUoP+m/IYi7RcPZ6iuZOVHJ/w4zAYIZg82II4m9RBjs=;
        b=hXlA0rtthn9B6J6HzW4JqH5e4S5NaUJY9ci5HHz1ib9yLTYcpxAL8kP80UYIp8lPOI
         4wBqt0StE8LBzMqbZsTSG/n9zA9v+NpyDmjuRx7x4U1DYpRboIXmONI+fmJpP48AvLR/
         UswU2jIA60OugsQKTjWmRi/23N/pYL8z4hFb6ymedtcNLxE7L5KQN2WGOy5WY+Ib/ZQr
         keRSd3Z7IhL85Jv5nkDRvc88P+5k5Vs8F84EyX7ScqeuOfjflz2xjyhuBNcwwaHEznm8
         BLELf0cEF9CTMWiMg4Lp0260zbdRzFL3DRG5RL2bnbP/UDvritdc1iaC0UpS1xoSe02Q
         fcOw==
X-Forwarded-Encrypted: i=1; AFNElJ9ieveOvZpum2Waf3oBQwCxja2Rmy688dg1W/vTzjSpDxfD7NDbVL+UIPM9bR86CBV01io0Tb8h1XP9llGt@lists.linux.dev
X-Gm-Message-State: AOJu0YyyL7POpYrREPTFRonXMZME0aN0unABGZ8dIpLbboZZFx8BTvMW
	yQpMHrsGr0KI/DeQPfcXPYVmWcviolAvsNiufLfX4a28R2CB2iy/q9MjZpZIipgPYgv9PvC8P/k
	qRQQkXrKKGiSAbH/j/8vp+1KGqUGzhp0=
X-Gm-Gg: AeBDietaQbeEt9IIEtWuMfunIhNwau0Vq70seMft1xxi7U4rBkey0amhUE0i9bEcHab
	8/VVXFWZ5rKizSP9Rei3FQiAJPNzemXEg7hAQgSHlFQ/0setW+iseTEoYSzRg6+WoBbNW1coJoz
	hXrmLV1X3LI1rUiyS/lFV9c0QuazVQcOdBOPz8w6J7vAQasxacovf2pJwoq+e7ueoHI3I3aip/P
	g3CEkfjiVQ12lMoz9M412miW60KJ1FP4PBkxQoMaJta2okpAjNP/c0N/gHeH7Hz+5A4+W7D8q3u
	7ylAeNH2pZOFzOuc8eG1eXpIrxL/AzCHbYuu4paxo9CKFC73GhCZz2jGQufs6IH1iPDAASe09zL
	MamMrh4swobf6wjmQDQ==
X-Received: by 2002:a17:907:c0a:b0:bab:f5c7:23ca with SMTP id
 a640c23a62f3a-bbffd9c998amr12816266b.38.1777661528535; Fri, 01 May 2026
 11:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260501170802.554963-1-ansh.bagga.linux@gmail.com>
In-Reply-To: <20260501170802.554963-1-ansh.bagga.linux@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 1 May 2026 21:51:32 +0300
X-Gm-Features: AVHnY4IeP4wRWGdM6MdAS6gK_dVXnOJLSf1QB_ljovXpfgedZLB4-6OLCIE0ihI
Message-ID: <CAHp75VeJHWMMQKPEiBsNt1afYms155mFDuBt_2PjUAEWNvAByw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix block comment formatting
To: Ansh Bagga <ansh.bagga.linux@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 8:08=E2=80=AFPM Ansh Bagga <ansh.bagga.linux@gmail.c=
om> wrote:
>
> Fix checkpatch warnings regarding block comment alignment.
> Block comments should use a trailing '*/' on a separate line to
> adhere to the kernel coding style guidelines.



...

> +       /*
> +        * We must free all buffers because they no longer match
> +        * the grid size.
> +        */

The style of this one is correct, the rest are wrong.
Better if you spend your time on doing real patches.


--=20
With Best Regards,
Andy Shevchenko
