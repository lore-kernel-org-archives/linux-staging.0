Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3FB299928
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301181; cv=none; b=KLup8eBV8rBNjnkFttmcGaNYPqPcwUXdbVSDlUawVxAsicSJ5Drkt5UaZ/vpotrO/wPCIanToMVoJaks7/gxCG0nXntidUjtV/yJoIB5BxBFCs+nI1WR+2WxZ9ZdJAs5b6GUdkQJ8k6ovVoWwZD/UjB9xOK2m3Yju01KPP4zzyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301181; c=relaxed/simple;
	bh=phQkMRc9uXp6z9O4ml78EGTe1vFbrgTMKpp5BSSPlGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBeJlRDY2SsPyqPgCOcEwTCXG6PR02Du0gvYpAzegVBmEETuHsKEJV7JlJJoc9i8nbS+r8A87INtNByzxxpAjh0hb6TCTbPnhNMfvbx6cMeh9RFaFGEFWY/of4NcDuGQxSkX6FEzzjKGmViajgH1LZM4R2Hp2FNVSyVTCBnT7oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiVohmBU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiVohmBU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b872cf905d3so263045666b.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 02:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768301179; x=1768905979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMCuJOi1+oBIvIAI7NFLBlD0HNwog3LXejzEb0VUQdc=;
        b=CiVohmBUluodg2h6LgzckgDwQzJr1wDTRCKeC4ZPkufrZ7TP42QXO9xrmEUY3aAQux
         9yHiXZlcNHIIeZQ6tc8jRiQg68z1SvsrvJboNGCc3/hr5kGQe5o/s/oqR0w4BoqBA7Ly
         Vw6GducTlY1Snh9CCLRZ7O0RNwlWx5/AWK3ijy2HBKYUdXZqtzb8JKdpVAgZ2r5fzWK6
         jjdiP0T7MyUXDciEb5WrgqLUeGZTW+TMRYaZIX9hqt6GRuMeiS4i7R+SizKfBBhaknUO
         S56CV6Zi6MojUXpEpAgo/4OTwrGkqZ6HgO8IgpT71w1SheVb8KE+ApRy57PcnfpDBvgT
         B3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301179; x=1768905979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMCuJOi1+oBIvIAI7NFLBlD0HNwog3LXejzEb0VUQdc=;
        b=UKQlkTiwFOVYzOX+Pl/GsCq2XCydfJUc6ur9qBbzVIRe2CEp81qyIDkpnRrskVG0QY
         Q0WwG6d2/J8Zjqy2ybiUooVH7Aj3nuV24yQiS9w3pDpUYTOzGQa/SdwluB3oY3X3pBtY
         WCPOMJxQVaiP1+buLBFcI8rTCql+Y08Aw5eeUkEfX2POiwGYhtBseU38C4B6WHTKywvi
         6dHvWSj3p7r+awULBN/38UuL4syFb3DC3zNLliNWw3Fax86hmWuiPoPiMumADQl0Xohy
         SJxYreNocIhBlR/sZ69ZXOBipQHTjgJyuiNW167tJj8azRBVCc6TsaR1hd5TvEPey2Vq
         2R/w==
X-Forwarded-Encrypted: i=1; AJvYcCVhGEVAz7rvFg8kO+/H+vBKx/Qs8bfopyS52lqQjWwlRlp5TLNQ4Qv/5tRpE1SmdxEjdAIMseOLIVtRg+ue@lists.linux.dev
X-Gm-Message-State: AOJu0YzYPIlK7lo5D70SVDgrJlEHHHRkp2ZTbxovYIc+fe4A1nDcQqO7
	42gk7FVV+HHkFjNIPAz734b6eovyAEWRjm8AagFPWxG5pSxz0cUkiq6z0thMp7NWh1kLt51aoO7
	frN5tUiwCIjEna7yBPPR5jyZuFQV/W0M=
