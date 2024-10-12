Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE881802B
	for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728746852; cv=none; b=Zozipn0wCMO7RrVxL1D1mEJ98/zXMj6GJRkF3T78s+YPoNWQBnyYdD+RrAN19KWYpH1RHqsm99HJRqPVS5BPagni++qZwFh1TBjqYy3S2frBC06FDV56PPaRrGx9O8J+rEpw47tUQgHF8sScLRMkD1gqBghgkofAMlEtKu5E++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728746852; c=relaxed/simple;
	bh=kNKvb0rNVp6vzyaGUwTGZygx9ZxekG8yqQEp4jqXF1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8h8T2XkCKIUpDIzbgNcVXB9Itdgu9ZiWX6nkXoyt0onJxunKZbYfQ0gIRTmFNm3+w/jzX4k0b39Em4djOTwNe7a4FnS3cLHX7L4ZXLFFfOHSPfihzkF4Z5XGxA53MMmHnFaT76nKp3MLtO1VEoMVeeF6ZgxnEjwfRZfegnu+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8TOWVTJ; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8TOWVTJ"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5e98a16e81dso1311841eaf.0
        for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728746850; x=1729351650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrZ2z4OAc7My1Ph9G3EUZe1keZZllltflrTof5pqzsk=;
        b=d8TOWVTJxpumlvA0SH6Fso5GazTp8GaaC6+thcyq7+XiPVGqmDYooIQi971CL6qWd7
         cHafESvDRlMxIYm1bWeFfDROKluMvJcesF84ZxszuU1F3iepYjTpmy6wLtjfGGB2ZcOb
         NF9ZPEWCMlT/PMtt20tqskCFXqtbaj8dCh3dPspeJ8mhBF3lOVfsURTBE4EoeUd4joBb
         7mggY/N2aFrq6k0RDO4S8tCmquJaW9AiWnqEjE7MMm9wRFIhvu65MOw5UYMn7mRAM+UQ
         y1aFjWb59Oiann9GpxvqDTvonklQJDldCucZSWoLbKfRR3MC2F+5CpxW+TkrecYrShHy
         ymZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728746850; x=1729351650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrZ2z4OAc7My1Ph9G3EUZe1keZZllltflrTof5pqzsk=;
        b=QOrLzowTkX6fxeYlREz4Vc/h7+x4JEoqpg8D06PbZHEwtuTdF8rM0ud1bcVGqxqvLT
         qlMhPMdzZOfvsEnwjwJHGLshcYFvFuqC0v/dGHYmwT5Oh3LNY07AIMlvpDn/70v2YjK8
         7+28TAC1e4x23SWCZ4+QL1YGG4e75y5LcwKZ3+RWE17DdP8MvVjZugzrti8rfVKP+cTg
         QtuyzHPxJH8j1dMgc1jKj47axdxEBHP8XFeliL97jn7HgmxA0zPbJDwpEdMJ0aykVShf
         zBTpVOcphezfjvKzcQyxoNtBenmLWEBvBB7E7n3vykbhRD3LwpEE57TJp2MIa91/UqGL
         mkxA==
X-Forwarded-Encrypted: i=1; AJvYcCV84Sk1pqIdEfG49AjRHuANljxGhkLwGBz8Yz+SQKefHWrDZ67tGqZoEgU4GLGr6aPSg6mEmqG/sXM1CuEK@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5+aN82TZ1kSfyVOaQ6kYIa392IreFthe0BzARiYlLKU27PaG6
	ojWR1JLz97FnxTAWmtXMmqssDpfk6bBkonB/OtfI5EjS4ujD4X3DeO23Ju6jhmn9lEnxET7PbUW
	r3B0ZUoRusO1Y7cykycBdRi+zUHQ=
X-Google-Smtp-Source: AGHT+IH3neqkdOpTr7uWA4n6mK3DF46/N7yEwf/kYso7EVeWqFHV1bhL0Dh+3fdbylsFLcWiO/O4Cnuhjp3DRDrCGdA=
X-Received: by 2002:a05:6870:9f85:b0:27b:583b:bfc2 with SMTP id
 586e51a60fabf-2886d9e7649mr4973605fac.0.1728746849998; Sat, 12 Oct 2024
 08:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011070828.851449-2-u.kleine-koenig@baylibre.com>
 <CAMhs-H8-8wmg_OqxQrO93ZV1Mrh-2GKowoWpvdk5qkvQbQ-F=A@mail.gmail.com> <m5ezhgxp5kwup65cieicws5fviwdapqmwm6ldiojic53pgs5tj@iu5u4wf74fzk>
In-Reply-To: <m5ezhgxp5kwup65cieicws5fviwdapqmwm6ldiojic53pgs5tj@iu5u4wf74fzk>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 12 Oct 2024 17:27:19 +0200
Message-ID: <CAMhs-H8ziPqHPSyk0Hfjy9DWvMTHH035jeoanqxCW9K22rY9fA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 11:46=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Sergio,
>
> On Fri, Oct 11, 2024 at 09:39:09AM +0200, Sergio Paracuellos wrote:
> > On Fri, Oct 11, 2024 at 9:09=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > > return void") .remove() is (again) the right callback to implement fo=
r
> > > platform drivers.
> > >
> > > Convert all platform drivers below drivers/staging/media/ to use
> > > .remove(), with the eventual goal to drop struct
> > > platform_driver::remove_new(). As .remove() and .remove_new() have th=
e
> > > same prototypes, conversion is done by just changing the structure
> > > member name in the driver initializer.
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> >
> > I sent a patch the other day to convert all staging drivers to use
> > remove which was applied yesterday.
> >
> > See: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git=
/commit/?h=3Dstaging-next&id=3Dc1a5060ec80020ce879fa5b2a16875bd9a5ab930
>
> If you really must grab this quest from me, please coordinate, or at
> least Cc: me on your patches.

I did not know you already have patches for staging and only sent this
to the staging list itself. Sorry for that. If you already have
patches for remaining stuff I stop sending patches about this. Sorry
for the inconvenience and let me know if you need my help in any way.

Best regards,
    Sergio Paracuellos
>
> Uwe
