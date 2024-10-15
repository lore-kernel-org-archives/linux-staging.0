Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5109F1F76B2
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 22:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032515; cv=none; b=p8DB2VaNnYLzFOY5fvfQTLFT40JJ2XjQ7ihZQuzAKxpRIiiEJjTNkTwdm8rSCz46TSX/JODu04PCoIzadAH0LYbpLbDhhXxk9FNRk1UQHs60atiMSlDFEeJ4r/mG6E60EG3FqsY8h6YZUprkc43Y6pEV1CUBVnbXqOyCw4kDY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032515; c=relaxed/simple;
	bh=MilXVF0Pl7zreQTOpN2ffuJKLXQVDsOWlshtxvK8NbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bD7N262SfwHbLydh9mg6N4xMlV1jXxKKLJxo9f1nkHvrfE09C4e/FUGYwvlheDr7DsrNdRqX3K95LrHtmmdAL+nY4jrgL3v1hAsyRvHtehiWiIUZY9yVznc/qVVlRtlHrqoCa+aou2f6lhtXEOgf0wjKrROZiAkqTtMZfpxOdNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=o8AHUqql; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="o8AHUqql"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99ea294480so341575966b.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 15:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729032510; x=1729637310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miq9FmtmjdBD0hWpSYeZA2klh/HZsIKy05pk3Zx+Afg=;
        b=o8AHUqqlQ+EEvFIBevNbTTMbnxhABISlOTNxKsSdqPFBcVX1oOfCItej2DoXupiWNK
         kG4aApHNjMvmKC9sZMn++aS3TgUtYK7B+p4f5J0jBSSErNajLPOW+NPPMeAbe1Jj7cZ/
         tsxB6L2rgqXT0uDcnEv48ZEL2oa7/rKmv6DUZyp5EGybKoqg0iy+l8amsH6rMkl5gr0+
         /cquuPqDWc5Sgb7rbVnZ6Y5Xr1lEu1Ney/5Ea056++2m54eUdpQ4M9SGa1ewaXlNZFMp
         dqPjNz9U5wypBXqytjG3zdJo5LLmrj+dBd2dKKVF55udfhBV7JYphzsCgho7nNT7s9ek
         6V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729032510; x=1729637310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miq9FmtmjdBD0hWpSYeZA2klh/HZsIKy05pk3Zx+Afg=;
        b=uMeehFciTiFMJBA3LWXsEkFlcvjnB5W4czMeMV9ysR0VakfiVxnylUNneIGEKthDZz
         k7iO2+3+2rsTDodA7oBfsmJMU34CIsVMlX98QFVZu7Xlsfi2sRDMefFSzIveSCE4xAV2
         d6GA9+7o6Dk0G2GM2wOf/kWRIm47zThiMaouG1ksZrzeoej+dt9zrDz7pCi2LCK2czNK
         iwS3oPeR1Zekr+xEzAPBd1k0/LOvKnLJJBxRQf8qXWC5XZYKe+IPYKoeiQmzSMNPP058
         tz3WZLOLaqydNvbloZgk908+OmGJMEdPbE6BYLSJjztPNLYoUCUq6MnX8HjSWCOAGZEM
         bU/A==
X-Forwarded-Encrypted: i=1; AJvYcCXCtM/c7LEONNKVgYNuK3NbXzlh1AmmFjV9U5U5dAjER7Q1USlTUy58OqJ+jlkSk4pZub5Hwjq1FRVqXgCE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7rUtM/DYVnp5j0frViuC19a4lskmd2JJygGBG9Cc4weEoP0Yq
	+gmFD9y63gxy34umuoON7L71DlzyB0H6xbhBToFoNAxFHWDehyCvRgll9bWT6ZML7S5+0FIJj5+
	Z01JfLwGZz+QlrlFerOgAOiVFr3Aj1MZlNHB+UQ==
X-Google-Smtp-Source: AGHT+IEwOi3xOaRekA3PPJMkq6HAJdzViRwYCHfUYxVkjaE6to7N2i/cYZrGYTe0N4xvD1sOPBjtZAPxgpVW4Xl0qFM=
X-Received: by 2002:a05:6402:c41:b0:5c5:b7fd:170a with SMTP id
 4fb4d7f45d1cf-5c95ac50794mr18001007a12.28.1729032510392; Tue, 15 Oct 2024
 15:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015215157.18571-1-everestkc@everestkc.com.np> <99056bd3-748f-42e8-a25a-131f7b194f55@linuxfoundation.org>
In-Reply-To: <99056bd3-748f-42e8-a25a-131f7b194f55@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Tue, 15 Oct 2024 16:48:18 -0600
Message-ID: <CAEO-vhEwkQKnPprdw_r=mg6KRbadY6B4A3R_sOsyH0ds78wb2g@mail.gmail.com>
Subject: Re: [PATCH] staging: gpib: Move free after the variable use has been completed
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 4:35=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 10/15/24 15:51, Everest K.C. wrote:
> > The variable `in_data` is freed, but used later in the code.
> > Fix it by moving the freeing the memory after it use has been
> > completed.
> >
> > This issue was reported by Coverity Scan.
> > Report:
> > CID 1600783: (#1 of 1): Use after free (USE_AFTER_FREE)
> > 19. pass_freed_arg: Passing freed pointer in_data as an argument to
> > ni_usb_dump_raw_block.
> >
> > Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB =
driver")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
> >   drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/stagin=
g/gpib/ni_usb/ni_usb_gpib.c
> > index 1da263676f2a..75f39e1f3ed1 100644
> > --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > @@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uint8=
_t *buffer, size_t length,
> >               kfree(in_data);
> >               return parse_retval;
> >       }
> > -     kfree(in_data);
> >       if (actual_length !=3D length - status.count) {
> >               pr_err("%s: actual_length=3D%i expected=3D%li\n",
> >                      __func__, actual_length, (long)(length - status.co=
unt));
> >               ni_usb_dump_raw_block(in_data, usb_bytes_read);
> >       }
> > +     kfree(in_data);
> >       switch (status.error_code) {
> >       case NIUSB_NO_ERROR:
> >               retval =3D 0;
>
> Looks good to me. Isn't this on next though. Don't forget to
> indicate it is against next.
No, it was fixed in the linux-staging repo.
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>
> thanks,
> -- Shuah
