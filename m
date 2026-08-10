Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB1E399CED
	for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345658; cv=pass; b=aXCw2tMMRgXcvx6RTjAvTRu+oNs9RITp0z2gXazNS7I3iU3UVc6KLFPJiuEPj3LycW4K/zqSr3tWwKWwupFKdL4CvJlvrxnwLlg+KFK18wZLA7YuJf8/IjyF1M4kXY9CqZhwmcl3poPheS0zuRQFszooJmsUIy43gdehbWU40y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345658; c=relaxed/simple;
	bh=t0itK36weHoU2jtoEAt96DrFUj7FEsHjlM30gbeY12U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPjKPR3WcjwXkQ5KxRsdDe5WeXsWNCdkI5yRgOi7HJHcJLqB6Xa0mLQklxOz7bX1f0q6ilBh2nxViWrA7ZqQxareixlzGI2IgZuTTOMWQg1KHCT+IOb5X5BhqCdSxBEFUfs0FcHGdZ6nGxFs6RQposXpMIB7OI2+nQG52V+WJwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRk09RAk; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRk09RAk"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39ca0a30148so11989461fa.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 00:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345655; cv=none;
        d=google.com; s=arc-20260327;
        b=LbtxOjkGJSpDqhckaTVuTSxr43gPlqmUfyJ37BODYJw7c2w8/abuqIf1E7pvfZUDOj
         U6eqO5lHWupfZHI1HNl6rybcyq1E42hfgc+vgOW9iaI3d+LAxZla49mx14Dx6mY2Tc0I
         svhtTvc2ORDjB2k2KfyLDznhmzCuid1KtsG+QC2DHB9hII0/Gyw18icNJF9p7gER47k4
         K7081dtQEPT4mTnVPqhOyu0gcYx7TXnvkYAKUJ/HtRrp5lphVGs8bQeAXs6jwpQaBFq7
         JMYpZIUup3CWenLP/QMXu3t36JtoTY2n+5e+FoaBXbPxVtCgucre/+7UVDp5rRfhiuPg
         SI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0itK36weHoU2jtoEAt96DrFUj7FEsHjlM30gbeY12U=;
        fh=xuVTjQYkY2Q7pGso/KvP/DOKR0eYVC0RDcybgUAjQ78=;
        b=rjbT2EBqrRGCKwLvLll41hZUVLCscrybmCRfN9DeR852VImvCjdMo8g93wcjfn5DxZ
         9bGgocx/2VmS1I/UxwX9fZZ/nkkymaLd6BQQQeQbxfEl9u+rO8IvBFxaecVmb0Y7Udgo
         A3gQfIRFXcP4qU3uL9TnTGDo9igg0jFN4PIZfqPZZW2SwPxcfs9FCxxxWVAhzcmXDO3e
         527qebWHGusHGGQihfV2ZOw5dhpDmQMhENdnHgB6P9HAmIb5tRM4YDuvpzSK6+jBAUhB
         UcHWvGaCsx0vzH4mN+uaBrKURydVZ/iiVZkSqiOFDZrsuBEjf3PEOm0aCJje4wgjVgK+
         kZyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345655; x=1786950455; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0itK36weHoU2jtoEAt96DrFUj7FEsHjlM30gbeY12U=;
        b=sRk09RAkZTAheQtKOygTA0SBWtiFyfopASxzEPlgys0SPuROxEL8aIuLCszQi4W9iz
         ikuEQQ9bVvJk4zBzyQf5SpvmxJMkIi83APSRkAfGOhg2sFE0WGatqqkWdtVBMc7wDPPK
         2zho2QdOT0zLqrht/nYij9wIpscLXHPcjhLS7SnGYpkM2jcYRCzX5qg/stjzSTBzxaPO
         x7zKDPVlBzQWd2k5cW47v7N+smfXhrScIAoiMWmC2L1k8/K2Ui0Qbds1rNljwxVTnBpf
         rUlDF0o4l4aj2PDYkyPh/qtasuflDefIqZ0NuGEPCBVEdutC1aCEetYg6j65IqP1qOe1
         hnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345655; x=1786950455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0itK36weHoU2jtoEAt96DrFUj7FEsHjlM30gbeY12U=;
        b=ey1HLdRhlyYaVfCZe5Ofxlpq39V0iJEWAK4Hv26glKIy53BqnO+HM2prtnwE9v+nmN
         7EwaZASlZPi1Mb4mlRspRvYS0LVB28Og36f2X0XLu40prwcj+ecU7qOvSDpjV5ZCNz25
         uvFzoDsOcayyVw5Z4GjYvSrVHAVFtEThewVZm3YariC6Yd7V7bHFmkmi53r4RpImDQA9
         oq5jF+ddQMfoDP2MUU+JoW0XvUbFF7RrVUJdOnoubhJ4L0Xir6t0T8NVercDiCbfxk5/
         mazjpAdWGc/1wPqtZ31gDZE1Ms6lTtl77AiJXIKvNEJZM7vG54lQVGtiEEWENfFpuhDu
         M+KA==
