Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D026FA4C;
	Tue,  1 Jul 2025 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371138; cv=none; b=P/0L+DUPEOxTw075DFB32Kg4G0RMOI7QnKJsyaDQwkgxiaG6G7FR/czpbh3dOVuDsrsoTiL0ATN1Z4mtbDuc2rVkPIF6BaaorsFpPC8zvsIFV3TntdfDi74MVVxqLGXzS1NI/4U0yqETXmFiqzq+hTGGEAcvn/5TwQLZz2YEF1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371138; c=relaxed/simple;
	bh=Vedol4hY+rRqUDONgAmDx8al8REG5r4lfPvZiD3cx/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HitD7j3TkziIaF5ufz+YD/6v9HdARWaAnc192h43gtjx7t26XJNG1n5Cb/RylETzRA1tlyvhIUeLnGzojaXkyGjfyl17FuOWRzPQfnGBQLcl+kUfGPOyrne+XIoqwwtnCSnhm8yDmHXJK4M7PVZ+pa28+AojzvTjLgY8Gnp1ua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFpqnSeg; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFpqnSeg"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e821922451fso518455276.0;
        Tue, 01 Jul 2025 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751371135; x=1751975935; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vedol4hY+rRqUDONgAmDx8al8REG5r4lfPvZiD3cx/A=;
        b=TFpqnSegVVg0c0cuDYc6dOpWbfXLRfNtHCo4/GzlieVPJPpDOxRBsd5hw9rNrLulbV
         Nz+tiy0FdehLZOZi329I0Adh24qZaXToh0gGVaIQXwN52wqzxgC6sXPJFItGNK6kpuFW
         WuwnIDTBHYI+Gq+OvQysUTlJl7/hldQZqcHnkkZUiDx49Andwpv7BA0EFFIBIC7MT0LJ
         z6bcC/+mNi4XWtPJ52Bpr9hqw9G6etgz/eqRRm2dILkp8A9UqPpzGjHSedp4ZfrTvo1P
         RWzYqGhqZY2UKAgfMl0t+2k610g026GhhBF6+MAOoT+ZQdUNvGQzIQAproNCyxdQEIS2
         GxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371135; x=1751975935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vedol4hY+rRqUDONgAmDx8al8REG5r4lfPvZiD3cx/A=;
        b=pvUhtrfczILbvG/vA0sajf14mCH3HwDs68izdgmruaDJN78SasO/gtSvs/SApTl988
         +AJvs3XdKGLahPbNgR59wzlC4kG5lR4AVlaJj9klDBe5sO4Rj1bU/7UXIQ//15gZCOMa
         nxNIYgSyudKm17poRTFPw+WhdiOK7HOzwU5Ohr2kcDZ2A1Vm7wzf0Y2ODA3fNiIxiCzo
         gohSLhsQRESCzsxbCGAA+mECI5xAeVZHQ4wlGFXWVMbnEMuyHDsiEd/IW0IyJfdk/4Yu
         7YIEIRmKPRbF60kVrZPzxFbVtmc6n/k6jegSq5+vMYbVB92ufQchxJoo20BvGG8LJRif
         aVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2yH7dVrReMQDhnVPoPPZuU60LKsO+RpnPrMMPr6meyMMkjkAepWtdnX9GC/PzvSrtCYYJy7OAyYQSKWMcFA==@lists.linux.dev, AJvYcCWUQQ8RSXGHWoRr/6iMJ9RMdr9BDGHnih+uJL3dEsA9MTusKpHxvN0jMALkJKWwcp7Px2xhXgFK8a2elADm3nTfzJNieA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb6/pzJeWoTo0/v9JSnVgjS4TQd+ufDWJQhwZCQ4c6tW7OkLwM
	yy6lYQfYBv18wMCl5bm+48lP2zn0zA14mFF5BHK4dYH86DAhvMpkfE6rkW5Beb0j5zj6Pmh+CvF
	mJr2gmbQfkRMgTqClqp3d5TeTe4S11YE=
X-Gm-Gg: ASbGncvZ7dq6g/4dfbbsj5ArEhf69mCqfO6mehreJXa3OUNMqUSa5xgRPFXTdZschBx
	O9x7gXs9n0g76S/oIOAixpx3zraapRoc7wwFOIvXnczlzbWsYbBnfh6udWMnmWWM0CY+FLkJxLC
	4rrqOsiitpMZT9oQKV5IWAwGShTX6Ci2Z/qkfs+/2eIpqEHQ==
X-Google-Smtp-Source: AGHT+IGgiJowCKFFlZiwDygK8oHms47QTPESpY33t7E8BJA47fJPqG+qtL9rmc9YTIE/0oPqnV67PA1ClFix1ShCh+w=
X-Received: by 2002:a05:690c:dc6:b0:70f:7bea:5dd with SMTP id
 00721157ae682-7163f7a475bmr18155327b3.9.1751371134880; Tue, 01 Jul 2025
 04:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com> <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
In-Reply-To: <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 1 Jul 2025 14:58:43 +0300
X-Gm-Features: Ac12FXx77Wq8plk53ER_MI4X8N7_XDcU6XFGVrvytjF9j2XAfeNRxtYwsScU_o8
Message-ID: <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,
On Sat, Jun 28, 2025 at 10:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jun 28, 2025 at 8:26=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> > before key initialization steps like kmem_cache_create(),
> > kmem_cache_alloc(), and __bo_init().
> >
> > This means that if any of these steps fail, the flag remains set,
> > misleading other parts of the driver (e.g. hmm_bo_alloc())
> > into thinking the device is initialized. This could lead
> > to undefined behavior or invalid memory use.
>
> Nice. Can you make some fault injection (temporary by modifying the
> code to always fail, for example) and actually prove this in practice?
> If so, the few (important) lines from the given Oops would be nice to
> have here.
>
I have been trying to test it without having any intel atomisp
hardware and failed continuously, do you have any tips or maybe some
resources on how i can test this driver.

> > Additionally, since __bo_init() is called from inside
> > hmm_bo_device_init() after the flag was already set, its internal
> > check for HMM_BO_DEVICE_INITED is redundant.
> >
> > - Move the flag assignment to the end after all allocations succeed.
> > - Remove redundant check of the flag inside __bo_init()
>
>
Thanks for your continuous guidance.
> --
> With Best Regards,
> Andy Shevchenko
