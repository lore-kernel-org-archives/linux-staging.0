Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A4B23909E
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598420; cv=none; b=ZA0b7bAj6fDizJrkaBYP/XP19U76XCjvNrVvVcVlq+yymbQiYGOJpKG9Wj1T5CiHoASPkVnjmWUgbc6rC3o+taCewGzkYAsadnM9k0W0GT2qYlvLLIPegHAynjvSBut4NNP6NPV7AOjr7/ErMRMXK+Xe1NlvAkZ3S1+ydEnnsjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598420; c=relaxed/simple;
	bh=QWAHrdoHZQWrK4dNu2Qq9in6lH220oPuPQXNfKYeiJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deqUaxpcVOiNfoe+DNcpZFNrgmBNaC2QRY9jXFB4GVdKN+8SYl1yaG2wMM8rcHUBpT8jPpfm6zD9KNdI70cYetxtlu4k8tcPuA057mJ7LkbCSOl3zrB/zTXcLAB3p+ECJ4x+1pIHP+2LsNhxGVBj+hWumEVI9kwuk4X4LDkWjaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BB9zBEaY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BB9zBEaY"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso10836656a12.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598417; x=1744203217; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWAHrdoHZQWrK4dNu2Qq9in6lH220oPuPQXNfKYeiJU=;
        b=BB9zBEaYBqPtrxj1l+d22ywcqh8fOGw9PgKr6q0EKawh+KA3/KycXK167iLoJecuw0
         u+DJ5ipqB2rXFdfLuiuzSc5jr0+bcOn3t2oB6sz6MqmVROGcT2NWJJjRViRNGgGW5RAH
         HzGOGeLkf+dZgTGvbZeSHPEVpTmgCmGFJT0qsRrSxe1RyzIwetfk32x3S2ACD0Yh7tWR
         IU3pTxVvToTlrk3WjpWJyvMjVjwgKnRHqzLRWBGdZrfYHbusivfJnQNws7WbpGOuX4DE
         dodYMw4C3DDCagM+1rjCus0ShDLomFSPVxwFJD68yPyMjVM/PRd/XNybSk7WK5mlli7A
         dTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598417; x=1744203217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWAHrdoHZQWrK4dNu2Qq9in6lH220oPuPQXNfKYeiJU=;
        b=W8hJQG1qL+rSG9bwug0z45X4bTPVuk2nnfC6Q0ZQmqQ2p8imlosIZHXJDIuWNg4rSC
         dpu+PY/Cj2uOnz1E4z73qPCYgC7WaHWqBfHtiogxsS5CW1IbQYOtln9mrRxkZQsHgBck
         +8zU6CjlU7cyKUZwJNm5n+T6EYQUV3+MCE/Dg2KfW9Dp7Xkb6IFYKBnhTxHX18Cym51e
         jGUjhcaxM4SsG3D7025+Gh+HDWwpClazthgVuS7TYke/DdqvNu1kEw+X6ydVlURypK2j
         nOYyNERW8kcbbip00eFJa4uSo8i9owTd0P1t1jtuclIwcHHumqGC5FNch+w/nJD8NBCH
         7B2A==
X-Forwarded-Encrypted: i=1; AJvYcCWbsreVtPnpXtY6Vv53NzLXZv+g/ai3Vat1wlEaC8atS47EbiDRUTR9FlEyZCIJ0kXIdmlyUVu92lucis7u@lists.linux.dev
X-Gm-Message-State: AOJu0YzeBVHaTaUxYeN0gdhsz/w6Ze/uXO1BVplwg1iWGrmg01iX50iY
	xDgNHUoCcfgqFFJVpMFdYMi/mGdg4lQntJ9U+pANPx6bJOHW5S/TUeM84xHbgDy5DqGc+Cf0Jt9
	pGkkRKuu7McqSfrKyI/F5ZRzxfmk=