X-Forwarded-Encrypted: i=1; AHgh+RpYlJ/jVxM91kJlgs0nh21+6a30Zurm1hTpqMwlJpCR0pgAuyOt9P62FvC58Jpi2EknUDFjfOoEcVhpbpDV@lists.linux.dev
X-Gm-Message-State: AOJu0YxrTDUM8EFOXsHBHzSON/tV7fXy2IoEY0cdX8KOP+leyiuNuY/8
	AWWHaT73aD08aYmBKHxcD+pr75rBXGAUr78DxmxQg5/1N2ax7VRjzLZiDUV9KpLNvkrKaYZM+9+
	asSg2aWO+q+f/f03mVkKkdAaq4EnzNkE=
X-Gm-Gg: AR+sD12UjV+rI6UYEnRmHuNcohNYTCl9EBKEgQwol69xVGau6IzeA8YHvPr/O5Rl4Ed
	gA2JKWgo8A4AkNhsVCHlCf2yay9zYHZ+qYhC4kWNWI67jvmEp8kX+yxWN1y4jkmHBEJd7l7iJIw
	lVftTeRGPvNQwX1QfHuvXvYzZP7iAfSmuZ4ioUjO+jVEZEOjw2SjEK9XMXgw1MWFBx6Zu++0fuy
	4ix9NC3Hpmu6cmuzIScFaenrkh1rrfC1PgcmfsW2bnAn/5Ay05aOBsvxDkv68Gm20ArtzaANCxk
	Nmx/1WXZaC+Fx/QDO6CVyPCsSdgfItn4YPh06+jmWXJ04/GIw/Bv1OQ/aL3XlakCHUlg5+olJNS
	rine7LsEXF+1c1UQkPb3QlvGYSZ9jyJISWMmLY60wur5fb2MXdNdZWz7osli9XRtMjODAQOT3Zs
	/zr8RXOT9kYTWAK2zcuqxc+YfV1V3MTsoA05W6NZrUpQ==
X-Received: by 2002:a05:651c:c8d:b0:39a:cfe9:247f with SMTP id
 38308e7fff4ca-39fbb301b83mr46526421fa.31.1786345654462; Mon, 10 Aug 2026
 00:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260809053253.14537-1-amballip@gmail.com>
In-Reply-To: <20260809053253.14537-1-amballip@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 10:06:58 +0300
X-Gm-Features: AUfX_mwVA-ExyPEAQSrd3nXoSIktRzqRF1T8EbwlfOAr0G0N12s_EaUlhji3NvU
Message-ID: <CAHp75VcFkgrcBKJcvm8Br164MA8jM1xRKahBuZ-WPgEBwfi5Fg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Fix wrong controller name in fb_bd663474
To: Preetish Amballi <amballip@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 8:33=E2=80=AFAM Preetish Amballi <amballip@gmail.com=
> wrote:
>
> The file fb_bd663474.c is a driver for the BD663474 LCD controller,
> but the comment header and MODULE_DESCRIPTION incorrectly reference
> 'uPD161704' =E2=80=94 a copy-paste error from fb_upd161704.c.
>
> Fix the comment and MODULE_DESCRIPTION to say 'BD663474' instead of
> 'uPD161704'.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
