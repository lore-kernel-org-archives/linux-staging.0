Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED938D00B
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523452; cv=pass; b=fhLj6SYw+bEZP7BoxgAGosHdF99pTF7wIh+5yXklSAqq77VcEtWDvyEocvij8nDQxNJVJp40D0xM36xrK0nJjZLdDxoEgN0DlBZZPLxtMk5is+uw6ajDhtx/d09EpLyxbhS7fipWrzk97eZzHqC3WOTS58JAt2ZyMxl3Ut63xI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523452; c=relaxed/simple;
	bh=j5a68+dYfBSv2UQUPGCx44eqmx2puegEe786FIsiurg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRQYeWryBEbbJpFjBk4EU1zA6fd/oUrpr1qQDtDvOCCBFYHoZGCuzrj4JwsczOk76Ad0/yVuaPkWrsgW47Y0t55BBwzv4aWD1uGLX9WT65vC/UFxRwLDpMWGD8p1GR7musdJ9ZwZKe2ThwG1UHESrVfoL/Z7nobVV6dK3mQ8GGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TP9MtZVc; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TP9MtZVc"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38c51c8e055so6925701fa.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 04:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774523449; cv=none;
        d=google.com; s=arc-20240605;
        b=bWzuJ4Z69jCCnyYOLaFdfuB6ShPke7tlXxEiA57or6TPUpHdbDJ8DWnmKQ2sNfB2zn
         scVeVuj1nOZdpBwYi6QqWdfz9WPhcOKAfCx4Ky/q239F049T6rMpaCNq1E04p0bbMdV2
         +YhMgFip2QKXuECYTC5EWmOlOCSZCvHCSAF73szwpUHZTvzsQZSFEk0Xfb9RMSnErD/a
         2M0ku7vzMTROd/U/oUuGZ7aFK+2qtrtiF/duUUghCbXny1XOij6We0fpbN5jFHLYVEtw
         3hONIGwfjwmhRh7ifkZ3WM+c0jT/z5+g+ZX88ohUciFqtBOBqryt0+QAEbyoqvlugatb
         C4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EAh9AJYs3RAWlJ+trsGE5Mdgk0XFyAOmvcavXgVU8t8=;
        fh=bg9gnrBx0PWuNDzb5NA6bMP10LzOq2vTbdgIiYSjM7g=;
        b=KVnyuoZ5il/yKg7fJF6nFgWJV+XAhUBA7zBujupS/hJ0Qlbe9jBV7p2Skf1ZAkBDYh
         e/z/pEDWwD9YMwRQvboMAGf6FlDbNcsfAQz1BwLEk+REMVkvJ0dlM9KmJ5xAd6iJJ/w1
         /HajFkOqXL/Pk3ctm4XFYKgXeY1yGhss2hEPa7+1wgNDSH9/MO0jx5e61uZ9pjMBKUK3
         obWFbmZXm4o5B0W9dIHEFpTQzJFKTv0nc2nuNBZypudTe1s2PvOmp5rp6UxvvCxHV249
         d31ZD/sHWFJnhezY7l2SdYS8RiMnxOxkkM4/TuipDf+vg0jqenTvUDCFIRDoOITDUMtw
         H8qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523449; x=1775128249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAh9AJYs3RAWlJ+trsGE5Mdgk0XFyAOmvcavXgVU8t8=;
        b=TP9MtZVcplyV9ZgdGPEyN4dZ7nEbnkOnjSex6Qxr71j34WdlXkGP5QXx8tnlehXM1p
         Pn0NGQfJlz53Cm8reyhsXGh1ThTw0youarSGPbu77nDZvhyIqwoo2QKzF9yn9Qa2LtGB
         oBBhkzlf6ZSPldtSZ10/b9VxHaY6kTJGtljg8nngx9J5RukUirAKWSiiAL5s8BjG/7jj
         tMijEfMvsIlrFkvzZbpUKhMrglIpBY9kA+sCHyN4xVkQ4ZojKEGcwl/c8pE36wfkA8M0
         MIzc1VFGv0uYvi6h6J/ZfvJwS78DaN0VXH4z9AVK1BTwKOarxqxw/l1IaM+yq/tviUF8
         G9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523449; x=1775128249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EAh9AJYs3RAWlJ+trsGE5Mdgk0XFyAOmvcavXgVU8t8=;
        b=Hb5gaXRU+iaSceEOm2j0eT5zXsd5dPLlCLqcafmAvuy2Jw3O9acNMdRmqI6yoJArR/
         aBMXNXbnQjfOWIGvq6nrPqpzJZY+DxJSYY/HWv0cIge5BFBTyeszAsLsDpMIwVt05h4a
         f/0INXBI26YXnGvvryBnomG5UoRJPB3qnLZCdM4GyM985qvmpdXfmJoZ7nB1Phn2O+Zb
         gmUKXNVX4EjsPeBYorqZPWO4i9JS5Cx5gu7FXEUag/LqKxdFwQPkxvuEo/UAyyfNm21A
         Dn1QbM+kyCrDdUgBf7oPpyFz+DXJfXdAqBG5XHxfjHkOv16bokQtiCVLxBG4WN58vejb
         7XKw==
