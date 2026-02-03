Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D93939C7
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106396; cv=pass; b=JhrVZoNh+5UAwU5MJ+JL1BAYN64WQ/87PUrjxUy1ViULXG+RzlLPo6lYRiB2Px4CqqcQbEVNO5w13iS+fKIvolSTUzTv0dwOHMGq7P2lgfFD4cK/0x0NCGNuCPyRggfm/ak2h+HniabhRQrZmIPdK1WjFL08RLsRXfgapHy5dKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106396; c=relaxed/simple;
	bh=0MCFXO5FIZvzJmFjkTBzA6pkm6bLmrZ/lrJfEy2sG5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKgJBAwT1QbzFWs+XZSQL+/x2obLTJeoe0EFfREqdcF9GDZoIi/FPxdvW3gU2wmbY10e4IndKMLUdszMArDsE+7Iu9xK/Nm70Q7YC7Zr6LW32yoCBCjZs2w95tgt81+69oNgs7ociwDlKDHy87kkOyhMSFOAn5/yDgALLK7gk5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lo9DUYTI; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lo9DUYTI"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8876d1a39bso750512866b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 00:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770106391; cv=none;
        d=google.com; s=arc-20240605;
        b=UEZsDMnMOFUwQ2lM2YRQLMsNo1wZ7ucfT672DihXXKo02P49zya6TMQ8DJT1hNO+0z
         nj5yyrZU0/Y3zRLJv1vAhdi71uJ8c61zf5CrjHhCi+j8RrbG6JpxFtCmfp1UpTj04s1V
         4DoqGJkSDV9TcT9yfcFBK3CaMfzgGIvOlc5gXp5Iq6C/vcetiwu9uec9wB90gIa2y1nx
         hIbDqDtXHstQZPK23g7WY6ePeVK1/MKPVtfzxp/e4aO9PEqCFL4o4cMZZrp62RGDqxOc
         /zAUg2BGTpbeuWQnyEdCrG9hTjl5B+uwIB7og/GoW6oXFi1aCUiZgPtL95WEY9/M7AHu
         nDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fStnL/MrIJ9ep3+L7qTFW4HqM4mUK68BWq3/0mdpWhU=;
        fh=URwhQhHF07Ha6ivrE27cL8mX9ZMn0Og5j2TwlBpgDVY=;
        b=cDbjf8446L6tK4SjDOxWQo88xXL12u8NoW07pVUuccrJ865JTRjusn95XUnsZeBD3r
         pLagOsNi0RO9h53J5yYqR+C+/93iCRX+uzZVx3vDlSaKq45p/bM127+0/VMOb108t/aU
         OI4FurlsqJzsG+24Glp5jrDQPk/EVHgysEBg7unx4Nt821kAyMCdkaFjtQwqoviBqw+A
         sYLQkPJokQvf3eS29QwKZI97DPVpAKs1cWkBcdFu/WDLcJPVaZqYKgHe/p2kX//XuaRF
         mLUmIEPUuLKrWwFf80xrO6//Ho/MMPAWFNfvBgdJxrrTE8jQPHuxJSvwOaesI3UvpaWN
         Njgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770106391; x=1770711191; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fStnL/MrIJ9ep3+L7qTFW4HqM4mUK68BWq3/0mdpWhU=;
        b=lo9DUYTIwqsigVjUAzKu1VuY8shxxxpaIAv+v+aa9gmIJWq2b2z0MJ19w3Y6so0PTf
         i1ztUQM9MvFCEdnFQ+B45lU9bzDQCEzdNQD5g09dxeXRVNiJgVJGsutROms0NL3srWdZ
         BHIcSaH2vk1X7HXVKJWBkJdBzvbt/GrBNa6zvYrkIzlF/uFmIcMYcDC3eqJigppHRpnb
         sio56USvC8gjM6Hnn7cvjL6+qqbOxNfOOzJ2dU+L9K16mjeCYAJsWdhMZC0vgGKbbCAT
         fnvnGoopT2j+4Vb+CodsUtAqnbGYsuOZt8x8wyrgWty+VauYDn0z2A/Li3f4D1tuaBJd
         Z5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106391; x=1770711191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fStnL/MrIJ9ep3+L7qTFW4HqM4mUK68BWq3/0mdpWhU=;
        b=ujPGYMGaKP3vIO+gFPQBor9TRV52AaxSb06LnZP1ukzEmFGCWntUC+CTkwitZP2w7y
         3lxfzgut8JzI8OCHccxOYBOodB9+uwdGF+wpx6jALCPZKAVrw3intx1UEUfQU0De7OEr
         EF/KzyPxqM5QroSI4pAdHiJtzIo+BtuIz7KLTtz1wzcordj+PGqWY65cIwQ5p1qBkDOh
         ue5YTV2DtP+V9w/m81quZFd/x0DmjFyR/oQNOjuATFhx5vnkA/tydyuxhoC9KtgqDdAd
         yZXmUxC6u82dlhtdfZJLTOIGwXPfQ5u0YD36WVptWDHP12aEywFtbknI3FI2HUAaNO3l
         t8MQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2PNPil6MOflux3dBbOj+NiySStw6mBP7ON5ji0LHs0UCI6nBmkj28fa/BZWXdjSOTitbI/1P1xj78iux4@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw3W0EKu4urR/z4NYpFF4XnQqpOJYhIeGK1V1RZFkOGAUYYu8J
	4UwclWSKmpM9sWX7HWfs0bHbxWdCf19rvp443PeurpOz447Do+vr772IQRFbz/ymzIb5Y3iAyB7
	2fi3WgojVyfU/fHRVDwXL+J7qU1C+Avw=
