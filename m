Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40232269AED;
	Tue,  8 Apr 2025 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113074; cv=none; b=K5XH7QhxAiY4G0ysF7JSrq3qqoacM9TPtU3OaqhhxxqGYFx9yrj/5EPlaFpLAisJjZpXuIgcDSCt63h+j2s/WXx4lLjK2l08+DZlQTpzVFW9z3DeTokG+gegM+37tPt73ja0uxZ8EgFIS33EBZNHNM3NAuJCNGl6vnHQAKhfq78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113074; c=relaxed/simple;
	bh=eHSWxmsnGn3NlqRg9ekLwP8NpVdUJpxvgjU0B7HZSxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KF5iVesOyAV5CczBs2nDrv9EOy9RRc+/Li53BtmBy7+kYbY85kY2AKJCIj5M3pRgBikWtoCWE43nYBiVpcKXssv98lkNQH053n6h6l4Sp2mA1J9/QKUwLtzEOVIZC3LaDLYWiZrXa2hBRS/O35KjL9Hpzi+KDl7ZR0r4huFrom8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3MFUJpr; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3MFUJpr"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso2980903e0c.3;
        Tue, 08 Apr 2025 04:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744113072; x=1744717872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6c4CK8m8rsz3UQuOMrED8qLpYmmaLeOXkF7GHkb74zQ=;
        b=l3MFUJprN+4FeeM1Hv6dqzQFFghUF4tBQj+Sde05uk0c0fzLKwWJy59mndcekBK7S8
         p1n68BPn26HRaJrs9lGwQr3NLwGNW6z/LT443PEb56vEUmhSuQOF5qg8k1wWVORktBMF
         qDK9A+P8PLlm9armP6TuEApyKjJiBQ3NzblonT2pDbDqBBPepTMhCqZJJkz3e8yegwuj
         Ds2IHayIc98jN2F+LoBWciaEkx3INc6GOwF2HLFQKgrq171xlM8/WeyHGrCPlI2asRA0
         1hUJbqq3CI3r35ZmWPSi+TgKjCCyhYP/uV5auFvmlJDJMy97xp6bn+CVvMzQ+WrDZG/D
         AiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113072; x=1744717872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6c4CK8m8rsz3UQuOMrED8qLpYmmaLeOXkF7GHkb74zQ=;
        b=se7C3zh1nULbZh7KF8QSZFUqn1ewxEGhH489+BYLCG/ArkZ9ulelxr29SEdl1pWoks
         VTA43T7x/nUZCaRPP7dbwuYbpNew60yqiGfTRwXhn1j7KIF3tBTNRk+a0ixFj9UNdyog
         5uD7PwrFYlxwb+XIsue5O1OVfieOSf9vsIh54znIyDBTfki3c+IRSDu2Qr/1WZlf28fq
         2bJQMsP8FgFf0u5ZqVz/CsVbBSBZcXdXUTxap6JgvkjyJtnymJUy2AFJRgYXUtwvZlWC
         lytG/Du/TkKeW0k5ZBiyOzvKquwegeeJxufc1e62z0V5mK/eXOyntOQo/g+TQFNounch
         8lDA==
X-Forwarded-Encrypted: i=1; AJvYcCUJitMsUxLnWeHPCT7aKivdcZT4ye8vhDWsUpiKNGd2sceriW2wdYnPb0kxb5JPD6L6o241t+hR9zidVhb4@lists.linux.dev, AJvYcCXTayxRK5peqGgiIFQThM7yoLPevxBt+8lb2wIG7WUFZKlEqWSlwpZhCtdJWXf0+MIGD/HSh4z4/VSD@lists.linux.dev
X-Gm-Message-State: AOJu0YwrQaoCk+UWw3wh0X7erz6GGv/2Xxszwu5f8f80qgorcVf0/M31
	11xp+PMLgzvHby+Ir/fe6JTTSM6FiYwTsI27oX8hNUSek4AeDnpJUNCbWrYev+4ZS6E4qg+e/Ak
	zqrtCsdqoqHfJb96rNQrm+Gmfa30=
