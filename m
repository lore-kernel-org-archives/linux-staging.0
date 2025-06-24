Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74044299AAA;
	Tue, 24 Jun 2025 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767246; cv=none; b=Ey8sgX80GnGmYQlIfFWmmaUAXk4SLlIo7+1GxEbBAlqNx/f1Sp31dS+ziqvbdmivmfuuf9hgC0RHgecE65vEzGdu12PABNzFrriM8b/ZpSP13WkWXfA68rl47+FbuNomufwQpEN5UvyOAE7ZiQOfNoPQZrHzrg2UTp0v5MW+NkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767246; c=relaxed/simple;
	bh=ePm0jJWqGXRR7vHBFxgYXrJJtOzI3e/OKIPjCcbV0nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLQf6XzwGYR+vgE3BvO/UiLoM6cN5PomwdxVmfzRIXEf8mvsQr2uBGIyQqppL5DKTn6hBhFHA13RTWhGpVZS+cQuSSvGiCnnIcuPAdGCuCoXasltsNAOdg0+VRlksU8o8eL6S0uOlxWAF7z8h+T8SNPuU1HF6oK+pHLGAHxJ0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTzWSoyZ; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTzWSoyZ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7111c6b0f1dso3340527b3.1;
        Tue, 24 Jun 2025 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750767243; x=1751372043; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml9c9kjIjL4ob9bPUhkIZhRpvrm1uOprQJuOEQPEJo0=;
        b=bTzWSoyZdxn40E80D20f6KlKD0OZoNZ3jFMeqAtytYUbhlSLKmCBgvC26M23SvqoTh
         Ex0OgmFhPpKApdwouxE71dYkUZErcw0EFMxRPL+2SXS6YVmqHc8flg0WlaBe4yZG5xkg
         EYnThWkob2dKg2UaQho4oFNVohIdWs4TQkhuSRLe7ooeK7J2R8Z3+WYZEzBcBTWAOpE3
         5uWeHEGNQiVVjgk4mCbXdKZfweAzCmqFPU3Yn7xHEiOfxH/TtkudyFjeF0lxLO5zYAsL
         eQYeomj5YiNdE1u8ZfyG5XXOmZHSDyBrncit43Jt2SttyN+Wmzc8R4pVh1+KVxB23oJh
         pB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767243; x=1751372043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml9c9kjIjL4ob9bPUhkIZhRpvrm1uOprQJuOEQPEJo0=;
        b=F5cm8MQH6jNYUUKXMra8U0Anwti7eap8JelRR+7g8TR7cO4yjoAWyjNGgDIU3fQ8jG
         suOCiKgZvOQaJY2e2aQccXT+z4tmZUEeO5VNaR2wjMdnK11iL7SyERjnGtSwdvHBEVNV
         gvHpW8I3vRLmRc8Y6nPKuXOT5eTab87giyTSgcmAIob1QuYgHQRS4pnULzZQhHTp+RXx
         7yQFYNkABs3cJoTqNyAwsReB63aeloM8qe8kcbJ+cQ2hT7GeEntPvjLZlcE7DGYZPW8x
         l4ZZWz8etySVFyMp4L2uRZrBKQBPErRpnHdS+/dACuIYY0NqGidvKZim39jUSQ4v5l5o
         EeiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtB1+OtGZggFpmp+C76s1Fkkj42sF0PgT7mGlT73wIriZvEPvJaW32i9PdsPHy9BX5k9HCmyKM5L8U4Ij4COvLVIZI2A==@lists.linux.dev, AJvYcCW4VCAMC/CWEFQY4+7C0Ze3ysWHjSwJiq2DDoK5MzGbh27Wv2t5xzDIE0iKKjGXn7xnxK9t/6+x39nZ6vw6jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4LrAV8VyjczKltDr5By8fYC1A3BuiwPZyIK4Mf6uUNea7g6+p
	tKhDtXdB4kvMnVSnIaxOANT50PNEc+yOopQoXoCQX+K8UFEj3OoB986l7k/X7cBYYF6J1YO/q4c
	kEhuvUatzeKNEsPKEnB/WXRnloP5/ifZRVVim
X-Gm-Gg: ASbGncswXiemdGwvVWVM+EcuA/AkacL0an1bL8hwAW7FRV++svgUhEi2i20AG0gvRaQ
	jpiiyVhSCUI/daOU80qmOqo8TkYq8KE3f3IDgj0E7kpbszn3XQWZ+G5rnejj7PX+mlVaPZkyTWa
	Nw0ctrUfWax03giGcJ2bM5B55Z0HYmgUM5iyyJbXJlZd5K
X-Google-Smtp-Source: AGHT+IGJneseQd34valjwD4g7qXNUGa5fvh5W4dFNyk2R9RoiDvyW7yd9lajATYT7lSlzYjGnEFNumQ7oA81TwA56nw=
X-Received: by 2002:a05:690c:a0a8:10b0:712:c14a:a363 with SMTP id
 00721157ae682-712c5fecc20mr77351027b3.0.1750767243031; Tue, 24 Jun 2025
 05:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com> <7852d6ac-95f0-41ec-8365-d23a2b16b208@kernel.org>
In-Reply-To: <7852d6ac-95f0-41ec-8365-d23a2b16b208@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 15:13:51 +0300
X-Gm-Features: Ac12FXzFNhMuUIJFqi8IDai0efhsfCqHPuMbewzkMoJuG_hD0-sw55sonDvBegw
Message-ID: <CAGn2d8MfaEpfc2a0MbuuGQ8_Z6HjTRLQVLk9AvqxWuSJSo43QA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Hans de Goede <hansg@kernel.org>
Cc: andy@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 9:31=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi,
> As Andy already mentioned you really should try to first better understan=
d
> the code before changing it.
>
> In this case this code is used for 2 custom sysfs attributes called
> "active_bo" and "free_bo".
>
> sysfs attributes are custom userspace API and we really want to remove
> all custom userspace APIs from this driver before moving it out of
> drivers/staging
>
> Instead everything should be done through existing standard kernels
> API, mostly the standard v4l2 API.
>
> Note this is already mentioned in drivers/staging/media/atomisp/TODO
> although these specific sysfs attributes are not named:
>
> """
> TODO
> =3D=3D=3D=3D
>
> 1. Items which MUST be fixed before the driver can be moved out of stagin=
g:
>
> * Remove/disable private IOCTLs
>
> * Remove/disable custom v4l2-ctrls
>
> * Remove custom sysfs files created by atomisp_drvfs.c
> """
>
> In this case the "active_bo" and "free_bo" sysfs attributes seem
> to be there for debugging purposes only and they can simply be removed.
>
> So instead of replacing scnprintf you should write a new patch
> removing everything starting at:
>
> <--- start removing code here --->
> /*
>  * p: private
>  * v: vmalloc
>
> ...
>
> static struct attribute_group atomisp_attribute_group[] =3D {
>         {.attrs =3D sysfs_attrs_ctrl },
> };
> <--- end removing code here --->
>
> and then also remove the sysfs_create_group() and
> sysfs_remove_group() calls.
>
> After writing that patch maybe you can also take a look at tackling
> the "Remove custom sysfs files created by atomisp_drvfs.c" TODO
> list item?
>
> Regards,
>
> Hans
>

Thank you so much Hans for this informative feedback , i now see the
whole picture ,
i will submit a new patch that removes the two custom attributes
active_bo and free_bo
and then will proceed with the TODO list item " Remove custom sysfs
files created by atomisp_drvfs.c"
