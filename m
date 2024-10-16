Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF68A209F44
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083257; cv=none; b=VEXdObXbIQcU5ncaYSinmlimHa+Ls7zTZNV0smC5GeY9SPeOCdX3cMp9s6YjGzmYSq9/f/iCvFE2HMyB7ribA5siy/oW7Id9QdHJPOOZtc3xDXCCLmGx6a8KYd5T9z9tPUCTregTLX9ypDg6G86pqzsLZsL6Ngg7F+SLRHIez6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083257; c=relaxed/simple;
	bh=fcRTIfNZx/JTFIjknzqhd10DJMrU/ZuxcvSaaXGx9ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0lWAXD6hPhZgGPdTo1G6aqRxMvfmyoYdaOqJ7Iu9GRWTrinBozOnVZwX90ZzxY+sf5K1+UbJnqebB7m9h3uA9x7UGmK4YGKQapwM8ZWZqqzQmfbVNtjVO6id0LLhUHMmHrdxDa5qnjwT9immLr00PkZoe5j/k97uHhotviW0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=vUebx1rE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="vUebx1rE"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso1414201a12.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729083253; x=1729688053; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56Jzig5ogJflOPUw3lWuUlJeigmnzp1xLLN+rEXcG9g=;
        b=vUebx1rE1XocNelf7t2FaQKLxQFvXJSGUUvI3ZzxLP0F1jwBmDhA6XhzX9zO+qH4gO
         Qh4T82q4eVrhPwVZGo0aQMCI3G74mF5U4yK8bSIs3ZxWzXVx8X7O7mPb2XuvTkUz5/QC
         FTRubwwhgdNds34eYoh3ZBNoFOsYr61JK1sLsc5RPWbcSC9OMRose4qpDhx6Idca+kmf
         +z1ugOA9KhXidNnUczlDaPf8uD9zyeAwoEqzJKNTvQs2PY1ww1ngZCSBjsuDEweVv3jT
         O7vJBYALnwYC/vdq5I5NdEjUAj6jvTk3kqLLAAIOFCPNsrlSyXbygKLgxO42rqhHODMG
         7gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083253; x=1729688053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56Jzig5ogJflOPUw3lWuUlJeigmnzp1xLLN+rEXcG9g=;
        b=opvzwXWq4pEUeileSzeioW29BiwtTjntCYrR7nx1vDWwBBQNg0cABiQ9Y0appCMUxl
         T3O+UwmYr0V90u+skvnwko0cSq4DHyePxwXYRYH66/i7nagh4PMyu1ErnsT4GgdR+MIu
         rH2cXGfu8QqWDHFz3WypImpx0UO0XE2sApiaHJqq9PgzD83Kx7XCbumbISjUNNyfA19y
         W3T9QJiCsPLCyN7M7t6nyWmicNoIn/GyvCl+qKg7mRhjzxCIc87Q+jInyztpIZ1EKn/n
         yHfiOrVqqt5mP1cUC3pQo2iUVAE6cVj1VVPpYuwJK6rL+zItAr/QWCfT94UjFWcGmwAk
         IkOw==
X-Forwarded-Encrypted: i=1; AJvYcCVKw1Ituz0VHIMCOOQp+9EdAmaj8vfGo6K2IUrr5dxaHwg+iddrHp04X/amMnevqvML6Dd4TzRAaMHfGifJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4r9Cyec5Fd+r0tMMNV02/Wlq1mSmdXggZAjxz9PyqV/VtlHyF
	qhYX4vpy9vu9IeX6i8HiteBqFaaDDCoUZkT1D9RX66I4l6pAdeypxRk0qhOa6NhwARRSqnIIoc4
	wZ3B7fKbLq84FYgugCTEhm1KkgeomL6zxptEWtwEEDGVmNkh0sQa2qluMNDc=
X-Google-Smtp-Source: AGHT+IFVkh3RJDsr7T3iGN0FxyNqlY+ZdO0pgZdL+clmv27JbwkFocdoahprSMAP9YpeEkHe+AcZIQXG98m5aSCIXJo=
X-Received: by 2002:a05:6402:50c9:b0:5c5:cda5:9328 with SMTP id
 4fb4d7f45d1cf-5c9947e3fc7mr5014646a12.4.1729083252971; Wed, 16 Oct 2024
 05:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016075319.4092-1-everestkc@everestkc.com.np> <2024101654-jasmine-ransack-7190@gregkh>
In-Reply-To: <2024101654-jasmine-ransack-7190@gregkh>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 16 Oct 2024 06:54:00 -0600
Message-ID: <CAEO-vhGuJUdbBhchbga33TNWvZXTXHWbd4=M8xeWkHAi1rnw2g@mail.gmail.com>
Subject: Re: [PATCH V2] staging: gpib: Remove a dead condition in if statement
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, skhan@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 2:04=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Oct 16, 2024 at 01:53:18AM -0600, Everest K.C. wrote:
> > The variable `residue` is an unsigned int, also the function
> > `fluke_get_dma_residue` returns an unsigned int. The value of
> > an unsigned int can only be 0 at minimum.
> > The less-than-zero comparison can never be true.
> > Fix it by removing the dead condition in the if statement.
> >
> > This issue was reported by Coverity Scan.
> > Report:
> > CID 1600782: (#1 of 1): Macro compares unsigned to 0 (NO_EFFECT)
> > unsigned_compare: This less-than-zero comparison of an unsigned value
> > is never true. residue < 0U.
> >
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
> > V1 -> V2: - Fixed typo of comparison in changelog
> >           - Removed Fixes tag
> >
> >  drivers/staging/gpib/eastwood/fluke_gpib.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/stagi=
ng/gpib/eastwood/fluke_gpib.c
> > index f9f149db222d..51b4f9891a34 100644
> > --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> > +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> > @@ -644,7 +644,7 @@ static int fluke_dma_read(gpib_board_t *board, uint=
8_t *buffer,
> >        */
> >       usleep_range(10, 15);
> >       residue =3D fluke_get_dma_residue(e_priv->dma_channel, dma_cookie=
);
> > -     if (WARN_ON_ONCE(residue > length || residue < 0))
> > +     if (WARN_ON_ONCE(residue > length))
>
> No, this is incorrect, now we never notice is the call to
> fluke_get_dma_residue() has failed.  Please fix that bug instead (hint,
> Covertity is giving you a pointer to where something might be wrong, but
> this change is NOT how to fix it.)
I need a little guidance here.
My best guess to fix the bug would be to make fluke_get_dma_residue()
return an int instead of unsigned int or size_t. But theoretically the
maximum value of residue can be UINT_MAX, and casting it to int will
result in a negative number, which in turn will cause  the error check
condition to evaluate to true.
The best solution I see would be to make fluke_get_dma_residue() return
an int (-1 for error and 0 for success). Then pass the address of residue
reference to fluke_get_dma_residue() to be updated.
Am I on the right track ?

Also,I searched for the functions with names that match get_dma_residue
in the kernel source code and found that they return unsigned int. I also
noticed that no error checks have been made to check if get_dma_residue
was successful.
> thanks,
>
> greg k-h
Thanks,
Everest K.C.