X-Gm-Message-State: AOJu0Yzrtt0wtsR7Z16agME31uM6XR5tCYw/PqFjhPJcN3FbVxXFTKhs
	c8Dz3zD2NSFRY8dmVuqdeQb1HFuuAtCF9NYUFkf66HCgoxN+evnylioMAqsIj32Ai8jZP9uoI+8
	k9dyWtUV3gK70myg4l/bRYo30sxeZQac=
X-Gm-Gg: ATEYQzw4uJhWZCYs+ME3q+yDkNE9BDmqAUPR3IloB7wZiyG5ERLW/bGzJ+2IBU4Vmwf
	RCUxLoPPOrpBY09bVTtxx760oYsBFPsX0Czh5MgDwIuu9QJVjgjaO/7aeNwlcikPUWbehkhjLRI
	dIHzK+HbNMbbtEDdaSD9s2bshSvrleU+ew91x4+cai2TX2IgHRx8WRLM/FjzFyuFP+2L/yGm+qX
	SpEib6KaWstFsuPsYQoAINL+Q4qt1P+zRWswI3PYLw6yNG7r6h5ciZFGGtT8rH6vAhIscNGc1Ji
	U7v7Eb+eiVt1nBtF1QM=
X-Received: by 2002:a2e:bc15:0:b0:38c:331d:94d with SMTP id
 38308e7fff4ca-38c4309f7e6mr25482441fa.6.1774523448226; Thu, 26 Mar 2026
 04:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081627.5841-1-omer.e.idrissi@gmail.com> <2026032638-spinach-spirited-48f6@gregkh>
In-Reply-To: <2026032638-spinach-spirited-48f6@gregkh>
From: Omer <omer.e.idrissi@gmail.com>
Date: Thu, 26 Mar 2026 12:10:36 +0100
X-Gm-Features: AQROBzBbnW_fPApDORT38sfWR0VIXxCTFjJiLr43lm7Tvjg1xwwDswGTlzKepfE
Message-ID: <CACx49NdOyb6cCEC-T2yNrv2aABtBbv1Yhxj6+EoxAJE59GHh6Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] clean up error handling
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Omer El Idrissi <omer.e.idriss@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nope.
The signed-off-by tag was off by one letter. so i fixed that and resent it.

Best,
Omer El Idrissi

On Thu, Mar 26, 2026 at 11:37=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, Mar 26, 2026 at 09:16:22AM +0100, Omer El Idrissi wrote:
> > This series lets sdio_init() propagate standard kernel error codes
> > instead of returning _SUCCESS/_FAIL.  There are two callers for this
> > function.  rtw_resume_process_normal() already returns negative values
> > but the caller doesn't check for errors so changing this doesn't
> > affect anything.  sdio_dvobj_init() returns NULL on
> > error so leave that as-is.
> >
> > Signed-off-by: Omer El Idrissi <omer.e.idriss@gmail.com>
>
> You sent v3 twice, was that on purpose?
>
> confused,
>
> greg k-h
