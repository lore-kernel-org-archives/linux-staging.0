Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C817D2
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770541227; cv=pass; b=cxZH8jtcwensb/B+vcIoeedzVfFyX5HwtOVvyR5yp4pwzqIUQNpcuF4yIxrTvKoJ4EydzPuO89t5zrLvdwwbodEVR9hNmAvWvsjvbKUpq3oXmvhoD/1ul+qW7sy62XBtsKIyFcurbeIa7oD75gpychyex5172C5//PP2Woe1yzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770541227; c=relaxed/simple;
	bh=doKgaa+dzfP6ZAfilXRbyF8jip1cO7yZUZC0bQvgjTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpQTc3jWm+ijf+cgoR1ej1dxZbXAigzpnPzTCK3QqGBgxatiT0j/eHGIHDVXDNI+etHKtLiwKkAv04pLi2fR7Bk2Dsf8hUkFBsv3tE93iHgnsGR7VvgYeLnRy7Nx2OqfJHvw3elMCxX9KtgA9MRtT/md72PVtNQTrlY6AJ32u2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmPDSY41; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmPDSY41"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359228b7c6so1192312f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 01:00:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770541225; cv=none;
        d=google.com; s=arc-20240605;
        b=T4Zemh7r/HWsW3T5nvZMybujJpoVGxO6dWThW4OJCiGREaRsbYhGUJ4UmSA3n0oi1K
         rfz9h1doDjTfowvHEqSSlQrVhJO5yQ8FnYX7Oe2SVsBBr7WdV5D8Xka+wZ/dZFar35Ie
         fmVyt9x8Uug7CIYb8SysUxeNocL1siMQwqtrWl9nTY6lRBERqDvmO6bELz+F1XHiDPaK
         gYb6vFF+cmU/8sD/kKmHqYrJXu/GTtJrqLWyspgqA6XRRgJXIwuUb0RsgWfv54r5eS/J
         QlhQ48cNGCSireJIpjZ08otNrjNqrZu66QoPt2JuPueXjc0+3z532tNdEjMO09xdLZVq
         dVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=doKgaa+dzfP6ZAfilXRbyF8jip1cO7yZUZC0bQvgjTI=;
        fh=Fl+jHDw4l7D2/oSRo5KeGFUusNbVTD8FED3DfLjo1Kw=;
        b=Lrrd6qAg7vWZdwRr4JsJFBawGtyawk29hUuVGE2yftXcBzirZ7W2CfuvmOi4x6QjVt
         ozSk3PMGWsAa7cWgwwFs7KL7KKkm08ul+f1/xTKW5H0zHutI40ZgAue83d3IcKpc5j3a
         wvBdIL1VfyIQuxMf87PrNQ8zk1AuT2zt0ps9YpX2a88oBTBKWOn0v6/7AC2UeEnBSYIa
         9iTerDwig5qs5bfgpBUrGbLKrYzaFJuck5i4G6hR3I2sVcHfg/UB9NAhYEFaW9spCam4
         2f/VLxorHWpHRwRr7H+Dgxr4afNPV26Oa/sqN3XBQjVCMHZ2wlTbK7+S999R5yf5Hk6j
         bG8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770541225; x=1771146025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doKgaa+dzfP6ZAfilXRbyF8jip1cO7yZUZC0bQvgjTI=;
        b=dmPDSY41/Dvu5hff7yG1AsqezZ+cTk1HWDjl0im1K/aBtnMwmiZlyns70fGJbcCgzf
         O8xSq8HtnQsmzXfWph5QM2jpSnpdeLVLLyd67/xzl1MjC+g6WxebGff7u/FF8cAfDCN9
         /Fyf0R5Xz5Hlqxsm7k7wResInknIBdpGXA5lbyRUcgdJW3O33MksfwkV4+UXIx3stxQ9
         eg7pNEXnnJxj0XRqJwXf2q22Q0X2xGgVtvsMojbDkBPydnmAV/zhKq3qq2VkZvDURM7R
         4RJbCjdTu9B4yR/rXRN2xOKcV5IdILrfLWwBPTb/4K1mkNLrUUlHQ9rHT/nJ45wlPzwA
         V+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770541225; x=1771146025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=doKgaa+dzfP6ZAfilXRbyF8jip1cO7yZUZC0bQvgjTI=;
        b=OYvjLFRkTuW/iQpkqw99Mzanf4M7ITEuV2QXnI3DlOr3/BM0DZTOPfVs2F33U/Gy37
         vTdGWAE147rHDhq0riOnIzlHPOMVZ/7goB0J6lsDSHOIwAh1xzC/TNqc0kqwu+pxERzi
         Dg9qRc54KLO1pnq0RBqZbttRtmIy/ZznQhx4nZv+G2CJBuzXPG0awlEVHQd0x+wzSZdR
         ALvOa0PHjNUGd24Mtf4Uf3BupCpG3xikRr/Xm8AwKp4nwdMhOj+ulDdMXgL0uiDzr+nL
         Mz759Tu3MntxKrenQ2spVbv+vfr+ka4r/5tVHHY6YywbnjvQ7lhRSNEpE9q/yLLtObvJ
         z6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUC+kEJq5clrAUnpCtnaNZ1+Q8Q27vnNGvK6kj/6lCVI5n4E7p0MqXVGXynLnsaGs9p6vt7giUULltqI32D@lists.linux.dev