X-Gm-Gg: AZuq6aIz4Qu9YeI2hPSU2YtyRr+KdiMglJUP5ytaJ4x6ioQMW0L4wF4Pai7RWsz4vvV
	j8pGB1qTAUevn94+EfsUe0iLwjEiVLE5c2hZxB3VsRQCWrTJxeitjttMkKeOJb7tkpp9z19FN53
	U7haVqkgyaaHtLdYyy7VdHdGWKAS45lIXlkBRJJBFOpyUUWQPAMv8Uob7Yo22YAiAHzElVu5O+a
	ps2S9gLMrc5ZDuXQFTUt8PlewH1eAn2grGknob0jDjBKp2zQndkehsEqmDVZPyUroJw4R8frMiP
	44aewkVnUl1NX9BD7ZKYYJi2dZjwyY3Lv9SccoVEb8Bnl5TadaijgLQPplVb7iv6VhY3PNo=
X-Received: by 2002:a17:907:7ba4:b0:b88:241e:693c with SMTP id
 a640c23a62f3a-b8dff66d239mr972148166b.31.1770106391269; Tue, 03 Feb 2026
 00:13:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260201135933.2052271-1-zilin@seu.edu.cn>
In-Reply-To: <20260201135933.2052271-1-zilin@seu.edu.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Feb 2026 10:12:34 +0200
X-Gm-Features: AZwV_Qht4yPI_WTe_hwsYimobPwDDqQK_xAol3KScKayfCvWT9cSc7VgWof02fY
Message-ID: <CAHp75Vd1jd9o3NuFOEBH9DHhX7VZcqYfkaZ6N4AvKJz0=7Wg1g@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: Fix memory leak in atomisp_fixed_pattern_table()
To: Zilin Guan <zilin@seu.edu.cn>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hverkuil@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 3:59=E2=80=AFPM Zilin Guan <zilin@seu.edu.cn> wrote:
>
> atomisp_v4l2_framebuffer_to_css_frame() allocates memory for
> temporary variable raw_black_frame, which must be released via
> ia_css_frame_free() before the function returns. However, if
> sh_css_set_black_frame() fails, the function returns immediately without
> performing this cleanup, leading to a memory leak.
>
> Fix this by assigning the error code to ret and allowing the code to
> fall through to the ia_css_frame_free() call.
>
> The bug was originally detected on v6.13-rc1 using an experimental
> static analysis tool we are developing, and we have verified that the
> issue persists in the latest mainline kernel. The tool is based on the
> LLVM framework and is specifically designed to detect memory management
> issues. It is currently under active development and not yet publicly
> available.
>
> We performed build testing on x86_64 with allyesconfig. Since triggering
> this error path in atomisp requires specific Intel Atom ISP hardware and
> firmware, we were unable to perform runtime testing and instead verified
> the fix according to the code logic.

...

> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3369,7 +3369,7 @@ int atomisp_fixed_pattern_table(struct atomisp_sub_=
device *asd,
>
>         if (sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_G=
ENERAL].stream,
>                                    raw_black_frame) !=3D 0)
> -               return -ENOMEM;
> +               ret =3D -ENOMEM;
>
>         ia_css_frame_free(raw_black_frame);
>         return ret;


No, instead assign the returned code to ret to begin with

  ret =3D sh_css_set_black_frame(...);
  ia_css_frame_free(raw_black_frame);
  return ret;

--=20
With Best Regards,
Andy Shevchenko
