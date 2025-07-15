Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC28272E75
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564437; cv=none; b=dkiAoHIBK5AXiPvqbEerZx4375CzzPeX11YXUsg/G1tSAMKje8mbtBuDpmORyu5XZw2xS78opjOa5H2387jfjJe4uaR5hTy6E4fR0+k4sN8tB918Lo+l3ZhBGVVdknir04MVjK+ugwIeal91EBxJNWbtPxqyIWCHkTTpmF5tzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564437; c=relaxed/simple;
	bh=HtC4D7tG4lYE9B3IP2Snb8X8xOANK8sSyRwAaDf5PO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb85A35l1WXKK+FXy9pexC4HWk1pD7Muf7E+bY+MV2LtmAqjBJXgURwfVSkgBKvKxcpAfD5J6s0HIljyPeQHAANjVdVveSwVq0+69vMjuUcKNbiOQLhPwSRWiqIs2sdpE/xD8mtgs8sNW+c8r4aE/BswRC9p+5jYDF+jUA5r6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ews83a2b; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ews83a2b"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so877955066b.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752564434; x=1753169234; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B11Fv+/P3Vntrk0Xgb5TyfuwXVxV0wxwjtvQx2djwQ=;
        b=ews83a2bbVa6tgjdvXE0BbHqFxia1yG3K3Vp1x44k0rDTM6D2SMHC7Dk2JpSD/kbu4
         4IaS2XHr9/Qh/n8DfC7IDKte52+fBVIuRQJ5pki8wSeovPixNP1tOSVDp1gPveJuQcGq
         XvxAezjFV86ZBIOaRXfO0XtQwH0AXpnLPlHfqa3JTLXa2g6mEGDyiQ6LMC29nVyAEF2J
         011Nfc3i1U+d6L5nroYB8DBh2zbLDZHn69Z28NcPKa7j5jzWJptv3lXE9TVo00gQLxUp
         yiSlLrQODx0W3fRNr3jMyo0g0cK51bWiAeR/5Dqm6BDMKF0eo+UBqKARLh2VHobNWQi6
         cDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564434; x=1753169234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7B11Fv+/P3Vntrk0Xgb5TyfuwXVxV0wxwjtvQx2djwQ=;
        b=F7JHxDC2Ys3zm7V+0jFzFB1xe3Pq1qc7jFadYuzOkuOZ4Jx2EUAkzu9cGQ8tD3Tsj4
         SuULvfc3e9Zmo27jiXwEddNqGeVi5U1ixHAF4vV16azD3dzhh+1AadWZ0yyKdAOHkkBR
         22BpIrZ2O07912DR1lSe0Xg6+6q70iPMOwMQrvHCcNmJSlHsaBmvNffNZQY3Xv+OyL09
         TmhUunFf5ZZa5QnEN241znvqHQhNsRnBcyViNLx9OfcKjvrZW0BFXm22d1tfXCqS+jUq
         gpjiUj3+kdBtZt8uKZglDkuhBiux2X2rqK3Qk0nQ4SwUm82tT8vz8IZVakQpn+gv7/Lp
         /Kmw==
X-Forwarded-Encrypted: i=1; AJvYcCWWvyVlICRjxHD7FVXjmuFsivGb0hcqoqZ2dvRb8ef0zdxCVEg0o486TiZewV6CeN7QjrQfhum4ea8XHq8t@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpi4tY/piBIufphoeVKrcAJd18wOmukN2ykHPG+Yf4nYLPEM76
	4awVD2D1HMmvfR7sDhLc8WYFYNDh6T/QzCGdEJLIDaujiZPin8Dd/MYCvwq3c4TCb87veVzO0WR
	+yZVN/KwiYiEILWDX7/Ybs/WYp4L0AVA=
X-Gm-Gg: ASbGncvEXKcH78nniZKpR0z8TZa8WQp8ltSygzC1zK5FXQroqlpenWpsQaUaWRz+KfX
	pXfhhp/PRmKKhBYSJWwQIi4Ya2EEU40CEqhIalpj5Hx9ApwohrppPCP/y/dnRR8K3QKxNi02ElF
	x2c0d3l/tZA6JjpAx4uS1x6MwPkZu9SA5zhBGZl4M04U/gap4kGqqHg3BmXej1pIg+zQEjknrXY
	ypOH50aPQ==
