Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CF6379
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWHwFyOa"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-680b8d50403so5493336d6.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704155651; x=1704760451; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfqH8G08ty3BRoxiRJlrx2qbokmxAtMRS/aRrX6GN3U=;
        b=NWHwFyOa1d+6/hQ7kBM0DkyKJ8XpODSpwuFa3p3JA+i2S/9xfv8VF1Dfi0BewwAhGx
         PPTOSmjF6zXqb4gF37sMqko8ILMEejTizsZqO58a1U0bdb5ROf3YEucU/ECVLrW9L0nP
         bwY4duLIxg6cPhQzY4UZOoLMJDi4u0zS17pXK19Ix1W3o+6Lid3XZmGI1lV6SJ/Dzvkh
         lbWIwcMCQF+xqJkI3WSzjOsNM0ui8RWEUuVUWSmgr7nIYxKaRnnCvMxYxiTlg/pA4bjk
         6qRXMplgxzk4bETJoVs4dYGBSbPFKrh1BOHBQ8YwnNjWyspgAUVfb6d1mbXPWOGd6Sqc
         6/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704155651; x=1704760451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfqH8G08ty3BRoxiRJlrx2qbokmxAtMRS/aRrX6GN3U=;
        b=PoG3mOhVbtbQKPHAU0qP7RSvXntp+xz9ocIiLhdSeC+0RravxBpIn8NkMA1bJo9liv
         Lii8OYGtExLAdQ2YyDR6Mq/e4wN7L/TMvJ249UiuhvXOk9Op5XixQYhNATSk3wGSw9GJ
         w3WrkVCeVoB2YuvDUeKmxBUiKbAliiL4ublGDAzz0d6JDKCywnTObon+H1bYvuMurnG0
         60xGhnML2wABq0wGvJe2jlJ5KKwNXSbL3cjeOEW4wiAvxu5mPeF/TDySZRH5dp3+AVoI
         ABzNoZcgvt8hni9XpfWdStngQ4VkowjExL2KV7ZApOgo2l4YFMpReM7p5U9YWKrYEHxp
         we2w==
X-Gm-Message-State: AOJu0YyvuGG7L4pH2DBoGP/dSHEqoRgkR5gpxMkZEi6zdnd36mIgX538
	B73zEwkrmR2UYnofClLoyqRY6cD+0W+8YFhXHZI=
X-Google-Smtp-Source: AGHT+IGyaJiXdgWqFBUu5f2BoOupM0lrgwObVrHTPW9QoEdjv0OTM66Kylt0YY2ugKaKsEPvWQdH8hjq7WtWoDGwWX0=
X-Received: by 2002:a0c:d783:0:b0:67f:fc67:882a with SMTP id
 z3-20020a0cd783000000b0067ffc67882amr15182078qvi.119.1704155650893; Mon, 01
 Jan 2024 16:34:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-12-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-12-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:33:34 +0200
Message-ID: <CAHp75VfHN1gbWRX20PpWVevmA+P9E4GCdkG0vRYQQ_QZvWKUsQ@mail.gmail.com>
Subject: Re: [PATCH 11/15] media: atomisp: Replace atomisp_drvfs attr with
 using driver.dev_groups attr
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> sysfs attributes preferably should not be manually be registered but
> instead the driver.groups / driver.dev_groups driver struct members
> should be used to have the driver core handle this in a race free
> manner.
>
> Using driver.groups would be the most direct replacement for
> driver_[add|remove]_file, but some of the attributes actually need access

..._file()

> to the struct atomisp_device (*), so as part of modernizing this part of
> the atomisp driver this change also makes the sysfs attribute device
> attributes instead of driver attributes.
>
> *) Before this change accessing these attributes without the driver havin=
g
> bound would result in a NULL pointer deref, this commit fixes this.

...

> +       if (dbglvl < 1 || dbglvl > 9)

in_range() ?

>                 return -ERANGE;

...

> +static const struct attribute_group dbg_attr_group =3D {
> +       .attrs =3D dbg_attrs,
> +};
>
> +const struct attribute_group *dbg_attr_groups[] =3D {
> +       &dbg_attr_group,
> +       NULL
> +};

ATTRIBUTE_GROUPS()

...

> +#include <linux/sysfs.h>

But why? You can use forward declaration, no?

> +extern const struct attribute_group *dbg_attr_groups[];

--=20
With Best Regards,
Andy Shevchenko
