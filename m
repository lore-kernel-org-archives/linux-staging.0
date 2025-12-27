Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46E320A23
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845351; cv=none; b=JfZ5WpJ6k2GNEmgX3LT6K72pPmL2l5m36tt4dnd2Mdd0HvOsqvOmg4QTuHSgGPvsFt1CaO07FW31YRWEZudRypjUSh1B1PtAOpUA2nqNWA25KH8JMuO701bGTI2c2ZXFywQcDdZMagg6zTgVwLCShGZPBA8VIQS+rjQeYifxmrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845351; c=relaxed/simple;
	bh=8YtmJWxVLcTXPglZgU+78L34QqcvuKoQn/q5GRMHn7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDeRmugFuvrXYiyk8Nllc7TBqj+lW4U9/EUnGMHXgMQAVbHZKkTfchRjrNjjl15XwNC2RAkXjbbf37KLKJm0geH/Szok6r1N1xSYhrF018A8Et4nPtjogCg1Wih+nx/rlmgA64/ZxosA4Om5N59HB9w6fTYtQuHJir23b+hLZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuQwpLYD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuQwpLYD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso1027248566b.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766845348; x=1767450148; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsY2YPUX+wtykoq8K3+fTG9jA80ktVPXe78RbmtQw8Y=;
        b=KuQwpLYDXmLi+0k/olOUq0BYxnKjtsgU8qsKblihHDBLKRJqNZQleNU8t0WxWcfEx5
         9tHmE6KRrvFLtcQ2/zJCE3137Rlhl1Mh1SK8grrjTJ+JcctOToUq9TZEJJtB3RvbCJLr
         eCbYnAxZK+73TR3ft+ybub9pM/lrlD+ed0tHnTMsjECJm0qBZ6GGUTCbqBbcW52zRjlJ
         kRo2odLz4ALSroYkJ9JdGWdB7ukUkoZ3L/mJOBMi33vh0oXfZOGjkVvgOUoAzyy3Ok2E
         fckteX2yk+nzzM1rTpdWKFy5JthvLFEfNF8jlPaNpRnr9gN+NkME+E8cuqQ/hT3lIe7T
         wyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845348; x=1767450148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsY2YPUX+wtykoq8K3+fTG9jA80ktVPXe78RbmtQw8Y=;
        b=WjL2xwuKHmInq2HLaLqqjWYc9k+WWuOZincKS+Bg7lAuS9yQUVy2VaY9J5K4ZqwJpt
         Ove9xNTk4OkmNEHEipIWv4xB0NGo79c/xT4ai7YEnCrsBKplLnq/77TEQafq7ZR7Npnq
         gajS16bEGQmu4Z1yjQ6y4YmgO3qrdT/U4THZE943Vi3Eq/xCfINVrhBG39kqtud4V4tX
         TVpkOywh7WGn5hBOTTdDtOxWEfnP2JkDuSLt2gEy3BpUJDQQDeAtfGxnVmCTfK02u9ZO
         d+kkamowhiS83HEi2x7XlSymDJ/zLXYLcWmV0Ma6YxVZHbAW/1qU954BDNfWuWNPEbJx
         pXIg==
X-Forwarded-Encrypted: i=1; AJvYcCXRbbMfQrco1o5zvCRxmrL24izZBuv8Fg1eux6foakVhe++DRVBc/vC9C/R04IaoCEWl6vpuhwqcYV+gKBj@lists.linux.dev
X-Gm-Message-State: AOJu0YyOEA3hdG9pg4ZODr/bvuF8We0/XjC7zOU7dXbNSS/KYdtVqf1g
	CYgIxfHTH3GAqi+V7IUKnJncmf8HB6PSKFqhPZL7YvOgVK8Mt4CvahE5bc+j7j4wxoXLiKRCF7B
	fprvoXMjBAgtNXuGvCgbNlF/uMHyEu/s=
X-Gm-Gg: AY/fxX46Dr3Za2oS64wlyuLaFn65ONWZ+U7sJtG2oHcXlN/ZRRfyIvawpruAcNhlE/k
	hYRhtr8tUapxUTKOtHpzs9fm9xXU5I6oQdG1c7ZoO7Un3f8ugQX7dosEtsb7C7DWFY1KnEZEOOp
	G50TmI32Ea64IBOjY7yNAtlom7iqXTqB2NNrDElxtwrPcIaurw02vU+v0vfW7enTg+6U493gTGm
	6lEi1NADqG59zQ8Wey/egpFnzNWI7r6Q8SkT5SLUKlJoMiq6CIrdtGYgyL/lr0hvI8RZv+v0Fwf
	z0335ksK9wepUhgQkvlOMuF2LebSP2e5fcMb2Z1mhV+X7WF7HdUuHe9mdZnfaR+mXN7DnmE=
X-Google-Smtp-Source: AGHT+IFueBeZlh5SVe0yz+/yxQv364cBzdkglW+0ZdQCwGpAc3nvuAc182enll5nZikPEvfIE1pSBxl7zDgGxVvO12k=
X-Received: by 2002:a17:907:2d0e:b0:b76:bcf5:a38a with SMTP id
 a640c23a62f3a-b8036a924ffmr2886902566b.0.1766845347379; Sat, 27 Dec 2025
 06:22:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com> <20251219054320.447281-5-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-5-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:21:51 +0200
X-Gm-Features: AQt7F2pBB7tF8rd4vW2CaPeAEaMHCh3Al7Dq6z2gzKKZ-tCgBNcws0oMLkjEaOA
Message-ID: <CAHp75VfTki7r-BMadsmOWudr2nc2f2VYgL9y6xR64usQB70ZAw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but th=
e
> core driver does not require CONFIG_FB_DEVICE.
>
> Make sysfs support optional by defining overlay_sysfs_groups as NULL when
> FB_DEVICE is disabled. The driver always sets .dev_groups, and the kernel
> naturally skips NULL attribute groups while the code remains buildable
> and type-checked.

> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with NULL overlay_sysfs_groups
> - Always populate .dev_groups

Same comment about the changelog in the commit messages.

...

> +#ifdef CONFIG_FB_DEVICE
>  ATTRIBUTE_GROUPS(overlay_sysfs);
> +#else
> +/*
> + * When CONFIG_FB_DEVICE is disabled, define overlay_sysfs_groups as NUL=
L.
> + * The compiler will optimize out the sysfs code paths when dev_groups i=
s NULL.
> + */
> +static const struct attribute_group *overlay_sysfs_groups[] =3D { NULL }=
;
> +#endif

Hmm... I'm wondering if PTR_IF() can anyhow help here.

--=20
With Best Regards,
Andy Shevchenko
