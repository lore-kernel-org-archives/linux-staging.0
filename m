Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E330568F
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869159; cv=pass; b=aWSfsTdpTe518vkY3LWlHJy4/dxTPWKrEO1EBut996u5VQTb3QbwP8oKXmSiyDBCM0u+4HgzOuCiSNcoTNKONzF03Oev1YL63lBLcXuG6QLTE2Rz2262ftZPC9p7rU1Gb9IPgSRF+yMpo8lMNv8JYc+EYRkROW6q49rweB81USA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869159; c=relaxed/simple;
	bh=3dgk+B0nXM6LhiLoCbn9rBDzg0eyUBTqpwuB4ry8O5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5y4GZepdb6vX3WZ1jkxJqvvdqBunA759YUh0bjICO9TY/h4JA4lwHBRinwgvpeRh0dONY5XPLHCxSXyKsq5fd4EDAW80gMiGhQwkl+wFdPK++FO+9K8Mh8wtDvyykLUEk9RfT9kvxpoRLsgwUxp4gN36o9UVkuqz4SlpDzCXs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmeHah4Z; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmeHah4Z"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso2024516866b.1
        for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 01:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779869155; cv=none;
        d=google.com; s=arc-20240605;
        b=f/DJ9aVRwe7vhxBr3YoOCWpRFRZwEHkhQNoSXpRW7EHNR+qvc0WpyQvynOa7dWFB88
         hYVk1BTSlRyV+cLfmfq6zrakkWu6JoG+tDuq3qJiY/UGpNr+GEm69D4EydsFRMNM0J6w
         f7BL/4rXIc1Rfo7vua6Z9vCQX3EnTpQwzbgndA7ERXLhlLN2xeJ3dH/zgd9YJEFqq6E0
         rACkTlI6MKHCxokPG6kU0V1hvjvGyYKYtTaPEHw0OBbWPQAQCs36nnHb42AixH5YXYuk
         XTtsSqq1t08dthy9Naxar7UcRfORHV/sWkuzI3DNWeQQVV2irx3Xc4x2ufvjJjGGRF8U
         q3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3dgk+B0nXM6LhiLoCbn9rBDzg0eyUBTqpwuB4ry8O5g=;
        fh=lQnv7BJtenCXM8NzRsjOEA1lSEGnPMddrIsfjkGr/ws=;
        b=ESrFZndDpDkuZiPE59UtEk93NEi8kffgS9THncJwua0QP9Adc5SNFdbMHpgyy92gk4
         5P8GB8/Lnb2abCkyLTLi8GauannA4yryrBHZSmBbXUfhQ8ErSx8QHPS5xBT6YmB4k6OE
         6ytBd+OgLPA591xSTZ23wNo8fjfUCz2i/9jgtD8SpaoHrkVrCi2i8QpEw0a2lfVER0ji
         tZi0SnqOFdRAD8LzS0xt3k7B06jR8/CZZbELyF1QIWS4w0xhstxoLb08x6c+dI436aFZ
         Ho89NTIy2E+kK9Gx2YmpjrfILDVIoP8K2XfNqhtXHP7IFE+23ReCaRPRTe1nW6WWBG0B
         Oxvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779869155; x=1780473955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dgk+B0nXM6LhiLoCbn9rBDzg0eyUBTqpwuB4ry8O5g=;
        b=JmeHah4ZxU6tTQST92gOZPT5Fny9iZQIgavHOLcSIeZlEd769K6y9M4B8ehqDM43DX
         CjXdqWzk/JstWgGLULjluOJB2WgRMMMj6O7Ha6aIvH+9zwcX0zJeiFdcA4YGlct+HZda
         zQjTkFUBrnck4zkxZ+XWYTNSvUsy6JLDeqdjdMbD+lQtjyqEsku3SjvIgO9bZkObjRv+
         MBFL9aftJFi5n3lEiwWKuILpAcTiaSgqGOeVy6NBLFQkwSIMtKwQC9+H8lSRO5WPIq+M
         HsYr8eGnNKLVFxMWj+xd/7UdWmvUCOTvDZvC2j+QJl6IRk1YbpJXEgmdRoo15//j3PNg
         dmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869155; x=1780473955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dgk+B0nXM6LhiLoCbn9rBDzg0eyUBTqpwuB4ry8O5g=;
        b=RxSb4mqlKC5t64XQwqP7d48fPYhZzzJ8hV3sdn9arqNx50EtKmfWOjNi0rGj0mTOoG
         SvlTEOWoPSzleSOfmuCpe5rCMU0WYwCTDp0loNey4V6homPPvpgtWttgFW4ipFLHz0P/
         SpWidvjYgOxjxGIsZ+7EfTgftcGmPS8LmR7YOhhQ+v1+PLbwWuY4bgZveDVoYiMJ+mrP
         YSKCP76/R4+Gyz87ZS0fp255aYX7IIwkz1uxTtIe1yui2an7Ps/ntcIKE+FAOF/KrQsi
         hMovrDtGjkJ4q1t84saIi/E0FIcfrbIiNIIvWC1IP/eS7BQjC0SXCgE8WPMXOA5ikmNB
         VhFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vXXQ/Q5ICIoVngKs1LXzpvj2AzMy9NasSDyWSUVc1QZ+TqBsiC0I5BFi65siXOa/5AYHnyp/3id960+2o@lists.linux.dev
