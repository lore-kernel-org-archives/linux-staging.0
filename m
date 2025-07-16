Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D302F28C5BD;
	Wed, 16 Jul 2025 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752653499; cv=none; b=GVBhIaoJS6/pT7s4pvY7DJ0h2zg2MBpgcHNZfOINAGta5vwk9Q8tPv8dHCnK9Zc/zeZMc6M7PNH07NB5u7i/5uiHmRgWJ5Ufi9G14aWI6KTGeP+uwcSz5+kMZflIJjRW8f1jAVWW4PF6U8tyVSddMJtNBSI1/OxqRMrkMxBu21I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752653499; c=relaxed/simple;
	bh=k79BMsIbK+zTQT1FqOMBe93RDWwnnBPN6W0nNfSHYXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZKXpwrYUNZ+05yR1mk1+hcz5cVn2r23Ww8R0e3dzoAe7iZRdQgDDPNBBBnXBPLIh8WVS75l7RiTLKDRjTq49DFlFEJNki9beH5dDMjuFB3Fs4PaItrl+4+p7OEAJaUq2sn+lLde5tyEMGZnN5s7EByR0volyFYxU2kXaXcC0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfZnKHKq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfZnKHKq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so1096196266b.2;
        Wed, 16 Jul 2025 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752653496; x=1753258296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J10ZHGKZA+2to8uQChpxJ+la5LZtKmfI+OysvrYK24=;
        b=GfZnKHKqHAhEOouR5Hw4NAonqa5o1dzyCSHT7rIxSMu+17hhlK2nCoKkycMkSOgm4h
         tgUoc9uMYMV2TnN2A3h//r3HaJoh0V207xJi056FRoy5RRYNXEtRrw7ATTqhlmiWVue4
         pOyqxa0orxz2OKfUojoJPiib37gVvF5Zd+BqIjPLhUF3VVcOO6UkOxBVG7zARkwkLl61
         aa6OsXoxzfa6He5KBvN+itjWu6gMuQqpgRc7uhj77qz00fNnl3lUKUWpMNiJj1oPQz78
         Z3HoKDMA2oJhL04ApFQ6WvLPyeHFpIzdoL9ihPcCkntM6B9NDtnDXVBUobDv2k8HYAic
         eK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752653496; x=1753258296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J10ZHGKZA+2to8uQChpxJ+la5LZtKmfI+OysvrYK24=;
        b=IuBFwPj8uqXEMB0nkEAeXYVHQnKitcqqVoy1jbJwGctbgv8Pr9h1LIoOobeJX1QLB+
         16b4oYD+pf9XYUd7ou9rnk/c/gW4NIa4W+Ghza7jeiKJf9FYfSUC1jJKKXPwVAlaKvOX
         cdJgV15PEZIV47Ms4s3hG7ClUDCnS/iLYiOFLLRc64+xNiIsjJay1ti2bzQ0USxQ5qwT
         ZFh9ksPRurNx78S4ew6YgwnCmIOlmr96pQQaCFBTtPueb0ITAqA/hjZUFiE5KI+DK0av
         uI/SFtAH83jE3bAXOOQJ57F9uRYZrrEjhRYc+sX/FwUM68y1yWUe1sD2MESKbh45kfzT
         Zk9A==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2GTye6RFMtoC9jOUvndfXn9Nac/bjjK95J/j3mfRVt6G2Jd9wtx8qUyqmr+m2nVuG/Y52QbkBLWm1gYcbA==@lists.linux.dev, AJvYcCX/qCAOHowd7TiFnitSVyB0nu6d17cybIVfc8pdybTvVMeI/DfhNhzFV9g7nnlHvt2ZTwzCd9HD8zGw+zo9RMVJlhlzpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHEpRdkkQFD42ARdPcM0w8JIE53zMab6beL3v7k2F6jDoL/Tk2
	M5qTMCS6wZG9xpY72Yc8K9HlNbJyd2r9K8gpEdOwBZpqUHqLe6heVfMaqBTm0w87fwle70ux/33
	puNXSg157bZI86/G7S46GlKXbc8x+ZuA=
X-Gm-Gg: ASbGncuM5XeUZ09jzSNdCUG7MP7KgYC0SS0eL1y5QdLIXfWvtY3XiztD6P4Iur1k04l
	5NltngEJAaVEB/J01NDAkkvdOciwe3DoXgsSEQVPDTbUnUDcsNIaCRBuVVWwqrwcBGB32zug90Z
	7WrhlT0gADWQJl5ii9pHbe7ApnNGouqd2K7Wvrp4LdnZwzg1ln266VYKZxK57eSynMDSaQ8fNpr
	i3CLUcZgw==
X-Google-Smtp-Source: AGHT+IFdUeFRiLRYSzyqZz8go9Y8LtsVEDFel7v1v4PGl5CPO196A/RSkK7i/IOWULX4PwzobdlFqnfns3bzAhWFF2E=
X-Received: by 2002:a17:907:f1ea:b0:add:fe17:e970 with SMTP id
 a640c23a62f3a-ae9cddfe2e8mr163141766b.14.1752653495712; Wed, 16 Jul 2025
 01:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716014225.15279-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250716014225.15279-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 16 Jul 2025 11:10:59 +0300
X-Gm-Features: Ac12FXxtN8CIVFs4-2mQKtJils4_U3AeV1g-oFVo2bsh5PDlNAO4qKhAGDd-3Bg
Message-ID: <CAHp75Ve6rE22crmt5mUioWtkWm_-ODV+Dk2gcTQ8ickhMMkvAQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 4:42=E2=80=AFAM Abdelrahman Fekry
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

If it's a fix, please add the Fixes tag.

...

> -       return atomisp_set_fmt(vdev, f);
> +       mutex_lock(&isp->mutex);
> +       ret =3D atomisp_set_fmt(vdev, f);
> +       mutex_unlock(&isp->mutex);

Side note: Can you consider switching the driver to use cleanup.h
(guard()(), scoped_guard(), __free(), etc)?

--=20
With Best Regards,
Andy Shevchenko