X-Google-Smtp-Source: AGHT+IEc62LOFeD7pGkpvhpMjAwjKjNczYiC4ILDPjuHqWZVZg/7cqp2v5qHEQ0GWDq7Lr9pHCbo89FE3T81Uk1eWwo=
X-Received: by 2002:a17:907:97cc:b0:ae3:8c9b:bd6a with SMTP id
 a640c23a62f3a-ae6fcac624bmr1739057566b.40.1752564433429; Tue, 15 Jul 2025
 00:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714153409.46085-1-martin@weidenauer.cc> <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
 <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc> <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
 <1D5485BE-E03F-4364-A48D-051AAECFBA9A@weidenauer.cc> <CAHp75Veovvxbr_6EuubDa7x8P5j12WjER=ar7E69A4r=sGONsw@mail.gmail.com>
 <2025071510-skeleton-squealer-f9bc@gregkh>
In-Reply-To: <2025071510-skeleton-squealer-f9bc@gregkh>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Jul 2025 10:26:36 +0300
X-Gm-Features: Ac12FXyukFhvmA5YCNgVbhBFeadAZfG3STdKDZJGa1rWbijyqXDBvzvvFyfES5U
Message-ID: <CAHp75Vd9hHgjuavkjnWEi3y6YoY+WggGZtupeno7O322crykcA@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Martin Weidenauer <martin@weidenauer.cc>, Woohee Yang <woohee9527@gmail.com>, 
	Jongmin Kim <jmkim@debian.org>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 10:04=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
> On Tue, Jul 15, 2025 at 09:57:19AM +0300, Andy Shevchenko wrote:
> > On Tue, Jul 15, 2025 at 12:54=E2=80=AFAM Martin Weidenauer <martin@weid=
enauer.cc> wrote:
> > > On 14 July 2025 23:38:47 CEST, Andy Shevchenko <andy.shevchenko@gmail=
.com> wrote:
> > > >On Mon, Jul 14, 2025 at 10:39=E2=80=AFPM Martin Weidenauer <martin@w=
eidenauer.cc> wrote:
> > > >> On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy.shevchenko@gm=
ail.com> wrote:
> > > >
> > > >> >Guys, please, coordinate and issue only one (or a few) patch(es) =
per
> > > >> >an issue. No need to send zillions patches for the same problem
> > > >> >file-by-file.
> > > >
> > > >> >On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin=
@weidenauer.cc> wrote:
> > > >> >>
> > > >> >> Fix checkpatch error "ERROR: that open brace { should be on the=
 previous line"
> > > >> >> in ia_css_dvs.host.c:277.
> > > >
> > > >> I deeply apologize, however this was the instruction of our worksh=
op in DebConf by Helen Koike <koike@igalia.com>
> > > >
> > > >This may be okay for the driver that consists of let's say less than
> > > >10 files, AtomISP consists of dozens of files in several (nested)
> > > >folders. It's not a good example for such an approach.
> > > >
> > > >> Here is the link to the exact workshop:
> > > >> <https://debconf25.debconf.org/talks/55-submit-your-first-contribu=
tion-to-the-linux-kernel/>
> > > >
> > > >Hmm... this really needs an update to explain how to work with the
> > > >drivers that contain many files and literally tens of thousands line=
s
> > > >of code.
> > > >
> > > >In any case the problem with your contribution is not the code, the
> > > >absence of coordination and possibility to clash with somebody else.
> > > >Also it looks like a DDoS attack against maintainers capacity. The
> > > >smaller patches are and the more of them --- the less the usefulness
> > > >of all this activity as at some point that floods the maintainer's
> > > >mailbox.
> > > >
> > > >TL:DR; (always) Use common sense!
> > >
> > > To be honest, such a contribution also seemed to me a bit useless but=
 I thought all of this had been discussed with you maintainers beforehand.
> > >
> > > As it seems this was not the case, although the workshop has shown us=
 how easy it is to make contributions and for my part I will use the knowle=
dge to make meaningful changes.
> > > So you can scrap this commit and I'll make a few commits in the next =
days which make more sense.
> >
> > The problem is not the code, the contribution is okay and appreciated.
> > The problem is that for _the same_ issue there are tons of patches
> > from _different_ people. Just discuss who does what and send "one
> > contributer =3D=3D one issue" (under one issue, I mean class of the iss=
ues
> > checkpatch or other tools report, for instance, the "if (foo)
> > return;"-like which are on one line and needs to be two or more lines,
> > do _all_ of them by _a single_ contributor.
>
> No, that's not necessary at all, really.  Just take them in the order
> they come in and review/apply them as normal.  Don't expect people to
> coordinate together, especially for staging stuff, that's crazy.

It might become hard to review, when there are many patches with the
(almost the) same subject and same comment and the only difference is
the file that is fixed. But fine, we can survive for now.

> This is just part of staging, it's the maintainers job to help guide new
> contributors like this.  If you don't want to do this, that's fine, just
> delete these media drivers out of staging then.  And don't blame the
> submitters, it's not their fault at all.

It's not blaming, it's advice on how to make a flow easier to follow.

--=20
With Best Regards,
Andy Shevchenko
