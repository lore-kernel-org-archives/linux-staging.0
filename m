Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55257D299
	for <linux-staging@lists.linux.dev>; Sun, 20 Apr 2025 01:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745111583; cv=none; b=kCfXKtE3vmVVcFy45x2EJeDTR9e4tRUEP6bpbxi5fEeAPlqvirL5x8ApbK9U2blbCFQMepG67hGBwyC6oHblXD6yk7+pMnbqB/cP2KM2qlZO6wzbG65uub24xMLWlc84CFA+DejFqPYaI6shd0p3d0OH9JhGpUAy6ULIdiArvRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745111583; c=relaxed/simple;
	bh=6G44rOBDOpX3K4dAYqiZRKu6NlpsI8kYJwv4t94PWfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEBq6FWi56o9HjOV8p47mJ3DYoLPbswI+zR2tHiuDzCfINJph2Ofv+JLRGkxv0czFmEdg9C6ENNVQvs4ItsXSVuQzU9bgko0tOs8vE4VLFHqNNP2KLkvX7riexrhwp7CfQtlsZmjyAeRBrdXrAHcOHimTzE4zI7e/aBornPQtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZI8bk0h2; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZI8bk0h2"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47692b9d059so43627121cf.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 18:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745111580; x=1745716380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thDcOLdPkfwcZEXoGMprWBcv7sRiqWfZZa3+HhTK2aY=;
        b=ZI8bk0h2HSihNFFVkVKDL4pSf0b9myfmQVGBb8XS9kK6y0vYfALvZXMAZ9t01iAulY
         IFp6BsUXNaaLTLM+GZ4b5hk1K9/QoTsX3GTuEzb9PBkmvZxxjkpL5XkdUkosVLisLM4w
         +cISdMn9z9Y0yJY8v5S78iNGQwlmN/DGKPNXPeItuL7p+U+MQOG8PcqklDXp6IcOtwhw
         KhceJd97A9BmFeGoBkvfSyXuo0q9UflZKZnpxKUJjOvPUM6hgsm6J+05+S7T+Kky86rs
         BcsAKJ+vqBEFeNOxUHcpOEcSmh7jWX1dBFJ8LbGqWXZUX0+wMMMceHl7gIb3z6fw2g2J
         3hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745111580; x=1745716380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thDcOLdPkfwcZEXoGMprWBcv7sRiqWfZZa3+HhTK2aY=;
        b=wL3cmX3TDFMLXXogi1IAkqPw5SEH+wdxIy4hke9UDTb3yc5RqpdXTne15RIAC5NPPW
         W8xCc3PcQE8uT60F448Z8D/WqNuPUl5tshOm8n46wUKsLf+zNiVC9BlbXDwMRAE3hJrf
         NOv/lx2+PC5c/TZgYSE6o+idRLsIPJPfjhJATiK1xdQ5waQQUNl50U82yIQysHsRRhbZ
         xMTx6LzvsF3MVQrCKxU6I09BWzLiHpzU0A0egwnROeSHvZG9u5HWXvEKnMdGJfFhx1sb
         wCOJ1qjR/RIA3VQObuLXJWkPiu75UCe1hAdeNWpfdaKtS4SXDDa3cH4Abfr0KSAbfMmA
         nQEw==
X-Forwarded-Encrypted: i=1; AJvYcCXeg3JoLIWBbtlMy0gDvlOhZONcQ+n1keJzbErILB+st+N7BkEDDQ440n8AZuFA9VXXwYC6gGtw6CkkcR6D@lists.linux.dev
X-Gm-Message-State: AOJu0YzQKy61BegRxOdaJnIGDOEK9tYvjuFOHfoC6Z++qVOYSp0hYhtx
	rvyoMWpeEy+NlgxTx/qs0eF6iRFWWUc2W5zjBRKXcVUR/WSu8zy8XdyVVPkaWjpkiWCDFEEqW7D
	mRHSi+kXGHBTh17EP87hB3GdwnBo=
X-Gm-Gg: ASbGncs1s9lyfiLaFlo9QTW22vUYET3W8pk7v2z1iYGbNNcGBKz2OoS6LK5TONkWkG6
	tEFV9bvXPTmOEXOXSH048ejiVfAvac6vgu+Sr+8LZnNUP3oVX1D0vcZ/pSplgeSZ9JfrV84lE0v
	m2XFTXQCcPfg/J/+hwFhg8BtvOPfDastzGPPxQgTaHN/L3HiMy3uH7fw==
