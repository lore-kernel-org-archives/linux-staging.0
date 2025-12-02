Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E331ED66
	for <linux-staging@lists.linux.dev>; Tue,  2 Dec 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764683703; cv=none; b=BNsueRL8VbylmSMZn7ucqoGR0/mEbOkcvDQ5pkMQt/atVO9PKHg7uNKskIjRYN6EV7QSS79sxPy7hUphQadVyQZA42PODI9f3+4AyaDRsWqDljepYs2iDUt1dP4yj4JLAshkfnQeTvbaMY3uIQGfwp5By/NINvICjBoeaqDHKco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764683703; c=relaxed/simple;
	bh=rYPu9wGVMJD3qxc3VrFM1hzhlwplY+KT749qc7N7eLY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jYUd5N7frFDxzNOILHtCKwfkOksoqeQ79ShWlDbQ3ZGNzDLoBFZlQHC7M5YNwbwEXaoveOeoI5u21EsDn99pvQT/naOPnjFmkr5M2/3PTsf1GzfXY2IlwYnEDTZ15ss1Y2fhGWnYNfqS6wGE9PL9j6k6x0kXYg/jAkhmorbV/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQh6/VyN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQh6/VyN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so63414015e9.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Dec 2025 05:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764683699; x=1765288499; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q/lyaGrD1zYP4nMnrlel1vvhznbrPEiq90hsTruO97U=;
        b=EQh6/VyNWFnCH+0hbU3/bSP+63EqB3+Ukj+8p21xdjLo94GLUi+bU1KPv38nVHsUgr
         AaNWznjJkn7hO7vXhWw1wTWY1gIZsKc6but1VKNBDp4qMNY8BAdff6Y/vC6pkVfci3UQ
         k/jKpBdNL2EwExb4JxY5JmzvNlLl2f+4vyUbDbtK2EId+e87g5VUQxhVfAMi0JtS5Wtq
         eY6IS8oaiLMgy5GU+QAbI8r/0gvWgY4Gynx8BnuSoCeprMrT7eHZxYldLtaRfXQzXHKF
         NKt37LEhBvpCLEBPKasUrWLhnp+4wYJZkO6w42HeKr4L/ES3rLrJbRWmtJkBo39uS3YJ
         Y6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764683699; x=1765288499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/lyaGrD1zYP4nMnrlel1vvhznbrPEiq90hsTruO97U=;
        b=DtvcWuPWG8htFNowuFZv+Mf8/C2U3ONsex2KU5fJzy4+bXBs//8nEzPWLT/X0bLEgb
         tm2bvRc+b1m3JAXCQpuK3oECFSpuPoAvwKNf2G/0qiS5aXEiFIx73P2YiBS22ZuNI9Vc
         EqzuEJoZl8aeeqIq12IlUjUM9c66qa1r/LaqKlSJpa7gXJRJufd6tVJJngfdgWG0yTdV
         6zIk02p+19Sj9IutOFM1X4osqsXBMuIDwA+IBzMKHEmZgq9+fluIvL6rlbPVtF0p/KMm
         JdEFH4F+SGKa7uJ5RKgRRXzl2TF9kqI4+2ZFzCHWsfp0UC8zKAK0T+5cUPGcHmzJrI5K
         AFTA==
X-Forwarded-Encrypted: i=1; AJvYcCWn6Yl6dkVUZECyWxP/X2jHwLglpkfOryOyqxntl8tOHGSePZxEK7ebP+QtB5ofzUvJwqjSw05x1xV0OT9A@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv+VjglEqa7VwP3rSjXXlFSyrc0ZWNCV9/T14qjl3Ldqn5CY83
	S2U3QW+GSZJp70MGh6dr80KUyRcMuYysSPmP40l6+WdddiyY/PUdAFt5
X-Gm-Gg: ASbGnctMM1xp21KRkOnP7BpE5GwifAF2SCUBV/2a0VEu/BCPYlLY+LvT2IL8AKFdh6r
	f1p4Kk7dS7ZT+7Gq/2AaaGVvl1Q3ZXGccYe7DY4CV3kF8uiL7NTvG/gh7dzmSHL4ibt7a22sg50
	2Cvv9fA75z2k5MRudFZnxYfpWVwB1nk8Ku/rym44hAUhG8cTabr3Y41WklpjtbdEKKqEjPCUDPN
	WsdiKyHOc8fWN3hXdKDFcBoFWMtYep1MHTmmwAVWA7s5z5WFPB17t4hJ/SeOhEiCbJoBRDq00Cr
	LP5+amWgu64+0fp6PqARavcPhc3QN6CRK1RuamHSF+tR6aJA9HNZJh01IoRWYgMkVkW3TuMhZzU
	LHlJMq9PPJzSTKuZn1XQ86doZjt5RfsE3xXH/46HZX34SSm1ZmyUPDW+m18Wp38xh57ic8B0MpE
	t5lTAqS4diKLODxZ4d2c0=