X-Gm-Gg: AY/fxX5RK9NrHFxappraWtK4PQ1FUT9qqlkxOc3iTbNjncgf8jywtO9bkZHD1I4YgYF
	NiaVKFeojtMrDlWjbeIt0Elxn/HdZsuI/ANEbX1IIb307IWhhrj6WU0wRvkEVTVST3UKtgjADZ3
	kbd+i/UjzE7HWqBY76EQV+mGnhJu2SqH8q/tTi4phDvWmaEZp5C754Xrr1oVeAAfw/wX8Ws2JwS
	7Iqyc2Q+rfV6YbKqapR3JBwjyal3OIZHZ6EhjhZrKXNga6xn95+bUYeCLI38/FoQGfFnWIVFExl
	o736NIQ1xo4omYurP1zXLX7dyAjy+JsDEpLSqXBceSQIFfVdPYvod1rhBKA0RnrsP+oCxI8=
X-Google-Smtp-Source: AGHT+IFvcKdJ0j5f9eQm3Qlk1sAfB7/uI7rC4aNzVw7Rb0zMuVIPNClTkUQbi7S1flZZwS91TvVPRBaeaxlwPmdgaIo=
X-Received: by 2002:a17:907:3c86:b0:b7c:fe7c:e383 with SMTP id
 a640c23a62f3a-b8444f2399cmr2165465666b.22.1768301178551; Tue, 13 Jan 2026
 02:46:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112190054.9828-1-dev.anubhavk@gmail.com> <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
 <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com>
In-Reply-To: <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Jan 2026 12:45:42 +0200
X-Gm-Features: AZwV_Qgo07UCug5OmxVy2XeBP03USTgg59_YqwKL7rGkPAp_1sKRMrW2Q8eDeFM
Message-ID: <CAHp75VcuO2qNeWLcrDqVfE_aQs=2ZiRB0CDxJpFquXJ6jd5eSg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
To: Anubhav Kokane <dev.anubhavk@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, hansg@kernel.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 12:37=E2=80=AFPM Anubhav Kokane <dev.anubhavk@gmail=
.com> wrote:
> On Tue, Jan 13, 2026 at 12:44=E2=80=AFAM Andy Shevchenko  wrote:
> > the preferred way is to switch to use kcalloc() in all three places.
> >
> >                 x =3D kcalloc(count, sizeof(*...), ...);
> >                 if (!x)
> >                         ...handle error...
> >
> >                 while (count--) {
> >                         ...
> >                 }
> >                 ...
> > err:
> >                 list_for_each... {
> >                         ...
> >                 }
> >                 kfree(x);

> Thank you for the feedback.

You're welcome!

> I looked into implementing kcalloc() as suggested. But the issue is struc=
t
> atomisp_s3a_buf (and the other buffers) are defined as list nodes with
> struct list_head list embedded in them.

Yes, and how does it affect the allocation?

> The driver relies on adding these
> individually to asd->s3a_stats and freeing them individually using kfree(=
)
> in multiple cleanup paths (including error path here).

Is it the issue? Instead of incrementing by a pointer size, you will
increment an address by a structure size, this is how + operator works
in C from the beginning (or close enough to that time).

> Switching to kcalloc() would mean the s3a_buf is no longer a standalone
> object but a slice of an array. This would lead to invalid or double free=
s
> if the existing code tries kfree() on this array element.

How? As I showed above you need to carefully move and replace
individual handling by a common one. So, instead of allocation per
item it will be an allocation per bucket.

> Addressing this requires a larger refactor of the buffer management logic
> across the driver,

Exactly! And that's what I think is the best way moving forward. You
will kill two birds with one stone: fixing the issue at hand and
improving the memory allocations in the driver in this area a lot.

> would you prefer I stick to the sizeof(*ptr) hardening for
> now to fix the checkpatch warning?

See above. As now I think this is unneeded churn as the idea would
still be the same =E2=80=94 moving towards kcalloc().

--=20
With Best Regards,
Andy Shevchenko
