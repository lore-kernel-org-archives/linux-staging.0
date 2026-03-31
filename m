Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6A640DFCB
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940720; cv=pass; b=u4K/hwDtOi9UsNYeVb9NdwREEPH4jdO+ewFbznycDkENz7kyh4EnFVbv/N/Te2xnY1JvLg5vtxVConNYHuiF6kPb91E2PceSwtpcT0UK6TbMdDJlLla2dTV+KcwPjH9owqiN4HfPm1a5e6rCe+ruOuIorPLGK/6ZFJEuoSyky8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940720; c=relaxed/simple;
	bh=csqNooH5rM+TOmTU+fGOgxtFFiac2iCUs8mRIqAjjiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkpH4WxGNn3YQk+0YIMDTAM8OUUpzZ4o6iz/cdw4QeU/Ppgd5Y2iG3yeB3/V1kiHqtguD2ipnHI3wxRV1aYA587I/RVTQrg63M9bXedin5KtsBvOzKyORRuSw8x5IBHmrp+rwEN8DtlfRCJLhzmtv3Bv4XCf3vkteaKk7L4rRv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMGw+jfc; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMGw+jfc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b980c65b97aso795849066b.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774940717; cv=none;
        d=google.com; s=arc-20240605;
        b=FWSH/3GRT3Q2LDTExKuPs8oFWpfwOHzg9sD5lSzSHlLcqCrlMPqCFXahjBWxAG7VuW
         ic+glz2QAP3bj3F3ujhe2WBAfNozhUUv1Kvh9mAmGneKVLq1SZF8wEJCMj2slt19tq3g
         e2EzbVMIeAlD+/4aFyGMfIm52zK/3ikdG42CVd1Of+B5cEHTfiDNU1PK/yi1nuhAzitu
         pmuldEU+uY0RwWFtlPqXIYpwXWQSbhyYct7bEQaSh4iE7+WMKb9DdFZRELvtxhmwiAR5
         lsAzpREgR4F3NddJ7zBz0lj/iQw12VrJxoNmNwQEc1OIrX/9lzSOrIPqcafij0Kxiau2
         wmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f6oWF/dNmQ8jzZYTNaItWPQmXNUN9mQoakFiTwJhUS4=;
        fh=BHISQwWtYOvwntOkacD3yqN8i+6yhrWnJI3S5oxxafo=;
        b=BigB/YxHhPwjmAgBci4i61sctIueCYJx62HHWiAKq8r8vDupXLE9F1fvsp48iLKUyJ
         GTD8DSFLQO3teQsTUyaGQ8PPM7n5i4OKWuVM2h25+ArccqnvrJVC2S9g1yPbtJv2G+NW
         GuMUCgL/e1FOJ8PJFQleBUabbZgToFTDYjlN045isP/DYkuzsADCsCSgIxj4hHJ0kEXN
         R7ey11a5jLbcygiNRJK9cGsEFmjfSGug3luUSubSRFLfRsCJarzRxygP/WHjmuKBbr06
         /EsonDSjRcaFcOtTWG28snvdu5lAt/gcw5Lhw+ULj/EuUksqyH2QZlvrRmDBpbAt+GSj
         tifw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774940717; x=1775545517; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6oWF/dNmQ8jzZYTNaItWPQmXNUN9mQoakFiTwJhUS4=;
        b=QMGw+jfcnij927q5hWX4Uirou74mBqxuUYSIdJM1PdPbr4yHH4bbMxrcysU43vnV1L
         vKkMVn8J/srH73GSEzkBgu5eaXsNW4kE+FHCyhDIsE6QYj1ceupksdKT98SopgyRK0vH
         jIMcielQmoxy8SMYNfaXJVxyYfgtDDaMohUWuvwmaH7eTlucwslt8zInUzQ5zuPwlcjc
         ZBbGdgkdzyp2YduxrUrDJhSReRhaI7ipGMFCHjZfXKwp0+XR8DOZNf7H8D8NXZI1qg1G
         2kNLeJZiKHbRcaj/ygqDUMJC1et6LUfPkkq3AkrYklIzWr0wiy0H7L6Egsx/W14n8Jmt
         2OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940717; x=1775545517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6oWF/dNmQ8jzZYTNaItWPQmXNUN9mQoakFiTwJhUS4=;
        b=VOPgL72G9N2GdXkTEBW6NcN/TBX/9+F8+RtNQ6EZrTKd515MjqXa4yb6kVJMj4Ljxh
         PxxH2mhO4ru7uq4tZJnoVbUguBJzFlkeao0KhNgfomTDL0M3gK1O/CZ0BuNE7wStpk6V
         5kRnn5cN4L3TdESJSNGgvJcjGfUBPuMtPgEXKfdtarfkAyLs8C79gzA5cFBfdj4JopHt
         +6sazqX0/PV259IKJ0/epk39da6fq81mRXkpznvTgYAF5c9CJw68yljYqyys3b0hotyD
         cyJxi6qP0/Qwv6gvsH1r5DeMeo3rRbludynpuxmp/Btoymg79od9afsOafX1LbmgIGNE
         lN2w==
