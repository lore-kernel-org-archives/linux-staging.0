Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B85315D3C
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003635; cv=none; b=YwXay9sO2iEfiVGlNFYaxBelDyl7JIht4/HfQQChOMBgFeNly/Ctu3gNCxAhgBncqO3PbO5tSyCpzvKtETHAGxym1r1IAeHbLg4RtSIROuceyJQp8SXqzw3EscE5rokl6SQideVeCY+XfVMRteHmXrAPJlq9Isro2JotYd5Q5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003635; c=relaxed/simple;
	bh=bMzJDYcnLhpbw+Ii34SLMl4UVUweCi49Jx8FihureMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXruUU4okxRsGfDs7UoauO5qAtpK/zY03GxsFCrW2cllbUrlpBxHUDOa/c6e0+FfRYR5kErL4fXMCjOsG/fM9Eu9MyGV3MbU9qHcuxdpBf8IazFOm9/5tj1fO/dxXRQfznBwBho/+5cFBKWQbjlvq23MZOWGlvyelHogTEf0xUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzxXmQ6h; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzxXmQ6h"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2e0a2ffdaso84741185a.0
        for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764003633; x=1764608433; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXlGqJvXSQQJPZv4dGz/Np9RRI2lVTjRL7zjO2Gm1lI=;
        b=QzxXmQ6h6px4PDdwJf9x7gVBI9LKFObeJ6EKZV6kaNVLhUXedvRvf4goMPpWaWV0w3
         ikbDeprvnHWzyTfV4f8ojJdKMEW+OmWtAtrKvwQGBVMLyrJ1eFC9KxOnBHTaDn049ti4
         DwbKRUX515YndMK8815lj4+Rw8SoDtUDNVU4uGXOmkah7ZyEz0mCfWmwbrTjGEje/5iA
         G0BeQGOHX3iYqHJNW7DiWSVAs7PQ+0NVClemx0nTCdOSNy52jlAJyUB9rFSxqm91W+gC
         biRL2WDk00vAR4zUM5kY5mquY06a7o67IA6DTzaplqVwAzsttLXPpvlpi1flmZTG+eX+
         EbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003633; x=1764608433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XXlGqJvXSQQJPZv4dGz/Np9RRI2lVTjRL7zjO2Gm1lI=;
        b=dwFThnViOE8JEub405h0qpAYtZOIO7a52q4h6DOncp8JWGSRO3XSgm+/Ncdyej7Yax
         H5ZBl4TDk+51aXvySrE734tzJXTmH3oMNE7WAJaavSmromjJDXtbQv5HuYDeQO6PSoVn
         QktXFMj/kNUkdB/iu5ZQYA+nztNQE6WNjPpbMqNnAK2iw1PC4WVk2qvnFgndU16wgG8P
         MxP+PLZO/AP2Jc8w1nAmVbUMLvCawLat6cjOspBpAYmfZet4SvYNqTloDvtVrOfZrDvY
         zg32QcqsdjcAg1FVF4o8aLolH+QIiJK63uYG4NEd5MM+KztZhHDpSwop9gMx0p21rMxY
         g37Q==
X-Gm-Message-State: AOJu0YzGeITh5f2Y/TdSVclg1IePWFNWuf24dvNJZhJnRXeSfnKPssDT
	Tldb0DxX24750WFvDcSEv+hARDyEP/tIshlHCCmMHCSaw1RzV1rPUIt7J6A5UnSGGy/ef6D2j2q
	XgmhJw1z7C8fZgYMjHT6KwILuKKyfBTs=
X-Gm-Gg: ASbGncs3mKpvn4sCk4hX5oi89+wPAe3+82X/CA5WD/fP1ysBEpuUcmvSIZ4YWodv4+L
	Rrrap0ll3s8mQOTzrYb0TzQxZN1dYSxjpxKn/Sbh+TR3U83qU2/Wu6vO6dC71+fVq9GyUOcEPZf
	FKKXfQUaDqy8v6vA188YIlcnl9QILS3g5u3XuqOqzaDYpjdbOAEwntltgZU7hxbMxelRXuAjLzz
	bXLYny6LiEworuEeC6D8wxWajaDRhgLthnIj3NyVt5N+/jsA2rsYvK9r78+wDnsvjcNUI88tKBl
	TZmLi1c=
X-Google-Smtp-Source: AGHT+IEE2jySGDPbeFVR68O+mI+KRyehlY83xgUckBuPx6EF3Ml3JPJ6MeN6KbH2r3sLYMYqIgabHxMMGtvyIREsgF4=
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4ee5883a43cmr122500291cf.1.1764003632271; Mon, 24 Nov 2025
 09:00:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117092020.8473-1-adam.quandour@gmail.com> <2025112415-suitcase-console-5b2d@gregkh>
In-Reply-To: <2025112415-suitcase-console-5b2d@gregkh>
From: Adam <adam.quandour@gmail.com>
Date: Mon, 24 Nov 2025 20:00:20 +0300
X-Gm-Features: AWmQ_bmcA-iJc0OO6kLbpQWwi40_KvA2ls7WSGdYLC4ROoHFv9l029yllVFeMTU
Message-ID: <CA+jnL0PugpSN3XNnUe+4aShshT6J-HScGeTuVn28xv+=+7NQYA@mail.gmail.com>
Subject: Re: [PATCH] staging: gpib: Clean-up commented-out code
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	niharchaithanya@gmail.com, dan.carpenter@linaro.org, 
	matchstick@neverthere.org, dpenkler@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, I will make a new patch then. It is in the same place in the
master branch. I should make the patch from another branch, right?

On Mon, Nov 24, 2025 at 7:54=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Nov 17, 2025 at 12:20:20PM +0300, Adam Quandour wrote:
> > Remove unused code.
> >
> > Signed-off-by: Adam Quandour <adam.quandour@gmail.com>
> > ---
> >  drivers/staging/gpib/cb7210/cb7210.c | 12 ------------
> >  1 file changed, 12 deletions(-)
> >
> > diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpi=
b/cb7210/cb7210.c
> > index 3e2397898a9b..24c61b151071 100644
> > --- a/drivers/staging/gpib/cb7210/cb7210.c
> > +++ b/drivers/staging/gpib/cb7210/cb7210.c
> > @@ -1290,26 +1290,14 @@ static void cb_gpib_release(struct pcmcia_devic=
e *link)
> >
> >  static int cb_gpib_suspend(struct pcmcia_device *link)
> >  {
> > -     //struct local_info *info =3D link->priv;
> > -     //struct struct gpib_board *dev =3D info->dev;
> > -
> >       if (link->open)
> >               dev_warn(&link->dev, "Device still open\n");
> > -     //netif_device_detach(dev);
> >
> >       return 0;
> >  }
> >
> >  static int cb_gpib_resume(struct pcmcia_device *link)
> >  {
> > -     //struct local_info *info =3D link->priv;
> > -     //struct struct gpib_board *dev =3D info->dev;
> > -
> > -     /*if (link->open) {
> > -      *      ni_gpib_probe(dev);     / really?
> > -      *      //netif_device_attach(dev);
> > -      *
> > -      */
> >       return cb_gpib_config(link);
> >  }
> >
> > --
> > 2.51.0
> >
>
> The code has now moved directories :(