X-Gm-Gg: ASbGncsBlxbHhNaYvX/lSv55p5GVuyoiTaFtmLl5FnzXks+wZ5si7zPOFdeleKFz5zr
	rtnIufNS97lvy39XF2BXq11g5M/qt3OiMPsUe/YhIOHMEDITMJ8yZuTNvlP10iyEo3cXY/SfWB3
	lFkTGL2KDv+6GoR77CgP6O6czpiw==
X-Google-Smtp-Source: AGHT+IEVVZKLLen5djjPelmf+peezMoKleLv6h20DTz9UV6T5Q4wfcMnGzp0gwFgIk6/dV3lXUuNsU0ohCecNTGcWXs=
X-Received: by 2002:a05:6122:8c04:b0:51f:4154:c1b2 with SMTP id
 71dfb90a1353d-527644239a8mr12090161e0c.2.1744113072103; Tue, 08 Apr 2025
 04:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
 <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
 <Z_TtyXwkOBK1MXGy@smile.fi.intel.com> <b89c8837-4aa1-4073-bb09-f71f37b5dcc6@stanley.mountain>
In-Reply-To: <b89c8837-4aa1-4073-bb09-f71f37b5dcc6@stanley.mountain>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 12:51:03 +0100
X-Gm-Features: ATxdqUE6QlXt5Q2GRjZqUe-Mf0KjLF3Pm0Jgd_V10YDzH4vMsZ87VB8sYMegCVI
Message-ID: <CADYq+fZ-LmoyGrAFsEHBwM2WJthpqGYhPLmAJ3Ea0B=NvmC8aw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, outreachy@lists.linux.dev, 
	gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:36=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Apr 08, 2025 at 12:35:05PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 08, 2025 at 10:22:44AM +0100, Samuel Abraham wrote:
> > > On Tue, Apr 8, 2025 at 8:20=E2=80=AFAM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> > > > <abrahamadekunle50@gmail.com> wrote:
> >
> > ...
> >
> > > > > -                                               psta->BA_starting=
_seqctrl[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > > > > +                                               psta->BA_starting=
_seqctrl[pattrib->priority & 0x0f] =3D (tx_seq + 1) & 0xfff;
> > > >
> > > > > -                                               psta->BA_starting=
_seqctrl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> > > > > +                                               psta->BA_starting=
_seqctrl[pattrib->priority & 0x0f] =3D (pattrib->seqnum + 1) & 0xfff;
> > > >
> > > > You mentioned Linux coding style, which also requires lines not to =
be
> > > > so long. These lines are. That's why a few versions ago I suggested
> > > > you to change these to be two lines each. I don't know how many tim=
es
> > > > to repeat this (it's third one).
> > >
> > > Okay, sorry
> > > I will add a third patch for a line break before the patch for %
> > > operations since each patch should handle a single thing.
> >
> > I am not sure you need a third patch for that. It lies into category of=
 space
> > and indentation fix.
> >
>
> Yeah.  Let's not go crazy.  Do the white space change as one patch.  The
> rules are there to make reviewing easier.  Splitting it up into three
> patches doesn't help anyone.

Okay thank you Dan. I have collapsed the spaces and linebreaks into one pat=
ch

>
> In staging we say, "Fix one type of checkpatch warning at a time."
> That's because it's a simple rule to explain and it stops people from
> sending us huge patches that fix every checkpatch warning.  But this
> patch is small and everything is related and it's easy to review.
>
Thank you very much for the clarity. I understand now.

I already asked Andy, but I would also like to seek your opinion on
how I should version
the next patch. I already made this current one v6. Do I send v7 with
changes in the cover letter,
or changes in the individual patches?
Or what is the best way please

Thanks

Adekunle.