X-Gm-Message-State: AOJu0YyMASKPgBk7esx5TaXH1RI3+awipJ6ydfrpPemkvXv5A/3mYZj3
	J04cx+B0zh3+WHOWSRqkvFcsg2w64x0zW6xK+hJlnvT3Ad9jg8Z6Pp+Hj28j6pcF2zjVhR0JdAj
	QejZiesHZJPcSfOf7pNwcXKfMfh5THf0=
X-Gm-Gg: Acq92OFA/ZObfZfm0yzEpKcjf6bD/JNNvLHhujf2XeLEyEiR6GQ7eUtqQfeCBQnCsoI
	G2SzeGF4HqjAJke0ugTSEAeb/Dl6Hl1RiLe5fJBz2InEvLl5aSliujAiAHuhJtz29MPhkG1kPqW
	BPeKvvvHtsFpjRMCys5TK7bNAKoxfRrJy0bM1EUXLtTTOPR6Xm1mp2etsDiyjpOpr2ai2weQTZ2
	FwOPHBYEAty5NQ3hHw6HrjgaI85ZbeXWcdTp2Q89kNpNvwvH+AEWfk6mybjpmxVGPqGqPqGPyto
	96ma9rEcqf5aUSz2YE82j7uw003fA8EGuh4fG6jpXIJSnHi8UjfICcUWGASHgow5LUf3b76dRbw
	drDs3zMIc5zuLeyHg6Y/w7tB1xpyYh8ESB6v2zJnwmKV+dE0RIv/iGvchQfMpbtHA1TBkdQ==
X-Received: by 2002:a17:906:3087:b0:bde:151:5a23 with SMTP id
 a640c23a62f3a-bde01609ebbmr950760266b.8.1779869154882; Wed, 27 May 2026
 01:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
In-Reply-To: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 May 2026 10:05:16 +0200
X-Gm-Features: AVHnY4KzohR6B6wtPxA5ioGjk6m7QUdg_GGGRRno4HqJkyhlupAYn71h8TE6io4
Message-ID: <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: remove redundant prefix from dev_dbg calls
To: Jeongin Yeo <jeongin.yeo@luaberry.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, matt@mattwardle.net, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 9:37=E2=80=AFAM Jeongin Yeo <jeongin.yeo@luaberry.c=
om> wrote:
>
> Remove the hardcoded function name and line number prefix from
> dev_dbg() output strings within ia_css_binary_find(). dev_dbg()
> can already emit the function name and line number via dynamic_debug's
> 'f' and 'l' flags, so embedding it in the format string is redundant.
>
> This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
> introducing __func__ to format strings.
>
> No functional changes.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