X-Google-Smtp-Source: AGHT+IHEJ7vE4gi5RgLqomFtoI5GERYeArL9FKjlt/33MJezcaz4LvqnHBrczqzMF0c7tY7ke3BUtbN25Hbq0WYgaG0=
X-Received: by 2002:a05:622a:19a5:b0:47a:e70c:e1ac with SMTP id
 d75a77b69052e-47aec36591bmr112062821cf.9.1745111580039; Sat, 19 Apr 2025
 18:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416142219.554938-1-gshahrouzi@gmail.com> <aAPEUUAHsG2CvFbr@debian-BULLSEYE-live-builder-AMD64>
 <CAKUZ0zJoV6pLEFh6mEjz5awousn4o8Mq2D9AL8CfvqqW620X4A@mail.gmail.com> <aAREYg1uAc8NSVKY@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <aAREYg1uAc8NSVKY@debian-BULLSEYE-live-builder-AMD64>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Sat, 19 Apr 2025 21:12:49 -0400
X-Gm-Features: ATxdqUExlWtyU2bbnRz5E1qlm3t9KbBZuxxYHLjhSGsEHuHTdMVaw2WyNWhZT0k
Message-ID: <CAKUZ0z+1JZs3ky3Yo4FNev8fow4bNvH_089=PvwEd-Rpvpj6Xg@mail.gmail.com>
Subject: Re: [PATCH] iio: ad5933: Correct settling cycles encoding per datasheet
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 8:47=E2=80=AFPM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> ...
> > > > @@ -411,14 +417,15 @@ static ssize_t ad5933_store(struct device *de=
v,
> > > >               ret =3D ad5933_cmd(st, 0);
> > > >               break;
> > > >       case AD5933_OUT_SETTLING_CYCLES:
> > > > -             val =3D clamp(val, (u16)0, (u16)0x7FF);
> > > > +             val =3D clamp(val, (u16)0, (u16)AD5933_MAX_SETTLING_C=
YCLES);
> > > >               st->settling_cycles =3D val;
> > > >
> > > > -             /* 2x, 4x handling, see datasheet */
> > > > +             /* Encode value for register: D10..D0 */
> > > > +             /* Datasheet Table 13: If cycles > 1022 -> val/4, set=
 bits D10=3D1, D9=3D1 */
> > > >               if (val > 1022)
> > > > -                     val =3D (val >> 2) | (3 << 9);
> > > > -             else if (val > 511)
> > > > -                     val =3D (val >> 1) | BIT(9);
> > > > +                     val =3D (val >> 2) | AD5933_SETTLE_MUL_4X;
> > > then this would become something like
> > >
> > >                 reg_data &=3D ~AD5933_SETTLE_MUL_MSK;
> > >                 reg_data |=3D FIELD_PREP(AD5933_SETTLE_MUL_MSK, AD593=
3_SETTLE_MUL_4X);
> > >                 reg_data &=3D ~AD5933_SETTLING_TIME_CYCLES_MSK;
> > >                 reg_data |=3D FIELD_PREP(AD5933_SETTLING_TIME_CYCLES_=
MSK, val >> 2);
> > I currently have:
> >                         val >>=3D 2;
> >                         val |=3D FIELD_PREP(AD5933_SETTLING_MULTIPLIER_=
MASK,
> >                                         AD5933_SETTLING_MULTIPLIER_VAL_=
X4);
> > which assumes val only has bits within a certain range which I believe
> > is the case here but not completely sure. Would it be better to clear
> > the bits regardless and then apply said operations?
> Nah, since val is being clamped to max settling time value, I think this =
is good.
Got it.
>
> > > ...
> > >
> > > Though, I guess it would then be preferable to use masks and bitfield=
 macros for
> > > all other places where we handle register data in ad5933 driver. Prob=
ably
> > > something for a different patch (if worth it).
> > I separated the original fix from the refactoring so the patches stay
> > modular. I can apply the use of masks and bitfield macros for other
> > register data. Should the refactoring be all in one patch or spread
> > across multiple?
>
> I believe all mask/bitfield refactoring can be done in one patch.
Sounds good.