X-Google-Smtp-Source: AGHT+IGPIJAb6n7MVUXkK/sY1lEb6sUlZ2omnYjaBcbZhIBLn498o8u4JCPCZAwkTS4bxKhIRR7lfA==
X-Received: by 2002:a5d:64e5:0:b0:42b:3963:d08f with SMTP id ffacd0b85a97d-42e0f23179fmr33074672f8f.26.1764683699345;
        Tue, 02 Dec 2025 05:54:59 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d618csm32462903f8f.14.2025.12.02.05.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 05:54:59 -0800 (PST)
Message-ID: <ac51767a823e71a4779beee246c50deb30b57db8.camel@gmail.com>
Subject: Re: [PATCH] staging: iio: adt7316: replace sprintf() with
 sysfs_emit()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Andy Shevchenko
	 <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, 
	Michael.Hennerich@analog.com, lars@metafoo.de, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Tue, 02 Dec 2025 13:55:39 +0000
In-Reply-To: <20251119145751.00003a9c@huawei.com>
References: <20251116101620.25277-1-i.shihao.999@gmail.com>
		<CAHp75VdY7W8EgOfKuxtTALj777aVatxV5dqsxm688JTy=iVW2Q@mail.gmail.com>
		<20251116152800.4c1849cc@jic23-huawei>
		<34a55901fe0729145097d287a98746f23eea13d8.camel@gmail.com>
		<CAHp75VejBvRX=5psgVgGPCsKk7gVgcDUd1q3Gn+4_jyzk=2pEw@mail.gmail.com>
	 <20251119145751.00003a9c@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-11-19 at 14:57 +0000, Jonathan Cameron wrote:
> On Tue, 18 Nov 2025 14:10:25 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>=20
> > On Tue, Nov 18, 2025 at 10:17=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmai=
l.com> wrote:
> > > On Sun, 2025-11-16 at 15:28 +0000, Jonathan Cameron wrote:=C2=A0=20
> > > > On Sun, 16 Nov 2025 13:08:07 +0200
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:=C2=A0=20
> >=20
> > ...
> >=20
> > > > Applied, but I will note that this driver is a long way from suitab=
le
> > > > for moving out of staging and I would be surprised if more than
> > > > one or two of the lines changed in this patch make it through the
> > > > necessary refactors (should anyone actually have another go at
> > > > doing them).=C2=A0 Anyhow, I still think this is worth taking just =
to
> > > > reduce the noise of remaining instances of this.
> > > >=20
> > > > I'd have deleted this long ago except I actually have one somewhere
> > > > and it one of the supported parts was still listed as suitable for
> > > > new designs when I checked not long ago.=C2=A0=20
> > >=20
> > > Seems to be now "just" in production. So no longer advised for new de=
signs. I gave a
> > > quick look and this is far from being a simple driver. It would requi=
re a fair amount
> > > of work to bring it out of staging. So, are there users relying on st=
aging drivers?=C2=A0=20
> >=20
> > If there is no choice, yes. For example FBTFT is famous for being used
> > by IoT / DIY _a lot_. Currently a bit less since we got tinyDRM
> > subsystem with most popular drivers reimplemented there.
> >=20
> > > But I would assume that for staging we are still free to drop support=
 it?=C2=A0=20
> >=20
> > At any level, we are still free to drop :-) Just different conditions
> > applied. For staging is basically an "effective immediately" case.
> >=20
>=20
> If no one replies to this thread in next few weeks to say otherwise, let =
us see
> if anyone objects to patches. I'll spin a series in a few weeks and they =
can sit
> in linux-next for most of the cycle to see anyone notices.=C2=A0 It is ea=
sy to bring
> drivers back if turns out anyone cares and then there is some motivation =
to
> finally clean them up.
>=20
> staging/iio/
> 	accel/adis16203 is production
> 	adc/ad7816 is production (7817, 7818) - the 7816 itself is obsolete.
> 	addac/adt7316 is production (what we are discussing here)

I checked internally and we still have customers actually buying some of th=
e chips supported by the
above driver. Not sure if it is being used with linux though... And more im=
portantly, I cannot also
commit that someone will jump in to clean it up.

- Nuno S=C3=A1