X-Gm-Gg: ASbGnctlpOKeM1aUD0NhIVn1M+O/NGLXHGkeEbM1AIwn4ZnP2ZQQRiQf/BLpRZdVK/q
	Fmz43EzPZs0iQ+d4wKRA0hkGBYIj1kygVlApw+Zl8vdpaU4ul2DN7yiCA6mHqQZwWEa5XxGay4R
	T6QRwjfyq1BHkbkTMjqckgw2Gsu6bdZ51ZkPU1AJY=
X-Google-Smtp-Source: AGHT+IGxDgr+/GaLpKlsw9St3w6GJvEPpvjphaV5hDOM2BUJ91HNibOwkf5Ij8wA/sKQqWEOmB+VBIEys451X/p7yBI=
X-Received: by 2002:a17:906:6a0b:b0:ac7:9937:e259 with SMTP id
 a640c23a62f3a-ac79937e35bmr225555866b.0.1743598417114; Wed, 02 Apr 2025
 05:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com> <CAHp75Vf4abzcNFwo2W-=-fOr1_j51RAUPxDbGNVX9F-Soxbs3A@mail.gmail.com>
 <CAKUZ0z+mqGwyEt8oem7gLMXbNp6D3MPPMXEH5GCdA4_768d=5g@mail.gmail.com>
In-Reply-To: <CAKUZ0z+mqGwyEt8oem7gLMXbNp6D3MPPMXEH5GCdA4_768d=5g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 15:53:00 +0300
X-Gm-Features: AQ5f1JpDktiw_Kd3xROZdIkDbnI11lgI5EHYRPHPVopQZ4eLDQiCWlbTGKfxrq0
Message-ID: <CAHp75Vdr9YO6GJmomumP=tksZfVj4BtDHx=Rb9Cr4gSQPnt+eg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: Fix indentation to use tabs instead of spaces
To: Gabriel <gshahrouzi@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 3:28=E2=80=AFPM Gabriel <gshahrouzi@gmail.com> wrote=
:
> On Wed, Apr 2, 2025 at 3:12=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Apr 2, 2025 at 5:40=E2=80=AFAM <gshahrouzi@gmail.com> wrote:
> >
> > Is it your first patch to the Linux kernel? See my comments below.
> It's among the first patches I've submitted.

Good start!

...

> > > >From d6a08153171ac52b438b6ddc1da50ebdd3550951 Mon Sep 17 00:00:00 20=
01
> > > From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > Date: Tue, 1 Apr 2025 22:04:25 -0400
> > > Subject: [PATCH] staging: media: Fix indentation to use tabs instead =
of spaces
> >
> > First of all, your patch is mangled. You want to use proper tools,
> > perhaps. One of which is `git format-patch ...` and another one is
> > `git send-email ...`
> I was using git format-patch but not git send-email which seems to
> have been the issue. The meta-data from the patch was getting appended to
> the top.

These are just normal headers for an email. They may be used by tools
such as `git send-email ...` or `mutt -H ...`.

...

> > Change itself is okay, but is this the only one case in the entire
> > driver (which is something like 100k LoCs long)? Even though, and
> > while for the training purposes this is fine, you can also think about
> > checking the common style of other functions, which may be shifted
> > with TABs, but still having not enough spaces or so.

> Good point. Regarding formatting, it probably makes the most sense to
> address these issues comprehensively in a single cleanup pass (similar
> to https://lore.kernel.org/linux-staging/cover.1743524096.git.karanja99er=
ick@gmail.com/T/#t).
> This particular instance caught my attention because I initially
> thought the author might have accidentally used spaces instead of
> tabs. The line in question used 2 tabs + 8 spaces, while subsequent
> similarly-aligned lines used 3 tabs. However, after examining
> different files in the driver, I noticed that while the formatting
> appears inconsistent, it likely exists for specific reasons. It's
> probably better to avoid changing a single detail without considering
> the broader formatting approach, and to treat checkpatch.pl more as a
> guide than the final authority.

Okay! In any case this patch is fine to me in case you want to send a v2.

--=20
With Best Regards,
Andy Shevchenko
