Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD002168A2
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7rn5b3C"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6808c3938afso30840706d6.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Jan 2024 13:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704230665; x=1704835465; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36Ih5trLY+IAE+FFGRo5lyyN7SKY7bVEH9AA4YXN+rw=;
        b=S7rn5b3C1YP3UZbg7O3aLlz999JTtiNyHG0EYvhNyvt1EvAHVD53DsYx4PbraxFjtB
         qQuLlQFvn4fPk53GoslVwBEY1+l+/tcKdcPNUh+zcN40pk10WylMvktfb9P0jyhSm5Kw
         O4HCCixHvPRmhYkDDAce7KUPlbXJwvWvSWRd/y4w7bxnK5ZhGYIW+Iuf3gpB2P9Tvoaj
         dBErmvrumYJkQdyeOoqgtG989QmqQgUpYlX+jSzpjRNcEGEmnWWvWy1hf5xCCwBJFE9/
         Gx5WGzIV20tntrRwzK0yrGtCT9NoW+1BEB8ikIADFQ363CDspIsdlYLYIQ42DZu3CqUF
         hWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704230665; x=1704835465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36Ih5trLY+IAE+FFGRo5lyyN7SKY7bVEH9AA4YXN+rw=;
        b=uYmhZJjzJ4hm/sM42ErrNooQgNAN+alTU+2Dm7yC3EUk6y2g9Pjtf4vYhrSGoogO4y
         C+y2c8N76SuTaIUYSRv3uTzgQwAbiYUIWsLr1kfMitjUoWBIkbyGhYX7LiG2bXC4Zyf3
         9XuSiq1kN2Bnfzq03nqMMLPyRwU3vgnn6/BcMDYI9VUZTk7wnXpyRgwX2RERbQa7Dek9
         9tbSbXHClriGXo+iR1wK32elFi8ThJq/Y60Rt4FmWYTW3MP4vf9TuYViAJfeip4VAh+u
         7tJ6YyZYYEY2EWvsCjmT9Q6WPk+T79wRrT/tg+KI7BfDBVrywetriEYYgHMATUUuknps
         6+Ig==
X-Gm-Message-State: AOJu0YzT74FF+W+Tr6j3zZBL64LPqhdKS+wet9vfTSzLj4yhV63Vsv96
	sHChtn2T3WpF8d+syhFYBfH7l1W71vrrlULE4hw=
X-Google-Smtp-Source: AGHT+IFo2Oe9524xTH9MwYCySZe7vLvLS3FEpYKJ+mYEn4IBmV8sdJ5rFzgmI/NOWdSdfhPwvyxn10rw2Xez4QyE/sI=
X-Received: by 2002:a05:6214:2aa7:b0:67a:a721:82f0 with SMTP id
 js7-20020a0562142aa700b0067aa72182f0mr20180214qvb.74.1704230664739; Tue, 02
 Jan 2024 13:24:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-12-hdegoede@redhat.com>
 <CAHp75VfHN1gbWRX20PpWVevmA+P9E4GCdkG0vRYQQ_QZvWKUsQ@mail.gmail.com> <960cc0a6-6ef8-4a66-8f83-89e854b7b578@redhat.com>
In-Reply-To: <960cc0a6-6ef8-4a66-8f83-89e854b7b578@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 23:23:48 +0200
Message-ID: <CAHp75VeREE+DEuCiAyPQkMRe2ni7K+di1tSFG=vjW4EWeS6gPw@mail.gmail.com>
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

On Tue, Jan 2, 2024 at 1:30=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 1/2/24 01:33, Andy Shevchenko wrote:
> > On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat=
.com> wrote:

...

> >> +static const struct attribute_group dbg_attr_group =3D {
> >> +       .attrs =3D dbg_attrs,
> >> +};
> >>
> >> +const struct attribute_group *dbg_attr_groups[] =3D {
> >> +       &dbg_attr_group,
> >> +       NULL
> >> +};
> >
> > ATTRIBUTE_GROUPS()
>
> I deliberately wrote this out (had to write this out)
> instead of using ATTRIBUTE_GROUPS() because ATTRIBUTE_GROUPS()
> makes the groups variable static and here it gets used
> in another file then where it is declared.

I see, but can it be refactored / does it make sense to refactor that
it becomes visible only in one module?

--=20
With Best Regards,
Andy Shevchenko