X-Gm-Message-State: AOJu0YwVDoxIrNCQlKMppLJEDGzWwndiOBNASrMz9ZGbLd2alHdbLdO7
	MuEy/U0P8M5/d90ywk1w8JcFn6MaFra5gQW5IQRWjWs52eXP65RmmvdU5ZwxH0iWtHMiTzHA08k
	o2fR+9Wl8ScY8xjXWOyCJSdoHgvXGhtI=
X-Gm-Gg: AZuq6aL3LubpSfjFZKqmcTKmwNu1SSs0m5IZl18CXMsNlMaCSm0b3guftZnj6O35Cc4
	rhdTX7kzCf4F0LMg7f5aArQRvyP9MwveyizmSHaW5ftd/y1bUNEk1ZMR2wXymX6qcPLpPvj6ZDg
	Wx2gDKzbw3BYAh6KieCeRel/+S2cYInpqQV/Rdpbo2vWgWcgbS8Eexy9pn5cvKZ1+fbdrwseo/7
	ZVl6bDYVi/kJtJyQvD2Hie8nGecdDO+O/jXwvrL/vR4wmcJ3XFnctVTiiTono8VavvYruQ=
X-Received: by 2002:a05:6000:24c9:b0:436:145a:e54f with SMTP id
 ffacd0b85a97d-4362933f8edmr12042827f8f.24.1770541224721; Sun, 08 Feb 2026
 01:00:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205224210.64920-1-nikolayof23@gmail.com> <DG84GL1LMAA8.3KOO3KZU1N2JO@gmail.com>
In-Reply-To: <DG84GL1LMAA8.3KOO3KZU1N2JO@gmail.com>
From: Nikolay <nikolayof23@gmail.com>
Date: Sun, 8 Feb 2026 12:00:12 +0300
X-Gm-Features: AZwV_QgncAoMIlQmpJgUWCXCFR785gkPnuDk0xTHNi9L-JXLEZBozNwrSIjiYZM
Message-ID: <CAJ2_aBDYHcJLwQcuLKAvmb_kMW30F1UJM0mcPTBie_99az23KQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary boolean comparison
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review!
I'll fix it and send v2.

Regards, Nikolay


=D0=BF=D1=82, 6 =D1=84=D0=B5=D0=B2=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 22:22=
, Ethan Tidmore <ethantidmore06@gmail.com>:
>
> On Thu Feb 5, 2026 at 4:41 PM CST, Nikolay Kulikov wrote:
> > Remove explicit comprassion to true in boolean expression to follow
> > Linux kernel coding style.
>
> You misspelt comparison as "comprassion".
>
> >
> > Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> > ---
>
> Thanks,
>
> ET
