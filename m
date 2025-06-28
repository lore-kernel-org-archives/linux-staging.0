Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D5A1C8626
	for <linux-staging@lists.linux.dev>; Sat, 28 Jun 2025 19:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751140740; cv=none; b=JT6JuesS1VZ9h0Ue1mZlTEvtcWewTcFxQbejoHCqFSrFNrdwPDy+6PzDfDJgCJ3iIXxcoL+UKx76if//LIoMOEVQRoXNi5Kzyb7noPORZ4uw+rt+caoMzffpn4d92DfzQH65LN3OKbFCpZmNISatsTm4vDN5XNb07WiTGeMmebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751140740; c=relaxed/simple;
	bh=lrbieHtJpWkNUFd5qTNuRm4ydg8f8KmTK4G081V4bzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1AsDN3NmZCYfP89j52XlwUFphSw6ysHYgoH8Njfufq3/8WfxYJ6DiXXDWMAwFlcnEipZEQ3oZJst2W9O5LluhQY/HgFVk7taI3igcY4e2eC9fDmPV3jdHJq+ALsAQq/L29sK3lMbOS8PeF3WzGjZCbzyO6btAo6SKm1uHCINZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvThll+O; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvThll+O"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb5ec407b1so149248866b.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Jun 2025 12:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751140737; x=1751745537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCn/x9JPsOm33ynQom2R0U43CTIFPTCUTDASBrS4OXI=;
        b=BvThll+OLogCaviP4A1dD6Yb9Rd9bD4F0dlfi6dDC8w0FAtiQVAL1wJELYxoaGc2Mn
         E+HNrsf85Iv8yqos8T20fuTaVxha1ytoVMjl0+MBUsqPud2rxVrQIcTLeySkYXC8MRuz
         NmKb7LBGi2DwfsmBywtExMnENO+RV4DFy2ncx4uEuGbBDAot2Izvlev1dl+Fy95hZFro
         3xazv2CeC1vKJ7B+MgJY31OZ1lqwOCea84wwjKFEBEKn2ttonRNH1RkJMoKYpFVpjOOy
         gCo8iGdAQEpZSzG4A/BxwifYiRrXbmTtYLk1MEL2D8UDE9ZtGG/3sZlUK7jaUJ1H1Ic/
         V4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140737; x=1751745537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCn/x9JPsOm33ynQom2R0U43CTIFPTCUTDASBrS4OXI=;
        b=rPJyvcGr5MB4aVIZHKNsPiTO50A3WGxVCnE2JBdymN1fUYW9b4YJi8h0v61pYt7sB/
         WqOcCjZPjmD6zyD8sEXpxKntTOMgtcxkhcjTUu8Z6hglcyGBIo1E2xGI4/4IEbPlVeLS
         qls+sEdQXsLM2qVZZPCi0J53Ok9XaA0WgCWcmd3pydsLHbC9WbvHx94UwI0aVmXXo7+r
         kYJXv1b/VwrEU/0IFGfil3ZuGuae0lke5nNA+A3qaZhXR2i21rhYJLSB9pWFIGUbo/l1
         azreIU1BBDkeYWoVU5LMpl4d4zqrOFj23rICE5UzNrN5wvZLkxqTnzuOwv+jE2m8MMuw
         lB9w==
X-Forwarded-Encrypted: i=1; AJvYcCXN/vpgIk7SX9EGcIZk0FAgxyu31q3QYv+AKH2MHT6zzGyC/YvvHZPBCiGTcDVXRFq0m3wYMoQvR3fQW88H@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1hbhhMVCYvII0HcQmzG7g8DBLf561wP1GNnM4X7WGTafxVcU2
	voma2ujV9+S80u0eSau82COczESb0qlRW/CpOIVUK00ZRfmxLG8qNjCthhpNmUWXSQHf3WEDbV9
	jspUL9i6Nf4KinXvccUcy4cxNPFRRPVw=
X-Gm-Gg: ASbGncs8CeBBiEXDQjh4DLJf4ju+cGN/tOxCA2fYVLrtnYqGs2U1Ko1IpiF7KwUs1JT
	wk4nib578FRFm6uJZHwYFQxYt4FF19npYYnAt4+gB4P/RXE6mREspzJd2/2PPeCmugrLN6TzT0u
	xlLUT1q2Gx1eeAjecQ8D++glyuSoefBrYsUnutTzauXls=
X-Google-Smtp-Source: AGHT+IFZBR8kfJGqRmjGfZ/IXkon+9o2g1PGlOtiW+bEm/EExm5FRtNH3McMm2rCL6PA4ZVg+vgD7F1bxOQqfxd3U4I=
X-Received: by 2002:a17:907:fdca:b0:ae3:6744:3675 with SMTP id
 a640c23a62f3a-ae367443a67mr510956766b.48.1751140736917; Sat, 28 Jun 2025
 12:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1751086324.git.abdun.nihaal@gmail.com> <62320323049c72b6e3fda6fa7a55e080b29491e8.1751086324.git.abdun.nihaal@gmail.com>
In-Reply-To: <62320323049c72b6e3fda6fa7a55e080b29491e8.1751086324.git.abdun.nihaal@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 28 Jun 2025 22:58:20 +0300
X-Gm-Features: Ac12FXz962GwXR5F2ZukYapM3EMaS4H-TNlh4C4kBY22Qq3L7dSM227zM9FUxAg
Message-ID: <CAHp75VeSYesZuJ-NEfEAvaRepEUtdLmxGrYmthD1YkSg-bsK_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, dan.carpenter@linaro.org, gregkh@linuxfoundation.org, 
	lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com, 
	willy@infradead.org, notro@tronnes.org, thomas.petazzoni@free-electrons.com, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 7:59=E2=80=AFAM Abdun Nihaal <abdun.nihaal@gmail.co=
m> wrote:
>
> The error handling in fbtft_framebuffer_alloc() mixes managed allocation
> and plain allocation, and performs error handling in an order different
> from the order in fbtft_framebuffer_release().
>
> Fix them by moving vmem allocation closer to where it is used, and using
> plain kzalloc() for txbuf allocation.

...

> +       struct fbtft_par *par =3D info->par;
> +
> +       if (par->txbuf.len > 0)

Do we really need this check? If txbuf.buf is kept NULL (please, check
this), the kfree() is NULL-aware.

> +               kfree(par->txbuf.buf);
>         fb_deferred_io_cleanup(info);
>         vfree(info->screen_buffer);
>         framebuffer_release(info);


--=20
With Best Regards,
Andy Shevchenko
