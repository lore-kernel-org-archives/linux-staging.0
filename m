Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E13D81
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 04:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755751192; cv=none; b=O45X2WI+KaAePvhRrojYOsw54uNbQjKujU6NqtV6AxKuLRbjHb8B+Lv7k4oonVftS1LoZ/2o4IPw4OJT6oyNOYP9YSE/yOGU1a01c9H2AXDOkitZuexvITieecGtzASag0IrvTwJiXCIJHuRHmqvIDmNqcinooV6OTYZZbdmzsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755751192; c=relaxed/simple;
	bh=br76vRpQpCWOsXPYJHMnjMrgtEy3lkiWpNPN5qRq9q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIXeJM4RrTUnLsuTSSgStDPOXEzrQCNKgTflMOTSnEfqST2tA9xztq73NNQnAnbpmlW4anKG7L0RmzzCG3AKQAEj9s2K1iKHG+8L1rk2AZxPanTZLTXVwXPzgrmUiqpnTXvVsdqQ6VzOcz3Wc1KrV/mRKOjfamMM173rp1HM2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrFZ0CHe; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrFZ0CHe"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so886404a12.3
        for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 21:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755751189; x=1756355989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMYPSQA46qYB6D9Felq2OfwmV4HFg5GsAl5y4OBzbyQ=;
        b=jrFZ0CHeGZyNGJfBq8GIZtt4XLhEbXCUGgcc4EKiDgJpufa0cTOXc8lidtRA0qUUDA
         gS1bg18MVfMD+ZOGNrRh8RC1M6wjiWDeBPGw332DRMks40+d8UsUszT9zEbWJVilSJ4m
         kzYs0ZLh7TK9hkMH4Q3cnNohCHCw+9W/yO1jg+sHpBd2w1Uye5sso8xFlvYB/eYmeeaK
         5rf3JOpouMs2SAO/GnTeroR1YMB5oOGh5aYdtena/LNoQRvulrw3AxhH+Nfo5xOWuG57
         Ui+P8+ouZGPvFirv+KqEvXSFUzKWlOwj6h2tkhGfEoiHai8aQnngKwQVWrJeIo+AQV5j
         4GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755751189; x=1756355989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMYPSQA46qYB6D9Felq2OfwmV4HFg5GsAl5y4OBzbyQ=;
        b=CBg5mwjEcxWAjThh76ehqGmZ+7odkiiP8pREZZknsJTFF9E0ioX+v4uNX4Wvw8KRPj
         t0SaFjXdkNDIAG4wH0j2G/euLZqo07FAdm9mpLawIb0qwUbvYjnE4hFacpsynU9Stls9
         s2qtaDjnozqpJTjOccX+MwS/NBmATI7VlyXAtM/55VDRplt2Q4I21K4AddHcHhqNe5yy
         9jEOP4WxWcxqPuWU+iKA3Z6r7IdAiesVUXirPaclffiz4KIpWLU7Suc0bLR6+tJFCUDK
         HR/bzgz4QkBe+kVlbSpheesEGyctiC1ITT/rN5kzgrF0I9h7HmL5eCn+1u9h1Hdr0/aN
         9thA==
X-Forwarded-Encrypted: i=1; AJvYcCU6bcX+MuA4KT0q4/LpzX7GVgS+nDjyQtIzWZozVeRdtU1D7+V5tdDq/dmWyePkk3HqdTWZabx4J+6yGITn@lists.linux.dev
X-Gm-Message-State: AOJu0YxTL7CqA0Jz7Dgv4l4JWANT4OTBSZR0QRfEzzDqF4ry5GQTyppW
	cR82M5ck3BPoE0C5pY02NeiwW8p05E3eHoWbW3vmBdMfv8SpeSbFs8Zkb+sQqBKTHTp1j4nXVvK
	7bKZ0XKv5tnmQ4OD1mGfUEkAJrx3sgE8rS0NkhDM=
X-Gm-Gg: ASbGncuPMxMuk0HCZr7QsLmYjxYJ/KxOfjU7V02lmGap5xrmfY43gHjdH2X2tsNGqO1
	Qoa3WFp4kXK2stzL+oLjy6/8gaXAKL2afsSRbW5KmRvDLv5zZ//LmGeIP/F1XTTxnLcv4Kqxo+2
	lIaI2Ou0h7IQj6X9eX3+Aijs9oopisVMDEXuY14ERvIPgKYIEOYCQtWmU+qDHdYtoSBn+VFE97d
	qR1B1I=
X-Google-Smtp-Source: AGHT+IHA58lZ9cyC75iW4GS6OivkNlCtKEtxTP9KpKjJcOTZPF2Vd7ycf/NKxNBOiyKpeHuXz8claRlSnu7eBcmiF6g=
X-Received: by 2002:a17:907:86a7:b0:af9:d7ba:4dd7 with SMTP id
 a640c23a62f3a-afe074c7c05mr89903766b.0.1755751188480; Wed, 20 Aug 2025
 21:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250817092942.95053-1-rongqianfeng@vivo.com> <aKXkQ0WXaG-hMgEW@smile.fi.intel.com>
 <9a289ccf-47b1-4e24-b317-53aaa166bb83@vivo.com>
In-Reply-To: <9a289ccf-47b1-4e24-b317-53aaa166bb83@vivo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 07:39:12 +0300
X-Gm-Features: Ac12FXw4kkB4EeiJi02q8Hy6NLedTDErmM47Tu9Eo04h5y1UTsmjgW4BDivda5w
Message-ID: <CAHp75Vd_fEVssDjQqn6SJWZ-W4=hpvgQ_fyS_KE3jfbaB0ZijQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_array() for array space allocation
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Colin Ian King <colin.i.king@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 6:27=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.co=
m> wrote:
> =E5=9C=A8 2025/8/20 23:05, Andy Shevchenko =E5=86=99=E9=81=93:
> > On Sun, Aug 17, 2025 at 05:29:39PM +0800, Qianfeng Rong wrote:

...

> >> -    descr->in_info =3D kmalloc(descr->num_stage *
> >> -                             sizeof(struct ia_css_frame_info),
> >> -                             GFP_KERNEL);
> >> +    descr->in_info =3D kmalloc_array(descr->num_stage,
> >> +                                   sizeof(struct ia_css_frame_info),
> >> +                                   GFP_KERNEL);
> > At the same time it would be nice to use sizeof(*...) variants instead =
of using
> > type-based.

> I prefer sizeof(type),

Preference for sizeof(*...) is for a reason, and main one is the
robustness against type changes. The shortened line is a bonus.

> but using sizeof(*ptr) here shortens the line and
> is indeed better.


--=20
With Best Regards,
Andy Shevchenko
