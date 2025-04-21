Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF29101E6
	for <linux-staging@lists.linux.dev>; Mon, 21 Apr 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226203; cv=none; b=ahYtaXGVZGoD7/3+6KHy6Z4ImAIzF2HLYe0aLq3TAXNVTbSBkwmSN1n3uc1+XUb2K1pYrLIHshixrnFmQ1XTY3GcOPYJN73GB/dAV359chAqKUoi/7KPK7v3a3PcxgYCFNjjSGbtJdUY/4AsCeB35FfQ4uwI6rwvbuPfCPgapEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226203; c=relaxed/simple;
	bh=NaNLxjVYAiHVKkQcBc30sZU1PvjgM6D5TdHmW1yTgO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q0kByAjWTciCrSweoktq984qN0pGIv92Wd4Nvq9PNHNhT+uZ1Xwb867f7b8nhRU83wSj33UyOeSXWRkxgoaCioijxYmdHVynjwkAxIZOHEcnbhVi7e+COYnffJuu7702sKZBhABU9ZE+zxL6DHS49fsLAeAnSLq1ZWrBuUX5D10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVAYaja0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVAYaja0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac25d2b2354so553042766b.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Apr 2025 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745226200; x=1745831000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaNLxjVYAiHVKkQcBc30sZU1PvjgM6D5TdHmW1yTgO0=;
        b=GVAYaja0+z4C1XWAixHA5DyNx7zT5jSYlncOdO3DZ85RSx93Gtdvy33hZPx9ZoYQvw
         4XdYvqBSveJ+840DlCNKe9Wi0Km1peHFnPlu8ciWRxycKd3tQ1GO7pV0ELHYpQxdmrgt
         MQ+CHUngWFujtuV2VtAgbQfJcvdNak93vKZxb4my8nMPZKaUJQ5AjjPJ8MWVqFjDKvlN
         K1SrT874W6c+9Pg6xz2DWBTBRimxOdI5IiwHeUk/UwJ8ZhPppDmDqvfRJDlFlcwTOqW0
         4bYrXbiNbGd6W5m9pHQqgx8g96pLH1ZwW9CknFDoEX7v3b77LWrRv74Zti+qZoQnEQsx
         dc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226200; x=1745831000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaNLxjVYAiHVKkQcBc30sZU1PvjgM6D5TdHmW1yTgO0=;
        b=ZIeS6x5d/d/LzbsLSfc5FsluEr2fufEz6DeZjwTeGSIu4G1wU3iFKw/61fl0BO+ZPG
         gFtEXWgMe4VRAvmQtFZrjE1J3juVGq7ioMoOH13R1Z/Qrap727HZrz/5xYrDjQr2RWwz
         Domi83Gq52RwfD+UM+3OQ0u3IG6stYpm9/RIXQPc2lfbDDucTGBjNhGLykhEnjbKVkMK
         ICalvGhNtrY1k+gkc7Zxe7rYLqJmYZ0jPyv4wzUcC2d+CQF+JjbHWmN5zfrnel54M13t
         LzQWER3lFhVt9vYmJps3ChKEslB0mIyucnA8wpiwZ2FHa8hFISReceMdoLEJlC6QCiFp
         NgKw==
X-Forwarded-Encrypted: i=1; AJvYcCXRTo4CCENeLt2uVKw02PhH4bIKlzXfVOLPrQKisPoahJQpGtJrOoKh8jSIRjnr7RgsWEHUzEbLnghcTaUD@lists.linux.dev
X-Gm-Message-State: AOJu0YyXgtb2eRjAikWfHFonM3iVzam9jMl3HlDbljLQ0RtdbkGyTazn
	eHPtXnX2ictfLbFw1pLE3xbCLhi1c1IKlqlTK7YjQMS8maAvMyNcNN7S3JnmyjvIW1h0wf0JKTE
	3dZ0QRjwPkZMMNZybezhnWdnfOaA=
X-Gm-Gg: ASbGnctgPaSUOGlZVMwsKB7D3lB2/JKttB1rNIWzr2+CyTniOkXIMfBr5K2VQk1ZPZe
	PXbvXk7jKBE227pf5X+aFgIW0d22426RSKYIKVkTi5vFbgDbYmNRD/KKOnO6Rc/M26PxILfCiRj
	rkTUM9SdhASDEvp5FYhmTW7Q==
X-Google-Smtp-Source: AGHT+IGrgBeOr4Q/absMM+Za+LCqe/Lll5BRdgNYHJVgjNFROenyLOx65DMpqcEBtUSR/JNtqFQe9uIFaPpojiNX1i4=
X-Received: by 2002:a17:906:dc8b:b0:aca:aeb3:c220 with SMTP id
 a640c23a62f3a-acb74720810mr1148270466b.0.1745226199906; Mon, 21 Apr 2025
 02:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421052804.11721-1-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250421052804.11721-1-hardevsinh.palaniya@siliconsignals.io>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 21 Apr 2025 12:02:43 +0300
X-Gm-Features: ATxdqUEQ8x2EIouk8KiFcVlxbg2SzLuyxAZXaUX5Lyn4hOI7kkBZXG-d9UCmXRI
Message-ID: <CAHp75VeZy3+0bGCNKjzPaK1Y234ZnZtG7v5iygtF1+Uhm9bTEA@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: Remove compat ioctl32 header file
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 8:28=E2=80=AFAM Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> Arnd's patch [1] removed the compat ioctl32 code, so this
> header file is no longer needed.
>
> Additionally, the definition of atomisp_compat_ioctl32()
> was deleted in Arnd's patch [1], making its declaration
> unused as well.
>
> Moreover, there are no references to this header file or
> the function(atomisp_compat_ioctl32) in the atomisp codebase.

> Link URL[1]: https://lore.kernel.org/linux-media/20210614103409.3154127-7=
-arnd@kernel.org/

Not so literally :-)
Should be just

Link: https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@ker=
nel.org/
[1]

> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

P.S. No need to resend, I hope Hans can tweak this whilst applying.

--=20
With Best Regards,
Andy Shevchenko
