Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C541714B7
	for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 04:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745038258; cv=none; b=JuTcdExX7x+wwYhZVrYylHYc8oVhvQPkmONyt00pyRGmZbggnRqfzwBjEPkQ3IbVGlQAJ2+f8yAZq9Li8vyw8F8yvoJJkLOo5ozrkJy8ZuxspIN0oR84HF2UIGze5/3w/f+9EqSmR8ZTO1tapXHYpvD+jQgnl4DXesktgBw/hPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745038258; c=relaxed/simple;
	bh=xllVgqoRLGvzGswF8Ov1YPU1Ma/P4Q74aaN5uZdOglQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEVZiDEK9NfdT0zcWF3Y/zeRGFTbN1kry3Omq3lhfm4jkdHDVK1S5fPO+GJtj91bHcISunYrKjKj6geMcm43vXJ9G5y4cLTNbWWOYeX2hXdb/5M6+aijA52eHgIOtQzJflZecPHTvo4woP+5dX7QhAi+NYGNVwLXlLl9NlL0aEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2GyHjKr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2GyHjKr"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acacb8743a7so400500366b.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745038255; x=1745643055; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xllVgqoRLGvzGswF8Ov1YPU1Ma/P4Q74aaN5uZdOglQ=;
        b=h2GyHjKri/JwN6rezpualxML1IgzWkr+QfGTGiJ7PR5kSnnvO/AMfBU+ZnfBuhU98h
         2MoM8L6cNqK8T4KTz3t6Ur7bI9MiLlxbFQh9h5H30w3eUPP2JLzYk5qsxQuyvHxMtQo8
         pSNmk4mksQCHsEmy3D2eZ8jYZil/gi6WZNQk5XmsJEq6I6u4m2UURDYzMOf6QMFSjcck
         idYtjySH71n4BIjtaydn3YhvmnN7FkeZULjDGwJ/04ccBgb/N6gjinMUX07tR9prk4KI
         SMMwExAV2+AFkjPiRjmZP/4MfvYsH4fGM/oStb2rpWPhfupIk/9DchnVtS7lrpDC2S/y
         zs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745038255; x=1745643055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xllVgqoRLGvzGswF8Ov1YPU1Ma/P4Q74aaN5uZdOglQ=;
        b=dg4exBqx8iPZDV4EekhGge/UEhARxcmA+ZpUWWXT/dEQ3ozMJ4RCPuYnLEa15OENsV
         ABdF/+oWepToNTurBpUTiAr9B7QJmMBPA0+YDayM0AeIZf8mrPWB7iv3zwyyY5f+Tk9V
         S6reQEI5nsvrovK6YfOqzYxxAEv+BVCReMO3CQbDyozoT1UFaayAG21iVR7V0UmoCdJ+
         plAVZZqnDSge/lfIXnOex4cm2YG9y/H/DgUeZKAiVt26P1sEO6AL923ZjgXbfx7UUZBm
         ua5U1L6Eb4QdeXmlzjU8ZbqVR/musJB5yKfCLvU/MU2sbffmP9exEAqB8mHHaU9Ai1L3
         4+fg==
X-Forwarded-Encrypted: i=1; AJvYcCXjvuWYDPXMFQIzhul+QQysT32Oz2nayvBF9wlI1JgBLYIY5kAmTMTd4OpYpHIxBu7uD+UdWEetJ8O3Q2IR@lists.linux.dev
X-Gm-Message-State: AOJu0YwyLHF6Aozx270O0qCT+naTP+ja2kZFnhVG6QBqSvJVOWQHH2Rs
	O6lyYZ3n0+E8XUd7Aii54QmjmVnfY1eEIow4uxHYISxX24XqsR0QUGKxH+Y5Ir/UTV0MenNB9QP
	gIdmpL1MGBZuRMDD73PZlgniZdAA=
X-Gm-Gg: ASbGncv1RDUZNljqfINST/9a8uDNLonKy5t++MO3VoQB1LBVCBI9iVaW1QSHZgAUL5n
	msnuFmR6BMVEzcXumC/GiF9pVHI+QFFwNIXVpmWUSTlKKqorR4B/v/p/7GWG2ZPOfyzX2CfRhFH
	EWZMdj/0tRzAQ6f/CRfVckGA==
X-Google-Smtp-Source: AGHT+IGAg+Qag6lXJNxjRNIcXfUNnuL5uHrlN9ER48s4oo4qFiaVa7C2rV69ToGe51SHan6QunD9ObLsjZTCBc93loo=
X-Received: by 2002:a17:907:728e:b0:aca:a128:f4e2 with SMTP id
 a640c23a62f3a-acb751203damr353102366b.10.1745038254568; Fri, 18 Apr 2025
 21:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 19 Apr 2025 07:50:18 +0300
X-Gm-Features: ATxdqUGrYiK4kSjGmHt566SEB6DssLKQwuFsw4imxlIBfayp0v4dv5L9yVKr_bQ
Message-ID: <CAHp75VexZWxOx+QZtYneAg+z3GJ9vqneVw0XVW8rxQX7vLfzwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: atomisp: Remove compat ioctl32 header file
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 10:19=E2=80=AFAM Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> Arnd's patch [1] removed the compat ioctl32 code,
> so this header file is no longer needed.
>
> Also, there are no references to this header file
> in the atomisp codebase.
>
> Link[1]: https://lore.kernel.org/linux-media/20210614103409.3154127-7-arn=
d@kernel.org/

Should be rather
Link: URL [1]

>

...and no newline between it and SoB.

> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>
> ---

Otherwise LGTM.

--=20
With Best Regards,
Andy Shevchenko
