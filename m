Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34278C9C
	for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 04:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745038775; cv=none; b=j59ArW4gzS8Ktg92TYMkjTdasbrtSYHovs/qfAi1j5G9arx1C5LlaJJVMTTjyOMqw4aeiy21bWr9p4AyCbUgsuftrGfebzr8AZAhGrbBS89PBGIyCBKJuUcoU4q5Wnc/YE4JUyrPl3BhQSfZLZ5RqIqZnZGsdn0+VfWox9pPED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745038775; c=relaxed/simple;
	bh=qHZWn1UhqRvPf8+rwyKrJZXAu5Z3WRQeUL+l18ANOG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORW6bInhddDQXXP2bhai34eyMMPsXYwlayyOCqjO63rTynpNIunHdFP/0Gma2+rznU+2nKhjItWgmdX7ldN/vWqXGG+r8i0X0l/y2GXtaa2X10bhb+lOQUP1JhFuLz5hjicnqZ6HSIJLHQgx9xbP7esjHjNjt1+8Rt0JRvo2tko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFRX5kac; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFRX5kac"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2c663a3daso439368366b.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 21:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745038772; x=1745643572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHZWn1UhqRvPf8+rwyKrJZXAu5Z3WRQeUL+l18ANOG8=;
        b=WFRX5kac9xo2W6QAriKxY+SCfbg4u0yR4t4Ae4E/aqdYiyHCvW0W1arvDXQYnT8kOc
         vYuuUgXDUw7AiVxv4nJ76cyZRgBJtw4M8AU/HBPxVcZuMnZowJlcPq3mgc0JTZ2tBCi6
         8hj2Y3nDmFZmeQi9SL9sjgNSHffze96UOEv01VB+OhYWCf/K6aGe8pgxpdPXKMr+hL5q
         KKfyN0f96Mvkgvqo4aMDaDi2MCyXIbGwefNnOvXFyQx0OVWiFGB5jX8rTFc/gD5blGki
         CZ+lauRQ50cZ1mKQbeDT33ykuFz0msM3oV/v4Bw5nebBPcUxnTaZQLwJN1vJJ3gvEZZ8
         2esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745038772; x=1745643572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHZWn1UhqRvPf8+rwyKrJZXAu5Z3WRQeUL+l18ANOG8=;
        b=hIFu81VDPl7kn0Lhr0C5Xtj+YVQV5Oa4Oc1Z5I47kIAO5Ecqyiyu+/qeOtZJ2KN6BP
         BWcvrZ9ZnvBrIh18srlEC2BFRjgGsk5ogOTJm7GLRhe8h3VUJdHbQHFanQu83CyMGTxc
         se/1eRhecOYCPp3Oh2CINLg7uxxRhwZjAzTP/5pKljbVCn3gaQl1zpxANGRa3D2/TCUR
         hWY1ppd33uXVePW1xHJeLMMvvAxlaWeZn5unE41x4+eYaMyydr8L8olbQ/4clI5gzKZs
         U1aNjdRBLgNsRuUuT2vMx4vX6zuUI9c9P5vWXhZdORREdy+dAYIlUPJa/qx6s5lKWTyC
         YUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF3fm7yR1mmGB6iBxLf9heG5kgEAsyDr3SvB5kk6oFnAZYMMxd+e1s8S0kh2ft79pD4R1OGJ+JI8/k5WyN@lists.linux.dev
X-Gm-Message-State: AOJu0YyBrmOg2c1pshGFMS4fcY9WZlvQq+xfVCj4aMgCg7NUFeKyJijg
	bNUq1diMQSjvlo/YoKyce2syaNY8DiknpjGdYv5wiY5M0TEbbuwoHt/NUKFlquxft4CVUX8r3qP
	SngSbiV3ydCwVK6S+APlN44sky+M=
X-Gm-Gg: ASbGncvM1BxficeSChw0zq/4k4omfh0pGJXU/0Oj2y8IhkPsiOXmDrxzPsY9QaNOfkx
	Q9Q8C/+9m3pL1o/tz7CUvtpkO4BNsEsSEbBC8LrPK9zq8scIOB2kNXWaxyILG2UEkkfsydIMnyy
	6GxoLzfEFZ8nsJw67Mb2L1zA==
X-Google-Smtp-Source: AGHT+IGMkcYZ/YdE+K24G/+Kjd4y2a3YOIz8t0Yrf1XtL1usxdov64Xo9A55mQWRRu0uO6CZgIWYLz02cnfYBzj3nHE=
X-Received: by 2002:a17:907:608d:b0:aca:c9b5:31a8 with SMTP id
 a640c23a62f3a-acb74dbf0femr333405266b.45.1745038772145; Fri, 18 Apr 2025
 21:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io> <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 19 Apr 2025 07:58:55 +0300
X-Gm-Features: ATxdqUFN74IX6AOi4xAvzGjvs_88RQj1Pju-KRMnjUvE_gct6csdr-C8Sa_wBzg
Message-ID: <CAHp75VePHnr7fVnO43Vhc59_CQKQ1TfaAxzj3dd_t0nqvzFRdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: atomisp: Remove unused atomisp_compat_ioctl32()
 declaration
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 10:19=E2=80=AFAM Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> Since its definition was deleted in a previous patch[1]

This is odd. Previous patch from you? The Link is to Arnd's one, which
is quite too old to be "previous patch".

> and there are no remaining users of this function in
> the codebase.

> Link[1]:https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd=
@kernel.org/
>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>

Same comment as per previous patch.

> ---

Overall I don't know why it's a separate patch and can't be squashed
with the first one. Whatever, it's staging and it's fine that we get
rid of dead code.

--=20
With Best Regards,
Andy Shevchenko