X-Gm-Message-State: AOJu0Ywe/+LEfbwsqHr8NuFPKTtwK3BaA+HD57C2aJj85kHN6d2d8a35
	w+BDuqg7+t5XkMvl8oX7095yTcU+IyZPuvcjbsBBNJP+qvijYiT35wxudvUDfVYFQgyAibKBptA
	qOaDLl4YkbwyB3LlJkuK6PzA5nAB+Uo4=
X-Gm-Gg: ATEYQzy/Nts3eqtf67kXjdorS4oFakZJ9Fa/ybLyIGVutM1N4IRHjqb6qv7WOHu8fj3
	RTXAp3Tt/VSkDmMeKN0e+MufAipt1gebMsbItMK2J4xB4ZkyiE6eMybCfv3ToI89R6zHTJIU7C5
	Af3Wr0u9D39Du0VftfsJqEC2Mja6E0jVArJL86UShR8DqUpsOz/42aXVQhBdkZou6nl8JWMB/gy
	R9+FDbhdzYFoN33ZXM+l4U7FEOBCNqFmOhoowGdBvg6ao2OEfeinWhwTge5a6GxQqokqj9f+Huk
	TASOGAiC3wJUloc9eEE91FKuwNT8vXdQ9VK2EJlKhTx1LKhymLMVU+vxrIOZlhCfgyHUrTg4EVn
	kruJ7IcA=
X-Received: by 2002:a17:907:706:b0:b98:6177:2f16 with SMTP id
 a640c23a62f3a-b9b509b401amr1011236566b.53.1774940716834; Tue, 31 Mar 2026
 00:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328192721.255493-1-azpijr@gmail.com> <20260328192721.255493-2-azpijr@gmail.com>
 <CAHp75VezSSid9b5qNzvMjUS7QTJaKtBhhVVnuS+-sjVe_a=CxQ@mail.gmail.com> <actfdnYcTbqg0gvW@gmail.com>
In-Reply-To: <actfdnYcTbqg0gvW@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 31 Mar 2026 10:04:40 +0300
X-Gm-Features: AQROBzDo9NurmTjppPHO4AbpzhYBNpRMAu0W22hgBHxEng4PhZxNcp1LYPgrSWA
Message-ID: <CAHp75Vd2ZywQoPGvLhj4dAwcB7otKAcncuEO6cN9YZJXYM+=rQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 8:57=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
> On Mon, Mar 30, 2026 at 11:59:24AM +0300, Andy Shevchenko wrote:
> > On Sat, Mar 28, 2026 at 9:27=E2=80=AFPM Jose A. Perez de Azpillaga
> > <azpijr@gmail.com> wrote:
> > >
> > > The function configure_isp_from_args() incorrectly dereferences
> > > args->delay_frames[0] to configure cropping without checking if the
> > > pointer is valid. However, as noted in a FIXME comment later in the
> > > same function, delay_frames can be NULL in certain pipeline
> > > configurations.
> > >
> > > Add defensive checks for both delay_frames and tnr_frames before pass=
ing
> > > them to their respective configuration functions. This ensures that
> > > optional frames are only processed if they were actually allocated,
> > > preventing a kernel NULL pointer dereference.
> >
> > Have you experienced bugs IRL?

> not really, I don't have the hardware, but while reading the code, I foun=
d
> it to be logically inconsistent. imo, the comment is misplaced since
> delay_frames can be null earlier.

Don't forget to mention this in the cover letter.

...

> > >         /*
> > > -        * FIXME: args->delay_frames can be NULL here
> > > -        *
> > > -        * Somehow, the driver at the Intel Atom Yocto tree doesn't s=
eem to
> > > -        * suffer from the same issue.
> > > -        *
> > > -        * Anyway, the function below should now handle a NULL delay_=
frames
> > > -        * without crashing, but the pipeline should likely be built =
without
> > > -        * adding it at the first place (or there are a hidden bug so=
mewhere)
> > > +        * Safely handle pipelines built without delay_frames
> > >          */
> >
> > This comment suggests something different. What the proposed change is
> > doing is just skipping the invalid data without actual understanding
> > of the root cause.
>
> you are right here. I should've done a deeper analysis instead of focusin=
g only
> on that function. looking more closely at how the pipeline is built, I fo=
und that
> these frames are intentionally skipped during allocation to save memory w=
hen a
> specific feature isn't enabled.
>
> the configuration path was just ignoring those enable flags and trying to=
 use the frames
> anyway. instead of a NULL check, maybe I should try gating these calls be=
hind the actual
> feature flags in the binary info.
>
> if this is a better approach, I'll send a v2 with these changes. :)

Sounds like a plan! We would appreciate this kind of patch over some
mechanical cleanups that flooded recently to this driver.

--=20
With Best Regards,
Andy Shevchenko
