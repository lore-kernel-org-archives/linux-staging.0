Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07121537A7;
	Sun, 22 Jun 2025 06:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750574179; cv=none; b=tMdUjHw59WKcwJ4liZsSx7jjKUccfds9oPTAR4B+gyfiEnK5D9ZKYq+1Gk8nlY2jFBXihnvAdDS75DvMJlpT0cIK/tvm8oSzmxg2qHOixh2zoVTOdeJlTaYvLNkrcR2ULbBpp/BiHCEv3vznFjo9je4vfyj0QMpTPjP6CigyBBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750574179; c=relaxed/simple;
	bh=PZqo15rE3h+XT1t6UwJXJ9LADYPiTh0vUkhWJ9S1hFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bqdn/v+cea/pKK32QiZ7MlIEi3a4Yo+BzX/vYUj1GvZX8gTUZ90w6XqXwDv7bvuqMdT3xEYLZwaL0MiA9A0v7MyIsaJUUG2drT34WtbApprqG43PMKxUXxS4Or0TxjmpCFqS3QhGb+rG9PTMDRu4/l6JRXpEGcw5lnojHfXo3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9s4IGg+; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9s4IGg+"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-712e7aceb69so176417b3.1;
        Sat, 21 Jun 2025 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750574177; x=1751178977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzD7pRtS55YhqOklNM425lZiJRQ0GtjKMB2DT0SmYpA=;
        b=P9s4IGg+lrYwNaIcd/G292OlxZwFU27BEeiEpwmJnIb9RBwX+8lye+RHDKWiMSHxeu
         Dco3OQccKxGTgk7jdI4nQcJYnYNRuv3Vz5TayzKqmMcIHHcG5uSaQJ1hmB68tPeInoRK
         yukQ4beKG9B77y9PCFygfglO+Zs6nB2ZU6Utgx82ZphmXmUSaH13YXmBtM6IW6vdwscE
         M+rfMpxK5FHCConzhGorX1R8kPulHVRnkTrQviaWgqmbiaz/cvEuIv44Ot9szEyDBgE7
         ts8SON8FT2Kfn01z9kWDAkAR7UJMj50wUKl05xT8jbMeYIA5eqK2Od4yuv/KxRnmYqfk
         TCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750574177; x=1751178977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzD7pRtS55YhqOklNM425lZiJRQ0GtjKMB2DT0SmYpA=;
        b=W/I3U9sFnepCoztt/VoXMmEoxUEpQpllI5vDHLPk7nuRoNHkdKiiHO66VVbUacWiHb
         cjhRfRyTKsF/psWALU4vcvbrqqmCx7KhKcHYpG/oxyredSarQw561RuS0UmBwNtwe1VG
         OjqnqVQLW9CxtdewsnBsZ7OisIsm+wOtiEmnb1SEHSa2QGnbIMBNAEBsuh/H19y1zTJ6
         x32o5mcSbjPiQ9+MNvjlhG0dpC+l31qjhQld1yqa2FSbPVLHieh5+a1oFTTUui613tG9
         k9yuWNKs/xS6mjEFNrE+vN38OkoxcZuv3fo+1p+RcijkxDgx+/lHzlGdCRAg9/x9QaKN
         GhkA==
X-Forwarded-Encrypted: i=1; AJvYcCUofJLhjCWFkwJSnycuL6BShc0SCuXJVnl16OwAcdr6Nr9u0gqv6XU3qXcwdFoWBT4IhLAPyanHKFY9qhC+hA16ijhBOQ==@lists.linux.dev, AJvYcCX/5JUPBuU1ebrKl2RXDP2l/9Vq/F1z1HE7iUrUcQto3lUpWy967dGpWEK8SWHHXRDsvqR5YauTauAUkBmt+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz41j//qx792Q3N/svkb1yv/CT1CD1xzlsyx0lhbaioSpOH6MwW
	2ZinmTU1Ek/VwPzSdL5889bn0yMvfIhWMj4yKN6qTxxDs0uvQZF+kd8y6+vYCEOrnGwxy3gDWwj
	KGWOFshojwzTLiT6SFap6eurGkGZE9wU=
X-Gm-Gg: ASbGnctQK7U5LLh4IB3nTpn+upn78HXzYtwBcYnXCbFnoTjRQijGMtKn92jM5/AXt4d
	tvc0w/a6xPqlWNBZ3Mi3k31ypDvrs09frmemIzA6VVqXzmAf9Ui7X4MQrU03Reo7a3LZFAX+Ovc
	IHiepd+wdls4vXebsXjQ3zafyGHzRoEuUhH0cjKSEiGHeN7w==
X-Google-Smtp-Source: AGHT+IGSVFJ6FBVy4wd4wNXb58fhsghGVUPG5VHLiYXGX0otXbvmB94A6oX3E65nXtKfNXK2/ICjCd87kazL3IE3W+s=
X-Received: by 2002:a05:690c:4b10:b0:712:a286:2ca2 with SMTP id
 00721157ae682-712c654cc21mr57287357b3.7.1750574176471; Sat, 21 Jun 2025
 23:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com> <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
In-Reply-To: <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sun, 22 Jun 2025 09:36:05 +0300
X-Gm-Features: AX0GCFthVu5QuHF_fiQfBvZwypdl2HGtpBjqpLtf1jAkutvlchtXvgCPrRQPSG0
Message-ID: <CAGn2d8NgZ1YMj3eSsujWjF6ppwMkOTJLvk2hVcXfUdkyq5TdyQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review
On Sat, Jun 21, 2025 at 9:25=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jun 21, 2025 at 9:30=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> > PAGE_SIZE handling and standardized sysfs output.
>
> ...
>
> > -       ssize_t ret =3D 0;
> > +       ssize_t offset =3D 0;
>
> It would be good to move this...
>
> >         struct hmm_buffer_object *bo;
> >         unsigned long flags;
> >         int i;
> >         long total[HMM_BO_LAST] =3D { 0 };
> >         long count[HMM_BO_LAST] =3D { 0 };
> > -       int index1 =3D 0;
> > -       int index2 =3D 0;
>
> ...to be here.

noted , thanks.

> >
> > -       ret =3D scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> > -       if (ret <=3D 0)
> > -               return 0;
> > -
> > -       index1 +=3D ret;
> > +       offset +=3D sysfs_emit(buf, "type pgnr\n");
>
> This changes the behaviour in case the sysfs_emit() fails. Not that
> this is a big issue, but it should be pointed out somewhere.

noted , will make a comment about it.
> ...
>
> > +       /* Direct return of accumlated length */
>
> accumulated
>
> Don't forget to run a spell-checker.
>
noted .
> --
> With Best Regards,
> Andy Shevchenko
