Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704A19005E;
	Thu, 17 Jul 2025 05:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752731905; cv=none; b=C1tnryzHr7ICR5cliUxxvzlTveuQkMYejAiJQb8d0ew1ur5gmiCqP3Tm6PZT/2JAmWqZYAKQ3NyktR9syPvH5WKKTAK2mAltxm+AjtF/I32Ao58SakkSb/BLdQlIViyHbaOYivYnPgGdJzS4hQXnsTPZMTt5ML+rgK05C7490EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752731905; c=relaxed/simple;
	bh=GzaeNvGgBNjYJOHg+v353vPVI0VbmmbGU8uUuOb+dVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c//FFG02JCGNEq5ua6yjVr2v97zf3cRPNBPehA55ah9a5nqip79R3FHWdogZWjpKO4eS3AaT82ybAi7bOtMNqMxbmPxyZxGIdYzWY4bpKjvkhzlGFTRcgMn9xN49S7apD7bD81WXx3P5EPQEXlF/6Za5pz8XRococp8EgAK3ArQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=So6yLHIH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So6yLHIH"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so92795966b.2;
        Wed, 16 Jul 2025 22:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752731902; x=1753336702; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIRTijv9i7tleNjJH5h95nFpr27ijpYUBRAXq3DNagE=;
        b=So6yLHIHCmPN26r8am/X3zz1uCjBxSITEje9Z+qUCLMEdxeLubN5TOtLEzcyyCeDMw
         8Bx4ELbLD1IcdWxG8eU3QqnH99SToctMxGmyAwWCHa1QykbQp0Jb5lorjQfwkFpD8TCE
         fFm49OPyXKjqI3vKqA7Y59e18DXXWOeMDsQqM+A+BBolj+Z3fvTV/+XCFfNnEsTbhaV7
         l72vkr4rukdtDyIdhLko0In/He6VGCq5TNbp++MK7w3ftRyJKtKTMrJCbZ6m3VFN6BMj
         6mvY9wvK2BXhEEI/xChsssR1fUhufTPR9GDGXxH/2v1BaGi/a3GUiRD1pzwoycWI2u5j
         F6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752731902; x=1753336702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIRTijv9i7tleNjJH5h95nFpr27ijpYUBRAXq3DNagE=;
        b=eMm6lbELWJeuhp1qHtAK7oEyq2uIV2avGzildByO0eBd7ONok0ADgH2xRFU+CN3REN
         CIYqlmyzdLRnCRbkXr6BOHV9tPG87UkWa0eE9M4J23TqiWKO0TdEPvNYLEY9q1jRR0u0
         Vib3Y1etYH1JhNMhWY8h6awzS4QLSzFN4BG68uY8spQocdv1gaLI1N7i4sGaeIj4axz/
         ab+o2DMWxL0Q81kKeEQbQeu74B1atJUrgqg4bKaLZo8zzqbKOtwhDOHRXwGRCg1Cvctz
         P4dnZJD3TOVH1UZNmGKWOpqnV4/q1pV4Tv+IIahqNJXpxuEwr8ldBCTzRpW0sRcgpNYT
         Dxgw==
X-Forwarded-Encrypted: i=1; AJvYcCV3nM5q/NE7218QvmV6YUH6zMciWnFE8E1hke/V1dwHQnC4zs/zCdZI0Icf/pATMLVEAj0wM4DYK9ScCJLS1ya9pUg1EQ==@lists.linux.dev, AJvYcCWbHvSBYx8NMraalhlWiiGpcBw5ZAQKPe4QA2mHHCvsfeCSPHdbyKNTwU2zJBarV19Pruh1FgFDCpmXwo2O0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfBhjy9cVq5RaKMgoXrBhSeHP//OJct0Dgt4zAkdOsEXOeiqkB
	Ox9e5WIg5UvrJWRcuwcjLM6cSfZO+NZLI5InBC+f5k4ciHaI5Yjq9WgGQMkp4WZEalBYCVj4qPF
	6HZNnZyPVmT8ziLBEZdlbgN1BOCtDVFHxs4o1JoA=
X-Gm-Gg: ASbGnctnRzUvmAKmkv5IcevOpTj1anPqcJu8d89OqgjddWvy2NvTszJEdsJGd2qkdet
	JP4GpAOYTLaD49IUDEa0zzJVo7aKtjrpyghjUHP1nK1JUf+An3///HNOWYz/VUE32VhZDiRivgQ
	nQa349VElUQvdjvG6jrrnytK64Y1LeUE0iSsAF/RZ6r2BALO7XL0FkFDYimXqZGExNoa9iGWL0l
	580jnQnGA==
X-Google-Smtp-Source: AGHT+IHI5thB/F2IFWJUiFlPA/6j+NF8ktS0u61JpA9SIcP0uSP4e1OxKm+GBgDu5WWhK82Gm1N5+7hJlRvgmyvD9u8=
X-Received: by 2002:a17:907:1c10:b0:ae3:7c8c:351d with SMTP id
 a640c23a62f3a-ae9ce1acb18mr557820566b.56.1752731902079; Wed, 16 Jul 2025
 22:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 17 Jul 2025 08:57:45 +0300
X-Gm-Features: Ac12FXxVS-slXnx8UX3hAelqaVMWQU1Khdwpoqjuk9lr1S5_RIlvpaD-SvuVP9A
Message-ID: <CAHp75VdpkswJiuA9ems_7o8i9W8HWN4BredO7qsaR6HjO5TxdQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 4:30=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The function atomisp_set_fmt() modifies shared device state and expects
> callers to hold the isp->mutex for synchronization. While most internal
> callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> V4L2 ioctl handler atomisp_s_fmt_cap() does not.
>
> This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> pipe->frame_info may be modified concurrently without proper protection.
>
> - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().

...

>  #include <linux/delay.h>
>  #include <linux/pci.h>
> +#include <linux/cleanup.h>

Keep it ordered.

...

> +       int ret;
>
> -       return atomisp_set_fmt(vdev, f);
> +       scoped_guard(mutex, &isp->mutex)
> +       {
> +               ret =3D atomisp_set_fmt(vdev, f);
> +       }
> +       return ret;

As Dan said, this should just add a (one line) guard()() and no other
lines being touched.

>  }

--=20
With Best Regards,
Andy Shevchenko
